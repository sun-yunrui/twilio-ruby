##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Conversations < Domain
      class V1 < Version
        class ConversationContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ParticipantList < ListResource
            ##
            # Initialize the ParticipantList
            # @param [Version] version Version that contains the resource
            # @param [String] conversation_sid The unique id of the
            #   [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this participant.
            # @return [ParticipantList] ParticipantList
            def initialize(version, conversation_sid: nil)
              super(version)

              # Path Solution
              @solution = {conversation_sid: conversation_sid}
              @uri = "/Conversations/#{@solution[:conversation_sid]}/Participants"
            end

            ##
            # Retrieve a single page of ParticipantInstance records from the API.
            # Request is executed immediately.
            # @param [String] identity A unique string identifier for the conversation
            #   participant as [Chat User](https://www.twilio.com/docs/api/chat/rest/users).
            #   This parameter is non-null if (and only if) the participant is using the
            #   Programmable Chat SDK to communicate. Limited to 256 characters.
            # @param [String] messaging_binding_address The address of the participant's
            #   device, e.g. a phone number or Messenger ID. Together with the Proxy address,
            #   this determines a participant uniquely. This field (with proxy_address) is only
            #   null when the participant is interacting from a Chat endpoint (see the
            #   'identity' field). Limited to 256 characters.
            # @param [String] messaging_binding_proxy_address The address of the Twilio phone
            #   number (or WhatsApp number, or Messenger Page ID) that the participant is in
            #   contact with. This field, together with participant address, is only null when
            #   the participant is interacting from a Chat endpoint (see the 'identity' field).
            #   Limited to 256 characters.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated.
            # @return [ParticipantInstance] Newly created ParticipantInstance
            def create(identity: :unset, messaging_binding_address: :unset, messaging_binding_proxy_address: :unset, date_created: :unset, date_updated: :unset)
              data = Twilio::Values.of({
                  'Identity' => identity,
                  'MessagingBinding.Address' => messaging_binding_address,
                  'MessagingBinding.ProxyAddress' => messaging_binding_proxy_address,
                  'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                  'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              ParticipantInstance.new(@version, payload, conversation_sid: @solution[:conversation_sid], )
            end

            ##
            # Lists ParticipantInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams ParticipantInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ParticipantInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of ParticipantInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ParticipantInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              ParticipantPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ParticipantInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ParticipantInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ParticipantPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Conversations.V1.ParticipantList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ParticipantPage < Page
            ##
            # Initialize the ParticipantPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ParticipantPage] ParticipantPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ParticipantInstance
            # @param [Hash] payload Payload response from the API
            # @return [ParticipantInstance] ParticipantInstance
            def get_instance(payload)
              ParticipantInstance.new(@version, payload, conversation_sid: @solution[:conversation_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Conversations.V1.ParticipantPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ParticipantContext < InstanceContext
            ##
            # Initialize the ParticipantContext
            # @param [Version] version Version that contains the resource
            # @param [String] conversation_sid The unique id of the
            #   [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this participant.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [ParticipantContext] ParticipantContext
            def initialize(version, conversation_sid, sid)
              super(version)

              # Path Solution
              @solution = {conversation_sid: conversation_sid, sid: sid, }
              @uri = "/Conversations/#{@solution[:conversation_sid]}/Participants/#{@solution[:sid]}"
            end

            ##
            # Update the ParticipantInstance
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated.
            # @return [ParticipantInstance] Updated ParticipantInstance
            def update(date_created: :unset, date_updated: :unset)
              data = Twilio::Values.of({
                  'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                  'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              ParticipantInstance.new(
                  @version,
                  payload,
                  conversation_sid: @solution[:conversation_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the ParticipantInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Fetch a ParticipantInstance
            # @return [ParticipantInstance] Fetched ParticipantInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              ParticipantInstance.new(
                  @version,
                  payload,
                  conversation_sid: @solution[:conversation_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.ParticipantContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.ParticipantContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ParticipantInstance < InstanceResource
            ##
            # Initialize the ParticipantInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] conversation_sid The unique id of the
            #   [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this participant.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [ParticipantInstance] ParticipantInstance
            def initialize(version, payload, conversation_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'conversation_sid' => payload['conversation_sid'],
                  'sid' => payload['sid'],
                  'identity' => payload['identity'],
                  'messaging_binding' => payload['messaging_binding'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'conversation_sid' => conversation_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ParticipantContext] ParticipantContext for this ParticipantInstance
            def context
              unless @instance_context
                @instance_context = ParticipantContext.new(@version, @params['conversation_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique id of the Account responsible for this participant.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The unique id of the Conversation for this participant.
            def conversation_sid
              @properties['conversation_sid']
            end

            ##
            # @return [String] A 34 character string that uniquely identifies this resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] A unique string identifier for the conversation participant as Chat User.
            def identity
              @properties['identity']
            end

            ##
            # @return [Hash] Information about how this participant exchanges messages with the conversation.
            def messaging_binding
              @properties['messaging_binding']
            end

            ##
            # @return [Time] The date that this resource was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this resource was last updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] An absolute URL for this participant.
            def url
              @properties['url']
            end

            ##
            # Update the ParticipantInstance
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated.
            # @return [ParticipantInstance] Updated ParticipantInstance
            def update(date_created: :unset, date_updated: :unset)
              context.update(date_created: date_created, date_updated: date_updated, )
            end

            ##
            # Deletes the ParticipantInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Fetch a ParticipantInstance
            # @return [ParticipantInstance] Fetched ParticipantInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.ParticipantInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.ParticipantInstance #{values}>"
            end
          end
        end
      end
    end
  end
end