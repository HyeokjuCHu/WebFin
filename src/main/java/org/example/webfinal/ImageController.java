package org.example.webfinal;

import org.example.webfinal.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ImageController {
    @Autowired
    private ImageService imageService;

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping(value="/image/add", method= RequestMethod.GET)
    public String addService() {
        return "addImage";
    }

    @RequestMapping(value = "/image/edit", method = RequestMethod.GET)
    public String editService(@RequestParam("id") int id, Model model) {
        ImageVO image = imageService.getImageById(id);
        model.addAttribute("image", image);  // image 객체를 JSP로 전달
        return "editImage";  // editImage.jsp로 이동
    }

    @RequestMapping(value = "/image/update", method = RequestMethod.POST)
    public String updateImage(@ModelAttribute ImageVO imageVO) {
        int result = imageService.updateImage(imageVO);  // 이미지 수정 메소드 호출
        if (result > 0) {
            return "redirect:/image/list";  // 수정 성공 시 이미지 목록으로 리다이렉트
        } else {
            return "redirect:/image/edit?id=" + imageVO.getId();  // 실패 시 수정 페이지로 리다이렉트
        }
    }




    @RequestMapping(value = "/image/list", method = RequestMethod.GET)
    public String listService(Model model) {
        List<ImageVO> images = imageService.getAllImages();  // Fetch all images
        model.addAttribute("images", images);  // Add images to the model
        return "imageList";  // Return view name
    }

    @RequestMapping(value = "/image/add", method = RequestMethod.POST)
    public String addImage(@ModelAttribute ImageVO imageVO) {
        int result = imageService.insertImage(imageVO);
        if (result > 0) {
            return "redirect:/image/index";  // 성공 시 다른 페이지로 리다이렉트
        } else {
            return "redirect:/image/index";  // 실패 시 오류 페이지로 리다이렉트
        }
    }

}
