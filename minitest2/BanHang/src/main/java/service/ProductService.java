package service;

import model.Product;

import java.util.ArrayList;

public class ProductService {
    private static final ArrayList<Product> products;

    static {
        products = new ArrayList<>();
        products.add(new Product(1,"Iphone7",8000000.0,16,"moi"));
        products.add(new Product(2,"Iphone8",18000000.0,20,"moi"));
        products.add(new Product(3,"Iphone6",5000000.0,6,"cu"));
        products.add(new Product(4,"Iphone5",4000000.0,1,"cu"));
    }

    public ArrayList<Product> getProducts(){
        return products;
    }

    public void addProduct(Product product){
        products.add(product);
    }

    public Product getProductInf(int id){
        for (Product product: products) {
            if(product.getId() == id){
                return product;
            }
        }
        return null;
    }
    public void sortIncrease(){
        products.sort((o1,o2) -> (int)(o1.getPrice() - o2.getPrice()));
    }

    public  void sortDecrease(){
        products.sort((o1,o2) -> (int)(o2.getPrice() - o1.getPrice()));
    }
}
