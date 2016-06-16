// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->


assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/tests/unit_tests/fromws_c.zcos"));

V = struct('time', (1:100)', 'values', sin((0:0.1:9.9)'));
scicos_simulate(scs_m, list());
