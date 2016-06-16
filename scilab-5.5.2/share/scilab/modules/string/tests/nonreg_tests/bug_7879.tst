// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises- Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7879 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=7879
//
// <-- Short Description -->
// string now accepts plist type.

function order = mycompfun ( x , y )
    order = x+y;
endfunction

params = init_param();
params = add_param(params, "boolval", %f);
params = add_param(params, "funval", mycompfun);
params = add_param(params, "doubleval", 1);
params = add_param(params, "doublematrix", ones(10, 10));
params = add_param(params, "stringval", "1");
params = add_param(params, "stringmat", ["1" "2"]);

string(params)
