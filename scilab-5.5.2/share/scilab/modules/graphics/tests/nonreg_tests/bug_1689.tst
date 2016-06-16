// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 1689 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=1689
//
// <-- Short Description -->
// Size of graphic window specify by user might no be correct depending
// on plateform

figureSize = [800, 600];

// check that final figure size is the one specified
hf = gcf();
xset ("wpdim", figureSize(1), figureSize(2));
if (hf.figure_size <> figureSize) then pause; end;

sleep(200);//Wait for MVC update

figureSize = [640, 480];
hf.figure_size = figureSize;
if (hf.figure_size <> figureSize) then pause; end;
