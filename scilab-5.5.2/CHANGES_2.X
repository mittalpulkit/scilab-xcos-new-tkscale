                     Main Changes Scilab 2.6 -> 2.7
                     ==============================
THANKS
======
Scilab group wants to thank the increasing number of people who have
contributed to this new version of Scilab, with special mention to 
Anders Blomdell, St�phane Mottelet, Dan McMahill
Ton van Overbeek, Bruno Pincon and Enrico Segre.


NEW FUNCTIONALITIES
===================
Slicot based control routines (www.win.tue.nl/wgs/slicot.html)
have been introduced with a special attention 
to identification functions, lyapunov, sylvester and riccati equation solvers.

Interface with TeXmacs (www.texmacs.org) a high level scientific text editor. 
The editor allows you to write structured documents via a wysiwyg interface 
including Scilab sessions and results.

An embedded text editor scipad derived from TkNotepad 
(www.mindspring.com/~joeja/programs.html) as been developed.

C Code generation from Scicos discrete models 

Blocks defining DAE are now usable in Scicos.

Statistic toolbox added (labostat).

A new graphics version based on objects and entities has been developed
(beta version). It allows to edit the properties of graphics
objects. By default, the old graphics version is used. Tu use the new graphics
version see the help of "graphics_entities".

OTHERS IMPROVEMENTS
===================
Linear algebra primitives now based on Lapack instead of Linpack/Eispack.

Basic functions revised (thanks to B Pincon).

stacksize use is no more restricted.

Hypertext, xml based, online help.

Binary Matlab file .mat loader (loadmatfile) added.

Possibility to customize graphics window event handlers (seteventhandler).

PVM interface now also works with Windows versions.

edit_graph, a graph editor for Metanet toolbox, written in Scilab, replaces
xmetanet. It works on both Unix and Windows.

INCOMPATIBLITIES
================
It is higly recommended to rebuild user's scilab functions libraries. This 
can be done as follow:
predef(0);genlib('mylib','mylib_path',%t)

gschur and gspec functions are now obsolete and replaced by schur and spec.

Geci and the communication library have been removed. Use PVM interface instead.

Metanet graph editor has been rewritten. Use edit_graph instead.

man pages have to be written in HTML or better in XML but chapters 
written in the old ascii files are still handled.

Scicos internal data structure have been changed. Automatic translation 
is made when  old diagrams are loaded.

                     Main Changes Scilab 2.5 -> 2.6
                     ==============================
THANKS
======
Scilab group wants to thank the increasing number of people who have
contributed to this new version of Scilab, with special mention to 
Anders Blomdell, Lydia Ellen van Dijk, Stephane Mottelet, Dan McMahill
Ton van Overbeek, Bruno Pincon and Enrico Segre.


NEW FUNCTIONALITIES
===================
Automatic graphic rescaling when combining 2D plots, axis handling

Isometric 3D plots. Thanks to Enrico Segre

3D plots shading. Thanks to Stephane MOTTELET

Error messages handling

Grep function added

Modeless message box added

Profiling of functions execution added

Real time simulation in Scicos. Thanks to Anders Blomdell

Scicos diagram linearization and fixed point computation

OTHERS IMPROVEMENTS
===================
A more professional licence

Input/Output improved (carriage return at the end of the file are not
required anymore, OS independent ascii file input, handling of opened
files )

More complete mexlib for MatlabV mex interface.

Many bug corrected in integer types manipulation

API improved, many examples given

A better window management under KDE

A better plugin interface (help, demos,...) and new Scilab functions for
building and loading interfaces.

Interactive demos for ODE and DAE solving added

Scicos' GUI improved, customizable keyboard shortcuts added

Default list, tlist and mlist display can be overloaded

It is now possible to draw dashed lines in color. Background now work
with postscript driver. Easiest argument passing to plot2d, plot3d,...
GIF driver bugs fixed.

INCOMPATIBLITY
==============
help and scicos palettes handling have changed.

Fraclab toolbox has been moved to the contributions part and is no
more  included in the package 

The Communication Toolbox (geci) is now obsolete. It will be removed in 
next release. Use PVM instead.

		     Main Changes Scilab 2.4.1 -> 2.5
		     ================================

NEW FUNCTIONALITIES
===================
Global variables have been introduced

