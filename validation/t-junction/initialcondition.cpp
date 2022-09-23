/* we should make these includes independent of the user */
#include "/home/nijso/CODES/su2/SU2_CFD/include/solver_structure.hpp"
#include "/home/nijso/CODES/su2/SU2_CFD/include/initialcondition.hpp"

/* initial condition for the mean variable */
su2double initcondmain(su2double Coords[3],int iVar){
  su2double init_value;
  cout << "1. calling initial condition from local library (main variables)" << endl;
  switch (iVar) {
    /* pressure */
    case 0:
      if (Coords[1] <= 0.0)
        init_value = 0.0;
      else
        init_value = 0.0;
      break;
    /* x-velocity */
    case 1:
      if ((fabs(Coords[1]) <= 0.00025) && (Coords[0]>0.0005))
        init_value = 1.0;
      else  
      if ((fabs(Coords[1]) <= 0.00025) && (Coords[0]<0.0005))
        init_value = Coords[0]/0.0005;
      else
        init_value = 0.0;
      break;
    /* y-velocity */
    case 2:
      if (Coords[1] <= -0.00025)
        init_value = 1.0;
      else
      if (Coords[1] >=  0.00025)
        init_value = -1.0;
      else
        init_value = 0.0;
      break;
    /* z-velocity */
    case 3:
        init_value = 0.0;
      break;
    /* temperature */
    case 4:
      if (Coords[1] <= 0.0)
        init_value = 293.15;
      else
        init_value = 293.15;
      break;
    default:
       init_value = 0.0;
       break;
  }

return(init_value); 
}

/* initial condition for the transported scalar */
su2double initcond(su2double Coords[3],int iVar){
  su2double init_value;
  cout << "calling initial condition from local library (transported scalars)" << endl;
  switch (iVar) {
    case 0:
      if (Coords[1] <= 0.0)
        init_value = 1.0;
      else
        init_value = 0.0;
      break;
    case 1:
      if (Coords[1] <= 0.0)
        init_value = 0.0;
      else
        init_value = 1.0;
      break;
    default:
       init_value = 0.0;
       break;
  }

return(init_value); 
}


void __attribute__ ((constructor)) initLibrary(void) {
 //
 // Function that is called when the library is loaded
 //
/* nijso: note that we should paralellize this */
    printf("Library is initialized from testcase directory\n"); 
    //we can put contructor stuff here like initialize variables
    // ...
}
void __attribute__ ((destructor)) cleanUpLibrary(void) {
 //
 // Function that is called when the library is »closed«.
 //
    printf("Library is exited\n"); 
}
