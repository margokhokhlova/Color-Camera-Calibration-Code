%This program is the implementation of a different recipe to choose an optimal reduced subset of calibration patches from a target.
%First, arbitrary one patch is chosen.Then, the next patch is chosen to maximize the distance to the nearest neighbor point in XYZ space.
% TO find the best of all soloutions, all starting patches are tried, to maximize the maximum distance between the nearest neighbors: max(max(min(xi-xr)))
%In this way the XYZ color space, which is used for calibration, is spanned as evely as possible so that calculation of measured points will be
%most-likely to an interpolation, not an extrapolation.
%Patches with low L and patches with no 20,21,22 have been removed

XYZPoints=[
37.1	33.26	24.53
38.67	32.86	22.88
38.14	28.34	17.73
68.95	72.71	60.44
70.31	71.84	60.47
71.19	74.08	58.01
66.83	69.55	56.82
69.63	71.31	57.4
68.39	72.28	57.46
67.66	70.24	59.94
9.21	4.47	1.55
11.94	10.22	7.02
14.45	10.3	5.99
17.17	10.37	5.19
16.3	7.97	3.53
35.74	33.63	25.27
4.18	3.75	1.85
42.45	39.77	25.87
43.79	39.69	24.09
44.28	36.63	16.6
62.46	68.51	58.98
65.75	64.01	58.42
69.5	72.8	49.57
54.82	57.09	46.12
63.34	62.15	47.63
60.5	66.95	48.27
56.98	58.7	56.25
4.92	3.77	1.13
5.76	3.84	0.69
9.06	4.34	0.28
15.49	13.49	7.25
17.83	13.52	4.81
20.78	13.97	3.04
18.2	9.32	0.5
41.37	40.29	28.92
7.79	7.54	3.85
48.26	47.24	28.03
48.93	47.54	23.68
50.33	46.17	12.77
55.84	64.01	57.53
60.58	55.49	55.82
67.74	71.39	40.27
42.88	44.81	35.65
56.48	52.39	37.29
52.62	61.39	38.75
45.95	46.9	52.09
8.65	7.87	2.42
9.25	7.94	1.35
12.12	9.08	0.8
29.93	28.24	13.71
31.07	27.29	7.49
32.62	27.28	3.74
36.31	26.39	1.35
47.88	47.6	33.03
5.19	5.33	2.66
51.77	54.16	16.6
50.62	52.37	8.27
50.21	52.71	2.85
49.74	59.66	56.26
54.62	46.36	52.44
66.15	69.94	31.35
32.34	33.84	26.54
49.12	42.31	27.24
45.37	55.98	29.99
35.56	35.72	47.76
5.13	5.41	1.68
5.17	5.48	1
6.83	7.39	0.97
21.58	22.11	10.77
21.38	21.92	5.71
21.42	22.36	2.88
24.4	25.91	1.79
52.74	54.43	29.04
6.92	7.62	3.86
49.45	54.35	29.25
47.17	53.99	23.2
36.21	47	9.2
43.97	55.3	55.01
48.64	38.02	48.65
64.8	68.47	23.68
23.36	24.62	19.21
42.07	33.34	18.73
38.95	50.96	22.69
26.9	26.59	43.72
6.28	7.68	2.52
5.8	7.72	1.47
6.65	10.17	1.35
30.62	34.09	17.75
27.99	33.57	10.94
24.47	32.05	5.83
19.4	29.73	2.49
52.48	55.59	38.16
4.39	5.28	3.52
31.86	39.32	26.69
28.42	38.73	24.38
16.89	30.94	15.91
38.96	51.33	53.89
42.84	30.7	44.56
63.82	67.12	17.63
16.24	17.26	13.46
35.65	25.81	12.18
33.38	46.28	16.89
20.09	19.4	39.88
3.66	5.37	2.87
2.97	5.24	2.44
3.84	8.22	3.08
14.33	17.52	11.72
11.42	17.39	9.82
9.01	16.63	8.02
11.42	23.14	10
36.48	40.01	29.33
3.06	3.67	2.83
31.93	39.1	34.21
28.78	38.56	35.72
17.59	30.74	32.26
34.42	47.54	52.75
37.33	24.44	40.15
62.92	65.6	12.78
10.44	11.18	8.78
29.78	19.53	7.37
28.36	41.67	12.27
14.62	13.62	36
2.6	3.56	3
2.11	3.41	3.21
2.86	5.51	5.49
14.79	17.83	14.58
11.89	17.45	15.69
10.12	17.52	16.68
12.56	23.61	23.19
36.61	40.31	33.64
3.21	3.7	3.47
36.7	40.29	39.14
35.27	40.48	43.67
26.75	35.44	48.16
30.8	44.3	51.66
32.98	19.97	36.19
62.29	64.28	9.5
6.32	6.83	5.49
25.16	15.08	4.38
24.39	37.67	9.06
10.77	9.52	32.36
2.77	3.54	4.41
2.49	3.5	5.82
3.81	5.87	11.92
11.74	13.52	14.24
10.57	13.58	18.13
9.14	13.2	22.86
12.36	19.28	37.56
38.76	40.56	35.62
5.21	5.31	7.1
41.04	41.44	40.74
41.26	41.67	44.04
35.83	36.99	48.14
28.05	41.72	50.78
29.5	16.68	32.64
61.87	63.09	7.03
3.44	3.75	3.09
21.33	11.78	2.42
21.22	34.12	6.6
8.01	6.57	28.83
5.21	5.35	11.03
5.06	5.13	15.88
7.4	8.11	30.68
17.28	17.48	17.82
17.01	17.33	23.24
16.8	16.77	28.19
13.38	14.28	36.76
40.48	41.03	36.22
35.49	33.65	33.94
36.7	34.14	38.49
36.35	32.46	45.82
26.08	39.77	50.07
26.95	14.46	29.8
61.69	62.08	5.26
18.28	9.42	1.26
18.91	31.2	4.77
6.2	4.66	25.74
5.46	4.44	24.92
10.87	10.32	11.48
11.83	10.4	16.34
12.44	10.17	21.05
10.16	8.18	30.38
34.85	34.24	30.61
32.21	27.51	29.08
34.69	27.35	33.42
36.27	24.16	39.99
24.2	37.81	49.32
23.94	12.05	26.2
61.39	60.58	3.58
14.65	6.98	0.46
16.67	27.97	3.1
9.34	4.49	13.28
8.94	7.47	8.42
11.04	7.71	11.54
12.94	7.59	14.91
17.24	8.53	22.93
30.05	27.5	25.07
32.63	27.33	23.8
34.68	26.99	24.73
32.5	21.07	22.58
23.32	36.87	48.96
22.68	11.09	24.62
61.32	59.83	2.95
13.39	6.21	0.28
15.55	26.27	2.49
9.97	4.81	5.43
9.16	7.44	6.52
11.56	7.7	7.35
14.5	7.95	8.28
19.4	9.64	12.06
30.22	27.73	22.75
];


