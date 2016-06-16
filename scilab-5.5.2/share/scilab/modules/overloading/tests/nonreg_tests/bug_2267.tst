// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 2267 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=2267
//
// <-- Short Description -->
// Wrong error message when ticks locations and labels have not the same sizes

clf(); plot2d(); a=gca();
errmsg1=msprintf(_("%s: Incompatible sizes for properties ''%s'' and ''%s'': Same sizes expected.\n"), "generic_i_h", "x_ticks.locations", "x_ticks.labels");
execstr("a.x_ticks.locations=0:2:6","errcatch"); //assert_checkerror does not catch the error here
assert_checkequal(lasterror(), errmsg1);
execstr("a.x_ticks.labels=string([0:2:6])", "errcatch");
assert_checkequal(lasterror(), errmsg1);

errmsg2=msprintf(_("%s: Incompatible sizes for properties ''%s'' and ''%s'': Same sizes expected.\n"), "generic_i_h", "y_ticks.locations", "y_ticks.labels");
execstr("a.y_ticks.locations=-2:1:2", "errcatch");
assert_checkequal(lasterror(), errmsg2);
execstr("a.y_ticks.labels=string([-2:1:2])", "errcatch");
assert_checkequal(lasterror(), errmsg2);
close
