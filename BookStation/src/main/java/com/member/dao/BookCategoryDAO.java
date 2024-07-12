package com.member.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import com.member.domain.BookCategoryVO;

public interface BookCategoryDAO {

    @Select("SELECT cm.category_main AS category_main, cd.category_sub AS category_sub " +
            "FROM book b " +
            "JOIN categorydetail cd ON b.category_id = cd.category_id " +
            "JOIN categorymain cm ON cd.category_mainID = cm.category_mainID " +
            "WHERE b.isbn = #{isbn}")
    BookCategoryVO getCategoryMainAndSubByIsbn(@Param("isbn") String isbn);

    @Select("SELECT category_main FROM categorymain WHERE category_mainID = #{category_MainID}")
    String getCategoryMainByID(@Param("category_MainID") String category_MainID);
}