% DistGlobal=zeros(1,208);
% for i=1:208
foundindex1=127;


%Choose patch 2 with maximum distance to patch 1 
DistArray=zeros(208,1);
for patch=1:208
    DistArray(patch)=sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(patch,:)).^2));
end
[maxDist,foundindex2]=max(DistArray);
foundindex2

%Choose patch 3, by calculating the distances to points 1 and 2, choosing the smaller distance, and maximizing this value 
DistArray=zeros(208,1);
for patch=1:208
    DistArray(patch)=min([sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex2,:)).^2))]);
end
[maxDist,foundindex3]=max(DistArray);
foundindex3

%Choose patch 4
DistArray=zeros(208,1);
for patch=1:208
    DistArray(patch)=min([sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex3,:)).^2))]);
end
[maxDist,foundindex4]=max(DistArray);
foundindex4

%Choose patch 5
DistArray=zeros(208,1);
for patch=1:208
    DistArray(patch)=min([sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex4,:)).^2))]);
end
[maxDist,foundindex5]=max(DistArray);
foundindex5

%Choose patch 6
DistArray=zeros(208,1);
for patch=1:208
    DistArray(patch)=min([sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex5,:)).^2))]);
end
[maxDist,foundindex6]=max(DistArray);
foundindex6

%Choose patch 7
DistArray=zeros(208,1);
for patch=1:208
    DistArray(patch)=min([sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex6,:)).^2))]);
end
[maxDist,foundindex7]=max(DistArray);
foundindex7

%Choose patch 8
DistArray=zeros(208,1);
for patch=1:208
    DistArray(patch)=min([sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex7,:)).^2))]);
end
[maxDist,foundindex8]=max(DistArray);
foundindex8

%Choose patch 9
DistArray=zeros(208,1);
for patch=1:208
    DistArray(patch)=min([sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex8,:)).^2))]);
end
[maxDist,foundindex9]=max(DistArray);
foundindex9

%Choose patch 10
DistArray=zeros(208,1);
for patch=1:208
    DistArray(patch)=min([sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(patch,:)-XYZPoints(foundindex9,:)).^2))]);
end
[maxDist,foundindex10]=max(DistArray);
foundindex10


%Quality number. calculate Euclidian distance between all closest
%neighbors.



