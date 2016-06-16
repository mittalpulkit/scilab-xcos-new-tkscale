// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2010 - DIGITEO 
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
ilib_verbose(0);
mkdir(pathconvert(TMPDIR+"/booleanSparseExample"));
cd(pathconvert(TMPDIR+"/booleanSparseExample"));
copyfile(SCI+"/modules/api_scilab/tests/unit_tests/booleanSparseExample.c",pathconvert(TMPDIR+"/booleanSparseExample/booleanSparseExample.c",%F));
cflags = "-I"+SCI+"/modules/localization/includes";
ilib_build("gw_booleanSparseExample",["booleanSparseExample","booleanSparseExample"],"booleanSparseExample.c",[],"","",cflags);
exec("loader.sce");

bsp = sparse([1,1;2,2;3,3],[%t,%t,%t]);
assert_checkequal(booleanSparseExample(bsp), bsp);
