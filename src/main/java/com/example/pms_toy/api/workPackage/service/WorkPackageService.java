package com.example.pms_toy.api.workPackage.service;

import com.example.pms_toy.api.workPackage.dto.WorkPackageDto;
import com.example.pms_toy.api.workPackage.entity.WorkPackage;
import com.example.pms_toy.api.workPackage.mapper.WorkPackageMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class WorkPackageService {

    private final WorkPackageMapper workPackageMapper;

    public WorkPackageDto.WorkPackageResDto create(WorkPackageDto.WorkPackageRegDto regDto) {
        WorkPackage workPackage = WorkPackage.builder()
                .title(regDto.getTitle())
                .content(regDto.getContent())
                .workType(regDto.getWorkType())
                .workStatus(regDto.getWorkStatus())
                .manageId(regDto.getManageId())
                .manageGroupId(regDto.getManageGroupId())
                .startDate(regDto.getStartDate())
                .endDate(regDto.getEndDate())
                .createId(1L)
//                .fileId(fileId)
                .build();

        workPackageMapper.insertWorkPackage(workPackage);

        return WorkPackageDto.WorkPackageResDto.builder()
                .workPackageId(workPackage.getWorkPackageId())
                .build();
    }
}
