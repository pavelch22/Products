package com.pavelch22.products.controller;

import com.pavelch22.products.model.Product;
import com.pavelch22.products.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
    private ProductService productService;

    @Autowired(required = true)
    @Qualifier(value = "productService")
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping(value = "products", method = RequestMethod.GET)
    public String listProducts(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("allProducts", productService.getAllProducts());
        return "products";
    }

    @RequestMapping(value = "/products/add", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") Product product) {
        if (product.getId() == 0) {
            productService.addProduct(product);
        } else {
            productService.updateProduct(product);
        }
        return "redirect:/products";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public String deleteProduct(@PathVariable("id") int id) {
        productService.deleteProduct(id);
        return "redirect:/products";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String editProduct(@PathVariable("id") int id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        model.addAttribute("allProducts", productService.getAllProducts());

        return "products";
    }

    @RequestMapping(value = "productDetails/{id}", method = RequestMethod.GET)
    public String productData(@PathVariable("id") int id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "productDetails";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome() {
        return "redirect:/products";
    }
}
