package com.kbstar.controller;

import com.kbstar.dto.Discount;
import com.kbstar.service.DiscountService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class DiscountController {
    private final DiscountService service;
    
}
