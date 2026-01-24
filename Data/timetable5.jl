# Dataset: ../ExcelData/comp05.xlsm

# Courses
C=54

# Lecturers
L=47

# Rooms
R=9
# Days
D=6

# Periods
P=6

# Curriculas
CU=139

#penalty coefficients
penalty_missing_seat=1
penalty_room_change=1
penalty_less_than_minimum_working_days=5
penalty_solo_cur_courses=2

Course_NoStudents=[10 10 300 100 50 60 170 350 80 230 80 440 400 20 370 80 60 50 10 130 30 60 40 40 50 50 170 70 10 150 90 90 150 100 100 200 70 170 150 50 340 30 60 110 40 10 140 100 20 10 60 70 280 60 ]
Course_NoLectures=[1 1 3 3 3 2 3 3 3 3 3 3 2 3 3 3 3 3 3 3 3 3 3 3 3 3 2 3 3 3 3 3 3 3 3 2 3 3 3 3 1 3 3 3 3 3 3 3 3 3 3 3 3 3 ]
Course_Lecturer=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 24 26 27 28 29 30 31 32 33 33 34 35 36 37 38 39 3 40 41 42 42 26 32 43 20 44 45 46 47 ]
Lecturer_NoCourses=[1 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 2 1 2 1 1 1 1 1 2 2 1 1 1 1 1 1 1 1 2 1 1 1 1 1 ]
Rooms_size=[130 50 50 48 65 60 30 200 450 ]
Course_MinLectureDays=[1 1 3 3 3 2 3 2 3 3 3 3 2 3 3 2 3 3 3 3 3 3 2 3 3 3 2 3 3 3 3 3 3 3 3 2 3 3 3 3 1 3 3 3 3 3 3 3 3 3 3 3 3 3 ]
Curricula_CourseCurreculaIncidenceMatrix=[
0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 ;
0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 ;
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 ;
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
]
Blocked_course_timeslot=zeros(C,D,P)
Blocked_course_timeslot[1,6,3]=1
Blocked_course_timeslot[1,6,4]=1
Blocked_course_timeslot[1,6,5]=1
Blocked_course_timeslot[1,6,6]=1
Blocked_course_timeslot[2,6,3]=1
Blocked_course_timeslot[2,6,4]=1
Blocked_course_timeslot[2,6,5]=1
Blocked_course_timeslot[2,6,6]=1
Blocked_course_timeslot[3,1,3]=1
Blocked_course_timeslot[3,1,6]=1
Blocked_course_timeslot[3,2,6]=1
Blocked_course_timeslot[3,3,4]=1
Blocked_course_timeslot[3,3,5]=1
Blocked_course_timeslot[3,3,6]=1
Blocked_course_timeslot[3,4,1]=1
Blocked_course_timeslot[3,4,2]=1
Blocked_course_timeslot[3,4,3]=1
Blocked_course_timeslot[3,4,4]=1
Blocked_course_timeslot[3,4,5]=1
Blocked_course_timeslot[3,4,6]=1
Blocked_course_timeslot[3,5,1]=1
Blocked_course_timeslot[3,5,2]=1
Blocked_course_timeslot[3,5,3]=1
Blocked_course_timeslot[3,5,4]=1
Blocked_course_timeslot[3,5,5]=1
Blocked_course_timeslot[3,5,6]=1
Blocked_course_timeslot[3,6,1]=1
Blocked_course_timeslot[3,6,2]=1
Blocked_course_timeslot[3,6,3]=1
Blocked_course_timeslot[3,6,4]=1
Blocked_course_timeslot[3,6,5]=1
Blocked_course_timeslot[3,6,6]=1
Blocked_course_timeslot[4,1,1]=1
Blocked_course_timeslot[4,1,2]=1
Blocked_course_timeslot[4,1,5]=1
Blocked_course_timeslot[4,1,6]=1
Blocked_course_timeslot[4,2,1]=1
Blocked_course_timeslot[4,2,6]=1
Blocked_course_timeslot[4,3,1]=1
Blocked_course_timeslot[4,3,6]=1
Blocked_course_timeslot[4,4,1]=1
Blocked_course_timeslot[4,4,6]=1
Blocked_course_timeslot[4,5,1]=1
Blocked_course_timeslot[4,5,6]=1
Blocked_course_timeslot[4,6,1]=1
Blocked_course_timeslot[4,6,2]=1
Blocked_course_timeslot[4,6,3]=1
Blocked_course_timeslot[4,6,4]=1
Blocked_course_timeslot[4,6,5]=1
Blocked_course_timeslot[4,6,6]=1
Blocked_course_timeslot[5,1,1]=1
Blocked_course_timeslot[5,2,1]=1
Blocked_course_timeslot[5,3,1]=1
Blocked_course_timeslot[5,4,1]=1
Blocked_course_timeslot[5,5,1]=1
Blocked_course_timeslot[5,6,3]=1
Blocked_course_timeslot[5,6,4]=1
Blocked_course_timeslot[5,6,5]=1
Blocked_course_timeslot[5,6,6]=1
Blocked_course_timeslot[6,1,1]=1
Blocked_course_timeslot[6,2,1]=1
Blocked_course_timeslot[6,3,1]=1
Blocked_course_timeslot[6,3,2]=1
Blocked_course_timeslot[6,4,1]=1
Blocked_course_timeslot[6,4,2]=1
Blocked_course_timeslot[6,5,1]=1
Blocked_course_timeslot[6,6,1]=1
Blocked_course_timeslot[6,6,3]=1
Blocked_course_timeslot[6,6,4]=1
Blocked_course_timeslot[6,6,5]=1
Blocked_course_timeslot[6,6,6]=1
Blocked_course_timeslot[7,6,3]=1
Blocked_course_timeslot[7,6,4]=1
Blocked_course_timeslot[7,6,5]=1
Blocked_course_timeslot[7,6,6]=1
Blocked_course_timeslot[8,1,1]=1
Blocked_course_timeslot[8,1,2]=1
Blocked_course_timeslot[8,1,3]=1
Blocked_course_timeslot[8,3,4]=1
Blocked_course_timeslot[8,3,5]=1
Blocked_course_timeslot[8,3,6]=1
Blocked_course_timeslot[8,4,1]=1
Blocked_course_timeslot[8,4,2]=1
Blocked_course_timeslot[8,4,3]=1
Blocked_course_timeslot[8,4,4]=1
Blocked_course_timeslot[8,4,5]=1
Blocked_course_timeslot[8,4,6]=1
Blocked_course_timeslot[8,5,1]=1
Blocked_course_timeslot[8,5,2]=1
Blocked_course_timeslot[8,5,3]=1
Blocked_course_timeslot[8,5,4]=1
Blocked_course_timeslot[8,5,5]=1
Blocked_course_timeslot[8,5,6]=1
Blocked_course_timeslot[8,6,1]=1
Blocked_course_timeslot[8,6,2]=1
Blocked_course_timeslot[8,6,3]=1
Blocked_course_timeslot[8,6,4]=1
Blocked_course_timeslot[8,6,5]=1
Blocked_course_timeslot[8,6,6]=1
Blocked_course_timeslot[9,1,1]=1
Blocked_course_timeslot[9,2,1]=1
Blocked_course_timeslot[9,3,1]=1
Blocked_course_timeslot[9,4,1]=1
Blocked_course_timeslot[9,5,1]=1
Blocked_course_timeslot[9,5,3]=1
Blocked_course_timeslot[9,6,1]=1
Blocked_course_timeslot[9,6,2]=1
Blocked_course_timeslot[9,6,3]=1
Blocked_course_timeslot[9,6,4]=1
Blocked_course_timeslot[9,6,5]=1
Blocked_course_timeslot[9,6,6]=1
Blocked_course_timeslot[10,6,3]=1
Blocked_course_timeslot[10,6,4]=1
Blocked_course_timeslot[10,6,5]=1
Blocked_course_timeslot[10,6,6]=1
Blocked_course_timeslot[11,1,1]=1
Blocked_course_timeslot[11,1,6]=1
Blocked_course_timeslot[11,2,1]=1
Blocked_course_timeslot[11,2,6]=1
Blocked_course_timeslot[11,3,1]=1
Blocked_course_timeslot[11,3,6]=1
Blocked_course_timeslot[11,4,1]=1
Blocked_course_timeslot[11,4,6]=1
Blocked_course_timeslot[11,5,1]=1
Blocked_course_timeslot[11,5,6]=1
Blocked_course_timeslot[11,6,3]=1
Blocked_course_timeslot[11,6,4]=1
Blocked_course_timeslot[11,6,5]=1
Blocked_course_timeslot[11,6,6]=1
Blocked_course_timeslot[12,1,1]=1
Blocked_course_timeslot[12,1,2]=1
Blocked_course_timeslot[12,1,3]=1
Blocked_course_timeslot[12,3,4]=1
Blocked_course_timeslot[12,3,5]=1
Blocked_course_timeslot[12,3,6]=1
Blocked_course_timeslot[12,4,1]=1
Blocked_course_timeslot[12,4,2]=1
Blocked_course_timeslot[12,4,3]=1
Blocked_course_timeslot[12,4,4]=1
Blocked_course_timeslot[12,4,5]=1
Blocked_course_timeslot[12,4,6]=1
Blocked_course_timeslot[12,5,1]=1
Blocked_course_timeslot[12,5,2]=1
Blocked_course_timeslot[12,5,3]=1
Blocked_course_timeslot[12,5,4]=1
Blocked_course_timeslot[12,5,5]=1
Blocked_course_timeslot[12,5,6]=1
Blocked_course_timeslot[12,6,1]=1
Blocked_course_timeslot[12,6,2]=1
Blocked_course_timeslot[12,6,3]=1
Blocked_course_timeslot[12,6,4]=1
Blocked_course_timeslot[12,6,5]=1
Blocked_course_timeslot[12,6,6]=1
Blocked_course_timeslot[13,1,1]=1
Blocked_course_timeslot[13,1,2]=1
Blocked_course_timeslot[13,1,3]=1
Blocked_course_timeslot[13,3,4]=1
Blocked_course_timeslot[13,3,5]=1
Blocked_course_timeslot[13,3,6]=1
Blocked_course_timeslot[13,4,1]=1
Blocked_course_timeslot[13,4,2]=1
Blocked_course_timeslot[13,4,3]=1
Blocked_course_timeslot[13,4,4]=1
Blocked_course_timeslot[13,4,5]=1
Blocked_course_timeslot[13,4,6]=1
Blocked_course_timeslot[13,5,1]=1
Blocked_course_timeslot[13,5,2]=1
Blocked_course_timeslot[13,5,3]=1
Blocked_course_timeslot[13,5,4]=1
Blocked_course_timeslot[13,5,5]=1
Blocked_course_timeslot[13,5,6]=1
Blocked_course_timeslot[13,6,1]=1
Blocked_course_timeslot[13,6,2]=1
Blocked_course_timeslot[13,6,3]=1
Blocked_course_timeslot[13,6,4]=1
Blocked_course_timeslot[13,6,5]=1
Blocked_course_timeslot[13,6,6]=1
Blocked_course_timeslot[14,6,3]=1
Blocked_course_timeslot[14,6,4]=1
Blocked_course_timeslot[14,6,5]=1
Blocked_course_timeslot[14,6,6]=1
Blocked_course_timeslot[15,6,1]=1
Blocked_course_timeslot[15,6,2]=1
Blocked_course_timeslot[15,6,3]=1
Blocked_course_timeslot[15,6,4]=1
Blocked_course_timeslot[15,6,5]=1
Blocked_course_timeslot[15,6,6]=1
Blocked_course_timeslot[16,1,1]=1
Blocked_course_timeslot[16,1,2]=1
Blocked_course_timeslot[16,1,3]=1
Blocked_course_timeslot[16,5,4]=1
Blocked_course_timeslot[16,5,5]=1
Blocked_course_timeslot[16,5,6]=1
Blocked_course_timeslot[16,6,1]=1
Blocked_course_timeslot[16,6,2]=1
Blocked_course_timeslot[16,6,3]=1
Blocked_course_timeslot[16,6,4]=1
Blocked_course_timeslot[16,6,5]=1
Blocked_course_timeslot[16,6,6]=1
Blocked_course_timeslot[17,6,3]=1
Blocked_course_timeslot[17,6,4]=1
Blocked_course_timeslot[17,6,5]=1
Blocked_course_timeslot[17,6,6]=1
Blocked_course_timeslot[18,1,1]=1
Blocked_course_timeslot[18,1,2]=1
Blocked_course_timeslot[18,1,3]=1
Blocked_course_timeslot[18,3,4]=1
Blocked_course_timeslot[18,3,5]=1
Blocked_course_timeslot[18,3,6]=1
Blocked_course_timeslot[18,6,3]=1
Blocked_course_timeslot[18,6,4]=1
Blocked_course_timeslot[18,6,5]=1
Blocked_course_timeslot[18,6,6]=1
Blocked_course_timeslot[19,6,3]=1
Blocked_course_timeslot[19,6,4]=1
Blocked_course_timeslot[19,6,5]=1
Blocked_course_timeslot[19,6,6]=1
Blocked_course_timeslot[20,6,1]=1
Blocked_course_timeslot[20,6,2]=1
Blocked_course_timeslot[20,6,3]=1
Blocked_course_timeslot[20,6,4]=1
Blocked_course_timeslot[20,6,5]=1
Blocked_course_timeslot[20,6,6]=1
Blocked_course_timeslot[21,1,1]=1
Blocked_course_timeslot[21,1,2]=1
Blocked_course_timeslot[21,1,3]=1
Blocked_course_timeslot[21,1,4]=1
Blocked_course_timeslot[21,1,5]=1
Blocked_course_timeslot[21,1,6]=1
Blocked_course_timeslot[21,2,4]=1
Blocked_course_timeslot[21,2,5]=1
Blocked_course_timeslot[21,2,6]=1
Blocked_course_timeslot[21,3,1]=1
Blocked_course_timeslot[21,3,2]=1
Blocked_course_timeslot[21,3,3]=1
Blocked_course_timeslot[21,3,4]=1
Blocked_course_timeslot[21,3,5]=1
Blocked_course_timeslot[21,3,6]=1
Blocked_course_timeslot[21,4,4]=1
Blocked_course_timeslot[21,4,5]=1
Blocked_course_timeslot[21,4,6]=1
Blocked_course_timeslot[21,5,1]=1
Blocked_course_timeslot[21,5,2]=1
Blocked_course_timeslot[21,5,3]=1
Blocked_course_timeslot[21,5,4]=1
Blocked_course_timeslot[21,5,5]=1
Blocked_course_timeslot[21,5,6]=1
Blocked_course_timeslot[21,6,3]=1
Blocked_course_timeslot[21,6,4]=1
Blocked_course_timeslot[21,6,5]=1
Blocked_course_timeslot[21,6,6]=1
Blocked_course_timeslot[22,1,1]=1
Blocked_course_timeslot[22,1,6]=1
Blocked_course_timeslot[22,2,1]=1
Blocked_course_timeslot[22,2,6]=1
Blocked_course_timeslot[22,3,1]=1
Blocked_course_timeslot[22,3,6]=1
Blocked_course_timeslot[22,4,1]=1
Blocked_course_timeslot[22,4,2]=1
Blocked_course_timeslot[22,4,6]=1
Blocked_course_timeslot[22,5,1]=1
Blocked_course_timeslot[22,5,6]=1
Blocked_course_timeslot[22,6,1]=1
Blocked_course_timeslot[22,6,2]=1
Blocked_course_timeslot[22,6,3]=1
Blocked_course_timeslot[22,6,4]=1
Blocked_course_timeslot[22,6,5]=1
Blocked_course_timeslot[22,6,6]=1
Blocked_course_timeslot[23,1,4]=1
Blocked_course_timeslot[23,1,5]=1
Blocked_course_timeslot[23,1,6]=1
Blocked_course_timeslot[23,2,4]=1
Blocked_course_timeslot[23,2,5]=1
Blocked_course_timeslot[23,2,6]=1
Blocked_course_timeslot[23,3,6]=1
Blocked_course_timeslot[23,4,6]=1
Blocked_course_timeslot[23,5,6]=1
Blocked_course_timeslot[23,6,3]=1
Blocked_course_timeslot[23,6,4]=1
Blocked_course_timeslot[23,6,5]=1
Blocked_course_timeslot[23,6,6]=1
Blocked_course_timeslot[24,6,3]=1
Blocked_course_timeslot[24,6,4]=1
Blocked_course_timeslot[24,6,5]=1
Blocked_course_timeslot[24,6,6]=1
Blocked_course_timeslot[25,1,5]=1
Blocked_course_timeslot[25,1,6]=1
Blocked_course_timeslot[25,2,5]=1
Blocked_course_timeslot[25,2,6]=1
Blocked_course_timeslot[25,3,6]=1
Blocked_course_timeslot[25,4,6]=1
Blocked_course_timeslot[25,5,4]=1
Blocked_course_timeslot[25,5,5]=1
Blocked_course_timeslot[25,5,6]=1
Blocked_course_timeslot[25,6,3]=1
Blocked_course_timeslot[25,6,4]=1
Blocked_course_timeslot[25,6,5]=1
Blocked_course_timeslot[25,6,6]=1
Blocked_course_timeslot[26,6,3]=1
Blocked_course_timeslot[26,6,4]=1
Blocked_course_timeslot[26,6,5]=1
Blocked_course_timeslot[26,6,6]=1
Blocked_course_timeslot[27,6,3]=1
Blocked_course_timeslot[27,6,4]=1
Blocked_course_timeslot[27,6,5]=1
Blocked_course_timeslot[27,6,6]=1
Blocked_course_timeslot[28,1,1]=1
Blocked_course_timeslot[28,1,2]=1
Blocked_course_timeslot[28,1,3]=1
Blocked_course_timeslot[28,2,1]=1
Blocked_course_timeslot[28,2,2]=1
Blocked_course_timeslot[28,2,3]=1
Blocked_course_timeslot[28,3,1]=1
Blocked_course_timeslot[28,3,2]=1
Blocked_course_timeslot[28,3,3]=1
Blocked_course_timeslot[28,4,1]=1
Blocked_course_timeslot[28,4,2]=1
Blocked_course_timeslot[28,4,3]=1
Blocked_course_timeslot[28,5,1]=1
Blocked_course_timeslot[28,5,2]=1
Blocked_course_timeslot[28,5,3]=1
Blocked_course_timeslot[28,6,1]=1
Blocked_course_timeslot[28,6,2]=1
Blocked_course_timeslot[28,6,3]=1
Blocked_course_timeslot[28,6,4]=1
Blocked_course_timeslot[28,6,5]=1
Blocked_course_timeslot[28,6,6]=1
Blocked_course_timeslot[29,2,1]=1
Blocked_course_timeslot[29,2,2]=1
Blocked_course_timeslot[29,2,3]=1
Blocked_course_timeslot[29,2,4]=1
Blocked_course_timeslot[29,2,5]=1
Blocked_course_timeslot[29,2,6]=1
Blocked_course_timeslot[29,5,4]=1
Blocked_course_timeslot[29,5,5]=1
Blocked_course_timeslot[29,5,6]=1
Blocked_course_timeslot[29,6,1]=1
Blocked_course_timeslot[29,6,2]=1
Blocked_course_timeslot[29,6,3]=1
Blocked_course_timeslot[29,6,4]=1
Blocked_course_timeslot[29,6,5]=1
Blocked_course_timeslot[29,6,6]=1
Blocked_course_timeslot[30,1,1]=1
Blocked_course_timeslot[30,1,2]=1
Blocked_course_timeslot[30,1,3]=1
Blocked_course_timeslot[30,1,4]=1
Blocked_course_timeslot[30,1,5]=1
Blocked_course_timeslot[30,1,6]=1
Blocked_course_timeslot[30,2,1]=1
Blocked_course_timeslot[30,2,2]=1
Blocked_course_timeslot[30,2,3]=1
Blocked_course_timeslot[30,2,4]=1
Blocked_course_timeslot[30,2,5]=1
Blocked_course_timeslot[30,2,6]=1
Blocked_course_timeslot[30,5,4]=1
Blocked_course_timeslot[30,5,5]=1
Blocked_course_timeslot[30,5,6]=1
Blocked_course_timeslot[30,6,1]=1
Blocked_course_timeslot[30,6,2]=1
Blocked_course_timeslot[30,6,3]=1
Blocked_course_timeslot[30,6,4]=1
Blocked_course_timeslot[30,6,5]=1
Blocked_course_timeslot[30,6,6]=1
Blocked_course_timeslot[31,6,3]=1
Blocked_course_timeslot[31,6,4]=1
Blocked_course_timeslot[31,6,5]=1
Blocked_course_timeslot[31,6,6]=1
Blocked_course_timeslot[32,1,1]=1
Blocked_course_timeslot[32,1,2]=1
Blocked_course_timeslot[32,1,3]=1
Blocked_course_timeslot[32,2,1]=1
Blocked_course_timeslot[32,2,2]=1
Blocked_course_timeslot[32,2,3]=1
Blocked_course_timeslot[32,3,1]=1
Blocked_course_timeslot[32,3,2]=1
Blocked_course_timeslot[32,3,3]=1
Blocked_course_timeslot[32,4,1]=1
Blocked_course_timeslot[32,4,2]=1
Blocked_course_timeslot[32,4,3]=1
Blocked_course_timeslot[32,5,1]=1
Blocked_course_timeslot[32,5,2]=1
Blocked_course_timeslot[32,5,3]=1
Blocked_course_timeslot[32,6,1]=1
Blocked_course_timeslot[32,6,2]=1
Blocked_course_timeslot[32,6,3]=1
Blocked_course_timeslot[32,6,4]=1
Blocked_course_timeslot[32,6,5]=1
Blocked_course_timeslot[32,6,6]=1
Blocked_course_timeslot[33,1,1]=1
Blocked_course_timeslot[33,1,2]=1
Blocked_course_timeslot[33,1,3]=1
Blocked_course_timeslot[33,1,4]=1
Blocked_course_timeslot[33,1,5]=1
Blocked_course_timeslot[33,1,6]=1
Blocked_course_timeslot[33,2,1]=1
Blocked_course_timeslot[33,2,2]=1
Blocked_course_timeslot[33,2,3]=1
Blocked_course_timeslot[33,2,4]=1
Blocked_course_timeslot[33,2,5]=1
Blocked_course_timeslot[33,2,6]=1
Blocked_course_timeslot[33,3,1]=1
Blocked_course_timeslot[33,3,2]=1
Blocked_course_timeslot[33,3,3]=1
Blocked_course_timeslot[33,3,4]=1
Blocked_course_timeslot[33,3,5]=1
Blocked_course_timeslot[33,3,6]=1
Blocked_course_timeslot[33,4,1]=1
Blocked_course_timeslot[33,4,2]=1
Blocked_course_timeslot[33,4,3]=1
Blocked_course_timeslot[33,6,3]=1
Blocked_course_timeslot[33,6,4]=1
Blocked_course_timeslot[33,6,5]=1
Blocked_course_timeslot[33,6,6]=1
Blocked_course_timeslot[34,4,1]=1
Blocked_course_timeslot[34,4,2]=1
Blocked_course_timeslot[34,4,3]=1
Blocked_course_timeslot[34,4,4]=1
Blocked_course_timeslot[34,4,5]=1
Blocked_course_timeslot[34,4,6]=1
Blocked_course_timeslot[34,5,1]=1
Blocked_course_timeslot[34,5,2]=1
Blocked_course_timeslot[34,5,3]=1
Blocked_course_timeslot[34,5,4]=1
Blocked_course_timeslot[34,5,5]=1
Blocked_course_timeslot[34,5,6]=1
Blocked_course_timeslot[34,6,1]=1
Blocked_course_timeslot[34,6,2]=1
Blocked_course_timeslot[34,6,3]=1
Blocked_course_timeslot[34,6,4]=1
Blocked_course_timeslot[34,6,5]=1
Blocked_course_timeslot[34,6,6]=1
Blocked_course_timeslot[36,1,1]=1
Blocked_course_timeslot[36,1,2]=1
Blocked_course_timeslot[36,1,3]=1
Blocked_course_timeslot[36,3,3]=1
Blocked_course_timeslot[36,3,4]=1
Blocked_course_timeslot[36,3,5]=1
Blocked_course_timeslot[36,3,6]=1
Blocked_course_timeslot[36,4,1]=1
Blocked_course_timeslot[36,4,2]=1
Blocked_course_timeslot[36,4,3]=1
Blocked_course_timeslot[36,4,4]=1
Blocked_course_timeslot[36,4,5]=1
Blocked_course_timeslot[36,4,6]=1
Blocked_course_timeslot[36,5,1]=1
Blocked_course_timeslot[36,5,2]=1
Blocked_course_timeslot[36,5,3]=1
Blocked_course_timeslot[36,5,4]=1
Blocked_course_timeslot[36,5,5]=1
Blocked_course_timeslot[36,5,6]=1
Blocked_course_timeslot[36,6,1]=1
Blocked_course_timeslot[36,6,2]=1
Blocked_course_timeslot[36,6,3]=1
Blocked_course_timeslot[36,6,4]=1
Blocked_course_timeslot[36,6,5]=1
Blocked_course_timeslot[36,6,6]=1
Blocked_course_timeslot[37,1,1]=1
Blocked_course_timeslot[37,2,1]=1
Blocked_course_timeslot[37,3,1]=1
Blocked_course_timeslot[37,4,1]=1
Blocked_course_timeslot[37,5,1]=1
Blocked_course_timeslot[37,6,3]=1
Blocked_course_timeslot[37,6,4]=1
Blocked_course_timeslot[37,6,5]=1
Blocked_course_timeslot[37,6,6]=1
Blocked_course_timeslot[38,3,4]=1
Blocked_course_timeslot[38,3,5]=1
Blocked_course_timeslot[38,3,6]=1
Blocked_course_timeslot[38,4,1]=1
Blocked_course_timeslot[38,4,2]=1
Blocked_course_timeslot[38,4,3]=1
Blocked_course_timeslot[38,4,4]=1
Blocked_course_timeslot[38,4,5]=1
Blocked_course_timeslot[38,4,6]=1
Blocked_course_timeslot[38,5,1]=1
Blocked_course_timeslot[38,5,2]=1
Blocked_course_timeslot[38,5,3]=1
Blocked_course_timeslot[38,5,4]=1
Blocked_course_timeslot[38,5,5]=1
Blocked_course_timeslot[38,5,6]=1
Blocked_course_timeslot[38,6,1]=1
Blocked_course_timeslot[38,6,2]=1
Blocked_course_timeslot[38,6,3]=1
Blocked_course_timeslot[38,6,4]=1
Blocked_course_timeslot[38,6,5]=1
Blocked_course_timeslot[38,6,6]=1
Blocked_course_timeslot[39,1,1]=1
Blocked_course_timeslot[39,1,2]=1
Blocked_course_timeslot[39,1,3]=1
Blocked_course_timeslot[39,1,4]=1
Blocked_course_timeslot[39,1,5]=1
Blocked_course_timeslot[39,1,6]=1
Blocked_course_timeslot[39,2,1]=1
Blocked_course_timeslot[39,2,2]=1
Blocked_course_timeslot[39,2,3]=1
Blocked_course_timeslot[39,2,4]=1
Blocked_course_timeslot[39,2,5]=1
Blocked_course_timeslot[39,2,6]=1
Blocked_course_timeslot[39,3,1]=1
Blocked_course_timeslot[39,3,2]=1
Blocked_course_timeslot[39,3,3]=1
Blocked_course_timeslot[39,5,4]=1
Blocked_course_timeslot[39,5,5]=1
Blocked_course_timeslot[39,5,6]=1
Blocked_course_timeslot[39,6,1]=1
Blocked_course_timeslot[39,6,2]=1
Blocked_course_timeslot[39,6,3]=1
Blocked_course_timeslot[39,6,4]=1
Blocked_course_timeslot[39,6,5]=1
Blocked_course_timeslot[39,6,6]=1
Blocked_course_timeslot[40,1,1]=1
Blocked_course_timeslot[40,1,2]=1
Blocked_course_timeslot[40,1,3]=1
Blocked_course_timeslot[40,1,4]=1
Blocked_course_timeslot[40,1,5]=1
Blocked_course_timeslot[40,1,6]=1
Blocked_course_timeslot[40,2,1]=1
Blocked_course_timeslot[40,3,1]=1
Blocked_course_timeslot[40,4,1]=1
Blocked_course_timeslot[40,5,1]=1
Blocked_course_timeslot[40,6,3]=1
Blocked_course_timeslot[40,6,4]=1
Blocked_course_timeslot[40,6,5]=1
Blocked_course_timeslot[40,6,6]=1
Blocked_course_timeslot[41,2,4]=1
Blocked_course_timeslot[41,2,5]=1
Blocked_course_timeslot[41,2,6]=1
Blocked_course_timeslot[41,3,4]=1
Blocked_course_timeslot[41,3,5]=1
Blocked_course_timeslot[41,3,6]=1
Blocked_course_timeslot[41,6,1]=1
Blocked_course_timeslot[41,6,2]=1
Blocked_course_timeslot[41,6,3]=1
Blocked_course_timeslot[41,6,4]=1
Blocked_course_timeslot[41,6,5]=1
Blocked_course_timeslot[41,6,6]=1
Blocked_course_timeslot[42,6,3]=1
Blocked_course_timeslot[42,6,4]=1
Blocked_course_timeslot[42,6,5]=1
Blocked_course_timeslot[42,6,6]=1
Blocked_course_timeslot[43,1,4]=1
Blocked_course_timeslot[43,1,5]=1
Blocked_course_timeslot[43,1,6]=1
Blocked_course_timeslot[43,2,4]=1
Blocked_course_timeslot[43,2,5]=1
Blocked_course_timeslot[43,2,6]=1
Blocked_course_timeslot[43,3,4]=1
Blocked_course_timeslot[43,3,5]=1
Blocked_course_timeslot[43,3,6]=1
Blocked_course_timeslot[43,4,1]=1
Blocked_course_timeslot[43,4,2]=1
Blocked_course_timeslot[43,4,3]=1
Blocked_course_timeslot[43,4,4]=1
Blocked_course_timeslot[43,4,5]=1
Blocked_course_timeslot[43,4,6]=1
Blocked_course_timeslot[43,5,1]=1
Blocked_course_timeslot[43,5,2]=1
Blocked_course_timeslot[43,5,3]=1
Blocked_course_timeslot[43,5,4]=1
Blocked_course_timeslot[43,5,5]=1
Blocked_course_timeslot[43,5,6]=1
Blocked_course_timeslot[43,6,1]=1
Blocked_course_timeslot[43,6,2]=1
Blocked_course_timeslot[43,6,3]=1
Blocked_course_timeslot[43,6,4]=1
Blocked_course_timeslot[43,6,5]=1
Blocked_course_timeslot[43,6,6]=1
Blocked_course_timeslot[44,1,1]=1
Blocked_course_timeslot[44,1,2]=1
Blocked_course_timeslot[44,1,3]=1
Blocked_course_timeslot[44,1,4]=1
Blocked_course_timeslot[44,1,5]=1
Blocked_course_timeslot[44,1,6]=1
Blocked_course_timeslot[44,2,1]=1
Blocked_course_timeslot[44,2,2]=1
Blocked_course_timeslot[44,2,3]=1
Blocked_course_timeslot[44,2,4]=1
Blocked_course_timeslot[44,2,5]=1
Blocked_course_timeslot[44,2,6]=1
Blocked_course_timeslot[44,3,1]=1
Blocked_course_timeslot[44,3,2]=1
Blocked_course_timeslot[44,3,3]=1
Blocked_course_timeslot[44,3,4]=1
Blocked_course_timeslot[44,3,5]=1
Blocked_course_timeslot[44,3,6]=1
Blocked_course_timeslot[44,5,6]=1
Blocked_course_timeslot[44,6,3]=1
Blocked_course_timeslot[44,6,4]=1
Blocked_course_timeslot[44,6,5]=1
Blocked_course_timeslot[44,6,6]=1
Blocked_course_timeslot[45,1,1]=1
Blocked_course_timeslot[45,1,2]=1
Blocked_course_timeslot[45,1,3]=1
Blocked_course_timeslot[45,1,4]=1
Blocked_course_timeslot[45,3,4]=1
Blocked_course_timeslot[45,3,5]=1
Blocked_course_timeslot[45,3,6]=1
Blocked_course_timeslot[45,4,1]=1
Blocked_course_timeslot[45,4,2]=1
Blocked_course_timeslot[45,4,3]=1
Blocked_course_timeslot[45,4,4]=1
Blocked_course_timeslot[45,4,5]=1
Blocked_course_timeslot[45,4,6]=1
Blocked_course_timeslot[45,5,1]=1
Blocked_course_timeslot[45,5,2]=1
Blocked_course_timeslot[45,5,3]=1
Blocked_course_timeslot[45,5,4]=1
Blocked_course_timeslot[45,5,5]=1
Blocked_course_timeslot[45,5,6]=1
Blocked_course_timeslot[45,6,1]=1
Blocked_course_timeslot[45,6,2]=1
Blocked_course_timeslot[45,6,3]=1
Blocked_course_timeslot[45,6,4]=1
Blocked_course_timeslot[45,6,5]=1
Blocked_course_timeslot[45,6,6]=1
Blocked_course_timeslot[46,1,1]=1
Blocked_course_timeslot[46,1,2]=1
Blocked_course_timeslot[46,1,3]=1
Blocked_course_timeslot[46,1,4]=1
Blocked_course_timeslot[46,3,4]=1
Blocked_course_timeslot[46,3,5]=1
Blocked_course_timeslot[46,3,6]=1
Blocked_course_timeslot[46,4,1]=1
Blocked_course_timeslot[46,4,2]=1
Blocked_course_timeslot[46,4,3]=1
Blocked_course_timeslot[46,4,4]=1
Blocked_course_timeslot[46,4,5]=1
Blocked_course_timeslot[46,4,6]=1
Blocked_course_timeslot[46,5,1]=1
Blocked_course_timeslot[46,5,2]=1
Blocked_course_timeslot[46,5,3]=1
Blocked_course_timeslot[46,5,4]=1
Blocked_course_timeslot[46,5,5]=1
Blocked_course_timeslot[46,5,6]=1
Blocked_course_timeslot[46,6,1]=1
Blocked_course_timeslot[46,6,2]=1
Blocked_course_timeslot[46,6,3]=1
Blocked_course_timeslot[46,6,4]=1
Blocked_course_timeslot[46,6,5]=1
Blocked_course_timeslot[46,6,6]=1
Blocked_course_timeslot[47,6,3]=1
Blocked_course_timeslot[47,6,4]=1
Blocked_course_timeslot[47,6,5]=1
Blocked_course_timeslot[47,6,6]=1
Blocked_course_timeslot[48,1,1]=1
Blocked_course_timeslot[48,1,2]=1
Blocked_course_timeslot[48,1,3]=1
Blocked_course_timeslot[48,1,4]=1
Blocked_course_timeslot[48,1,5]=1
Blocked_course_timeslot[48,1,6]=1
Blocked_course_timeslot[48,2,1]=1
Blocked_course_timeslot[48,2,2]=1
Blocked_course_timeslot[48,2,3]=1
Blocked_course_timeslot[48,2,4]=1
Blocked_course_timeslot[48,2,5]=1
Blocked_course_timeslot[48,2,6]=1
Blocked_course_timeslot[48,3,1]=1
Blocked_course_timeslot[48,3,2]=1
Blocked_course_timeslot[48,3,3]=1
Blocked_course_timeslot[48,3,4]=1
Blocked_course_timeslot[48,3,5]=1
Blocked_course_timeslot[48,3,6]=1
Blocked_course_timeslot[48,4,1]=1
Blocked_course_timeslot[48,4,2]=1
Blocked_course_timeslot[48,4,3]=1
Blocked_course_timeslot[48,6,3]=1
Blocked_course_timeslot[48,6,4]=1
Blocked_course_timeslot[48,6,5]=1
Blocked_course_timeslot[48,6,6]=1
Blocked_course_timeslot[49,1,6]=1
Blocked_course_timeslot[49,2,6]=1
Blocked_course_timeslot[49,3,6]=1
Blocked_course_timeslot[49,4,6]=1
Blocked_course_timeslot[49,5,4]=1
Blocked_course_timeslot[49,5,5]=1
Blocked_course_timeslot[49,5,6]=1
Blocked_course_timeslot[49,6,1]=1
Blocked_course_timeslot[49,6,2]=1
Blocked_course_timeslot[49,6,3]=1
Blocked_course_timeslot[49,6,4]=1
Blocked_course_timeslot[49,6,5]=1
Blocked_course_timeslot[49,6,6]=1
Blocked_course_timeslot[50,6,1]=1
Blocked_course_timeslot[50,6,2]=1
Blocked_course_timeslot[50,6,3]=1
Blocked_course_timeslot[50,6,4]=1
Blocked_course_timeslot[50,6,5]=1
Blocked_course_timeslot[50,6,6]=1
Blocked_course_timeslot[51,1,1]=1
Blocked_course_timeslot[51,4,1]=1
Blocked_course_timeslot[51,4,2]=1
Blocked_course_timeslot[51,4,3]=1
Blocked_course_timeslot[51,4,4]=1
Blocked_course_timeslot[51,4,5]=1
Blocked_course_timeslot[51,4,6]=1
Blocked_course_timeslot[51,5,1]=1
Blocked_course_timeslot[51,5,2]=1
Blocked_course_timeslot[51,5,3]=1
Blocked_course_timeslot[51,5,4]=1
Blocked_course_timeslot[51,5,5]=1
Blocked_course_timeslot[51,5,6]=1
Blocked_course_timeslot[51,6,1]=1
Blocked_course_timeslot[51,6,2]=1
Blocked_course_timeslot[51,6,3]=1
Blocked_course_timeslot[51,6,4]=1
Blocked_course_timeslot[51,6,5]=1
Blocked_course_timeslot[51,6,6]=1
Blocked_course_timeslot[52,6,3]=1
Blocked_course_timeslot[52,6,4]=1
Blocked_course_timeslot[52,6,5]=1
Blocked_course_timeslot[52,6,6]=1
Blocked_course_timeslot[53,1,1]=1
Blocked_course_timeslot[53,1,2]=1
Blocked_course_timeslot[53,1,3]=1
Blocked_course_timeslot[53,1,4]=1
Blocked_course_timeslot[53,2,1]=1
Blocked_course_timeslot[53,2,2]=1
Blocked_course_timeslot[53,2,3]=1
Blocked_course_timeslot[53,2,4]=1
Blocked_course_timeslot[53,3,1]=1
Blocked_course_timeslot[53,3,2]=1
Blocked_course_timeslot[53,3,3]=1
Blocked_course_timeslot[53,3,4]=1
Blocked_course_timeslot[53,4,1]=1
Blocked_course_timeslot[53,4,2]=1
Blocked_course_timeslot[53,4,3]=1
Blocked_course_timeslot[53,4,4]=1
Blocked_course_timeslot[53,4,5]=1
Blocked_course_timeslot[53,4,6]=1
Blocked_course_timeslot[53,5,1]=1
Blocked_course_timeslot[53,5,2]=1
Blocked_course_timeslot[53,5,3]=1
Blocked_course_timeslot[53,5,4]=1
Blocked_course_timeslot[53,5,5]=1
Blocked_course_timeslot[53,5,6]=1
Blocked_course_timeslot[53,6,1]=1
Blocked_course_timeslot[53,6,2]=1
Blocked_course_timeslot[53,6,3]=1
Blocked_course_timeslot[53,6,4]=1
Blocked_course_timeslot[53,6,5]=1
Blocked_course_timeslot[53,6,6]=1
Blocked_course_timeslot[54,1,1]=1
Blocked_course_timeslot[54,1,2]=1
Blocked_course_timeslot[54,1,3]=1
Blocked_course_timeslot[54,1,4]=1
Blocked_course_timeslot[54,2,1]=1
Blocked_course_timeslot[54,2,2]=1
Blocked_course_timeslot[54,2,3]=1
Blocked_course_timeslot[54,2,4]=1
Blocked_course_timeslot[54,3,1]=1
Blocked_course_timeslot[54,3,2]=1
Blocked_course_timeslot[54,3,3]=1
Blocked_course_timeslot[54,3,4]=1
Blocked_course_timeslot[54,4,1]=1
Blocked_course_timeslot[54,4,2]=1
Blocked_course_timeslot[54,4,3]=1
Blocked_course_timeslot[54,4,4]=1
Blocked_course_timeslot[54,4,5]=1
Blocked_course_timeslot[54,4,6]=1
Blocked_course_timeslot[54,5,1]=1
Blocked_course_timeslot[54,5,2]=1
Blocked_course_timeslot[54,5,3]=1
Blocked_course_timeslot[54,5,4]=1
Blocked_course_timeslot[54,5,5]=1
Blocked_course_timeslot[54,5,6]=1
Blocked_course_timeslot[54,6,1]=1
Blocked_course_timeslot[54,6,2]=1
Blocked_course_timeslot[54,6,3]=1
Blocked_course_timeslot[54,6,4]=1
Blocked_course_timeslot[54,6,5]=1
Blocked_course_timeslot[54,6,6]=1
