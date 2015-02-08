module Scraper
  class Insurer
    extend StringCleaner

    URLs = {
      'Life Insurer' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo129&mid=3.1.9',
      'Non-Life Insurers' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo264&mid=3.2.10'
    }

    def self.scrape
      URLs.each do |category, url|
        doc = Nokogiri(open(url))

        doc.search('#tab1 table table table table tr').each do |co|
          cert_no = co.search('td')[0].inner_text.strip.gsub('.', '') rescue nil

          if cert_no =~ /\A\d{1,2}\Z/
            _a1, _a2, *address_parts = co.search('td')[1].inner_text.split("\r\n")
            contact_parts = co.search('td')[4].inner_text.split("\r\n")
            phone = contact_parts.detect {|s| s =~ /(tele*|phone)/i }.gsub(/[^\d\(\)\.\:]/, '') rescue nil

            data = {
              cert_no: cert_no,
              company_name: co.search('td')[1].search('a').inner_text,
              url: co.search('td')[1].search('a').attr('href'),
              address: clean_string(address_parts.join(', ')),
              principal_officer: clean_string(co.search('td')[2].inner_text.split("\r\n").join(', ')),
              appointed_actuary: clean_string(co.search('td')[3].inner_text.split("\r\n").join(', ')),
              phone: phone,
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
