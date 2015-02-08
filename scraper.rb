# -*- coding: utf-8 -*-

require 'json'
require 'nokogiri'
require 'open-uri'
require 'turbotlib'
require_relative 'scraper/insurance_broker'
require_relative 'scraper/insurer'
require_relative 'scraper/reinsurer'

Scraper::InsuranceBroker.scrape
Scraper::Insurer.scrape
Scraper::Reinsurer.scrape

# 'Third Party Administrators' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo646&mid=9.5.7'

# 'Web Aggregators' => 'https://www.irda.gov.in/ADMINCMS/cms/NormalData_Layout.aspx?page=PageNo2337&mid=9.6.1'
