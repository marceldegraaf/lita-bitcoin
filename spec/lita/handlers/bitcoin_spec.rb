require "spec_helper"

describe Lita::Handlers::Bitcoin, lita_handler: true do
  it { routes_command("btc").to(:reply) }

  let!(:body) { %Q{ {"result":"success","return":{"high":{"value":"600.00000","value_int":"60000000","display":"$600.00","display_short":"$600.00","currency":"USD"},"low":{"value":"511.77000","value_int":"51177000","display":"$511.77","display_short":"$511.77","currency":"USD"},"avg":{"value":"552.76876","value_int":"55276876","display":"$552.77","display_short":"$552.77","currency":"USD"},"vwap":{"value":"549.70256","value_int":"54970256","display":"$549.70","display_short":"$549.70","currency":"USD"},"vol":{"value":"21148.57793549","value_int":"2114857793549","display":"21,148.58\u00a0BTC","display_short":"21,148.58\u00a0BTC","currency":"BTC"},"last_local":{"value":"527.10000","value_int":"52710000","display":"$527.10","display_short":"$527.10","currency":"USD"},"last_orig":{"value":"527.10000","value_int":"52710000","display":"$527.10","display_short":"$527.10","currency":"USD"},"last_all":{"value":"527.10000","value_int":"52710000","display":"$527.10","display_short":"$527.10","currency":"USD"},"last":{"value":"527.10000","value_int":"52710000","display":"$527.10","display_short":"$527.10","currency":"USD"},"buy":{"value":"527.10000","value_int":"52710000","display":"$527.10","display_short":"$527.10","currency":"USD"},"sell":{"value":"533.04755","value_int":"53304755","display":"$533.05","display_short":"$533.05","currency":"USD"},"item":"BTC","now":"1392212682920166"}} } }
  let!(:response) { double(:response, body: body) }

  describe "#btc" do
    it "replies to the 'btc' command" do
      Lita::Handlers::Bitcoin.any_instance.stub(:ticker_response).and_return(response)

      send_command("btc")
      expect(replies.last).to eq("1 BTC is currently worth $533.05")
    end
  end
end
