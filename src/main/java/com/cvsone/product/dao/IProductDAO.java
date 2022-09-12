package com.cvsone.product.dao;

import com.cvsone.common.vo.SearchVO;
import com.cvsone.product.vo.ProductVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IProductDAO {
    List<ProductVO> getProductList(SearchVO searchVO);

    int getProductCount(SearchVO searchVO);

    ProductVO getProductByName(String prdName);

    String getSampleString();
}
