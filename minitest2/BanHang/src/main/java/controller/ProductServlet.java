package controller;

import model.Product;
import service.CartService;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProductServlet", value = "/products")


public class ProductServlet extends HttpServlet {

    private  final ProductService productService = new ProductService();
    private  final CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request,response);
    }

    public void action(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        String action = request.getParameter("action");
        if (action == null) {
            action = "all";
        }
        switch (action) {
            case "creatGet":
                createGet(request, response);
                break;
            case "creatPost":
                createPost(request, response);
                break;
            case "sortIncrease":
                sortIncrease(request,response);
                break;
            case "sortDecrease":
                sortDecrease(request,response);
                break;
            case "delete":
//                delete(request, response);
                break;
            case "detail":
                displayDetail(request, response);
                break;
            case "cart":
                goCart(request,response);
                break;
            case "cartAdd":
                cartAdd(request,response);
                break;
            case "pay":

                break;
            case "all":
                displayAll(request, response);
                break;
        }
    }

    private void cartAdd(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProductInf(id);
        cartService.addProduct(product);
        displayAll(request,response);
    }

    private void sortDecrease(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        productService.sortDecrease();
        displayAll(request,response);
    }

    private void sortIncrease(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        productService.sortIncrease();
        displayAll(request,response);
    }

    private void displayDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProductInf(id);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view-detail.jsp");
        requestDispatcher.forward(request, response);
    }

    private void goCart(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        ArrayList<Product> products = cartService.getCartList();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        requestDispatcher.forward(request, response);
    }

    private void displayAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ArrayList<Product> products = productService.getProducts();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        productService.addProduct(new Product(id,name,price,quantity,description));
        displayAll(request,response);

    }

    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.sendRedirect("create.jsp");

    }
}
