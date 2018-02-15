package kz.epam.zd.action;

import kz.epam.zd.exception.ActionException;
import kz.epam.zd.exception.ServiceException;
import kz.epam.zd.model.Book;
import kz.epam.zd.model.Order;
import kz.epam.zd.model.OrderStatus;
import kz.epam.zd.model.user.User;
import kz.epam.zd.service.OrderService;
import kz.epam.zd.util.ValidatorHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

import static kz.epam.zd.util.ConstantHolder.*;

/**
 * Customer action to order books from the cart
 */
public class OrderBooksAction implements Action {

    private static final String EMPTY_CART_MESSAGE = "empty.cart.message";
    private static final String REDIRECT_ORDER_SUCCESS = "redirect:/do/?action=show-order-success-page";
    private static final String WAITING_ORDER_STATUS = "waiting";

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HashMap books = (HashMap) request.getSession().getAttribute(CART);
        if (books.isEmpty()) {
            request.getSession().setAttribute(CART + FORM_ERRORS, EMPTY_CART_MESSAGE);
            return REDIRECT_CART_PAGE;
        }

        if (ValidatorHelper.checkCartForm(request, books))
            return REDIRECT_CART_PAGE;

        final User user = (User) request.getSession().getAttribute(USER);
        final int userId = user.getId();

        //updates book quantity
        for (int i = 0; i < books.size(); i++) {
            for (Object o : books.entrySet()) {
                Map.Entry pair = (Map.Entry) o;
                //noinspection unchecked
                books.replace(pair.getKey(), pair.getValue(), Integer.valueOf(request.getParameter(QUANTITY + i)));
            }
        }

        Order order = new Order();
        order.setUserId(userId);
        order.setStatus(OrderStatus.valueOf(WAITING_ORDER_STATUS));


        OrderService orderService = new OrderService();
        try {
            orderService.makeOrder(order, userId, books);
        } catch (ServiceException e) {
            request.setAttribute(ORDERS + FORM_ERRORS, e.getMessage());
        }

        request.getSession().setAttribute(CART, new HashMap<Book, Integer>());
        return REDIRECT_ORDER_SUCCESS;
    }

}