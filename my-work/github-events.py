#!/home/codespace/.python/current/bin/python3

import os
import json
import requests

# Step 1: Retrieve GitHub username from environment variable
GHUSER = os.getenv('GITHUB_USER')

# Step 2: Define the API URL dynamically using the username
url = 'https://api.github.com/users/{0}/events'.format(GHUSER)

# Step 3: Fetch the recent GitHub activity for the user
response = requests.get(url)

# Step 4: Parse the JSON response
events = json.loads(response.text)

# Step 5: Loop through the first 5 events and print them
for event in events[:5]:
    event_info = event['type'] + ' :: ' + event['repo']['name']
    print(event_info)
