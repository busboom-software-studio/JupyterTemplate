#!/usr/bin/env python
# coding: utf-8

# # SymPy
# 
# https://www.sympy.org/en/index.html
# 
# https://jaantollander.com/post/computer-algebra-with-sympy-and-jupyter/
# 
# 
# 

# In[3]:


from sympy import *
init_printing("mathjax") # sympy expression printing
#%%


x = symbols("x")
a,b,c = symbols("a,b,c", real=True)
i,j,n = symbols("i,j,n", integer=True)
f = symbols("f", cls=Function)


# ## Basic Equations

# In[8]:


eq = a*x**2 + b*x + c 
print(eq)


# In[9]:


solve(eq, x)


# ## Summation

# In[10]:


eq = Sum(x**i, (i, 1, n))
eq


# In[7]:


eq.doit()


# ## Differential Equations

# In[12]:


f = Function("f")

eq = diff(f(x), x, 2) + a*diff(f(x), x) + b*f(x) + c
eq


# In[13]:


dsolve(eq)


# In[ ]:




