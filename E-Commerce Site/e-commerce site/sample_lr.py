import numpy
import csv
#####################################CNN #######################################
dataset = numpy.loadtxt("ibm.csv", delimiter=",",skiprows=1)

# split into input (X) and output (Y) variables
# Train Set
X = dataset[:, 0:4]
print(X)
Y = dataset[:, 4:]
print(Y)