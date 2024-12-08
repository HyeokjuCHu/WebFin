package org.example.webfinal;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ImageDAO {
    @Autowired
    SqlSession sqlSession;

    public int insertImage(ImageVO vo) {
        return sqlSession.insert("Image.insertImage", vo);
    }

    public ImageVO getImageById(int id) {
        return sqlSession.selectOne("Image.getImageById", id);
    }

    public int updateImage(ImageVO vo) {
        return sqlSession.update("Image.updateImage", vo);
    }

    public List<ImageVO> getAllImages() {
        return sqlSession.selectList("Image.getAllImages");
    }

    public int deleteImage(int id) { // delete 메서드 구현
        return sqlSession.delete("Image.deleteImage", id);
    }

    public List<ImageVO> searchImages(String query) {
        return sqlSession.selectList("Image.searchImages", "%" + query + "%");
    }
}