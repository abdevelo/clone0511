package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.dto.Reserve;
import com.kbstar.service.ReserveService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/reserve")
public class ReserveController {

    private final ReserveService reserveService;


    @PostMapping("/add")
    public void addReserve(int memberId, int itemId) {
        Reserve reserve = new Reserve(memberId, itemId);
        log.info("===============reserve================" + reserve);
        try {
            reserveService.register(reserve);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("찜 리스트에 추가를 실패했습니다.");
        }
    }

    @GetMapping("/{memberId}")
    public String myReserve(@PathVariable int memberId, Model model) throws Exception {
        List<Item> myReserve = reserveService.myReserve(memberId);
        log.info("========myReserve===================" + myReserve);
        model.addAttribute("myReserve", myReserve);
        model.addAttribute("center", "shopping-reserve");
        return "index";
    }


}
