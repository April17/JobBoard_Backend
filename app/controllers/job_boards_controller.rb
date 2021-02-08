class JobBoardsController < ApplicationController

    def index
        job_boards = JobBoard.all
        render json: job_boards
    end

    def job_count
        job_data = JobBoard.all.map{|board| board.name }
            .map{|name| ["#{name}", JobOpportunity.where(job_source: name).size] }.to_h
        render json: job_data, serializer: nil
    end


end
