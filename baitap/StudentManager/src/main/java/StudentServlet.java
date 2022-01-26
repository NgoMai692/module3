import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "StudentServlet", urlPatterns = "/students")
public class StudentServlet extends HttpServlet {
    private  final StudentService studentService = new StudentService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        displayAllStudent(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request,response);
    }

    private void action(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        String action = request.getParameter("param");
        if (action == null){
            action = "";
        }
        switch (action){
            case "createGet":
                createGet(request,response);
                break;
            case "createPost":
                createPost(request,response);
                break;
            default:
                displayAllStudent(request,response);
        }
    }

    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.sendRedirect("create.jsp");
    }

    private void displayAllStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ArrayList<Student> students = studentService.getStudentList();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

//    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        response.sendRedirect("create.jsp");
//    }
    private void createPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        double avg = Double.parseDouble(request.getParameter("avg"));
        studentService.createStudent(new Student(id,name,age,address,avg));
        ArrayList<Student> students = studentService.getStudentList();
        request.setAttribute("students",students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request,response);
    }
}
