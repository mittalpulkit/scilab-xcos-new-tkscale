// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010-2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 8719 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=8719
//
// <-- Short Description -->
// The karmarkar function prints unwanted messages.
//


c = [-20 -24 0 0]';
a = [
3 6 1 0
4 2 0 1
];
b = [60 32]';
expected = [4 8 0 0]';
x0 = [
4.1128205
7.7333333
1.2615385
0.0820513
];
xopt=karmarkar(a,b,c,x0);
assert_checkalmostequal ( xopt , expected , 1.e-3, 1.e-3 );

