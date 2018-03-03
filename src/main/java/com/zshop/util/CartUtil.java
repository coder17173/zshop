package com.zshop.util;

import com.zshop.common.Constants;
import com.zshop.model.CartItem;
import com.zshop.model.Order;
import com.zshop.model.OrderItem;
import com.zshop.model.Product;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author ZhangHang
 * Date 2018/3/3 10:34
 * Description
 */
public class CartUtil {
    /**
     * 增加商品到购物车
     * @param session
     * @param product
     * @param number
     */
    public static synchronized void addProductToCart(HttpSession session, Product product, Integer number) {
        Map<Integer, CartItem> cartItemMap = (HashMap<Integer,CartItem>)session.getAttribute(Constants.CART);
        CartItem item = new CartItem(product, number);
        if(cartItemMap == null) {
            cartItemMap = new HashMap<Integer, CartItem>();
        }
        if(cartItemMap.containsKey(product.getPid())) {
            CartItem cartItem = cartItemMap.get(product.getPid());
            cartItem.setNumber(cartItem.getNumber() + number);
            cartItemMap.put(product.getPid(), cartItem);
        } else {
            cartItemMap.put(product.getPid(), item);
        }
        session.setAttribute(Constants.CART, cartItemMap);
    }

    /**
     * 删除购物车中的商品
     * @param session
     */
    public static synchronized void deleteProductFromCart(HttpSession session, Integer pid) {
        Map<Integer, CartItem> cartItemMap = (HashMap<Integer,CartItem>)session.getAttribute(Constants.CART);
        if(cartItemMap != null) {
            cartItemMap.remove(pid);
        }
        session.setAttribute(Constants.CART, cartItemMap);
    }

    /**
     * 清空购物车
     * @param session
     */
    public static synchronized void cleanCart(HttpSession session) {
        Map<Integer, CartItem> cartItemMap = (HashMap<Integer,CartItem>)session.getAttribute(Constants.CART);
        if(cartItemMap != null) {
            cartItemMap.clear();
        }
        session.setAttribute(Constants.CART, cartItemMap);
    }

    /**
     * 订单封装
     * @param session
     * @return
     */
    public static List<OrderItem> getOrderItemFromCart(HttpSession session) {
        Map<Integer, CartItem> cartItemMap = (HashMap<Integer, CartItem>)session.getAttribute(Constants.CART);
        if(cartItemMap == null) {
            cartItemMap = new HashMap<Integer, CartItem>();
        }
        List<OrderItem> itemList = new ArrayList<OrderItem>();
        for (CartItem cartItem : cartItemMap.values()) {
            OrderItem item = new OrderItem();
            Product product = cartItem.getProduct();
            item.setProduct(product);
            item.setPid(product.getPid());
            item.setBuyPrice(product.getPrice());
            int number = cartItem.getNumber();
            item.setCount(number);
            item.setSubTotal(product.getPrice()*number);
            itemList.add(item);
        }
        return itemList;
    }
}
