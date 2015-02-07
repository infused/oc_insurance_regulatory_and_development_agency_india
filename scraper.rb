# -*- coding: utf-8 -*-

require 'json'
require 'nokogiri'
require 'open-uri'
require 'turbotlib'
require_relative 'scraper/insurance_broker'
require_relative 'scraper/insurer'

Scraper::InsuranceBroker.scrape
Scraper::Insurer.scrape

# 'Non-Life Insurers' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo264&mid=3.2.10'
# 'Re-Insurers' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo1687&mid=3.3.6'

# 'Third Party Administrators' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo646&mid=9.5.7'

# 'Web Aggregators' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo2337&mid=9.6.1'
