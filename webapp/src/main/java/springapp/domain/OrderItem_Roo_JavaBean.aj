// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package springapp.domain;

import springapp.domain.OrderItem;
import springapp.domain.Product;

privileged aspect OrderItem_Roo_JavaBean {
    
    public int OrderItem.getAmount() {
        return this.amount;
    }
    
    public void OrderItem.setAmount(int amount) {
        this.amount = amount;
    }
    
    public Product OrderItem.getProduct() {
        return this.product;
    }
    
    public void OrderItem.setProduct(Product product) {
        this.product = product;
    }
    
}