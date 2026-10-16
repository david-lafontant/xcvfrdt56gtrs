json.extract! certificate, :id, :first_name, :last_name, :company, :certificate_id, :documents, :operator_id, :description, :created_at, :updated_at
json.url certificate_url(certificate, format: :json)
json.documents do
  json.array!(certificate.documents) do |document|
    json.id document.id
    json.url url_for(document)
  end
end
