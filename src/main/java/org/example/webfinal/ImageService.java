package org.example.webfinal;

import java.util.List;

public interface ImageService {
    public int insertImage(ImageVO vo);
    public ImageVO getImageById(int id);
    public int updateImage(ImageVO vo);
    public List<ImageVO> getAllImages();
}
