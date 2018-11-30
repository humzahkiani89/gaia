from astropy.io import fits
import matplotlib.pyplot as plt
import numpy as np


hdulist = fits.open('../data/modextinction.fits')
hdulist.info()
data = hdulist[1].data
x=0
#print(data)
#mg = data[:,0]
#bp = data[:,1]
mg=[]
bp=[]
while (x<1187):    ##1187
    z = data[x]
    mg.append(z[0])
    bp.append(z[1])
    x=x+1
plt.scatter(bp, mg, c='k', s=(.5), alpha=.9, marker=".")
plt.xlim([0,4])
plt.ylim([12,-4])
#plt.xticks(np.arange(0, 4, 1.0))
plt.axes().set_aspect(0.3)
#plt.axis([0.,4,-4,12])
plt.xlabel('G_BP - G_RP')
plt.ylabel('M_G')
plt.savefig('withextinction.png')


