package com.pavelch22.products.service;

import com.pavelch22.products.dao.ProductDao;
import com.pavelch22.products.model.Product;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    private ProductDao productDao;

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    @Transactional
    public Product getProductById(int id) {
        return productDao.getProductById(id);
    }

    @Transactional
    public List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }

    @Transactional
    public void addProduct(Product product) {
        productDao.addProduct(product);
    }

    @Transactional
    public void updateProduct(Product product) {
        productDao.updateProduct(product);
    }

    @Transactional
    public void deleteProduct(int id) {
        productDao.deleteProduct(id);
    }
}
