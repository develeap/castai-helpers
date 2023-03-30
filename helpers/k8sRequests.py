import castconfig
import requests
import datetime
from pprint import pprint
import dateutil.parser as parser
import json
import csv

BASE_URL="https://api.cast.ai"
TIME_IN_DAYS = 7

interval = parser.parse(str(datetime.datetime.now() - datetime.timedelta(days = TIME_IN_DAYS))).isoformat()+'Z'
now = parser.parse(str(datetime.datetime.now())).isoformat()+'Z'

url = f"{BASE_URL}/v1/cost-reports/clusters/{castconfig.CLUSTER}/workload-efficiency?startTime={interval}&endTime={now}"

headers = {
    "accept": "application/json",
    "X-API-Key": castconfig.API_KEY
}

response = json.loads(requests.get(url, headers=headers).text)

serviceList = [{ 'name': item['workloadName'],'namespace': item['namespace']} for item in response['items']]
print(serviceList)
with open('requests.csv', 'w', encoding='UTF8') as f:
    writer = csv.writer(f)

    writer.writerow(['Namespace','Service Name','Container Name','CPU','MEM'])
    for service in serviceList:
        url = f"{BASE_URL}/v1/cost-reports/clusters/{castconfig.CLUSTER}/namespaces/{service['namespace']}/workload/{service['name']}/efficiency?startTime={interval}&endTime={now}"
        resp = json.loads(requests.get(url, headers=headers).text)
        for container in resp['containers']:
            writer.writerow([service['namespace'],service['name'],container['name'],container['items'][-1]['info']['requests']['cpu'],container['items'][-1]['info']['requests']['memoryGib']])


    
