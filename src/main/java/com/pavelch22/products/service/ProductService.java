package com.pavelch22.products.service;

import com.pavelch22.products.model.Product;

import java.util.List;

public interface ProductService {

    Product getProductById(int id);

    List<Product> getAllProducts();

    void addProduct(Product product);

    void updateProduct(Product product);

    void deleteProduct(int id);
}
