require 'json'

def determine_status(remarks)
  case remarks
  when /(expired|Refused\ to\ grant\ renewal)/i
    'expired'
  when /cancelled/i
    'cancelled'
  else
    'active'
  end
end

STDIN.each_line do |line|
  raw = JSON.parse(line)

  licence_record = {
    company_name: raw['company_name'],
    licence_number: raw['license_code_no'],
    jurisdiction_classification: raw['nature_of_application'],
    regulator: 'Insurance Regulatory and Development Authority of India',
    company_jurisdiction: 'India',
    licence_jurisdiction: 'India',
    status: determine_status(raw['remarks']),
    source_url: raw['source_url'],
    sample_date: raw['sample_date'],
    category: 'Financial',
    jurisdiction_classification: raw['category'],
    confidence: 'HIGH',
  }

  puts licence_record.to_json
end
