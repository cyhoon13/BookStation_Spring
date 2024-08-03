package com.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.member.domain.CartVO;

public interface CartDAO {
		
	/* 책 정보 */
    @Select("SELECT c.cart_id, c.member_id, c.isbn, c.bookCount, b.book_name, b.book_price, b.book_discount " +
            "FROM cart c " +
            "JOIN book b ON c.isbn = b.isbn " +
            "WHERE c.member_id = #{member_id}")
    List<CartVO> getCartByMember_id(String member_id);
	
    /* 장바구니 상품 추가 */
    @Insert("INSERT INTO cart(cart_id, member_id, isbn, bookCount) VALUES(#{cart_id}, #{member_id}, #{isbn}, #{bookCount})")
    void addCart(CartVO cartVO);

    /* 장바구니 항목 삭제 */
    @Delete("DELETE FROM cart WHERE cart_id = #{cart_id} AND member_id = #{member_id}")
    void deleteCart(CartVO cartVO);
    
    /* 주문 후 장바구니 항목 삭제 */
    @Delete("DELETE FROM cart WHERE member_id = #{member_id}")
    void deleteCartByMemberId(String member_id);
    
    /* 장바구니 항목 수 반환 */
    @Select("SELECT COUNT(*) FROM cart WHERE member_id = #{member_id}")
    int getCartCountByMember_id(String member_id);
   
    /* 장바구니 수량 증가 */
    @Update("UPDATE cart SET bookCount = bookCount + 1 WHERE member_id = #{member_id} AND cart_id = #{cart_id}")
    void increaseCartItemCount(@Param("member_id") String member_id, @Param("cart_id") long cart_id);

    /* 장바구니 수량 감소 */
    @Update("UPDATE cart SET bookCount = bookCount - 1 WHERE member_id = #{member_id} AND cart_id = #{cart_id} AND bookCount > 1")
    void decreaseCartItemCount(@Param("member_id") String member_id, @Param("cart_id") long cart_id);

}
