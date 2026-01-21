package com.example.pms_toy.api.workPackage.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WorkPackage {
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
