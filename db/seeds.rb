# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'json'

board = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'jobBoards.json')))

board['job_boards'].each do |job_board|
    JobBoard.create(job_board.to_h)
end


CSV.foreach(Rails.root.join('lib', 'seeds', 'job_opportunities.csv'), headers: true) do |row|
    job_opp = JobOpportunity.new({
        id: row['ID (primary key)'],
        job_title: row['Job Title'],
        company_name: row['Company Name'],
        job_url: row['Job URL'],
        job_source: "Unknown"
    })
    JobBoard.all.each do |job_board_c|
        if row['Job URL']
            if row['Job URL'].include? row['Company Name']
                job_opp.job_source = "Company Website"
                if job_opp.save
                    if row['Job URL'].include? job_board_c.root_domain
                        JobBoardJobOpportunity.create(job_board: job_board_c, job_opportunity: job_opp)
                    end
                end
                break
            end
            if row['Job URL'].include? job_board_c.root_domain
                job_opp.job_source = job_board_c.name
                if job_opp.save
                    JobBoardJobOpportunity.create(job_board: job_board_c, job_opportunity: job_opp)
                end
                break
            end
        else
            break 
        end
    end
    if job_opp.job_source == "Unknown"
        job_opp.save
    end
end


puts "HAPPY SEEDING"