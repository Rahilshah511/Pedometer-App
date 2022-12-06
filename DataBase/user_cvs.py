import matplotlib.pyplot as plt
import csv
import pandas as pd
import os

t='.csv'
l='user_list.csv'
k='date_list.csv'
df=pd.DataFrame(pd.read_csv(l,names=['user']))
df1=pd.DataFrame(pd.read_csv(k,names=['date']))
df0=pd.DataFrame(pd.read_csv('time_list.csv',names=['time']))
for i in df.user:
    if(os.path.isfile(i+t)):
        print('exists')
    else:
        df2=pd.DataFrame(columns=list(df1['date']),index=list(df0['time']))
        df2.to_csv(i+t)
