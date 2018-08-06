package com.how2java.tmall.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.how2java.tmall.pojo.Category;
import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.service.CategoryService;
import com.how2java.tmall.service.ProductService;
import com.how2java.tmall.util.ImageUtil;
import com.how2java.tmall.util.Page;
import com.how2java.tmall.util.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("")
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_product_list")
    public String list(Model model, Page page, int cid) {
        Category category = categoryService.get(cid);
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List productList = productService.list(cid);

        int total;
        total = (int) new PageInfo<>(productList).getTotal();
        page.setTotal(total);
        page.setParam("&cid=" + category.getId());

        model.addAttribute("category", category);
        model.addAttribute("productList", productList);
        model.addAttribute("page", page);
        return "admin/listProduct";
    }

    @RequestMapping("admin_product_add")
    public String add(Product product, HttpSession httpSession, UploadedImageFile uploadedImageFile) throws IOException {
        productService.add(product);
        File imageFolder = new File(httpSession.getServletContext().getRealPath("img/product"));
        File file = new File(imageFolder, product.getId() + ".jpg");
        if (!file.getParentFile().exists())
            file.getParentFile().mkdirs();
        uploadedImageFile.getImage().transferTo(file);
        BufferedImage img = ImageUtil.change2jpg(file);
        ImageIO.write(img, "jpg", file);

        return "redirect:/admin_product_list?cid=" + product.getCid();
    }

    @RequestMapping("admin_product_delete")
    public String delete(int id, HttpSession httpSession) {
        Product product = productService.get(id);
        productService.delete(id);

        File imageFolder = new File(httpSession.getServletContext().getRealPath("img/product"));
        File file = new File(imageFolder, product.getId() + ".jpg");
        file.delete();

        return "redirect:/admin_product_list?cid=" + product.getCid();
    }

    @RequestMapping("admin_product_edit")
    public String edit(Model model, int id) {
        Product product = productService.get(id);
        Category category = categoryService.get(product.getCid());
        product.setCategory(category);
        model.addAttribute("product", product);

        return "admin/editProduct";
    }

    @RequestMapping("admin_product_update")
    public String update(Product product, HttpSession httpSession, UploadedImageFile uploadedImageFile) throws IOException {
        productService.update(product);

        MultipartFile image = uploadedImageFile.getImage();
        if (image != null && !image.isEmpty()) {
            File imageFolder = new File(httpSession.getServletContext().getRealPath("img/product"));
            File file = new File(imageFolder, product.getId()+".jsp");
            if (!file.getParentFile().exists())
                file.getParentFile().mkdirs();
            uploadedImageFile.getImage().transferTo(file);
            BufferedImage img = ImageUtil.change2jpg(file);
            ImageIO.write(img, "jpg", file);
        }

        return "redirect:/admin_product_list?cid=" + product.getCid();
    }


}
