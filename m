Return-Path: <linux-i2c+bounces-7970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AC9C7967
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0C8CB28872
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307E22022C5;
	Wed, 13 Nov 2024 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cIaNgcvd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B50C200CBE;
	Wed, 13 Nov 2024 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514491; cv=none; b=q8HBrL+gNEByKO8iBDhAIFZvNseLPW9OuhMSwpCzbBLjEYCFEMfv30PFLu2hCBHww6UJb1u3aQR15dIXMFOdJ/bZRW+GJol3IVu1gYuDurxGZa4OtfVjg2za5e5OS5zGjav7Hf3rm+U5oJmxh2h5T2L0/O2pYwbV5ImgPEIqlwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514491; c=relaxed/simple;
	bh=DeVkfklVz5KNEGiDf1zzHreyQXjJmRI4iUM9GSziv6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IxFO+Bvup6Gxo5kSsImv96Fh+DvaBKPN90y8ovB2UlGzwKevhwbn1hGHWNkEQVcbF3oSwX0EVZrlipTAB31oBqgxfh/dEKVxm+7wkOq1IKZgd4OuainDdqkPSsLMKptvR3Ozyt7xcqpwymDX85cwHW6c+H0zBe872e9+KbDsO6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cIaNgcvd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD9toj0022152;
	Wed, 13 Nov 2024 16:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vrOHPbEZsOs
	2ZMDaLbDaBYIZj69r5PTDQhjiKwGtq3I=; b=cIaNgcvd5IIWcTZ5D8eTdDdqkG9
	43RbVwHf/9HXEwXJP6moloJFURv2cVUV5D6mMacT2IWvtn+5AksB3ySbFgyNW3W0
	nfjtVD8n3TliJgoMBNb+p8Rk1QDJYfmcTkFE7jzs87kw8Hq8L1Kjue8CmSTM5+0E
	9rODZtkcZwTkeOQVBn8MDiV2b7JooauMOwIwteOxwosoVm2c3t1cb0XOvAXf5Xgv
	Fj9ncJlGWVOdgfHduXEGfUpYgyLN/d+3j4rXI3f5Hz/x6GnF2/AyaCl2exB5T/ei
	FmkYv2C6N6dc9HMbV5pFeSV03P+PMhjnvOZkVgayBRGdhLNGS7mrSmd5L7Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42va07bjm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADGEZsa032603;
	Wed, 13 Nov 2024 16:14:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tmhvg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:35 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4ADGEZ6O032597;
	Wed, 13 Nov 2024 16:14:35 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ADGEYWI032592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:35 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 1799F24055; Wed, 13 Nov 2024 21:44:34 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v4 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing between two subsystems
Date: Wed, 13 Nov 2024 21:44:13 +0530
Message-Id: <20241113161413.3821858-5-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: fQtdzChs2245augo5yyHNILMDCl9AQ5r
X-Proofpoint-ORIG-GUID: fQtdzChs2245augo5yyHNILMDCl9AQ5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130135

Add support to share I2C controller in multiprocessor system in a mutually
exclusive way. Use "qcom,shared-se" flag in a particular i2c instance node
if the usecase requires i2c controller to be shared.

Sharing of I2C SE(Serial engine) is possible only for GSI mode as client
from each processor can queue transfers over its own GPII Channel. For
non GSI mode, we should force disable this feature even if set by user
from DT by mistake.

I2C driver just need to mark first_msg and last_msg flag to help indicate
GPI driver to take lock and unlock TRE there by protecting from concurrent
access from other EE or Subsystem.

gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
Unlock TRE for the respective transfer operations.

Since the GPIOs are also shared between two SS, do not unconfigure them
during runtime suspend. This will allow other SS to continue to transfer
the data without any disturbance over the IO lines.

For example, Assume an I2C EEPROM device connected with an I2C controller.
Each client from ADSP and APPS processor can perform i2c transactions
without any disturbance from each other.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7a22e1f46e60..4bc5a5ea47f7 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
@@ -617,6 +618,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	peripheral.clk_div = itr->clk_div;
 	peripheral.set_config = 1;
 	peripheral.multi_msg = false;
+	peripheral.shared_se = gi2c->se.shared_geni_se;
 
 	for (i = 0; i < num; i++) {
 		gi2c->cur = &msgs[i];
@@ -627,6 +629,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		if (i < num - 1)
 			peripheral.stretch = 1;
 
+		peripheral.first_msg = (i == 0);
+		peripheral.last_msg = (i == num - 1);
 		peripheral.addr = msgs[i].addr;
 
 		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
@@ -815,6 +819,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = KHZ(100);
 	}
 
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
+		gi2c->se.shared_geni_se = true;
+		dev_dbg(&pdev->dev, "I2C is shared between subsystems\n");
+	}
+
 	if (has_acpi_companion(dev))
 		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
 
@@ -887,8 +896,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	else
 		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
 
-	if (fifo_disable) {
-		/* FIFO is disabled, so we can only use GPI DMA */
+	if (fifo_disable || gi2c->se.shared_geni_se) {
+		/* FIFO is disabled, so we can only use GPI DMA.
+		 * SE can be shared in GSI mode between subsystems, each SS owns a GPII.
+		 **/
 		gi2c->gpi_mode = true;
 		ret = setup_gpi_dma(gi2c);
 		if (ret) {
@@ -900,6 +911,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
 	} else {
 		gi2c->gpi_mode = false;
+
+		/* Force disable shared SE case for non GSI mode */
+		gi2c->se.shared_geni_se = false;
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 
 		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
@@ -981,7 +995,6 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
 	} else {
 		gi2c->suspended = 1;
 	}
-- 
2.25.1


