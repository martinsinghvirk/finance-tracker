class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks

    def self.find_by_ticker(ticker_symbol)
        where(ticker: ticker_symbol).first
    end

    def self.new_from_lookup(ticker_symbol)
        begin # Inkluderar felhantering
            looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
            #price = strip_commas(looked_up_stock.latest_price) # Konverterar om senaste aktiepris.
            new(ticker: looked_up_stock.symbol, name: looked_up_stock.company_name, last_price: looked_up_stock.latest_price)
        rescue Exception => e
            return nil
        end        
    end

    # ANVÄNDS INTE I NULÄGET!
    # Funktionen hjälper oss att konvertera om datavärdet för senaste aktiepris till en decimal-typ.
    def self.strip_commas(number)
        number.gsub(",", "") # Tar två argument, först det man vill ersätta och sen med vad.
    end

end
