package com.kbstar.dto;

import lombok.Data;

@Data
public class Discount {
    private String code;
    private int amount = 1000;
}
