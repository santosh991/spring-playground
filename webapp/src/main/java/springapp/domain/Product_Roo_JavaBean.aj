// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package springapp.domain;

import springapp.domain.Product;

privileged aspect Product_Roo_JavaBean {
    
    public String Product.getDescription() {
        return this.description;
    }
    
    public void Product.setDescription(String description) {
        this.description = description;
    }
    
    public Double Product.getPrice() {
        return this.price;
    }
    
    public void Product.setPrice(Double price) {
        this.price = price;
    }
    
}
