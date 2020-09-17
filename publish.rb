# frozen_string_literal: true

require 'pubsub_client'

PubsubClient.configure do |config|
  config.topic_name = 'temecula'
end

puts 'Starting...'

100.times do |i|
  payload = { message: "message-#{i}" }
  PubsubClient.publish(payload.to_json) do |result|
    unless result.succeeded?
      puts "Publishing error: #{result.error}"
    end
  end
end

puts 'Fin'
