# script to extract massflow weighted averages of CO on slices through the domain
#
# To ensure correct image size when batch processing, please search 
# for and uncomment the line `# renderView*.ViewSize = [*,*]`
import os,glob

#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'XML Unstructured Grid Reader'
flowvtu = XMLUnstructuredGridReader(FileName=['/home/nbe0dev/fluentsims/su2/p1_0300/flow.vtu'])

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')

# show data in view
flowvtuDisplay = Show(flowvtu, renderView1)

# trace defaults for the display properties.
flowvtuDisplay.Representation = 'Surface'

# reset view to fit data
renderView1.ResetCamera()

#changing interaction mode based on data extents
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [0.026750000193715096, 0.0010000000474974513, 10000.0]
renderView1.CameraFocalPoint = [0.026750000193715096, 0.0010000000474974513, 0.0]

# update the view to ensure updated data information
renderView1.Update()

f = open('output.txt','wb')
f.write("#x[m] Temperature[K] X-CO[-]  X-CO-mass[-] CO[ppm] CO-mass[ppm]\n")

# we want to have 97 different slices, every slice is 1 mm large
xs=range(1,535,1)


# create a new 'Slice'
slice1 = Slice(Input=flowvtu)

# Properties modified on slice1.SliceType
slice1.SliceType.Origin = [0.0, 0.0, 0.0]
slice1.SliceType.Normal = [1.0, 0.0, 0.0]

#nrm=GenerateSurfaceNormals(Input=slice1)
# create a new 'Calculator'
# compute the mass flux
calcMassFlux = Calculator(Input=slice1)
calcMassFlux.ResultArrayName = "MassFlux"
calcMassFlux.Function = 'Density*Velocity_X'

# compute the molar mass of the mixture
MM = Calculator(calcMassFlux)
MM.ResultArrayName = "M"
MM.Function = 'lookup_MolarWeightMix'

# compute rho * X-H2O
calcH2OFlux = Calculator(MM)
calcH2OFlux.ResultArrayName = "rhoH2O"
calcH2OFlux.Function = 'lookup_Y-H2O*MassFlux * M/18.01528'

# compute rho * X-O2
calcO2Flux = Calculator(calcH2OFlux)
calcO2Flux.ResultArrayName = "rhoO2"
calcO2Flux.Function = 'lookup_Y-O2*MassFlux * M/15.999'

# compute rho * X-CO
calcCOFlux = Calculator(calcO2Flux)
calcCOFlux.ResultArrayName = "rhoCO"
calcCOFlux.Function = 'y-co-split*MassFlux * M/28.01'

# compute rho * X-NO
calcNOFlux = Calculator(calcCOFlux)
calcNOFlux.ResultArrayName = "rhoNO"
calcNOFlux.Function = 'y-no-split*MassFlux * M/30.0061'

# compute rho * T
calcTFlux = Calculator(calcNOFlux)
calcTFlux.ResultArrayName = "rhoT"
calcTFlux.Function = 'Temperature*MassFlux'

# update the view to ensure updated data information
renderView1.Update()

# create a new 'Integrate Variables'
integrateVariables1 = IntegrateVariables(calcTFlux)

# get layout
layout1 = GetLayout()

# update the view to ensure updated data information
renderView1.Update()

for x in xs:
        # define a point in the slice (the normal was defined above)
	slice1.SliceType.Origin = [0.0+x/10000.0, 0.0, 0.0]

	integrateVariables1.UpdatePipeline()
	data = servermanager.Fetch(integrateVariables1)
	pointdata=data.GetPointData()

	myrhoT = pointdata.GetArray('rhoT')
        myMassFlux=pointdata.GetArray('MassFlux')
	myCO = pointdata.GetArray('y-co-split')
	myNO = pointdata.GetArray('y-no-split')
	myrho = pointdata.GetArray('Density')
	myrhoCO = pointdata.GetArray('rhoCO')
	myrhoNO = pointdata.GetArray('rhoNO')
	myH2O = pointdata.GetArray('rhoH2O')
	myO2 = pointdata.GetArray('rhoO2')

	CO = myCO.GetValue(0)
	NO = myNO.GetValue(0)
	O2 = myO2.GetValue(0)
	H2O = myH2O.GetValue(0)

        intmassflux = myMassFlux.GetValue(0)

        COmass = CO/intmassflux
        NOmass = NO/intmassflux
        O2mass = O2/intmassflux
        H2Omass = H2O/intmassflux

        COdaf = 1.0e6 * COmass / (1.0-H2Omass-O2mass)
        NOdaf = 1.0e6 * NOmass / (1.0-H2Omass-O2mass)
        #COppm=COmass*1e6
        
        xlocation=x/10000.0
	print(x, xlocation, CO, O2, H2O, COmass, O2mass, H2Omass,COdaf)
	f.write("%.8f %.6f %.6f %.6f \n" % (x/1000.0, xlocation, COmass, COdaf))
# end of the loop: close the file and exit
f.close()
