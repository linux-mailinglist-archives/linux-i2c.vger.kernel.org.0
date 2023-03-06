Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B45C66AC3AD
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 15:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjCFOqX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 09:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbjCFOqG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 09:46:06 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC50D2E82E;
        Mon,  6 Mar 2023 06:45:47 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326Dhvrw008525;
        Mon, 6 Mar 2023 14:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=nXxBYvYmKxouMcZlkVJQl/q1L/EByDXUxEAwhrEUQUQ=;
 b=hblBiYtYJwFsffDcBNpxEbGD6da685ozODZUHTyf/q5QR+TU3TfWGoXEfrnOHbnKh/SJ
 nFzFLpGm/CBwMXGBjUE3KMIbxy5q4T6lVB0xbxiUD2xBw08QIfKiDCgKAHrzwMpkX8I3
 9Pz1mUPAGU0+HPEbWVtTsmhoftS4i4ciNp2ZX2LDi8VbuHcO62YWM96fsrIs+okw7QEq
 2zxSJK958GeTPG8YALvMyl2HBauIFnIDsvzwncnu/dPNyEPhblMHa04mEiPvGEfrCOyF
 XQoxzMjIQHIre5uOlwkwY2Hg79QsTQD1+x+VX7RYw9sFpfGb8rYPUx5m1OQpfzLLRm2a 4g== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p419d50au-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Mar 2023 14:45:29 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 326EjOON014501;
        Mon, 6 Mar 2023 14:45:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3p4fft5hxu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 06 Mar 2023 14:45:24 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326EjOji014495;
        Mon, 6 Mar 2023 14:45:24 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 326EjOKM014494;
        Mon, 06 Mar 2023 14:45:24 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
        id 291C312010CA; Mon,  6 Mar 2023 20:15:23 +0530 (IST)
From:   Md Sadre Alam <quic_mdalam@quicinc.com>
To:     loic.poulain@linaro.org, rfoss@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_mdalam@quicinc.com
Subject: [PATCH 3/5] i2c: qcom-cci:Use devm_platform_get_and_ioremap_resource()
Date:   Mon,  6 Mar 2023 20:15:22 +0530
Message-Id: <20230306144522.15699-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tEIPnkK23uXSScqfu_5DGPFAF-EPwQYy
X-Proofpoint-GUID: tEIPnkK23uXSScqfu_5DGPFAF-EPwQYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 mlxlogscore=749 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060130
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 01358472680c..ed70bc1e4926 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -581,8 +581,7 @@ static int cci_probe(struct platform_device *pdev)
 
 	/* Memory */
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cci->base = devm_ioremap_resource(dev, r);
+	cci->base = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(cci->base))
 		return PTR_ERR(cci->base);
 
-- 
2.17.1

