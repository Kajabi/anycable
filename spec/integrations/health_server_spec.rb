# frozen_string_literal: true

require "spec_helper"
require "net/http"

describe "health server" do
  before(:all) do
    @server = Object.new.tap do |obj|
      obj.define_singleton_method(:running?) { true }
    end

    @health_server = AnyCable::HealthServer.new(
      @server,
      port: 54_321
    )
    @health_server.start
  end

  after(:all) { @health_server.stop }

  context "when server is running" do
    before { allow(@server).to receive(:running?).and_return(true) }

    it "responds with 200" do
      res = Net::HTTP.get_response(URI("http://localhost:54321/health"))
      expect(res.code).to eq("200"), res.body
    end
  end

  context "when server is not running" do
    before { allow(@server).to receive(:running?).and_return(false) }

    it "responds with 200" do
      res = Net::HTTP.get_response(URI("http://localhost:54321/health"))
      expect(res.code).to eq("503"), res.body
    end
  end
end
