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
H=0.015

my_list = [-6, 0.0, 3, 6, 14,17,20,24,27,30,34,40,47,53,60,67,74]

# from where to where
y_min = 0.000
y_max = 0.0705
# -------------------------------------------------------------------------- #


# -------------------------------------------------------------------------- #
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

vtkfilename = 'diffuser/zone_0/Internal.vtu'
print "vtu filename:"
print vtkfilename

# create a new 'Legacy VTK Reader'
#flowvtk = LegacyVTKReader(FileNames=[vtkfilename])
flowvtk = XMLUnstructuredGridReader(FileName=vtkfilename)

# loop over the list of line locations
for x in my_list:
        print x
        # create a new 'Plot Over Line'
        plotOverLine1 = PlotOverLine(Input=flowvtk, Source='High Resolution Line Source')

        # Properties modified on plotOverLine1.Source
        plotOverLine1.Source.Point1 = [x*H, y_min, 0.0]
        plotOverLine1.Source.Point2 = [x*H, y_max, 0.0]
        # Properties modified on plotOverLine1.Source
        plotOverLine1.Source.Resolution = 200

        # save data
        base='line_'
        print base
        # just adding the number to the string will lead to binary approximations
        # so we construct a nice string for the filename
        #ext='{:2.5f}'.format(x)
        ext='{:2.2f}'.format(x)
        print ext
        # note that paraview determines how to save the file using the extension
        filename = base+ext+'.csv'
        print filename
        SaveData(filename, proxy=plotOverLine1)

print "end of loop over lineplots"
