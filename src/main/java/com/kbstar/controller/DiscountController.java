package com.kbstar.controller;

import com.kbstar.dto.Discount;
import com.kbstar.service.DiscountService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class DiscountController {
    private final DiscountService service;

    @PostMapping("/discount")
    public int Discount(Discount discount) {
        System.out.println("discount = " + discount);
        return discount.getAmount();
    }
    
}
