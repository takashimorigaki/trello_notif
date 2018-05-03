# coding: utf-8
require 'slack'
require 'trello'
require 'date'

# trello
BOARD_ID = '<board_id>'
LIST_NAME = '<list_name>'
CONSUMER_KEY = '<trello_key>'
CONSUMER_SECRET = '<trello_secret>'
OAUTH_TOKEN = '<trello_token>'

# slack
CHANNEL_NAME = '<channel_name>'
USERNAME = '<user_name>'
TOKEN = '<slack_token>'

Trello.configure do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
  config.oauth_token = OAUTH_TOKEN
end

board = Trello::Board.find(BOARD_ID)

list_id = nil

board.lists.each do |l|
  list_id = l.id if l.name == LIST_NAME
end

exit if list_id.nil?

list = Trello::List.find(list_id)
list.cards.each do |c|
  if c.due.present? and c.due.to_date == Date.today + 1
    text = "#{list.name}の「#{c.name}」の期限は#{c.due.to_date.to_s.gsub('-', '/')}までだよ"
    print "#{text}\n"
    notify_to_slack(text)
  end
end

Slack.configure do |config|
  config.token = TOKEN
end
Slack.auth_test

def notify_to_slack(text)
  return if text.nil?
  Slack.chat_postMessage text: text, username: USERNAME, channel: CHANNEL_NAME
end