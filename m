Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C158168A43E
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 22:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbjBCVH2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 16:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbjBCVHF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 16:07:05 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D54FAB5C0;
        Fri,  3 Feb 2023 13:05:20 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313JkBBA001250;
        Fri, 3 Feb 2023 21:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=rvaPs1gGGOz3RwEe5eODoAGyyXUHT8C3O8iBBoJF2oE=;
 b=VW8yrBzEPzXKEFP8L2m2iMXDRUDaOGjnEQUkgPBKPP3mck6lqHiDhgCN8nO6hgM6FZgL
 DW8Ljo5Axt0+VxuggwUU9iD35AaQaxb4FizIUaeLEJf4HOKyb/FemqW/BPQWQJ1gN99i
 YJeS/Dgg9bBEWTpo0v3f0LE0uHloUSLSf31eTPPJgQdPWhrECQ+cA+j5agI8Qjhgv63l
 gXu1fbadloAWrQcbDowIzz7xqArhWyRXXcMoxR6tuiyC/6PsFsPygrx3k2GCHiSTNPAd
 iJxlzHIiEgV6Laustm85rAY13u00NtyaSEdC6kikDoQlugx5tleGiDIMSULz8pqkbebS Dg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngns5jga8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Feb 2023 21:04:03 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313L3mwH024009
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Feb 2023 21:03:49 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 3 Feb 2023 13:03:46 -0800
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Visweswara Tanuku <quic_vtanuku@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-serial@vger.kernel.org>
Subject: [PATCH] soc: qcom: geni-se: Move qcom-geni-se.h to linux/soc/qcom/geni-se.h
Date:   Fri, 3 Feb 2023 13:01:32 -0800
Message-ID: <20230203210133.3552796-1-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LOHmo4vYamGpqlkOIup6-syKNL23zgQb
X-Proofpoint-ORIG-GUID: LOHmo4vYamGpqlkOIup6-syKNL23zgQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302030189
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move include/linux/qcom-geni-se.h to include/linux/soc/qcom/geni-se.h.
This removes 1 of a few remaining Qualcomm-specific headers into a more
approciate subdirectory under include/.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c                   | 2 +-
 drivers/soc/qcom/qcom-geni-se.c                      | 2 +-
 drivers/spi/spi-geni-qcom.c                          | 2 +-
 drivers/tty/serial/qcom_geni_serial.c                | 2 +-
 include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} (100%)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index fd70794bfcee..80d586b0be7a 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -14,7 +14,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
-#include <linux/qcom-geni-se.h>
+#include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
 
 #define SE_I2C_TX_TRANS_LEN		0x26c
diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index f0475b93ca73..795a2e1d59b3 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -14,7 +14,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
-#include <linux/qcom-geni-se.h>
+#include <linux/soc/qcom/geni-se.h>
 
 /**
  * DOC: Overview
diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 4e83cc5b445d..e05e40a49294 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -12,7 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
-#include <linux/qcom-geni-se.h>
+#include <linux/soc/qcom/geni-se.h>
 #include <linux/spi/spi.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index b487823f0e61..52f3a0184577 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -16,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_wakeirq.h>
-#include <linux/qcom-geni-se.h>
+#include <linux/soc/qcom/geni-se.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
 #include <linux/slab.h>
diff --git a/include/linux/qcom-geni-se.h b/include/linux/soc/qcom/geni-se.h
similarity index 100%
rename from include/linux/qcom-geni-se.h
rename to include/linux/soc/qcom/geni-se.h

base-commit: 3866989ec2c319341e2cf69ec6116269b634a271
-- 
2.39.1

