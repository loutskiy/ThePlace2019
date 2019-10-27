import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import time
import random

# Use a service account
cred = credentials.Certificate('//home/mlk/Arduino/sketch_oct26a/google-c92c2cb72168.json')
firebase_admin.initialize_app(cred)

db = firestore.client()

lastNumber = ""

with open('/dev/ttyACM0') as f:
    while True:
        currentNumber = f.readline()
        if currentNumber != lastNumber:
                data = {"coordinates": {
                        "latitude": random.uniform(47.474739, 47.474750),
                        "longitude": random.uniform(19.096616, 19.096620)
                    }
                }
                db.collection(u'hackathon').document(u'live_data').set(data)
        lastNumber = currentNumber
        time.sleep(0.5)
