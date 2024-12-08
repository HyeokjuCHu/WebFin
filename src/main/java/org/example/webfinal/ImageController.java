package org.example.webfinal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@Controller
public class ImageController {
    @Autowired
    private ImageService imageService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        List<ImageVO> images = imageService.getAllImages(); // 이미지 목록 가져오기
        model.addAttribute("imageList", images); // 모델에 추가
        return "index"; // index.jsp 반환
    }

    @RequestMapping(value = "/image/update", method = RequestMethod.POST)
        public String updateImage(@ModelAttribute ImageVO imageVO) {
            imageVO.setUpdated_at(new Timestamp(System.currentTimeMillis())); // 수정 시간 설정
            int result = imageService.updateImage(imageVO);
            if (result > 0) {
                return "redirect:/image/list";
            } else {
                return "redirect:/image/edit?id=" + imageVO.getId();
            }
        }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam("query") String query, Model model) {
        List<ImageVO> results = imageService.searchImages(query);
        model.addAttribute("imageList", results);
        return "imageList";
    }


    @RequestMapping(value = "/image/add", method = RequestMethod.GET)
    public String showAddImageForm() {
        return "addImage"; // addImage.jsp를 반환
    }

    @RequestMapping(value = "/image/list", method = RequestMethod.GET)
    public String listImages(Model model) {
        List<ImageVO> images = imageService.getAllImages();
        model.addAttribute("imageList", images);
        return "imageList"; // imageList.jsp를 반환
    }

    @RequestMapping(value = "/image/edit", method = RequestMethod.GET)
    public String editImage(@RequestParam("id") int id, Model model) {
        ImageVO image = imageService.getImageById(id);
        model.addAttribute("image", image);
        return "editImage"; // editImage.jsp를 반환
    }

    @RequestMapping(value = "/image/delete", method = RequestMethod.POST)
    public String deleteImage(@RequestParam("id") int id) {
        imageService.deleteImage(id); // Service를 통해 이미지 삭제
        return "redirect:/image/list"; // 삭제 후 목록으로 리다이렉트
    }

    @RequestMapping(value = "/image/add", method = RequestMethod.POST)
    public String addImage(@RequestParam("user_id") String userId,
                           @RequestParam("file") MultipartFile file,
                           @RequestParam("title") String title,
                           @RequestParam("description") String description,
                           Model model) {

        // 사용자 ID가 비어있는지 확인
        if (userId == null || userId.trim().isEmpty()) {
            model.addAttribute("error", "사용자 ID는 필수 입력 항목입니다.");
            return "addImage"; // 에러 시 다시 폼으로
        }

        // 파일이 비어있는지 확인
        if (file.isEmpty()) {
            model.addAttribute("error", "파일을 선택해 주세요.");
            return "addImage"; // 에러 시 다시 폼으로
        }

        String fileName = file.getOriginalFilename(); // 파일 이름 가져오기
        String uploadDir = "src/main/webapp/images/"; // 실제 파일 저장 경로

        try {
            File dest = new File(uploadDir + fileName);
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "파일 업로드 중 문제가 발생했습니다.");
            return "addImage"; // 에러 시 다시 폼으로
        }

        // ImageVO 객체 생성 및 값 설정
        ImageVO imageVO = new ImageVO();
        imageVO.setUser_id(userId);
        imageVO.setFilename(fileName);
        imageVO.setTitle(title);
        imageVO.setDescription(description);
        imageVO.setCreated_at(new Timestamp(System.currentTimeMillis()));
        imageVO.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        imageVO.setLikes(0);
        imageVO.setViews(0);

        int result = imageService.insertImage(imageVO);
        if (result > 0) {
            return "redirect:/image/list"; // 성공 시 목록 페이지로 이동
        } else {
            model.addAttribute("error", "이미지 등록에 실패했습니다.");
            return "addImage"; // 실패 시 에러 메시지와 함께 폼으로
        }
    }
}
