package com.example.pms_toy.api.workPackage.controller;

import com.example.pms_toy.api.workPackage.dto.WorkPackageDto;
import com.example.pms_toy.api.workPackage.service.WorkPackageService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/work-package")
public class WorkPackageController {

    private final WorkPackageService workPackageService;

    @PostMapping
    public WorkPackageDto.WorkPackageResDto create(@RequestBody WorkPackageDto.WorkPackageRegDto regDto) {
        return workPackageService.create(regDto);
    }
}
