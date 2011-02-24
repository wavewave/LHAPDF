#ifdef __cplusplus
extern "C" { 
#endif

void my_initPDFSet( const char* name ) ; 

double my_alphasPDF( double mu ) ; 

int my_numberPDF( void ) ;

void my_initPDF( int n ); 

double my_xfx( double x, double Q, int n ) ;

#ifdef __cplusplus
}
#endif
