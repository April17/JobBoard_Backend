class JobOpportunitySerializer < ActiveModel::Serializer
  attributes :id, :job_title, :company_name, :job_url
end
