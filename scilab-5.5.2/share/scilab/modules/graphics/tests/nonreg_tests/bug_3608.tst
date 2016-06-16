// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 3608-->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=3608
//
// <-- Short Description -->
// Scilab freezes when executing a combination of "eventhandler", "xchange" and "plot".
// 

function follow(win,x,y,ibut)
  [xx,yy]=xchange(x,y,"i2f");
endfunction

x=linspace(0,1,100); plot(x,x);

seteventhandler("follow")
for i=1:100,
 plot(x,x);
 [xx,yy] = xchange(i,i,"i2f");
 [xi, yi] = xchange(xx,yy,"f2i");
end

// used to crash scilab because of errors in the stack

