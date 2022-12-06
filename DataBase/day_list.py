import matplotlib.pyplot as plt
import csv
import pandas as pd
import os
from datetime import datetime

p=datetime.today().strftime('%Y-%m-%d')
t='.csv'
l='user_list.csv'
k='date_list.csv'
df=pd.DataFrame(pd.read_csv(l,names=['user']))
df1=pd.DataFrame(pd.read_csv(k,names=['date']))
df0=pd.DataFrame(pd.read_csv('time_list.csv',names=['time']))

if p not in df1.values:
    with open(k,mode='a') as of:
        pw=csv.writer(of, delimiter=',')
        pw.writerow([p])
    print(pd.read_csv(k,names=['date']))
    for i in df.user:
        q=i+t
        kt=pd.DataFrame(pd.read_csv(q,names=list(df1['date']),skiprows=1))
        kt[p] = None
        
        os.remove(q)
        kt.to_csv(q)
      
else:
    print("The date Exist.")
