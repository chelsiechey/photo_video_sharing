# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '934776'
Pusher.key = '26cd5fe60368e9869198'
Pusher.secret = '0e6d79364b1288f1f17a'
Pusher.cluster = 'us3'
Pusher.logger = Rails.logger
Pusher.encrypted = true