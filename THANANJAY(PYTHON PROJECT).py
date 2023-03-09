#!/usr/bin/env python
# coding: utf-8

# In[ ]:


Name - THANANJAY
Roll num - 21P050


# In[1]:


import pandas as pd


# In[2]:


df = pd.read_csv('train.csv')


# In[3]:


df.info()


# In[4]:


df.head(10)


# In[5]:


df.tail(10)


# In[6]:


df.describe()


# In[7]:


import matplotlib.pyplot as plt


# In[10]:


plt.hist(df['views'])
plt.show()


# In[16]:


plt.scatter(df['likes'], df['views'])
plt.show()


# In[17]:


import seaborn as sns


# In[18]:


sns.heatmap(df.corr(), annot=True)
plt.show()

