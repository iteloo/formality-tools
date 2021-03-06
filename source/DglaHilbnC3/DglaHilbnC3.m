(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



BeginPackage["FormalityTools`DglaHilbnC3`",{"FormalityTools`Helpers`"}];


SetupDgla::usage="Set up the dgla using the partition describing a monimial ideal.";
CleanDgla::usage="Clean up the dgla.";
Dgla::usage="Returns the dgla associated with the input partition. If no input is given, it will use the partition currently set up. Will override previous SetupDgla.";
d::usage="The differential";
c::usage="The graded Lie bracket";


Begin["`Private`"];


SetupDgla[\[Mu]in_List]:=Module[{},
CleanDgla[];
\[Mu]=\[Mu]in;
nonzeroDegrees=Range[3];
]


CleanDgla[]:=Module[{},
ClearCache/@Unevaluated/@Unevaluated[{\[Mu],B,c,d,pp,P,nonzeroDegrees,dO}];
]


Dgla[]:=Module[{},
{
Table[{i,d[i]},{i,Select[nonzeroDegrees,MemberQ[nonzeroDegrees,#+1]&]}],Table[With[{i=\[Alpha][[1]],j=\[Alpha][[2]]},{{i,j},c[i,j]}],{\[Alpha],Select[Flatten[Outer[List,nonzeroDegrees,nonzeroDegrees],1],MemberQ[nonzeroDegrees,Plus@@#]&]}]
}
]


Dgla[\[Mu]in_]:=Module[{result},
SetupDgla[\[Mu]in];
result=Dgla[];
CleanDgla[];
result
]


e[i_]:=e[i]=Table[KroneckerDelta[i,j],{j,1,3}];
\[Delta]=KroneckerDelta;
\[Delta]12[i_,J_]:=\[Delta]12[i,J]=Boole[{{2,3},{3,1},{1,2}}[[i]]==J];


pp[r_,h_]:=pp[r,h]=Boole[MemberQ[\[Mu],r]]\[Delta][r,h];
P[i_,h_,r_]:=pp[r+e[i],h];


B[x_]:=B[x]=Switch[x,
0,Flatten[Outer[List,\[Mu],\[Mu],1],1],
1,Flatten[Outer[List,{1,2,3},\[Mu],\[Mu],1],2],
2,Flatten[Outer[List,{{2,3},{3,1},{1,2}},\[Mu],\[Mu],1],2],
3,B[0]
];


d[i_]:=d[i]=ct[c[1,i],Apply[P,B[1],1],2,1];


c[a_Integer,b_Integer]:=c[a,b]=If[b<a,Transpose[-(-1)^(a b)c[b,a],{1,3,2}],
SparseArray@Switch[{a,b},
{0,0},
Module[{h,r,p,q,s,t},
Table[
{h,r}=\[Beta];
{p,q}=\[Alpha]1;
{s,t}=\[Alpha]2;
\[Delta][h,p]\[Delta][q,s]\[Delta][r,t]-\[Delta][p,t]\[Delta][r,q]\[Delta][h,s]
,{\[Beta],B[0]},{\[Alpha]1,B[0]},{\[Alpha]2,B[0]}]
],
{0,1},
Module[{i,l,h,r,p,q,s,t},
Table[
{i,h,r}=\[Beta];
{p,q}=\[Alpha]1;
{l,s,t}=\[Alpha]2;
\[Delta][i,l](\[Delta][h,p]\[Delta][q,s]\[Delta][r,t]-\[Delta][p,t]\[Delta][r,q]\[Delta][h,s])
,{\[Beta],B[1]},{\[Alpha]1,B[0]},{\[Alpha]2,B[1]}]
],
{0,2},
Module[{J,K,h,r,p,q,s,t},
Table[
{J,h,r}=\[Beta];
{p,q}=\[Alpha]1;
{K,s,t}=\[Alpha]2;
\[Delta][J,K](\[Delta][h,p]\[Delta][q,s]\[Delta][r,t]-\[Delta][p,t]\[Delta][r,q]\[Delta][h,s])
,{\[Beta],B[2]},{\[Alpha]1,B[0]},{\[Alpha]2,B[2]}]
],
{0,3},
Module[{h,r,p,q,s,t},
Table[
{h,r}=\[Beta];
{p,q}=\[Alpha]1;
{s,t}=\[Alpha]2;
(\[Delta][h,p]\[Delta][q,s]\[Delta][r,t]-\[Delta][p,t]\[Delta][r,q]\[Delta][h,s])
,{\[Beta],B[3]},{\[Alpha]1,B[0]},{\[Alpha]2,B[3]}]
],
{1,1},
Module[{i,j,k,l,h,r,p,q,s,t},
Table[
{{i,j},h,r}=\[Beta];
{k,p,q}=\[Alpha]1;
{l,s,t}=\[Alpha]2;
(\[Delta][i,k]\[Delta][j,l]-\[Delta][i,l]\[Delta][j,k])(\[Delta][h,p]\[Delta][q,s]\[Delta][r,t]-\[Delta][p,t]\[Delta][r,q]\[Delta][h,s])
,{\[Beta],B[2]},{\[Alpha]1,B[1]},{\[Alpha]2,B[1]}]
],
{1,2},
Module[{i,J,h,r,p,q,s,t},
Table[
{h,r}=\[Beta];
{i,p,q}=\[Alpha]1;
{J,s,t}=\[Alpha]2;
\[Delta]12[i,J](\[Delta][h,p]\[Delta][q,s]\[Delta][r,t]-\[Delta][p,t]\[Delta][r,q]\[Delta][h,s])
,{\[Beta],B[3]},{\[Alpha]1,B[1]},{\[Alpha]2,B[2]}]
],
_,
0
]
];


dO[index_]:=dO[index]=SparseArray@Switch[index,
0,
Module[{i,h,r,l,m},
Table[
{i,h,r}=\[Alpha];
{l,m}=a;
P[i,h,l]\[Delta][r,m]-P[i,m,r]\[Delta][h,l]
,{\[Alpha],B[1]},{a,B[0]}]
],
1,
Module[{i,j,h,r,k,l,m},
Table[
{{i,j},h,r}=\[Beta];
{k,l,m}=\[Alpha];
\[Delta][j,k](P[i,h,l]\[Delta][r,m]
-P[i,m,r]\[Delta][h,l])
-\[Delta][i,k](P[j,h,l]\[Delta][r,m]
-P[j,m,r]\[Delta][h,l])
,{\[Beta],B[2]},{\[Alpha],B[1]}]
],
2,
Module[{h,r,J,p,q},Table[
{h,r}=b;
{J,p,q}=\[Beta];
Sum[\[Delta]12[i,J](P[i,h,p]\[Delta][r,q]-P[i,q,r]\[Delta][p,h]),{i,{1,2,3}}]
,{b,B[3]},{\[Beta],B[2]}]
],
_,
{}
]


End[];
EndPackage[];
