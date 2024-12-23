import numpy as np

meV2k = 11.60452500617 # meV to K 

mu = 0.16

## outside cavity 
#eph = 1.4071280
## inside cavity (one mode) 
#eph = 1.4723845
## inside cavity (two modes)
#eph = 1.5143227
## inside cavity (three modes)
eph = 1.4951758

## outside cavity 
#wlog = 20.210312
## inside cavity (one mode) 
#wlog = 19.710538
## inside cavity (two modes)
#wlog = 19.282755
## inside cavity (three modes)
wlog = 19.749143


def Tc_Allen_Dynes(wlog, mu, eph):
    prefactor = wlog/1.2 * meV2k
    exponent = -1.04*(1+eph)
    exponent = exponent/(eph-mu*(1+0.62*eph))
    return prefactor*np.exp(exponent)

print(Tc_Allen_Dynes(wlog, mu, eph))
