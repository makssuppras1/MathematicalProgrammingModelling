#************************************************************************
# Workplan Teaching Assistants Data
TA_acronyms=["AL", "FR", "JE", "MI"]
TA=length(TA_acronyms)
Periods=["9-10", "10-11", "11-12", "12-13", "13-14", "14-15", "15-16", "16-17"]
P=length(Periods)
Days=[1, 2, 3, 4, 5, 6, 7, 8, 9]
D=length(Days)
Demand = [ # Demand[Periods,Days]
	4	4	4	0	3	0	3 	0	2
	4	4	4	2	4	2	4	2	2
	4	4	4	4	4	4	4	4	2
	4	3	3	3	3	4	3	3	1
	4	3	3	3	3	4	3	3	1
	4	3	3	3	3	4	3	3	1
	3	3	2	3	3	4	3	3	1
	3	3	2	2	2	3	2	2	1
]

Inconvenience = zeros(Float64, 4,8,9)
Inconvenience[1,:,:] = [ # Inconvenience["AL",Periods,Days]
	0	0	0	1	0	0	0	0	0
	0	0	0	1	0	0	0	0	0
	0	0	0	0	0	0	0	0	0
	0	0	0	0	0	0	0	0	0
	0	0	0	0	0	0	0	0	0
	0	0	0	0	0	0	0	0	0
	0	0	0	0	0	0	0	0	0
	0	0	0	0	0	0	0	0	0  
]


Inconvenience[2,:,:] = [ # Inconvenience"FR"L,Periods,Days]
	 1	1	1	0	1	0	1	0	2
	 1	1	1	4	1	2	1	1	2
	 1	1	1	1	1	1	1	1	2
	 1	1	1	1	1	1	1	1	2
	 1	1	1	1	1	1	1	1	2
	 1	1	1	1	1	1	2	1	2
	 2	1	2	1	1	1	2	2	2
	 2	1	2	1	1	1	2	2	2 
]

Inconvenience[3,:,:] = [ # Inconvenience["JE",Periods,Days]
	0	0	0	0	0	0	0	0	0
	0	0	0	8	0	0	0	0	0
	0	0	0	8	0	0	0	0	0
	4	3	3	3	3	4	3	3	1
	0	0	0	0	0	0	0	0	5
	0	0	0	0	0	0	0	0	5
	0	0	0	0	5	0	0	0	8
	0	0	0	0	5	0	0	0	8  
]

Inconvenience[4,:,:] = [ # Inconvenience["MI",Periods,Days]
 	0 	0 	0 	 0 	6.25  	0 	0 	0 	0
 	0 	0 	0 	 6.25 	0  	6.25 	0 	6.25 	6.25
 	0 	0 	0 	 0 	0  	0 	0 	0 	6.25
 	0 	0 	0 	 0 	0  	0 	0 	0 	6.25
 	0 	0 	0 	 0 	0  	0 	0 	0 	6.25
 	0 	0 	0	 0 	6.25  	0 	0 	0 	6.25
 	0 	0 	0 	 0 	6.25  	0 	0 	0 	6.25
 	0 	0 	0 	 6.25 	6.25  	0 	6.25 	0 	6.25 
]
#************************************************************************

#************************************************************************
# normalization
penTASum=zeros(TA)
for ta=1:TA
    penTASum[ta]=sum( Inconvenience[ta,p,d] for p=1:P, d=1:D)
end
#println(penTASum)
for ta=1:TA
    for p=1:P
        for d=1:D
            Inconvenience[ta,p,d]=
            100*Inconvenience[ta,p,d]/penTASum[ta]
        end
    end
end
#************************************************************************
