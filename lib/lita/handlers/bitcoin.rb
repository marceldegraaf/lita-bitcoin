require "lita"

module Lita
  module Handlers
    class Bitcoin < Handler

      URL = "http://data.mtgox.com/api/1/BTCUSD/ticker"

      route(/btc/i, :reply, command: true, help: {
        "btc" => "Returns the current BTC/USD exchange rate."
      })

      def self.default_config(handler_config)
      end

      def reply(response)
        response.reply "1 BTC is currently worth #{rate}"
      end

      private

      def rate
        if data && data["return"] && data["return"]["sell"]
          data["return"]["sell"]["display"]
        else
          "UNKNOWN"
        end
      end

      def data
        MultiJson.load(ticker_response.body)
      end

      def ticker_response
        http.get(URL)
      end
    end

    Lita.register_handler(Bitcoin)
  end
end
