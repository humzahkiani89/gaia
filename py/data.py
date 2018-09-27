from astropy.io import fits
import matplotlib.pyplot as plt
import numpy as np


hdulist = fits.open('45000.fits')
hdulist.info()
data = hdulist[1].data
x=0
#print(data)
#mg = data[:,0]
#bp = data[:,1]
mg=[]
bp=[]
while (x<45000):    ##1187
    z = data[x]
    mg.append(z[0])
    bp.append(z[1])
    x=x+1
plt.scatter(bp,mg, c='k', s=(20.0/3.0), alpha=0.1, marker=".")
plt.xlim([0,4])
plt.ylim([12,-4])
plt.xticks(np.arange(0, 5, 1.0))
plt.axes().set_aspect(0.3)
plt.xlabel('G_BP - G_RP')
plt.ylabel('M_G')
plt.savefig('45000.png')
print(mg)
