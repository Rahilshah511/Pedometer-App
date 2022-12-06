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
ui=input('user:')
ty=input("YYYY-MM-DD:")
if ui in df.values:
    q=ui+t
    df4=pd.DataFrame(pd.read_csv(q,names=list(df1['date']),skiprows=1))
    df4=df4.sort_values(ty)
    df4 = df4.astype({ty:'int'})
    op=df4[ty]
    
    
    print(op[-1]*0.05)
    
else:
    print('Do not exit')
    