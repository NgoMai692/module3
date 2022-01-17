-- Hiển thị tất cả sinh viên có tên bắt đầu là 'h' 
select * from student where StudentName like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from class where month(StartDate) = 12;

-- Hiển thị tất cả thông tin môn học có credit trong khoảng 3-5
select * from subject where Credit >= 3 and Credit<=5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên là HUNG là 2
update student set `ClassID` = 2 where StudentName = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.    
select StudentName, SubName, Mark from mark m
inner join student s on s.StudentId = m.StudentId
inner join subject su on su.SubId = m.SubId
order by m.Mark DESC ;