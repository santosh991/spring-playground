package springapp.web;

import java.util.List;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springapp.domain.Product;
import springapp.domain.ProductOrder;

@RequestMapping("/productorders")
@Controller
@RooWebScaffold(path = "productorders", formBackingObject = ProductOrder.class)
public class ProductOrderController {
	
	@ModelAttribute("allProducts")
	public List<Product> getAllProducts(){
		return Product.findAllProducts();
	}
}
