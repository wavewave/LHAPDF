#include "lhapdf.h"
#include "LHAPDF/LHAPDF.h"
#include <iostream>
#include <cstdlib>
using namespace std;
  
void my_initPDFSet( const char* name ) 
{
  const int SUBSET = 0 ; 
  const string NAME = name ; 

  LHAPDF::initPDFSet(NAME, LHAPDF::LHGRID,  SUBSET ); 
}


double my_alphasPDF( double mu ) 
{
  return LHAPDF::alphasPDF( mu ); 
}

int my_numberPDF( void ) 
{
  return LHAPDF::numberPDF() ; 
}

void my_initPDF( int n )
{
  LHAPDF::initPDF( n ); 
}

double my_xfx( double x, double Q, int n ) 
{
  LHAPDF::xfx(x,Q,n); 
}
