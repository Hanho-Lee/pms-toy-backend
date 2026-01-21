package com.example.pms_toy.api.workPackage.dto;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class WorkPackageDto {
    @Data
    @Builder
    @AllArgsConstructor
    public static class WorkPackageRegDto {
        String title;
        String content;
        String workType;
        String workStatus;
        Long manageId;
        Long manageGroupId;
        LocalDate startDate;
        LocalDate endDate;
        Long createId;
    }

    @Data
    @Builder
    @AllArgsConstructor
    public static class WorkPackageResDto {
        Long workPackageId;
        String title;
        String content;
        String workType;
        String workStatus;
        Long manageId;
        Long manageGroupId;
        LocalDate startDate;
        LocalDate endDate;
        Long createId;
        LocalDateTime createDt;
        Long updateId;
        LocalDateTime updateDt;
        Long fileId;
    }
}
