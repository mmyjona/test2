/*
 * Copyright 2019 The FATE Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.webank.ai.fate.board.services;

import com.webank.ai.fate.board.dao.JobMapper;
import com.webank.ai.fate.board.pojo.Job;
import com.webank.ai.fate.board.pojo.JobExample;
import com.webank.ai.fate.board.pojo.JobWithBLOBs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Service

public class JobManagerService {
    public static Set<String> jobFinishStatus = new HashSet<String>() {
        {
            add("success");
            add("failed");
            add("partial");
            add("setFailed");
        }
    };
    private final Logger logger = LoggerFactory.getLogger(JobManagerService.class);
    @Autowired
    JobMapper jobMapper;

    public long count() {

        JobExample jobExample = new JobExample();
        return jobMapper.countByExample(jobExample);
    }

    public List<JobWithBLOBs> queryJobByPage(long startIndex, long pageSize) {
        List<JobWithBLOBs> jobWithBLOBs = jobMapper.selectByPage(startIndex, pageSize);
        return jobWithBLOBs;
    }


    public List<Job> queryJobStatus() {

        JobExample jobExample = new JobExample();

        JobExample.Criteria criteria = jobExample.createCriteria();

        ArrayList<String> stringArrayList = new ArrayList<String>();

        stringArrayList.add("waiting");

        stringArrayList.add("running");

        criteria.andFStatusIn(stringArrayList);

        jobExample.setOrderByClause("f_status, f_start_time desc");

        return jobMapper.selectByExample(jobExample);

    }


    public List<JobWithBLOBs> queryJob() {

        JobExample jobExample = new JobExample();

        jobExample.setOrderByClause("f_start_time desc");

        List<JobWithBLOBs> jobWithBLOBsList = jobMapper.selectByExampleWithBLOBs(jobExample);

        return jobWithBLOBsList;

    }


    public JobWithBLOBs queryJobByConditions(String jobId, String role, String partyId) {

        JobExample jobExample = new JobExample();

        JobExample.Criteria criteria = jobExample.createCriteria();

        criteria.andFJobIdEqualTo(jobId);

        criteria.andFRoleEqualTo(role);

        criteria.andFPartyIdEqualTo(partyId);

        List<JobWithBLOBs> jobWithBLOBsList = jobMapper.selectByExampleWithBLOBs(jobExample);

        if (jobWithBLOBsList.size() != 0) {
            return jobWithBLOBsList.get(0);
        } else {
            return null;
        }
    }


    public List<JobWithBLOBs> queryPagedJobsByCondition(long startIndex, long pageSize, Object orderField, String orderType, String jobId) {
        String order = orderField + " " + orderType;
        String limit = startIndex + "," + pageSize;

        JobExample jobExample = new JobExample();
        jobExample.setOrderByClause(order);
        jobExample.setLimitClause(limit);
        if (jobId != null) {
            JobExample.Criteria criteria = jobExample.createCriteria();
            jobId = "%" + jobId + "%";
            criteria.andFJobIdLike(jobId);

        }
        List<JobWithBLOBs> jobWithBLOBs = jobMapper.selectByExampleWithBLOBs(jobExample);

        return jobWithBLOBs;
    }


}