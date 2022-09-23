# run using 
# pvpython --version 5.2.0-client extractlinedata.py 
# we will then have the line data in separate .csv files

#### import the simple module from the paraview
from paraview.simple import *
# for file handling
from glob import glob

print "--------------------"
print "extracting line data"
print "--------------------"

# define a list of locations downstream of the burner where we should create line plots
# -------------------------------------------------------------------------- #
x_burner = 0.0
my_list = [x_burner+0.000, x_burner+1.0, x_burner+2.0]
y_min = 0.000
y_max = 1.0
# -------------------------------------------------------------------------- #


# -------------------------------------------------------------------------- #
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'XML Unstructured Grid Reader'
flowvtu = XMLUnstructuredGridReader(FileName=['flow.vtu'])

# loop over the list of line locations
for x in my_list:
  print x
  # create a new 'Plot Over Line'
  plotOverLine1 = PlotOverLine(Input=flowvtu, Source='High Resolution Line Source')

  # Properties modified on plotOverLine1.Source
  plotOverLine1.Source.Point1 = [x, y_min, 0.0]
  plotOverLine1.Source.Point2 = [x, y_max, 0.0]
  # Properties modified on plotOverLine1.Source
  plotOverLine1.Source.Resolution = 400

  # save data
  base='line_'
  # just adding the number to the string will lead to binary approximations
  # so we construct a nice string for the filename
  ext='{:2.5f}'.format(x)
  # note that paraview determines how to save the file using the extension
  filename = base+ext+'.csv'
  print filename
  SaveData(filename, proxy=plotOverLine1)

print "end of loop over lineplots"

