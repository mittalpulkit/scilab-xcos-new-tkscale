// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
// <-- Non-regression test for bug 7057 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=7057
//
// <-- Short Description -->
// isdigit & isalphanum crashed with a matrix of string as input argument.
//======================================================================================== 
a = ["a1";"b2b";"1cc2c";"4d555"];
ierr = execstr('isdigit(a)','errcatch');
if ierr == 0 then pause, end
//======================================================================================== 
a = ["a1";"b2b";"1cc2c";"4d555"];
ierr = execstr('isalphanum(a)','errcatch');
if ierr == 0 then pause, end
//======================================================================================== 
