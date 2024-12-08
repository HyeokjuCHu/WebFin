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
        return imageDAO.getImageById(id);
    }

    @Override
    public int updateImage(ImageVO vo) {
        return imageDAO.updateImage(vo);
    }

    @Override
    public List<ImageVO> getAllImages() {
        return imageDAO.getAllImages();
    }

    @Override
    public void deleteImage(int id) {
        imageDAO.deleteImage(id);
    }

    @Override
    public List<ImageVO> searchImages(String query) {
        return imageDAO.searchImages(query);
    }


}
