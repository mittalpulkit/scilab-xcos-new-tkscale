// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->

funcprot(0);

deff('[y]=t(x)',[
'y=0'
'if x>0 then'
'  if x==1 then '
'    return'
'  else '
'    if x==2 then '
'       y=10'
'    else '
'       for u=1:x, '
'         y=y+u,'
'       end,'
'       return'
'    end'
'  end'
'else '
'  for u=1:-x, '
'    if u==4 then '
'      return,'
'    else '
'      y=u,'
'    end'
'  end'
'end'],'n')
//
if t(0)<>0 then pause,end
if t(1)<>0 then pause,end
if t(-1)<>1 then pause,end
//
t1=t;
comp(t1)
if t(0)-t1(0)<>0 then pause,end
if t(1)-t1(1)<>0 then pause,end
if t(-1)-t1(-1)<>0 then pause,end

//==========================================================================
//test of break
//==========================================================================

// for in macro
//--------------------------------------
deff('[k]=tt1()','k=0,for i=1:5 ,k=k+1;if k==3 then break,end,end,k=k+1','n')
if tt1()<>4 then pause,end
if tt1()<>4 then pause,end
clear tt1

deff('[k]=tt1()',[
'k=0,';
'for i=1:5 ,';
'  k=k+1;';
'  if k==3 then break,end,';
'  if k==-1 then 1,end,';
'end,k=k+1'],'n')
if tt1()<>4 then pause,end
if tt1()<>4 then pause,end

clear tt1

deff('[k]=tt1()',[
'k=0,';
'for i=1:5 ,';
'  k=k+1;';
'  if k==3 then break,end,';
'  for j=1:5,j,end,';
'end,';
'k=k+1'],'n')
if tt1()<>4 then pause,end
if tt1()<>4 then pause,end

// while
//----------------------------------------
deff('[k]=tt1()','k=0,while k<10 ,k=k+1;if k==3 then break,end,end,k=k+1','n')
if tt1()<>4 then pause,end
if tt1()<>4 then pause,end
clear tt1

deff('[k]=tt1()',[
'k=0,';
'while k<10 ,';
'  k=k+1;';
'  if k==3 then break,end,';
'  if k==-1 then 1,end,';
'end,k=k+1'],'n')
if tt1()<>4 then pause,end
if tt1()<>4 then pause,end

clear tt1

deff('[k]=tt1()',[
'k=0,';
'while k<10 ,';
'  k=k+1;';
'  if k==3 then break,end,';
'  for j=1:5,j,end,';
'end,';
'k=k+1'],'n')
if tt1()<>4 then pause,end
if tt1()<>4 then pause,end
//
// keyboard mode 
//------------------------
k=0;while k<10 ,k=k+1;if k==3 then break,end,end,k=k+1;
if k<>4 then pause,end

k=0;while k<10 ,k=k+1;if k==3 then break,end,end,
k=k+1;
if k<>4 then pause,end

k=0;for  i=1:5 ,k=k+1;if k==3 then break,end,end,k=k+1;
if k<>4 then pause,end

k=0;for  i=1:5 ,k=k+1;if k==3 then break,end,end,
k=k+1;
if k<>4 then pause,end

//
k=0;while k<10,if k==0 then break,end,k=k+1;end,k=k+1;
if k<>1 then pause,end

k=0;while k<10,if k==0 then break,end,k=k+1;end,
k=k+1;
if k<>1 then pause,end

k=0;for i=1:5,if k==0 then break,end,k=k+1;end,k=k+1;
if k<>1 then pause,end

k=0;for i=1:5,if k==0 then break,end,k=k+1;end,
k=k+1;
if k<>1 then pause,end


//==========================================================================
//test of continue
//==========================================================================

//in a for
//----------

n=3;
c=[];for k=1:5,if k==n then continue,end,c=[c,k];end
if or(c<>[1 2 4 5]) then pause,end
n=5;
c=[];for k=1:5,if k==n then continue,end,c=[c,k];end
if or(c<>[1 2 3 4]) then pause,end



deff('c=foo(n)','c=[];for k=1:5,if k==n then continue,end,c=[c,k],end','n')
if or(foo(3)<>[1 2 4 5]) then pause,end
if or(foo(5)<>[1 2 3 4]) then pause,end
comp(foo)
if or(foo(3)<>[1 2 4 5]) then pause,end
if or(foo(5)<>[1 2 3 4]) then pause,end

 
n=3;
c=[];for i=1:3,for k=1:4,if k==n&i==2 then continue,end,c=[c,k];end;end
if or(c<>[1,2,3,4, 1,2,4, 1,2,3,4]) then pause,end
n=4;
c=[];for i=1:3,for k=1:4,if k==n&i==2 then continue,end,c=[c,k];end;end
if or(c<> [1,2,3,4, 1,2,3, 1,2,3,4]) then pause,end

deff('c=foo(n)','c=[];for i=1:3,for k=1:4,if k==n&i==2 then continue,end,c=[c,k];end;end','n')
if or(foo(3)<>[1,2,3,4, 1,2,4, 1,2,3,4]) then pause,end
if or(foo(4)<>[1,2,3,4, 1,2,3, 1,2,3,4]) then pause,end
comp(foo)
if or(foo(3)<>[1,2,3,4, 1,2,4, 1,2,3,4]) then pause,end
if or(foo(4)<>[1,2,3,4, 1,2,3, 1,2,3,4]) then pause,end


//in a while
//----------
//
n=3;
c=[];k=0;while k<5,k=k+1;if k==n then continue,end,c=[c,k];end
if or(c<>[1 2 4 5]) then pause,end
n=5;
c=[];k=0;while k<5,k=k+1;if k==n then continue,end,c=[c,k];end
if or(c<>[1 2 3 4]) then pause,end
deff('c=foo(n)','c=[];k=0;while k<5,k=k+1;if k==n then continue,end,c=[c,k],end','n')
if or(foo(3)<>[1 2 4 5]) then pause,end
if or(foo(5)<>[1 2 3 4]) then pause,end

comp(foo)
if or(foo(3)<>[1 2 4 5]) then pause,end
if or(foo(5)<>[1 2 3 4]) then pause,end

n=3;
c=[];for i=1:3,k=0;while k<4,k=k+1;if k==n&i==2 then continue,end,c=[c,k];end;end
if or(c<>[1,2,3,4, 1,2,4, 1,2,3,4]) then pause,end
n=4;
c=[];for i=1:3,k=0;while k<4,k=k+1;,if k==n&i==2 then continue,end,c=[c,k];end;end
if or(c<> [1,2,3,4, 1,2,3, 1,2,3,4]) then pause,end

clear foo
deff('c=foo(n)','c=[];for i=1:3,k=0;while k<4,k=k+1;if k==n&i==2 then continue,end,c=[c,k];end;end','n')
if or(foo(3)<>[1,2,3,4, 1,2,4, 1,2,3,4]) then pause,end
if or(foo(4)<>[1,2,3,4, 1,2,3, 1,2,3,4]) then pause,end
comp(foo)
if or(foo(3)<>[1,2,3,4, 1,2,4, 1,2,3,4]) then pause,end
if or(foo(4)<>[1,2,3,4, 1,2,3, 1,2,3,4]) then pause,end
