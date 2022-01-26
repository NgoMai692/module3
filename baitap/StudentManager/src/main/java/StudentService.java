import java.util.ArrayList;

public class StudentService {

    private static final ArrayList<Student> students;

    static {
        students = new ArrayList<>();
        students.add(new Student(1, "quan", 26, "HN", 8));
        students.add(new Student(2, "toan", 24, "HN", 6));
        students.add(new Student(3, "nhuanh", 22, "HN", 10));
    }

    public ArrayList<Student> getStudentList() {
        return students;
    }

    public Student getStudent(int id) {
        for (Student student : students) {
            if (student.getId() == id) {
                return student;
            }
        }
        return null;
    }

    public void createStudent(Student student) {
        students.add(student);
    }

    public void deleteStudent(Student student) {
        students.remove(student);
    }

    public void editStudent(int index, Student student) {
        students.set(index, student);
    }

    public ArrayList<Student> sortStudentList() {
        students.sort((o1, o2) -> (int) (o1.getAvg()-o2.getAvg()));
        return students;
    }

    public ArrayList<Student> getStudentListByAvg() {
        ArrayList<Student> studentList = new ArrayList<>();
        for (Student student: students) {
            if (student.getAvg() >= 8) {
                studentList.add(student);
            }
        }
        return studentList;
    }

    public ArrayList<Student> searchStudentByName(String name) {
        ArrayList<Student> studentList = new ArrayList<>();
        for (Student student: students) {
            if (student.getName().equals(name)) {
                studentList.add(student);
            }
        }
        return studentList;
    }
}
