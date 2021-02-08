class JobOpportunitiesController < ApplicationController
    after_action { pagy_headers_merge(@pagy) if @pagy }

    def show
        # job_opp = JobOpportunity.where(job_source: params[:id])
        # paginate  job_opp, per_page: 20
        # # render json: job_opp
        if params[:id] == " "
            @pagy, @records = pagy(JobOpportunity.all)
            render json: { data: @records,
                   pagy: pagy_metadata(@pagy) }
        else
            @pagy, @records = pagy(JobOpportunity.where(job_source: params[:id]))
            render json: { data: @records,
               pagy: pagy_metadata(@pagy) }    
        end
        
    end
    
end