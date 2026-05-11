Shifts=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
S=length(Shifts)
ConflictingShifts=[]

#1
ss=[2 4 6 11 17 21 22 25]
push!(ConflictingShifts,ss)

# 2
ss=[3 7 9 14 16 17 23]
push!(ConflictingShifts,ss)

# 3
ss=[4 9 10 11 18 19 22 23]
push!(ConflictingShifts,ss)

# 4
ss=[8 9 10 19 20 21 24 25]
push!(ConflictingShifts,ss)

# 5
ss=[6 10 11 13 15 16 21 22]
push!(ConflictingShifts,ss)

# 6
ss=[8 11 12 13 14 15 16 17 18 19]
push!(ConflictingShifts,ss)

# 7
ss=[9 10 14 15 21 22 25]
push!(ConflictingShifts,ss)

# 8
ss=[9 10 11 15 16 24]
push!(ConflictingShifts,ss)

# 9
ss=[12 13 15 19 21 24]
push!(ConflictingShifts,ss)

# 10
ss=[11 14 15 16 19 22]
push!(ConflictingShifts,ss)

# 11
ss=[12 13 15 19 20 21 25]
push!(ConflictingShifts,ss)

# 12
ss=[14 15 16 17 18 23]
push!(ConflictingShifts,ss)

# 13
ss=[14 16 19 23 25]
push!(ConflictingShifts,ss)

# 14
ss=[15 17 18 22]
push!(ConflictingShifts,ss)

# 15
ss=[16 17 23 24 25]
push!(ConflictingShifts,ss)

# 16
ss=[18 19 20 21 24]
push!(ConflictingShifts,ss)

# 17
ss=[19 22 24]
push!(ConflictingShifts,ss)

# 18
ss=[20 21]
push!(ConflictingShifts,ss)

# 19
ss=[23 24 25]
push!(ConflictingShifts,ss)

# 20
ss=[22 25]
push!(ConflictingShifts,ss)

# 21
ss=[22 23 24]
push!(ConflictingShifts,ss)

# 22
ss=[24]
push!(ConflictingShifts,ss)

# 23
ss=[24 25]
push!(ConflictingShifts,ss)

# 24
ss=[25]
push!(ConflictingShifts,ss)

# 25
ss=[]
push!(ConflictingShifts,ss)

Conflict=zeros(Int8,S,S)
for s1=1:S-1
    for idx=1:length(ConflictingShifts[s1])
        Conflict[s1,ConflictingShifts[s1][idx]]=1
        Conflict[ConflictingShifts[s1][idx],s1]=1
    end
end
