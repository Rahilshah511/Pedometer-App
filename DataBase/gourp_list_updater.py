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
df2=pd.DataFrame(pd.read_csv('step_list.csv',names=list(df1['date']),skiprows=1))
