module Scraper
  class InsuranceBroker
    URLs = {
      'Insurance Broker' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo2120&mid=9.3.7',
    }

    def self.scrape
      URLs.each do |category, url|
        doc = Nokogiri(open(url))

        doc.search('#tab1 table table table table tr').each do |co|
          cert_no = co.search('td')[0].inner_text.strip rescue nil

          if cert_no =~ /\A\d{3}\Z/
            data = {
              cert_no: cert_no,
              license_code_no: co.search('td')[1].inner_text,
              company_name: co.search('td')[2].inner_text,
              address: co.search('td')[3].inner_text,
              phone: co.search('td')[4].inner_text,
              nature_of_application: co.search('td')[5].inner_text,
              principal_officer: co.search('td')[6].inner_text,
              period_of_license: co.search('td')[7].inner_text,
              remarks: co.search('td')[8].inner_text,
              category: category,
              source_url: url,
              sample_date: Time.now
            }

            puts JSON.dump(data)
          end
        end
      end
    end
  end
end
