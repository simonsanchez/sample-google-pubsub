# frozen_string_literal: true

require 'google/cloud/pubsub'

pubsub = Google::Cloud::PubSub.new
subscription = pubsub.subscription('temecula')
puts 'Subscriber listening...'

subscriber = subscription.listen do |received_message|
  puts received_message.data
  received_message.acknowledge!
end

begin
  subscriber.start

  sleep
rescue SignalException
  subscriber.stop.wait!
end

puts 'Done'
