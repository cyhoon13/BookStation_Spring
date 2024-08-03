package com.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.member.domain.OrderVO;
import com.member.domain.OrdersPrintVO;

public interface OrderDAO {

	/* 결제정보 */
    @Insert("INSERT INTO orders (member_id, payOption1, payOption2, payOption3, orderDate, savePoint, usePoint, totalPrice, orderState) "
            + "VALUES (#{member_id}, #{payOption1}, #{payOption2}, #{payOption3}, SYSDATE, #{savePoint}, #{usePoint}, #{totalPrice}, #{orderState})")
    @SelectKey(statement = "SELECT order_id FROM orders WHERE ROWNUM = 1 ORDER BY order_id DESC", keyProperty = "order_id", before = false, resultType = long.class)
    public void addOrder(OrderVO orderVO);

    /* 배송정보 */
    @Insert("INSERT INTO Shipping (order_id, shipping_name, shipping_phone, shippingAddr1, shippingAddr2, shippingAddr3, shippingOption1, shippingOption2) "
            + "VALUES (#{order_id}, #{shipping_name}, #{shipping_phone}, #{shippingAddr1}, #{shippingAddr2}, #{shippingAddr3}, #{shippingOption1}, #{shippingOption2})")
    void addShipping(OrderVO orderVO);
    
    /* 주문상품 정보 */
    @Insert("INSERT INTO ordersPrint (order_id, member_id, isbn, ordersPrint_price, ordersPrint_count, ordersPrint_date, ordersPrint_state) "
            + "VALUES (#{order_id}, #{member_id}, #{isbn}, #{ordersPrint_price}, #{ordersPrint_count}, SYSDATE, #{ordersPrint_state})")
    void addOrdersPrint(OrdersPrintVO ordersPrintVO);
    
    /* 회원 포인트 업데이트 */
    @Update("UPDATE member SET member_point = member_point + #{savePoint} - #{usePoint} WHERE member_id = #{member_id}")
    void updateMemberPoints(@Param("member_id") String member_id, @Param("savePoint") int savePoint, @Param("usePoint") int usePoint);
    
    /* 회원 주문금액 업데이트 */
    @Update("UPDATE member SET member_totalprice = member_totalprice + #{totalPrice} WHERE member_id = #{member_id}")
    void updateMemberTotalPrice(@Param("member_id") String member_id, @Param("totalPrice") int totalPrice);
    
}