##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Device' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.microvisor.v1.devices.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://microvisor.twilio.com/v1/Devices',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "devices": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://microvisor.twilio.com/v1/Devices?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://microvisor.twilio.com/v1/Devices?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "devices"
          }
      }
      ]
    ))

    actual = @client.microvisor.v1.devices.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "devices": [
              {
                  "sid": "UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "unique_name": "This is my device; there are many like it.",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "app": {
                      "target_sid": "KAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "target_hash": null,
                      "date_targeted": "2021-01-01T12:34:56Z",
                      "update_status": "up-to-date",
                      "update_error_code": 0,
                      "reported_sid": "KAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "date_reported": "2021-01-01T12:34:56Z"
                  },
                  "logging": {
                      "enabled": true,
                      "date_expires": "2021-01-01T12:34:56Z"
                  },
                  "date_created": "2021-01-01T12:34:56Z",
                  "date_updated": "2021-01-01T12:34:56Z",
                  "url": "https://microvisor.twilio.com/v1/Devices/UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "device_configs": "https://microvisor.twilio.com/v1/Devices/UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Configs",
                      "device_secrets": "https://microvisor.twilio.com/v1/Devices/UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Secrets"
                  }
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://microvisor.twilio.com/v1/Devices?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://microvisor.twilio.com/v1/Devices?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "devices"
          }
      }
      ]
    ))

    actual = @client.microvisor.v1.devices.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.microvisor.v1.devices('UVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://microvisor.twilio.com/v1/Devices/UVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "This is my device; there are many like it.",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "app": {
              "target_sid": "KAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              "target_hash": null,
              "date_targeted": "2021-01-01T12:34:56Z",
              "update_status": "up-to-date",
              "update_error_code": 0,
              "reported_sid": "KAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              "date_reported": "2021-01-01T12:34:56Z"
          },
          "logging": {
              "enabled": true,
              "date_expires": "2021-01-01T12:34:56Z"
          },
          "date_created": "2021-01-01T12:34:56Z",
          "date_updated": "2021-01-01T12:34:56Z",
          "url": "https://microvisor.twilio.com/v1/Devices/UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "device_configs": "https://microvisor.twilio.com/v1/Devices/UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Configs",
              "device_secrets": "https://microvisor.twilio.com/v1/Devices/UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Secrets"
          }
      }
      ]
    ))

    actual = @client.microvisor.v1.devices('UVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.microvisor.v1.devices('UVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://microvisor.twilio.com/v1/Devices/UVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "UniqueName",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "app": {
              "target_sid": "KAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              "target_hash": null,
              "date_targeted": "2021-01-01T12:34:56Z",
              "update_status": "pending",
              "update_error_code": 0,
              "reported_sid": null,
              "date_reported": "2021-01-01T12:34:56Z"
          },
          "logging": {
              "enabled": false,
              "date_expires": null
          },
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "url": "https://microvisor.twilio.com/v1/Devices/UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "device_configs": "https://microvisor.twilio.com/v1/Devices/UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Configs",
              "device_secrets": "https://microvisor.twilio.com/v1/Devices/UVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Secrets"
          }
      }
      ]
    ))

    actual = @client.microvisor.v1.devices('UVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end