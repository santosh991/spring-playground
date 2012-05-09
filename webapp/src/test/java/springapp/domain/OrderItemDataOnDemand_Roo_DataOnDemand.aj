// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package springapp.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import springapp.domain.OrderItem;
import springapp.domain.OrderItemDataOnDemand;
import springapp.domain.Product;
import springapp.domain.ProductDataOnDemand;

privileged aspect OrderItemDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OrderItemDataOnDemand: @Component;
    
    private Random OrderItemDataOnDemand.rnd = new SecureRandom();
    
    private List<OrderItem> OrderItemDataOnDemand.data;
    
    @Autowired
    private ProductDataOnDemand OrderItemDataOnDemand.productDataOnDemand;
    
    public OrderItem OrderItemDataOnDemand.getNewTransientOrderItem(int index) {
        OrderItem obj = new OrderItem();
        setAmount(obj, index);
        setProduct(obj, index);
        return obj;
    }
    
    public void OrderItemDataOnDemand.setAmount(OrderItem obj, int index) {
        int amount = index;
        obj.setAmount(amount);
    }
    
    public void OrderItemDataOnDemand.setProduct(OrderItem obj, int index) {
        Product product = productDataOnDemand.getRandomProduct();
        obj.setProduct(product);
    }
    
    public OrderItem OrderItemDataOnDemand.getSpecificOrderItem(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        OrderItem obj = data.get(index);
        Long id = obj.getId();
        return OrderItem.findOrderItem(id);
    }
    
    public OrderItem OrderItemDataOnDemand.getRandomOrderItem() {
        init();
        OrderItem obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return OrderItem.findOrderItem(id);
    }
    
    public boolean OrderItemDataOnDemand.modifyOrderItem(OrderItem obj) {
        return false;
    }
    
    public void OrderItemDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = OrderItem.findOrderItemEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'OrderItem' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<OrderItem>();
        for (int i = 0; i < 10; i++) {
            OrderItem obj = getNewTransientOrderItem(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