Dist1=min([sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(foundindex9,:)).^2)) sqrt(sum((XYZPoints(foundindex1,:)-XYZPoints(foundindex10,:)).^2))]);
Dist2=min([sqrt(sum((XYZPoints(foundindex2,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(foundindex2,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(foundindex2,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(foundindex2,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(foundindex2,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(foundindex2,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(foundindex2,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(foundindex2,:)-XYZPoints(foundindex9,:)).^2)) sqrt(sum((XYZPoints(foundindex2,:)-XYZPoints(foundindex10,:)).^2))]);
Dist3=min([sqrt(sum((XYZPoints(foundindex3,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(foundindex3,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(foundindex3,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(foundindex3,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(foundindex3,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(foundindex3,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(foundindex3,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(foundindex3,:)-XYZPoints(foundindex9,:)).^2)) sqrt(sum((XYZPoints(foundindex3,:)-XYZPoints(foundindex10,:)).^2))]);
Dist4=min([sqrt(sum((XYZPoints(foundindex4,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(foundindex4,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(foundindex4,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(foundindex4,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(foundindex4,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(foundindex4,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(foundindex4,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(foundindex4,:)-XYZPoints(foundindex9,:)).^2)) sqrt(sum((XYZPoints(foundindex4,:)-XYZPoints(foundindex10,:)).^2))]);
Dist5=min([sqrt(sum((XYZPoints(foundindex5,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(foundindex5,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(foundindex5,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(foundindex5,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(foundindex5,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(foundindex5,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(foundindex5,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(foundindex5,:)-XYZPoints(foundindex9,:)).^2)) sqrt(sum((XYZPoints(foundindex5,:)-XYZPoints(foundindex10,:)).^2))]);
Dist6=min([sqrt(sum((XYZPoints(foundindex6,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(foundindex6,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(foundindex6,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(foundindex6,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(foundindex6,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(foundindex6,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(foundindex6,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(foundindex6,:)-XYZPoints(foundindex9,:)).^2)) sqrt(sum((XYZPoints(foundindex6,:)-XYZPoints(foundindex10,:)).^2))]);
Dist7=min([sqrt(sum((XYZPoints(foundindex7,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(foundindex7,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(foundindex7,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(foundindex7,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(foundindex7,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(foundindex7,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(foundindex7,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(foundindex7,:)-XYZPoints(foundindex9,:)).^2)) sqrt(sum((XYZPoints(foundindex7,:)-XYZPoints(foundindex10,:)).^2))]);
Dist8=min([sqrt(sum((XYZPoints(foundindex8,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(foundindex8,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(foundindex8,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(foundindex8,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(foundindex8,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(foundindex8,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(foundindex8,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(foundindex8,:)-XYZPoints(foundindex9,:)).^2)) sqrt(sum((XYZPoints(foundindex8,:)-XYZPoints(foundindex10,:)).^2))]);
Dist9=min([sqrt(sum((XYZPoints(foundindex9,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(foundindex9,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(foundindex9,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(foundindex9,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(foundindex9,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(foundindex9,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(foundindex9,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(foundindex9,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(foundindex9,:)-XYZPoints(foundindex10,:)).^2))]);
Dist10=min([sqrt(sum((XYZPoints(foundindex10,:)-XYZPoints(foundindex1,:)).^2)) sqrt(sum((XYZPoints(foundindex10,:)-XYZPoints(foundindex2,:)).^2)) sqrt(sum((XYZPoints(foundindex10,:)-XYZPoints(foundindex3,:)).^2)) sqrt(sum((XYZPoints(foundindex10,:)-XYZPoints(foundindex4,:)).^2)) sqrt(sum((XYZPoints(foundindex10,:)-XYZPoints(foundindex5,:)).^2)) sqrt(sum((XYZPoints(foundindex10,:)-XYZPoints(foundindex6,:)).^2)) sqrt(sum((XYZPoints(foundindex10,:)-XYZPoints(foundindex7,:)).^2)) sqrt(sum((XYZPoints(foundindex10,:)-XYZPoints(foundindex8,:)).^2)) sqrt(sum((XYZPoints(foundindex10,:)-XYZPoints(foundindex9,:)).^2))]);

DistGlobal=Dist1+Dist2+Dist3+Dist4+Dist5+Dist6+Dist7+Dist8+Dist9+Dist10;

% DistGlobal(i)=Dist1+Dist2+Dist3+Dist4+Dist5+Dist6+Dist7+Dist8+Dist9+Dist10;
% end
% 
% [maxDist,i]=max(DistGlobal);
% i
% 
% [minDist,j]=min(DistGlobal);
% j

