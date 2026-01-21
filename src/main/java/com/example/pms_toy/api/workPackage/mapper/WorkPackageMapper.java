package com.example.pms_toy.api.workPackage.mapper;

import com.example.pms_toy.api.workPackage.entity.WorkPackage;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkPackageMapper {
    int insertWorkPackage(WorkPackage workPackage);
}
