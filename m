Return-Path: <linux-i2c+bounces-7047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC24987E78
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 08:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5E85283D14
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 06:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83471865E8;
	Fri, 27 Sep 2024 06:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NozVlKm1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C50D176AA1;
	Fri, 27 Sep 2024 06:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727418705; cv=none; b=kNJ9xZh1Ojm30JiUv5Sz4r/FlGlAEMo+MIW5QTr0lMWWkzA2++4c/dfVabVt8ZtNu0eKjR8+isyE9xxwKY+An3K/170VW6LM9sp9jfPBPikJJmqZeMqXNPQDBDEhApHfjn/li5yWLOy6orBvxEpLv2hSLZ29QGGAF2p+zn9t9a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727418705; c=relaxed/simple;
	bh=t5m1ts4KMc9ermPpzmK3GJrBaOZoiQCEmfd2DDsLKRw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nKMebPBunAY+hIcDwEqGcsIYYwk+XN/Nkuv7N9vu5+vAsKmF6rTdtivZYH0XnOEc7ehxHnGvVzk7YU6WHguTCNOfk/9pcnytX6GESuW4neSUOtuSmSLtKl8eQ+5dUcU4wLKpMeNWP+EXJ3xcQPe/eW+/Y5LHNVRkFmwHtPKs0X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NozVlKm1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48QGA5mp017002;
	Fri, 27 Sep 2024 06:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L00z7e0O60Y
	gFZVx5jzYcYW7lIjzqwFE9ZJamjuzbps=; b=NozVlKm1EAx1hBF6E9zoUoB7x21
	zwaI5O3XmdQISi/a+YTgC4S8Wk7B64z2u1P59atqm+ju5vSV5z44zlyzvftyjhHp
	tjfhTAGiE42wqsfu7TH6QnpFwaDVUOdWuUOcYUAmA5H84CWq9+qIzY9wscvdyds2
	NBK8Ye2JV2+elZ2L+1FlEhI6grW8PkeFe8Re/ttST9jI+TmaEJra+dGIE5Kjk44H
	PiHq/OrgN9YmOEmqdAqiJ6BwhU4S+0hRXI+CeZ4HO16g0R3xGT4Bke1pvSvhtrNk
	jIx93r0D43txrxOPUL4rZWgqxZ4xcGnwrNW+W6q/tG6KYfS0T1nURmCglvw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc31vhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6VJ4P001845;
	Fri, 27 Sep 2024 06:31:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41sq7mnbnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48R6UGGT000896;
	Fri, 27 Sep 2024 06:31:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48R6VVU3001911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:31 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 8F5702408B; Fri, 27 Sep 2024 12:01:30 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v3 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing between two subsystems
Date: Fri, 27 Sep 2024 12:01:08 +0530
Message-Id: <20240927063108.2773304-5-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: JariQnbP7zQRv1c1fJDDlSZeMFFk3ycI
X-Proofpoint-ORIG-GUID: JariQnbP7zQRv1c1fJDDlSZeMFFk3ycI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270043

Add support to share I2C SE by two Subsystems in a mutually exclusive way.
Use "qcom,shared-se" flag in a particular i2c instance node if the usecase
requires i2c controller to be shared.

Sharing of SE(Serial engine) is possible only for GSI mode as each
subsystem(SS) can queue transfers over its own GPII Channel. For non GSI
mode, we should force disable this feature even if set by user from DT by
mistake.

I2C driver just need to mark first_msg and last_msg flag to help indicate
GPI driver to take lock and unlock TRE there by protecting from concurrent
access from other EE or Subsystem.

gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
Unlock TRE for the respective transfer operations.

Since the GPIOs are also shared between two SS, do not unconfigure them
during runtime suspend. This will allow other SS to continue to transfer
the data without any disturbance over the IO lines.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 212336f724a6..479fa8e1c33f 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
@@ -602,6 +603,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	peripheral.clk_div = itr->clk_div;
 	peripheral.set_config = 1;
 	peripheral.multi_msg = false;
+	peripheral.shared_se = gi2c->se.shared_geni_se;
 
 	for (i = 0; i < num; i++) {
 		gi2c->cur = &msgs[i];
@@ -612,6 +614,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		if (i < num - 1)
 			peripheral.stretch = 1;
 
+		peripheral.first_msg = (i == 0);
+		peripheral.last_msg = (i == num - 1);
 		peripheral.addr = msgs[i].addr;
 
 		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
@@ -631,8 +635,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		dma_async_issue_pending(gi2c->tx_c);
 
 		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-		if (!time_left)
+		if (!time_left) {
+			dev_dbg(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
+						gi2c->cur->flags, gi2c->cur->addr);
 			gi2c->err = -ETIMEDOUT;
+		}
 
 		if (gi2c->err) {
 			ret = gi2c->err;
@@ -800,6 +807,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = KHZ(100);
 	}
 
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
+		gi2c->se.shared_geni_se = true;
+		dev_dbg(&pdev->dev, "I2C is shared between subsystems\n");
+	}
+
 	if (has_acpi_companion(dev))
 		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
 
@@ -870,8 +882,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
@@ -883,6 +897,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
 	} else {
 		gi2c->gpi_mode = false;
+
+		/* Force disable shared SE case for non GSI mode */
+		gi2c->se.shared_geni_se = false;
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 
 		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
@@ -964,7 +981,6 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
 	} else {
 		gi2c->suspended = 1;
 	}
-- 
2.25.1


