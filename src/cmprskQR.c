#include <R.h>
#include <Rdefines.h>
#include <R_ext/Error.h>
#include <Rmath.h>

SEXP comptmp21(SEXP Num, SEXP ZI_mat, SEXP Compare_vec) {
	SEXP Res;
	int nprotect, i, j, d, num, t;
	double *zi_mat, *res;
	int *compare_vec;
	double tmp;
	
	num = INTEGER_VALUE(Num);
	d = INTEGER(GET_DIM(ZI_mat))[1];
	zi_mat = NUMERIC_POINTER(ZI_mat);
	compare_vec = INTEGER_POINTER(Compare_vec);
	
	nprotect = 0;
	
	PROTECT(Res = allocMatrix(REALSXP, num, d)); nprotect++;
	res = NUMERIC_POINTER(Res);
	
	for (j=0; j<d; j++) {
		tmp = 0.0;
		for(t=0; t<compare_vec[0]; t++) {
			tmp += zi_mat[t+j*num];
		}
		res[j*num] = tmp;
	}
	
	for(i=1; i<num; i++) {
		for (j=0; j<d; j++) {
			tmp = 0.0;
			for(t=compare_vec[i-1]; t<compare_vec[i]; t++) {
				tmp += zi_mat[t + j * num];
			}
			res[i + j * num] = res[(i-1) + j * num] + tmp;
		}
	}
	
	UNPROTECT(nprotect);
	return(Res);
}
