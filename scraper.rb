# -*- coding: utf-8 -*-

require 'json'
require 'nokogiri'
require 'turbotlib'
require 'open-uri'

urls = {
  'Insurance Broker' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo2120&mid=9.3.7',
}

urls.each do |category, url|
  doc = Nokogiri(open(url))

  doc.search('#tab1 table table table table tr').each do |row|
    cert_no = row.search('td')[0].inner_text.strip rescue nil

    if cert_no =~ /\A\d{3}\Z/
      data = {
        cert_no: cert_no,
        license_code_no: row.search('td')[1].inner_text,
        company_name: row.search('td')[2].inner_text,
        address: row.search('td')[3].inner_text,
        phone: row.search('td')[4].inner_text,
        nature_of_application: row.search('td')[5].inner_text,
        principal_officer: row.search('td')[6].inner_text,
        period_of_license: row.search('td')[7].inner_text,
        remarks: row.search('td')[8].inner_text,
        category: category,
        source_url: url,
        sample_date: Time.now
      }

      puts JSON.dump(data)
    end


  end
end
