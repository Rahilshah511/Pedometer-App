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

ty=input("YYYY-MM-DD:")
df3=pd.DataFrame(columns=['user','total'])
for j in list(df['user']):
    q=j+t
    df4=pd.DataFrame(pd.read_csv(q,names=list(df1['date'])))
   
    df3.loc[len(df3.index)] = [j,df4[ty].iloc[-1]] 
df3 = df3.astype({'total':'int'})
kp=df3.sort_values('total',ascending=False)
tp=kp.head(5)
kp.plot.bar('user','total',color='k',linestyle='-',linewidth=2)
plt.show()



        
