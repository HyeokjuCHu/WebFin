package org.example.webfinal;

import org.example.webfinal.ImageDAO;
import org.example.webfinal.ImageService;
import org.example.webfinal.ImageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageServiceImpl implements ImageService {
    @Autowired
    ImageDAO imageDAO;

    @Override
    public int insertImage(ImageVO vo) {
        return imageDAO.insertImage(vo);
    }

    @Override
    public ImageVO getImageById(int id) {
        return imageDAO.getImageById(id);  // DAO에서 데이터를 가져옴
    }

    @Override
    public int updateImage(ImageVO vo) {
        return imageDAO.updateImage(vo);  // DAO에서 업데이트 수행
    }

    @Override
    public List<ImageVO> getAllImages() {
        return imageDAO.getAllImages();  // Retrieve all images from the DAO
    }
}