New graphic mode has been added to allow scrollbar handling (panner
for X Window and scrollbars for Windows). 
GIF export format is now available for Scilab graphic windows.

Keyboard events and window closing within graphical windows can now be
captured.

Scicos graphical user interface has been made more intuitive and
keyboard shortcuts have been added.

Scilab Binary files created by "save" are now system-independent so
they can be exchanged. In particular (compiled macros) *.bin files and
*.cos (scicos diagrams) can be exchanged.

It is now possible to dynamically link C++ procedures with Scilab.

A new data type "mlist" has been added.

A new function "genlib" allows users to compile the .sci files in a
given directory, generate associated library and load it. This
function is particularly useful under windows if VC++ is not
available. 

C formatted input output functions (printf, scanf, ..) have been
interfaced to scilab.

OTHERS IMPROVEMENTS
===================
Efficiency has been improved using reference argument passing when
possible instead of value passing.

Hypermatrix opreations have been accelerated.

On X Window systems 3D Athena Widgets are preferably used instead of
standard  Athena Widgets for a better look.

The "Matlab 4" to Scilab translator has been completed and considerably
improved.



NEW TOOLBOXES
=============
True integer data types (1,2 and 4 bytes) with associated operations
and some functions acting on them have been added. 

A library of procedures has been added to allow the use of Matlab
mex-files under Scilab.

PORTS
=====
Scilab has been successfully compiled with Windows ABSOFT development
environment.

INCOMPATIBILITIES
=================
New Scilab "save"d files cannot be loaded by earlier Scilab versions.
A new function "oldsave" has been added to save in old format.

Scilab help mechanism has changed. The $MANCHAPTERS/Chapter is no more
used, instead a Scilab variable "helps" is used.





		     Main Changes Scilab 2.4 -> 2.4.1
		     ================================

Many bugs fixed.

Option "--without-pvm" added to configure to compile Scilab 
  without PVM library.

NEW MACHINES
============

Scilab runs now on MAC Mklinux and DEC Alpha Linux.

NEW FUNCTIONALITIES
===================

The Matlab to Scilab translator has been considerably improved.

After fixing a number of bugs, Scicos is no longer considered a beta release.

Metanet toolbox: Function "netclose" for closing a Metanet window 
                 has been added.

                     Main Changes Scilab 2.3 -> 2.4
                     ==============================

WINDOWS 95/NT
=============

This version is no longer a beta version. Incremental link is now possible.

PVM interface and Xmetanet do not work yet.

NEW TOOLBOXES
=============

m2sci: beta version of a Matlab to Scilab translator.

Fraclab: fractal and wavelet analysis.

Tksci: beta Tcl/Tk interface.

PVM: beta PVM interface (not yet available on Windows).

dcd: cumulative distribution functions and inverses...

grand: random number generators.

NEW FUNCTIONALITIES
===================

Metanet toolbox: Function "pipe_network" for solving the pipe network problem 
                 has been added.

Scicos toolbox: - New and improved formalism
                - Faster Compiler 
                - Improved GUI

Maple toolbox: The Maple to Scilab interface (maple/maple2scilab.mpl)
               has been improved. Sparse matrices are handled. There is
               now the choice between C and Fortran code generation.

Nonlinear toolbox: Addition of 2D and 3D definite integrals int2d et int3d.

Data types: N dimensional arrays have been introduced (see hypermatrices).

chdir and getcwd functions added to change and get working directory.

Floating points exception handling may be set by "ieee" function.

Overloading: It is now possible to overload display of tlist data
             structure. It is also possible to extend basic primitive
             function definition to new data types. To avoid possible
             ambiguity overloading function names have been
             changed. Old names still work, but for efficiency it
             desirable to change it. See overloading help.

Syntax: Functions with strings arguments may be called as commands.
        For instance "exec('foo.sce')" can be entered as "exec foo.sce".

        It is now possible to define functions with unbounded number
        of input and output arguments (see varargin help).

INCOMPATIBILITIES
=================

Some old Scicos diagrams may not be translated properly into Scilab 2.4.

Binary files created by "save" in Scilab 2.4 cannot be read by Scilab 2.3.

Scicos diagrams created by "save" in Scilab 2.4 cannot be read by Scilab 2.3.

