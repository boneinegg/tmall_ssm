package com.how2java.tmall.service.impl;


import com.how2java.tmall.mapper.ProductMapper;
import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.pojo.ProductExample;
import com.how2java.tmall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;

    @Override
    public void add(Product product) {
        productMapper.insert(product);
    }
    @Override
    public void delete(int id) {
        productMapper.deleteByPrimaryKey(id);
    }
    @Override
    public void update(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }
    @Override
    public Product get(int id) {
        return productMapper.selectByPrimaryKey(id);
    }
    @Override
    public List list(int cid) {
        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andCidEqualTo(cid);
        productExample.setOrderByClause("id desc");
        return productMapper.selectByExample(productExample);
    }
}
