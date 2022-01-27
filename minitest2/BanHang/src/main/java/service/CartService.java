package service;

import model.Product;

import java.util.ArrayList;

public class CartService {
    ArrayList<Product> cartList = new ArrayList<>();

    public void addProduct(Product product){
        cartList.add(product);
    }

    public ArrayList<Product> getCartList(){
        return cartList;
    }

    public void deleteProduct(Product product){
        cartList.remove(product);
    }
}
