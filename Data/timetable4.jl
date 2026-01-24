# Dataset: ../ExcelData/comp04.xlsm

# Courses
C=79

# Lecturers
L=70

# Rooms
R=18
# Days
D=5

# Periods
P=5

# Curriculas
CU=57

#penalty coefficients
penalty_missing_seat=1
penalty_room_change=1
penalty_less_than_minimum_working_days=5
penalty_solo_cur_courses=2

Course_NoStudents=[20 25 41 13 13 76 119 63 63 76 89 70 92 92 70 70 92 120 120 124 121 121 121 130 145 113 113 113 88 125 125 80 80 115 110 90 66 70 114 114 30 23 50 36 43 70 50 70 15 5 25 5 5 30 13 30 10 30 15 3 3 18 53 14 124 30 30 46 46 18 60 40 6 76 130 60 110 100 3 ]
Course_NoLectures=[3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 6 3 3 3 3 3 5 3 7 7 3 3 3 7 7 7 7 7 7 3 3 3 7 6 6 5 ]
Course_Lecturer=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 7 18 19 20 21 22 23 24 12 6 25 26 27 28 29 2 30 31 32 33 34 35 36 37 33 38 39 39 40 41 42 43 44 45 46 47 48 49 21 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 2 66 67 67 68 69 70 ]
Lecturer_NoCourses=[1 3 1 1 1 2 2 1 1 1 1 2 1 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 ]
Rooms_size=[40 42 42 48 50 55 60 216 216 216 216 312 336 50 60 80 60 20 ]
Course_MinLectureDays=[3 3 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 3 3 3 3 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 2 3 3 2 4 3 3 2 3 2 4 3 1 1 3 3 3 1 1 1 1 1 1 3 3 2 1 4 4 4 ]
Curricula_CourseCurreculaIncidenceMatrix=[
0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 ;
0 0 0 0 0 0 1 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 ;
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
]
Blocked_course_timeslot=zeros(C,D,P)
Blocked_course_timeslot[1,1,1]=1
Blocked_course_timeslot[1,1,2]=1
Blocked_course_timeslot[1,1,3]=1
Blocked_course_timeslot[1,1,4]=1
Blocked_course_timeslot[1,1,5]=1
Blocked_course_timeslot[2,1,1]=1
Blocked_course_timeslot[2,1,3]=1
Blocked_course_timeslot[2,2,3]=1
Blocked_course_timeslot[2,3,1]=1
Blocked_course_timeslot[2,3,3]=1
Blocked_course_timeslot[2,4,3]=1
Blocked_course_timeslot[2,5,1]=1
Blocked_course_timeslot[2,5,3]=1
Blocked_course_timeslot[3,4,1]=1
Blocked_course_timeslot[3,4,2]=1
Blocked_course_timeslot[3,4,3]=1
Blocked_course_timeslot[3,4,4]=1
Blocked_course_timeslot[3,4,5]=1
Blocked_course_timeslot[3,5,1]=1
Blocked_course_timeslot[3,5,2]=1
Blocked_course_timeslot[3,5,3]=1
Blocked_course_timeslot[3,5,4]=1
Blocked_course_timeslot[3,5,5]=1
Blocked_course_timeslot[6,1,1]=1
Blocked_course_timeslot[6,1,5]=1
Blocked_course_timeslot[6,2,1]=1
Blocked_course_timeslot[6,2,5]=1
Blocked_course_timeslot[6,3,1]=1
Blocked_course_timeslot[6,4,1]=1
Blocked_course_timeslot[6,5,1]=1
Blocked_course_timeslot[6,5,2]=1
Blocked_course_timeslot[7,1,1]=1
Blocked_course_timeslot[7,1,2]=1
Blocked_course_timeslot[7,1,3]=1
Blocked_course_timeslot[7,2,1]=1
Blocked_course_timeslot[7,2,2]=1
Blocked_course_timeslot[7,2,3]=1
Blocked_course_timeslot[7,2,4]=1
Blocked_course_timeslot[7,2,5]=1
Blocked_course_timeslot[8,3,3]=1
Blocked_course_timeslot[8,3,4]=1
Blocked_course_timeslot[8,3,5]=1
Blocked_course_timeslot[8,4,1]=1
Blocked_course_timeslot[8,4,2]=1
Blocked_course_timeslot[8,4,3]=1
Blocked_course_timeslot[8,4,4]=1
Blocked_course_timeslot[8,4,5]=1
Blocked_course_timeslot[10,1,1]=1
Blocked_course_timeslot[10,1,5]=1
Blocked_course_timeslot[10,2,1]=1
Blocked_course_timeslot[10,2,5]=1
Blocked_course_timeslot[10,3,1]=1
Blocked_course_timeslot[10,4,1]=1
Blocked_course_timeslot[10,5,1]=1
Blocked_course_timeslot[10,5,5]=1
Blocked_course_timeslot[11,1,3]=1
Blocked_course_timeslot[11,1,4]=1
Blocked_course_timeslot[11,2,3]=1
Blocked_course_timeslot[11,2,4]=1
Blocked_course_timeslot[11,5,2]=1
Blocked_course_timeslot[11,5,3]=1
Blocked_course_timeslot[11,5,4]=1
Blocked_course_timeslot[11,5,5]=1
Blocked_course_timeslot[12,1,3]=1
Blocked_course_timeslot[12,2,3]=1
Blocked_course_timeslot[12,3,3]=1
Blocked_course_timeslot[12,4,3]=1
Blocked_course_timeslot[12,5,3]=1
Blocked_course_timeslot[12,5,4]=1
Blocked_course_timeslot[12,5,5]=1
Blocked_course_timeslot[15,1,3]=1
Blocked_course_timeslot[15,1,4]=1
Blocked_course_timeslot[15,1,5]=1
Blocked_course_timeslot[15,4,4]=1
Blocked_course_timeslot[15,4,5]=1
Blocked_course_timeslot[15,5,3]=1
Blocked_course_timeslot[15,5,4]=1
Blocked_course_timeslot[15,5,5]=1
Blocked_course_timeslot[16,4,1]=1
Blocked_course_timeslot[16,4,2]=1
Blocked_course_timeslot[16,4,3]=1
Blocked_course_timeslot[16,4,4]=1
Blocked_course_timeslot[16,4,5]=1
Blocked_course_timeslot[16,5,1]=1
Blocked_course_timeslot[16,5,2]=1
Blocked_course_timeslot[16,5,3]=1
Blocked_course_timeslot[16,5,4]=1
Blocked_course_timeslot[16,5,5]=1
Blocked_course_timeslot[17,1,1]=1
Blocked_course_timeslot[17,2,1]=1
Blocked_course_timeslot[17,3,1]=1
Blocked_course_timeslot[17,4,1]=1
Blocked_course_timeslot[17,4,2]=1
Blocked_course_timeslot[17,4,3]=1
Blocked_course_timeslot[17,4,4]=1
Blocked_course_timeslot[17,4,5]=1
Blocked_course_timeslot[18,1,1]=1
Blocked_course_timeslot[18,1,2]=1
Blocked_course_timeslot[18,1,3]=1
Blocked_course_timeslot[18,2,1]=1
Blocked_course_timeslot[18,2,2]=1
Blocked_course_timeslot[18,2,3]=1
Blocked_course_timeslot[18,2,4]=1
Blocked_course_timeslot[18,2,5]=1
Blocked_course_timeslot[19,1,1]=1
Blocked_course_timeslot[19,1,3]=1
Blocked_course_timeslot[19,1,4]=1
Blocked_course_timeslot[19,1,5]=1
Blocked_course_timeslot[19,2,1]=1
Blocked_course_timeslot[19,2,3]=1
Blocked_course_timeslot[19,2,4]=1
Blocked_course_timeslot[19,2,5]=1
Blocked_course_timeslot[19,3,1]=1
Blocked_course_timeslot[19,3,3]=1
Blocked_course_timeslot[19,3,4]=1
Blocked_course_timeslot[19,3,5]=1
Blocked_course_timeslot[19,4,1]=1
Blocked_course_timeslot[19,4,3]=1
Blocked_course_timeslot[19,4,4]=1
Blocked_course_timeslot[19,4,5]=1
Blocked_course_timeslot[19,5,1]=1
Blocked_course_timeslot[19,5,3]=1
Blocked_course_timeslot[19,5,4]=1
Blocked_course_timeslot[19,5,5]=1
Blocked_course_timeslot[20,1,1]=1
Blocked_course_timeslot[20,1,2]=1
Blocked_course_timeslot[20,1,3]=1
Blocked_course_timeslot[20,1,4]=1
Blocked_course_timeslot[20,1,5]=1
Blocked_course_timeslot[20,2,1]=1
Blocked_course_timeslot[20,2,2]=1
Blocked_course_timeslot[20,2,3]=1
Blocked_course_timeslot[20,2,4]=1
Blocked_course_timeslot[20,4,3]=1
Blocked_course_timeslot[20,5,3]=1
Blocked_course_timeslot[20,5,5]=1
Blocked_course_timeslot[21,1,3]=1
Blocked_course_timeslot[21,2,3]=1
Blocked_course_timeslot[21,2,5]=1
Blocked_course_timeslot[22,1,3]=1
Blocked_course_timeslot[22,2,3]=1
Blocked_course_timeslot[22,2,5]=1
Blocked_course_timeslot[23,1,3]=1
Blocked_course_timeslot[23,2,3]=1
Blocked_course_timeslot[23,2,5]=1
Blocked_course_timeslot[24,4,1]=1
Blocked_course_timeslot[24,4,2]=1
Blocked_course_timeslot[24,4,3]=1
Blocked_course_timeslot[24,4,4]=1
Blocked_course_timeslot[24,4,5]=1
Blocked_course_timeslot[24,5,1]=1
Blocked_course_timeslot[24,5,2]=1
Blocked_course_timeslot[24,5,3]=1
Blocked_course_timeslot[24,5,4]=1
Blocked_course_timeslot[24,5,5]=1
Blocked_course_timeslot[25,4,1]=1
Blocked_course_timeslot[25,4,2]=1
Blocked_course_timeslot[25,4,3]=1
Blocked_course_timeslot[25,4,4]=1
Blocked_course_timeslot[25,4,5]=1
Blocked_course_timeslot[25,5,1]=1
Blocked_course_timeslot[25,5,2]=1
Blocked_course_timeslot[25,5,3]=1
Blocked_course_timeslot[25,5,4]=1
Blocked_course_timeslot[25,5,5]=1
Blocked_course_timeslot[26,1,3]=1
Blocked_course_timeslot[26,2,3]=1
Blocked_course_timeslot[26,3,3]=1
Blocked_course_timeslot[26,4,3]=1
Blocked_course_timeslot[26,5,3]=1
Blocked_course_timeslot[26,5,4]=1
Blocked_course_timeslot[26,5,5]=1
Blocked_course_timeslot[29,2,4]=1
Blocked_course_timeslot[29,2,5]=1
Blocked_course_timeslot[29,3,4]=1
Blocked_course_timeslot[29,3,5]=1
Blocked_course_timeslot[29,5,2]=1
Blocked_course_timeslot[29,5,3]=1
Blocked_course_timeslot[29,5,4]=1
Blocked_course_timeslot[29,5,5]=1
Blocked_course_timeslot[33,1,1]=1
Blocked_course_timeslot[33,1,3]=1
Blocked_course_timeslot[33,2,3]=1
Blocked_course_timeslot[33,3,1]=1
Blocked_course_timeslot[33,3,3]=1
Blocked_course_timeslot[33,4,3]=1
Blocked_course_timeslot[33,5,1]=1
Blocked_course_timeslot[33,5,3]=1
Blocked_course_timeslot[34,2,5]=1
Blocked_course_timeslot[34,3,5]=1
Blocked_course_timeslot[34,4,5]=1
Blocked_course_timeslot[34,5,1]=1
Blocked_course_timeslot[34,5,2]=1
Blocked_course_timeslot[34,5,3]=1
Blocked_course_timeslot[34,5,4]=1
Blocked_course_timeslot[34,5,5]=1
Blocked_course_timeslot[36,1,1]=1
Blocked_course_timeslot[36,1,2]=1
Blocked_course_timeslot[36,1,3]=1
Blocked_course_timeslot[36,1,4]=1
Blocked_course_timeslot[36,5,2]=1
Blocked_course_timeslot[36,5,3]=1
Blocked_course_timeslot[36,5,4]=1
Blocked_course_timeslot[36,5,5]=1
Blocked_course_timeslot[39,1,1]=1
Blocked_course_timeslot[39,1,2]=1
Blocked_course_timeslot[39,1,5]=1
Blocked_course_timeslot[39,5,1]=1
Blocked_course_timeslot[39,5,2]=1
Blocked_course_timeslot[39,5,3]=1
Blocked_course_timeslot[39,5,4]=1
Blocked_course_timeslot[39,5,5]=1
Blocked_course_timeslot[44,1,5]=1
Blocked_course_timeslot[44,2,5]=1
Blocked_course_timeslot[44,3,3]=1
Blocked_course_timeslot[44,3,5]=1
Blocked_course_timeslot[44,4,2]=1
Blocked_course_timeslot[44,4,5]=1
Blocked_course_timeslot[44,5,3]=1
Blocked_course_timeslot[44,5,5]=1
Blocked_course_timeslot[46,1,1]=1
Blocked_course_timeslot[46,1,2]=1
Blocked_course_timeslot[46,1,3]=1
Blocked_course_timeslot[46,1,4]=1
Blocked_course_timeslot[46,1,5]=1
Blocked_course_timeslot[46,5,1]=1
Blocked_course_timeslot[46,5,2]=1
Blocked_course_timeslot[46,5,3]=1
Blocked_course_timeslot[46,5,4]=1
Blocked_course_timeslot[46,5,5]=1
Blocked_course_timeslot[47,4,3]=1
Blocked_course_timeslot[47,4,4]=1
Blocked_course_timeslot[47,4,5]=1
Blocked_course_timeslot[47,5,1]=1
Blocked_course_timeslot[47,5,2]=1
Blocked_course_timeslot[47,5,3]=1
Blocked_course_timeslot[47,5,4]=1
Blocked_course_timeslot[47,5,5]=1
Blocked_course_timeslot[49,1,1]=1
Blocked_course_timeslot[49,1,2]=1
Blocked_course_timeslot[49,1,3]=1
Blocked_course_timeslot[49,1,4]=1
Blocked_course_timeslot[49,1,5]=1
Blocked_course_timeslot[49,4,1]=1
Blocked_course_timeslot[49,4,2]=1
Blocked_course_timeslot[49,4,3]=1
Blocked_course_timeslot[49,4,4]=1
Blocked_course_timeslot[49,4,5]=1
Blocked_course_timeslot[49,5,1]=1
Blocked_course_timeslot[49,5,2]=1
Blocked_course_timeslot[49,5,3]=1
Blocked_course_timeslot[49,5,4]=1
Blocked_course_timeslot[49,5,5]=1
Blocked_course_timeslot[51,1,4]=1
Blocked_course_timeslot[51,1,5]=1
Blocked_course_timeslot[51,2,4]=1
Blocked_course_timeslot[51,2,5]=1
Blocked_course_timeslot[51,3,4]=1
Blocked_course_timeslot[51,3,5]=1
Blocked_course_timeslot[51,4,4]=1
Blocked_course_timeslot[51,4,5]=1
Blocked_course_timeslot[51,5,4]=1
Blocked_course_timeslot[51,5,5]=1
Blocked_course_timeslot[52,1,1]=1
Blocked_course_timeslot[52,1,2]=1
Blocked_course_timeslot[52,1,3]=1
Blocked_course_timeslot[52,1,4]=1
Blocked_course_timeslot[52,1,5]=1
Blocked_course_timeslot[52,2,1]=1
Blocked_course_timeslot[52,5,1]=1
Blocked_course_timeslot[52,5,2]=1
Blocked_course_timeslot[52,5,3]=1
Blocked_course_timeslot[52,5,4]=1
Blocked_course_timeslot[52,5,5]=1
Blocked_course_timeslot[53,1,1]=1
Blocked_course_timeslot[53,1,2]=1
Blocked_course_timeslot[53,1,3]=1
Blocked_course_timeslot[53,1,4]=1
Blocked_course_timeslot[53,1,5]=1
Blocked_course_timeslot[53,2,1]=1
Blocked_course_timeslot[53,2,2]=1
Blocked_course_timeslot[53,2,3]=1
Blocked_course_timeslot[53,2,4]=1
Blocked_course_timeslot[53,2,5]=1
Blocked_course_timeslot[53,5,4]=1
Blocked_course_timeslot[53,5,5]=1
Blocked_course_timeslot[54,1,1]=1
Blocked_course_timeslot[54,1,2]=1
Blocked_course_timeslot[54,1,3]=1
Blocked_course_timeslot[54,5,1]=1
Blocked_course_timeslot[54,5,2]=1
Blocked_course_timeslot[54,5,3]=1
Blocked_course_timeslot[54,5,4]=1
Blocked_course_timeslot[54,5,5]=1
Blocked_course_timeslot[55,1,1]=1
Blocked_course_timeslot[55,1,2]=1
Blocked_course_timeslot[55,1,3]=1
Blocked_course_timeslot[55,1,4]=1
Blocked_course_timeslot[55,1,5]=1
Blocked_course_timeslot[55,5,3]=1
Blocked_course_timeslot[55,5,4]=1
Blocked_course_timeslot[55,5,5]=1
Blocked_course_timeslot[58,1,1]=1
Blocked_course_timeslot[58,2,1]=1
Blocked_course_timeslot[58,3,1]=1
Blocked_course_timeslot[58,4,1]=1
Blocked_course_timeslot[58,5,1]=1
Blocked_course_timeslot[59,3,1]=1
Blocked_course_timeslot[59,3,2]=1
Blocked_course_timeslot[59,3,3]=1
Blocked_course_timeslot[59,3,4]=1
Blocked_course_timeslot[59,3,5]=1
Blocked_course_timeslot[59,4,1]=1
Blocked_course_timeslot[59,4,2]=1
Blocked_course_timeslot[59,4,3]=1
Blocked_course_timeslot[59,4,4]=1
Blocked_course_timeslot[59,4,5]=1
Blocked_course_timeslot[59,5,1]=1
Blocked_course_timeslot[59,5,2]=1
Blocked_course_timeslot[59,5,3]=1
Blocked_course_timeslot[59,5,4]=1
Blocked_course_timeslot[59,5,5]=1
Blocked_course_timeslot[60,1,4]=1
Blocked_course_timeslot[60,1,5]=1
Blocked_course_timeslot[60,2,4]=1
Blocked_course_timeslot[60,2,5]=1
Blocked_course_timeslot[60,3,4]=1
Blocked_course_timeslot[60,3,5]=1
Blocked_course_timeslot[60,4,4]=1
Blocked_course_timeslot[60,4,5]=1
Blocked_course_timeslot[64,2,3]=1
Blocked_course_timeslot[64,2,4]=1
Blocked_course_timeslot[64,2,5]=1
Blocked_course_timeslot[64,3,4]=1
Blocked_course_timeslot[64,3,5]=1
Blocked_course_timeslot[64,4,1]=1
Blocked_course_timeslot[64,4,2]=1
Blocked_course_timeslot[64,4,3]=1
Blocked_course_timeslot[65,4,3]=1
Blocked_course_timeslot[65,5,3]=1
Blocked_course_timeslot[65,5,5]=1
Blocked_course_timeslot[73,1,1]=1
Blocked_course_timeslot[73,1,3]=1
Blocked_course_timeslot[73,2,3]=1
Blocked_course_timeslot[73,3,1]=1
Blocked_course_timeslot[73,3,3]=1
Blocked_course_timeslot[73,4,3]=1
Blocked_course_timeslot[73,5,1]=1
Blocked_course_timeslot[73,5,3]=1
Blocked_course_timeslot[74,1,3]=1
Blocked_course_timeslot[74,2,3]=1
Blocked_course_timeslot[74,2,4]=1
Blocked_course_timeslot[74,3,3]=1
Blocked_course_timeslot[74,3,4]=1
Blocked_course_timeslot[74,4,3]=1
Blocked_course_timeslot[74,4,4]=1
Blocked_course_timeslot[74,5,3]=1
Blocked_course_timeslot[75,2,1]=1
Blocked_course_timeslot[75,2,2]=1
Blocked_course_timeslot[75,2,3]=1
Blocked_course_timeslot[75,2,4]=1
Blocked_course_timeslot[75,2,5]=1
Blocked_course_timeslot[75,4,1]=1
Blocked_course_timeslot[75,4,2]=1
Blocked_course_timeslot[75,4,3]=1
Blocked_course_timeslot[75,4,4]=1
Blocked_course_timeslot[75,4,5]=1
Blocked_course_timeslot[75,5,1]=1
Blocked_course_timeslot[75,5,2]=1
Blocked_course_timeslot[75,5,3]=1
Blocked_course_timeslot[75,5,4]=1
Blocked_course_timeslot[75,5,5]=1
Blocked_course_timeslot[77,3,4]=1
Blocked_course_timeslot[77,3,5]=1
Blocked_course_timeslot[77,4,1]=1
Blocked_course_timeslot[77,4,2]=1
Blocked_course_timeslot[77,4,3]=1
Blocked_course_timeslot[77,4,4]=1
Blocked_course_timeslot[77,4,5]=1
Blocked_course_timeslot[77,5,5]=1
Blocked_course_timeslot[78,1,1]=1
Blocked_course_timeslot[78,1,2]=1
Blocked_course_timeslot[78,5,1]=1
Blocked_course_timeslot[78,5,2]=1
Blocked_course_timeslot[78,5,3]=1
Blocked_course_timeslot[78,5,4]=1
Blocked_course_timeslot[78,5,5]=1
Blocked_course_timeslot[79,1,3]=1
Blocked_course_timeslot[79,2,3]=1
Blocked_course_timeslot[79,3,1]=1
Blocked_course_timeslot[79,3,2]=1
Blocked_course_timeslot[79,3,3]=1
Blocked_course_timeslot[79,3,4]=1
Blocked_course_timeslot[79,3,5]=1
Blocked_course_timeslot[79,4,3]=1
Blocked_course_timeslot[79,5,3]=1
