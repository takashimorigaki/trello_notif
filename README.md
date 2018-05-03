# trello notification to slack

## Setup about trello
1. Get <trello_key>, <trello_token> and <trello_secret> from https://trello.com/1/appKey/generate
2. Get <board_id> you want to manage from trello board's url
3. Add your <list_name>, <board_id>, <trello_key>, <trello_token> and <trello_secret> `$ vi notif.rb`
```
BOARD_ID = '<board_id>'
LIST_NAME = '<list_name>'
CONSUMER_KEY = '<trello_key>'
CONSUMER_SECRET = '<trello_secret>'
OAUTH_TOKEN = '<trello_token>'
```

## Setup about slack
1. Create your <token> from https://api.slack.com/custom-integrations/legacy-tokens
2. Add your <channel_name>, <user_name> and <slack_token> `$ vi notif.rb`
```
CHANNEL_NAME = '<channel_name>'
USERNAME = '<user_name>'
TOKEN = '<slack_token>'
```

## Get Card name you need to do by tomorrow
1. Gem install `$ bundle install` or `$ bundle install --path vendor/bundle`
2. Run test `$ ruby notif.rb` or `$ bundle exec ruby notif.rb`, you can get slack message about trello card's name you need to do by tomorrow.
3. If you use scheduler on heroku, so you can get message everyday. Let's try!