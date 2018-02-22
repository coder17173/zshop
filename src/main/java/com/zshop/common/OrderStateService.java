package com.zshop.common;

/**
 * Author ZhangHang
 * Date 2018/2/21 21:08
 * Description
 */
public class OrderStateService {
    public static String getOrderStateDesc(int state) {
        String stateDesc;
        switch (state) {
            case 0:
                stateDesc = OrderStateEnum.WAIT_PAY.getDesc();
                break;
            case 1:
                stateDesc = OrderStateEnum.PAYED.getDesc();
                break;
            case 2:
                stateDesc = OrderStateEnum.SHIPPED.getDesc();
                break;
            case 3:
                stateDesc = OrderStateEnum.DELETED.getDesc();
                break;
            case 4:
                stateDesc = OrderStateEnum.ENDED.getDesc();
                break;
            default:
                stateDesc = null;
                break;
        }
        return stateDesc;
    }
}
