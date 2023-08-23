Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 265E77860DD
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 21:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjHWTms (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 15:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238377AbjHWTmW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 15:42:22 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5CDE6E;
        Wed, 23 Aug 2023 12:42:20 -0700 (PDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37NHxWPW031929;
        Wed, 23 Aug 2023 19:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=vmKNLJDuNsAz30h05ydMQimPh1tgOAbfXHtIErZ3kXg=;
 b=g6eb7F/0bGbQlgbbcecF19lnUDmOewLvh6/tt7swaDuPyLFTb5wSXbfr+FG/EFI2Vhdz
 7C0gYakB05WMj6JjLPC4fUs19n/GcTjpg1xFyDoeZ1m0BAp/DD1QuNJ6z6D4wJjownJr
 rfBcw2e1wDtFM8W6Gi6uR3j5QNKXlPZLsDciqnSTj37vkuuwK/B6xKInxJG+r+e6hjZb
 NJoyEY57WqoD3FBCmyaO4IMPEg7SRv+YwHnOgW8xmiFbz7OII5ytv5AZlWMhxGQNRCQr
 I0boZAnHZALpqUsZmoeMibQYgNUzVazgO0lAlIkVL+jL4B3z8cpJNfFkiNxTh/OI89fO bQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sn1yu2q6v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Aug 2023 19:42:09 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37NIwQWN033197;
        Wed, 23 Aug 2023 19:42:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3sn1yvhj2h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Aug 2023 19:42:08 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37NJg8Kr024393;
        Wed, 23 Aug 2023 19:42:08 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3sn1yvhj15-1;
        Wed, 23 Aug 2023 19:42:08 +0000
From:   Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To:     dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Liao Chang <liaochang1@huawei.com>,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com,
        vegard.nossum@oracle.com
Subject: [PATCH next] i2c: qcom-cci: Fix error checking in cci_probe()
Date:   Wed, 23 Aug 2023 12:42:02 -0700
Message-ID: <20230823194202.2280957-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_14,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308230179
X-Proofpoint-GUID: CUfOwl5W092Su6ntIrYGo2rTnOFimzJl
X-Proofpoint-ORIG-GUID: CUfOwl5W092Su6ntIrYGo2rTnOFimzJl
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

devm_clk_bulk_get_all() can return zero when no clocks are obtained.
Passing zero to dev_err_probe() is a success which is incorrect.

Fixes: 605efbf43813 ("i2c: qcom-cci: Use dev_err_probe in probe function")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Only compile tested, found by static analysis with smatch.

https://lore.kernel.org/all/CAA8EJprTOjbOy7N5+8NiJaNNhK+_btdUUFcpHKPkMuCZj5umMA@mail.gmail.com/
^^ I reported initially here, Dmitry suggested we need to fix it in a
different patch.

the Fixes commit used above pointed this bug, but the real fixes tag is this:
Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
---
 drivers/i2c/busses/i2c-qcom-cci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index cf13abec05f1..414882c57d7f 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -588,8 +588,10 @@ static int cci_probe(struct platform_device *pdev)
 	/* Clocks */
 
 	ret = devm_clk_bulk_get_all(dev, &cci->clocks);
-	if (ret < 1)
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get clocks\n");
+	else if (!ret)
+		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
 	cci->nclocks = ret;
 
 	/* Retrieve CCI clock rate */
-- 
2.39.3

