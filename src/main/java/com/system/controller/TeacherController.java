package com.system.controller;

import com.system.po.CourseCustom;
import com.system.po.SelectedCourseCustom;
import com.system.po.Teacher;
import com.system.service.CourseService;
import com.system.service.SelectedCourseService;
import com.system.service.TeacherService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Vinci on 2017/7/6.
 */

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {

    @Resource(name = "teacherServiceImpl")
    private TeacherService teacherService;

    @Resource(name = "courseServiceImpl")
    private CourseService courseService;

    @Resource(name = "selectedCourseServiceImpl")
    private SelectedCourseService selectedCourseService;

    // 显示我的课程
    @RequestMapping(value = "/showCourse")
    public String stuCourseShow(Model model) throws Exception {

        Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();

        List<CourseCustom> list = courseService.findByTeacherID(Integer.parseInt(username));
        model.addAttribute("courseList", list);

        return "teacher/showCourse";
    }

    // 显示成绩
    @RequestMapping(value = "/gradeCourse")
    public String gradeCourse(Integer id, Model model) throws Exception {
        if (id == null) {
            return "";
        }
        List<SelectedCourseCustom> list = selectedCourseService.findByCourseID(id);
        model.addAttribute("selectedCourseList", list);
        return "teacher/showGrade";
    }

    // 打分
    @RequestMapping(value = "/mark", method = {RequestMethod.GET})
    public String markUI(SelectedCourseCustom scc, Model model) throws Exception {

        SelectedCourseCustom selectedCourseCustom = selectedCourseService.findOne(scc);

        model.addAttribute("selectedCourse", selectedCourseCustom);

        return "teacher/mark";
    }

    // 打分
    @RequestMapping(value = "/mark", method = {RequestMethod.POST})
    public String mark(SelectedCourseCustom scc) throws Exception {

        selectedCourseService.updataOne(scc);

        return "redirect:/teacher/gradeCourse?id=" + scc.getCourseid();
    }

    //修改密码
    @RequestMapping(value = "/passwordRest")
    public String passwordRest() throws Exception {
        return "teacher/passwordRest";
    }

    //个人信息
    @RequestMapping(value = "/profile")
    public String profile(Model model) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();
        Teacher teacher = teacherService.profile(Integer.parseInt(username));
        model.addAttribute("teacher", teacher);
        return "teacher/profile";
    }

    //更新个人信息
    @RequestMapping(value = "/profile_update")
    public String profileUpdate(Model model, @RequestParam("userName") String username, @RequestParam("sex") String sex, @RequestParam("degree") String degree, @RequestParam("title") String title, @RequestParam("collegeID") int collegeid) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        String userid = (String) subject.getPrincipal();
        Teacher teacher = new Teacher();
        teacher.setUserid(Integer.parseInt(userid));
        teacher.setUsername(username);
        teacher.setSex(sex);
        teacher.setDegree(degree);
        teacher.setTitle(title);
        teacher.setCollegeid(collegeid);
        int result = teacherService.profileUpdate(teacher);
        System.out.println(result);
        return profile(model);
    }

}
