%module(directors="1") ctp

%{
#include "ThostFtdcUserApiDataType.h"
#include "ThostFtdcUserApiStruct.h"
#include "ThostFtdcTraderApi.h"
#include "ThostFtdcMdApi.h"
%}

%include "typemaps.i"
%typemap(in) (char **ARRAY, int SIZE) {
  if (rb_obj_is_kind_of($input, rb_cArray)) {
    int size = RARRAY_LEN($input);
    $2 = ($2_ltype)size;
    $1 = (char **)malloc((size+1)*sizeof(char *));
    VALUE *ptr = RARRAY_PTR($input);
    int i=0;
    for (; i < size; i++, ptr++) {
      $1[i] = StringValuePtr(*ptr);
    }
    $1[i] = 0;
  } else {
    $1 = 0; $2 = 0;
    %argument_fail(SWIG_TypeError, "char **ARRAY, int SIZE", $symname, $argnum);
  }
 }

%typemap(typecheck, precedence=SWIG_TYPECHECK_STRING_ARRAY) (char **ARRAY, int SIZE) {
  $1 = rb_obj_is_kind_of($input, rb_cArray);
 }

%typemap(freearg) (char **ARRAY, int SIZE) {
  /* free((char *)$1); */
 }

%apply (char **ARRAY, int SIZE) { (char *ppInstrumentID[], int nCount) };

%include "ThostFtdcUserApiDataType.h"
%include "ThostFtdcUserApiStruct.h"


%feature("director") CThostFtdcMdSpi;
%include "ThostFtdcMdApi.h"


%feature("director") CThostFtdcTraderSpi;
%include "ThostFtdcTraderApi.h"
