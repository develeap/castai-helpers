import castconfig
import requests
from pprint import pprint
import json
import csv

BASE_URL="https://api.cast.ai"


url = F"{BASE_URL}/v1/kubernetes/clusters/{castconfig.CLUSTER}/problematic-workloads"

headers = {
    "accept": "application/json",
    "X-API-Key": castconfig.API_KEY
}

response = requests.get(url, headers=headers)
resp = json.loads(response.text)
pprint(resp['controllers'])

with open('constrains.csv', 'w', encoding='UTF8') as f:
    writer = csv.writer(f)

    writer.writerow(['Kind','Name','Issue'])

    for service in resp['controllers']:
        writer.writerow([service['kind'],service['name'],service['problems']])