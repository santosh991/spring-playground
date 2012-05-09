package springapp.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import springapp.domain.ProductOrder;

@RequestMapping("/productorders")
@Controller
@RooWebScaffold(path = "productorders", formBackingObject = ProductOrder.class)
public class ProductOrderController {
}
