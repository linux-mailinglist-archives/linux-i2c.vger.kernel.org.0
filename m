Return-Path: <linux-i2c+bounces-5908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00CC963FFA
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 113DF1C242D5
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5074E18E37E;
	Thu, 29 Aug 2024 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="idA4KpHX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B5118DF94;
	Thu, 29 Aug 2024 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923579; cv=none; b=buMhjukQncQuUgiC52F/5XQT7ZZoktjI6axUsRHW9dHhhzJTCvbS2E4zj2pCvj91ZKA2kv3gcWTpLly0anCKPKpdtZK7ppESvUKEN6UCp482CLOJJ9/riI0d9Dqz5FGeHbyPUSdncWEunDerPtv1KFjXBsEDl06/0zyuYYQR7Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923579; c=relaxed/simple;
	bh=P9bp+kuK45uZZSN3cpkVtEACd9ZvSOCvJtQ1RH40zPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FMXey5xyWqTsU4eYRwa2hAx50zUlFkzdzzlmvKl+SsSjaVQzwhOYVq2kg6Tl3jeyisQ3XFa6N/Y3yppBBvs8KTsupDsKJjTHGOx8AfmfCOtGoy7+X1IiZJJsSUMWhrgAS3YDMUcZ7ZOj5kySZKEVd1NHkAWvMdaqYdjbAR1vjik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=idA4KpHX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8Oggj010887;
	Thu, 29 Aug 2024 09:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yuNVYZ9hfDi
	5n3vRZsFzMDLctazYKEOldnRMnjkS1N4=; b=idA4KpHXUElhLgJzEECHCg0+sop
	wtiDaIUHDisO2YuDnsXOyRDB7X7YmHefPiSz7lsoutWHazy4sfi9PTdXcgpIgAeJ
	4FbvibGJYx9wps3tMVX2DLg9hndTbzszajn95ARmeblO1rBfd/G+sGIT7CXywEMu
	9WXJA4BoGp5fn7MzeW5xbHw+Ik+HzE4VIp9sKFqorkO1pLvG8AWYUgYZloEn6lPz
	yJj6MTXCXmostDlKj3QI6nm9t2zlfD+MYE8KHp3jZtvvBNOQqbnLkoyFC+z+pnmg
	5ROZNjd5se1OVVksFlhmKnOYX6VadYfyYaCrLd6j+KaB74ZKhzKyUXRjh0g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0mqfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:26:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 47T9QAtr019440;
	Thu, 29 Aug 2024 09:26:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4178kmcgmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:26:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47T9Q2X5019351;
	Thu, 29 Aug 2024 09:26:10 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47T9Q9Br019426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:26:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id DAEEF242FD; Thu, 29 Aug 2024 14:56:08 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing between two subsystems
Date: Thu, 29 Aug 2024 14:54:18 +0530
Message-Id: <20240829092418.2863659-5-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hyrKRq-Nfoh8TtgE-h8UfBcCI7jn7QTC
X-Proofpoint-ORIG-GUID: hyrKRq-Nfoh8TtgE-h8UfBcCI7jn7QTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290069

Add support to share I2C SE by two Subsystems in a mutually exclusive way.
Use  "qcom,shared-se" flag in a particular i2c instance node if the
usecase requires i2c controller to be shared.

I2C driver just need to mark first_msg and last_msg flag to help indicate
GPI driver to  take lock and unlock TRE there by protecting from concurrent
access from other EE or Subsystem.

gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
Unlock TRE for the respective transfer operations.

Since the GPIOs are also shared for the i2c bus between two SS, do not
touch GPIO configuration during runtime suspend and only turn off the
clocks. This will allow other SS to continue to transfer the data
without any disturbance over the IO lines.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index eebb0cbb6ca4..ee2e431601a6 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
@@ -99,6 +100,7 @@ struct geni_i2c_dev {
 	struct dma_chan *rx_c;
 	bool gpi_mode;
 	bool abort_done;
+	bool is_shared;
 };
 
 struct geni_i2c_desc {
@@ -602,6 +604,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	peripheral.clk_div = itr->clk_div;
 	peripheral.set_config = 1;
 	peripheral.multi_msg = false;
+	peripheral.shared_se = gi2c->is_shared;
 
 	for (i = 0; i < num; i++) {
 		gi2c->cur = &msgs[i];
@@ -612,6 +615,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		if (i < num - 1)
 			peripheral.stretch = 1;
 
+		peripheral.first_msg = (i == 0);
+		peripheral.last_msg = (i == num - 1);
 		peripheral.addr = msgs[i].addr;
 
 		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
@@ -631,8 +636,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		dma_async_issue_pending(gi2c->tx_c);
 
 		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-		if (!time_left)
+		if (!time_left) {
+			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
+						gi2c->cur->flags, gi2c->cur->addr);
 			gi2c->err = -ETIMEDOUT;
+		}
 
 		if (gi2c->err) {
 			ret = gi2c->err;
@@ -800,6 +808,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = KHZ(100);
 	}
 
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
+		gi2c->is_shared = true;
+		dev_dbg(&pdev->dev, "Shared SE Usecase\n");
+	}
+
 	if (has_acpi_companion(dev))
 		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
 
@@ -962,14 +975,16 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
-	if (ret) {
-		enable_irq(gi2c->irq);
-		return ret;
-
+	if (gi2c->is_shared) {
+		geni_se_clks_off(&gi2c->se);
 	} else {
-		gi2c->suspended = 1;
+		ret = geni_se_resources_off(&gi2c->se);
+		if (ret) {
+			enable_irq(gi2c->irq);
+			return ret;
+		}
 	}
+	gi2c->suspended = 1;
 
 	clk_disable_unprepare(gi2c->core_clk);
 
-- 
2.25.1


