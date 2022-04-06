##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'TaskQueuesStatistics' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .task_queues \
                           .statistics.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/TaskQueues/Statistics',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/Statistics?FriendlyName=friendly_name&StartDate=2008-01-02T00%3A00%3A00Z&EndDate=2008-01-02T00%3A00%3A00Z&Minutes=1&PageSize=50",
              "key": "task_queues_statistics",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/Statistics?FriendlyName=friendly_name&StartDate=2008-01-02T00%3A00%3A00Z&EndDate=2008-01-02T00%3A00%3A00Z&Minutes=1&PageSize=50"
          },
          "task_queues_statistics": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "cumulative": {
                      "avg_task_acceptance_time": 0.0,
                      "end_time": "2015-08-18T08:46:15Z",
                      "reservations_accepted": 0,
                      "reservations_canceled": 0,
                      "reservations_created": 0,
                      "reservations_rejected": 0,
                      "reservations_rescinded": 0,
                      "reservations_timed_out": 0,
                      "start_time": "2015-08-18T08:31:15Z",
                      "tasks_canceled": 0,
                      "tasks_deleted": 0,
                      "tasks_entered": 0,
                      "tasks_moved": 0
                  },
                  "realtime": {
                      "activity_statistics": [
                          {
                              "friendly_name": "Offline",
                              "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                              "workers": 0
                          },
                          {
                              "friendly_name": "Idle",
                              "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                              "workers": 0
                          },
                          {
                              "friendly_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
                              "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                              "workers": 0
                          },
                          {
                              "friendly_name": "Reserved",
                              "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                              "workers": 0
                          },
                          {
                              "friendly_name": "Busy",
                              "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                              "workers": 0
                          },
                          {
                              "friendly_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
                              "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                              "workers": 0
                          }
                      ],
                      "longest_task_waiting_age": 0,
                      "longest_task_waiting_sid": "WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "tasks_by_status": {
                          "assigned": 0,
                          "pending": 0,
                          "reserved": 0,
                          "wrapping": 0
                      },
                      "total_available_workers": 0,
                      "total_eligible_workers": 0,
                      "total_tasks": 0
                  },
                  "task_queue_sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .task_queues \
                                  .statistics.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/Statistics?FriendlyName=friendly_name&StartDate=2008-01-02T00%3A00%3A00Z&EndDate=2008-01-02T00%3A00%3A00Z&Minutes=1&PageSize=50",
              "key": "task_queues_statistics",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/Statistics?FriendlyName=friendly_name&StartDate=2008-01-02T00%3A00%3A00Z&EndDate=2008-01-02T00%3A00%3A00Z&Minutes=1&PageSize=50"
          },
          "task_queues_statistics": []
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .task_queues \
                                  .statistics.list()

    expect(actual).to_not eq(nil)
  end
end