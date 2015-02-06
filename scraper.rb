# -*- coding: utf-8 -*-

require 'json'
require 'nokogiri'
require 'open-uri'
require 'turbotlib'
require_relative 'scraper/insurance_broker'

Scraper::InsuranceBroker.scrape
