class JobBoardSerializer < ActiveModel::Serializer
  attributes :name, :rating, :root_domain, :logo_file, :description
end
