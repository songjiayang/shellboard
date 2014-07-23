json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :job_type, :company_name, :occupation, :location, :description, :apply_information, :deadline, :aasm_state, :city, :identifier
  json.url job_url(job, format: :json)
end
