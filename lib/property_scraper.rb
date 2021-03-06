require "property_scraper/version"
require "property_scraper/scraper"
require "property_scraper/homeaway_scraper"
require "property_scraper/airbnb_scraper"
require "property_scraper/demeure_scraper"
require "property_scraper/luxury_retreats_scraper"
require "property_scraper/vrbo_scraper"
require "property_scraper/love_home_swap_scraper"
require "property_scraper/travel_keys_scraper"

module PropertyScraper
  class InvalidUrl < StandardError; end

  Scrapers = [DemeureScraper, AirbnbScraper, LuxuryRetreatsScraper, VrboScraper, LoveHomeSwapScraper, TravelKeysScraper]

  def self.scrape(url)
    Scrapers.each do |scraper|
      return scraper.new(url) if scraper.can_scrape?(url)
    end

    raise InvalidUrl
  end

end
