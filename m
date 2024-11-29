Return-Path: <linux-i2c+bounces-8272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1142E9DE8D7
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 15:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34DC5164787
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 14:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12AC1684B0;
	Fri, 29 Nov 2024 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ntMZeMVI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086BB14AD2B;
	Fri, 29 Nov 2024 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732891471; cv=none; b=j4HyC1Ula0VSGrgjxy/zugZ/aGnflb6csQYxGdPvxYLnR0st6ACL8FOL22+lzvNbsEHnbRuEI+SvkpmxgkP9/AtJicYTSiW16TTGUMTw4Huo0aI4SM25Eyy+mB2VLXqz0StbRGRje7q135vGe55A3l5J8t9oGaO/HtbpWbkeqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732891471; c=relaxed/simple;
	bh=m2lGAd8xK+lQG1rO7Xg3F66oNsglHKIHJM69OFj9ruA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ur2mL3bStUm3dZL/lGKFhqQwptKK1qy6ct6XfPI7MHd6bqSt0ux8y913fnyr5mQVw1fzbk0J+hRjolt7apQwAGeVaQZxsUZvXM97aMgmF+EefPqkIUaUc9vCEV3AVHhUchJ1Z/byUNZjQwBih97q5XKJ1qGU5CxiNW+IqsZmFpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ntMZeMVI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATCU8O6005340;
	Fri, 29 Nov 2024 14:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tsGDbxhBe2l
	nu+J0hISXvulesaihHAizrF6lf56LC7k=; b=ntMZeMVIrJluIxLG/MImdWQ4zrA
	AYLtdqHphXqTADarX05JAGFXEmsxv0X3/0TU+0P3TdvbfnCXVx5CEpBs6y/JpmWm
	4Vp11nVtkNG7/nrQV1Zvoiw1u6L0rf+uneJAsmSinj93vGjX7NqbAftbZDSdXp4u
	IbuzRCLyAtZ2kd04i+JKvsKbdSB1sv+5SiVHKaBNno/XszRA3Aq8R7HKfaYF2z4e
	7wMLFtAcPtXeKDcKpqlQ6ujIcgjd06fAJkPm254tiE8WAf/To90tQHkXYZRLxi11
	hJlR3wkNXshdJNWglPQKSO4EhjVirC0o+WvW3AWtpD9b6+ewQgl4SMMYicQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 436h2mmhd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:44:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATEiEXR028785;
	Fri, 29 Nov 2024 14:44:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 43384m8ha5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:44:19 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4ATEi3GX028668;
	Fri, 29 Nov 2024 14:44:19 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ATEiIXB028817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:44:19 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 3906B240E9; Fri, 29 Nov 2024 20:14:18 +0530 (+0530)
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
Subject: [PATCH v5 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing between two subsystems
Date: Fri, 29 Nov 2024 20:13:57 +0530
Message-Id: <20241129144357.2008465-5-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: 00WwSYgGU8BoyPRopmlXDa3RI6qakwuQ
X-Proofpoint-ORIG-GUID: 00WwSYgGU8BoyPRopmlXDa3RI6qakwuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290120

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
 drivers/i2c/busses/i2c-qcom-geni.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7a22e1f46e60..ccf9933e2dad 100644
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
@@ -900,6 +911,12 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
 	} else {
 		gi2c->gpi_mode = false;
+
+		if (gi2c->se.shared_geni_se) {
+			dev_err(dev, "I2C sharing is not supported in non GSI mode\n");
+			return -EINVAL;
+		}
+
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 
 		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
@@ -981,7 +998,6 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
 	} else {
 		gi2c->suspended = 1;
 	}
-- 
2.25.1


