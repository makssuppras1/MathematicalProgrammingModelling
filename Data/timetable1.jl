# Dataset: ../ExcelData/comp01.xlsm

# Courses
C=30

# Lecturers
L=24

# Rooms
R=6
# Days
D=5

# Periods
P=6

# Curriculas
CU=14

#penalty coefficients
penalty_missing_seat=1
penalty_room_change=1
penalty_less_than_minimum_working_days=5
penalty_solo_cur_courses=2

Course_NoStudents=[130 75 117 75 65 65 65 65 55 55 55 20 11 31 31 2 2 7 6 10 8 6 5 14 7 9 7 4 10 9 ]
Course_NoLectures=[6 6 7 3 1 8 7 2 4 8 5 5 5 1 6 5 5 6 6 5 6 6 6 6 5 6 6 6 6 6 ]
Course_Lecturer=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 21 22 9 23 24 8 3 2 4 ]
Lecturer_NoCourses=[1 2 2 2 1 1 1 2 2 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 ]
Rooms_size=[200 100 9 30 20 30 ]
Course_MinLectureDays=[4 4 3 3 1 3 3 2 3 3 4 4 4 1 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 ]
Curricula_CourseCurreculaIncidenceMatrix=[
1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 1 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 1 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 ;
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 1 0 ;
]
Blocked_course_timeslot=zeros(C,D,P)
Blocked_course_timeslot[1,5,1]=1
Blocked_course_timeslot[1,5,2]=1
Blocked_course_timeslot[1,5,3]=1
Blocked_course_timeslot[1,5,4]=1
Blocked_course_timeslot[1,5,5]=1
Blocked_course_timeslot[1,5,6]=1
Blocked_course_timeslot[3,1,1]=1
Blocked_course_timeslot[3,1,2]=1
Blocked_course_timeslot[3,1,3]=1
Blocked_course_timeslot[3,1,4]=1
Blocked_course_timeslot[3,1,5]=1
Blocked_course_timeslot[3,1,6]=1
Blocked_course_timeslot[9,4,1]=1
Blocked_course_timeslot[9,4,2]=1
Blocked_course_timeslot[9,4,3]=1
Blocked_course_timeslot[9,4,4]=1
Blocked_course_timeslot[9,4,5]=1
Blocked_course_timeslot[9,4,6]=1
Blocked_course_timeslot[10,3,3]=1
Blocked_course_timeslot[10,3,4]=1
Blocked_course_timeslot[10,3,5]=1
Blocked_course_timeslot[10,3,6]=1
Blocked_course_timeslot[10,4,1]=1
Blocked_course_timeslot[10,4,2]=1
Blocked_course_timeslot[10,4,3]=1
Blocked_course_timeslot[10,4,4]=1
Blocked_course_timeslot[10,4,5]=1
Blocked_course_timeslot[10,4,6]=1
Blocked_course_timeslot[15,4,3]=1
Blocked_course_timeslot[15,4,4]=1
Blocked_course_timeslot[15,4,5]=1
Blocked_course_timeslot[15,4,6]=1
Blocked_course_timeslot[15,5,1]=1
Blocked_course_timeslot[15,5,2]=1
Blocked_course_timeslot[15,5,3]=1
Blocked_course_timeslot[15,5,4]=1
Blocked_course_timeslot[15,5,5]=1
Blocked_course_timeslot[15,5,6]=1
Blocked_course_timeslot[29,1,1]=1
Blocked_course_timeslot[29,1,2]=1
Blocked_course_timeslot[29,1,3]=1
Blocked_course_timeslot[29,2,1]=1
Blocked_course_timeslot[29,2,2]=1
Blocked_course_timeslot[29,2,3]=1
Blocked_course_timeslot[29,3,1]=1
Blocked_course_timeslot[29,3,2]=1
Blocked_course_timeslot[29,3,3]=1
Blocked_course_timeslot[29,4,1]=1
Blocked_course_timeslot[29,4,2]=1
Blocked_course_timeslot[29,4,3]=1
Blocked_course_timeslot[29,5,1]=1
Blocked_course_timeslot[29,5,2]=1
Blocked_course_timeslot[29,5,3]=1
