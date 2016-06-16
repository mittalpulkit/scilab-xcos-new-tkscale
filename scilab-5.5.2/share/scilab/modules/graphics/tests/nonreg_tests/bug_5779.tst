// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 5779 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=5779
//
// <-- Short Description -->
// xnumb number format too small

nb_grad = 3;
[valeurs] = linspace (0.935000 ,1.000000 ,nb_grad);
[x] = linspace (0.95,0.95,nb_grad);
[y] = linspace (-0.02,0.02,nb_grad);
plot2d ([0.935000 ,1.000000] ,[-0.03,0.03]);
xnumb(x,y,valeurs);
a=gca();
assert_checkalmostequal(strtod(a.children(1).text),valeurs(3));
assert_checkalmostequal(strtod(a.children(2).text),valeurs(2));
assert_checkalmostequal(strtod(a.children(3).text),valeurs(1));
close
