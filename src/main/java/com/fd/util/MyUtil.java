package com.fd.util;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class MyUtil {
    public static String upload(HttpServletRequest request, MultipartFile file) throws IOException {
        //返回图片的存储位置
        String image = null;
        if(file != null && !file.isEmpty()){
            //重命名图片，具有唯一的名字
            String name = UUID.randomUUID().toString().replace("-","");
            //获取图片的后缀
            System.out.println(file.getOriginalFilename());
            String ext = FilenameUtils.getExtension(file.getOriginalFilename());
            //设置图片上传的路径
            String url = request.getSession().getServletContext().getRealPath("/upload");
            System.out.println(url);
            //判断文件夹是否存在
            File file1 = new File(url);
            if(!file1.exists()) {
                file1.mkdirs();
            }
            // 以绝对路径保存图片
            file.transferTo(new File(url+"/"+name+"."+ext));
            image = "upload/"+name+"."+ext;
        }
        return image;
    }

    public static void deleteFile(HttpServletRequest request,String image){
        if(image != null){
            //获取文件所在的目录
            String url = request.getSession().getServletContext().getRealPath("/upload");
            File folder = new File(url);
            File[] files = folder.listFiles();
            //得到图片名称,因为存在数据库中的名称为“upload/***.ext”
            String[] a = image.split("/");
            //遍历文件之前需要判断文件夹内容是否为空
            if(files != null) {
                for (File file : files) {
                    if (file.getName().equals(a[1])) {
                        file.delete();
                        System.out.println("删除成功！");
                    }
                }
            }
        }
    }
}
