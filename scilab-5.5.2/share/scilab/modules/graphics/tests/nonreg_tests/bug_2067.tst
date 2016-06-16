// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2006-2008 - INRIA - Jean-Baptiste SILVY <jean-baptiste.silvy@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2067 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=2067
//
// <-- Short Description -->
//    Scilab dies when the Plot command is given a large numerical value.
//
//    Tried it with Scilab Nightly Build 20060710.
//
//    Greetings from Poland,
//    Lukasz Hladowski.

// the bug was hanging the computer

plot( 10^16, 5);
