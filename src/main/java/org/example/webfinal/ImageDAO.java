package org.example.webfinal;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ImageDAO {

    @Autowired
    SqlSession sqlSession;

    public int insertImage(ImageVO vo){
        int result = sqlSession.update("Image.InsertImage",vo);
        return result;
    }
    public ImageVO getImageById(int id) {
        return sqlSession.selectOne("Image.getImageById", id);  // SQL 쿼리 매핑
    }

    public int updateImage(ImageVO vo) {
        return sqlSession.update("Image.updateImage", vo);  // SQL 쿼리로 업데이트 수행
    }

    public List<ImageVO> getAllImages() {
        return sqlSession.selectList("Image.getAllImages");  // Select all images from database
    }

}
