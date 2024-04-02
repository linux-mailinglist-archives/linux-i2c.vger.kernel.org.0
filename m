Return-Path: <linux-i2c+bounces-2704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C7894B4C
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 08:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D618BB22AAA
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 06:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527921B5A0;
	Tue,  2 Apr 2024 06:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NFL9ydoa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCA7182BD;
	Tue,  2 Apr 2024 06:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712038905; cv=none; b=KwnvhNRnYyBdy2xrU0n4QvQbY8uqvgVk7sB0iURmTuQBJOlse9GgzlfJdKo3Nl6dhqBriEk9GbEznpplpTkeE1g5cBDQNzvm6IPam8xrHTMiET5r8AXKnAncQRFTa3l5kUKbeIR90Y2Er7HR01cmSthzli2XLKlb8MOEAEC5B1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712038905; c=relaxed/simple;
	bh=mRZWwTUnefPwVr6kgskXNOs3H2EcvZobDxeInjclxC8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u5r9vefY6FlZyx4C4fw4yuDB2y8gLPv8AbTbMkIV2f0Y1JY6rliqxjUMb5nde+I/OIRphu7tCfzYqDoZNkXdNqc7YGd9OMoERiBQDLTC5YMBpmqkQ8dMw1XzZ/+J8gIc8by2CXtPhW1SWI2VTAZjwaFFHOBd+XBWowZBKf2N0tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NFL9ydoa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4325PdbO028066;
	Tue, 2 Apr 2024 06:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=/+1f+75ym5lr/23i7Ex3
	zI4bWC6Au1tzEOaaj98blyA=; b=NFL9ydoad2tJlFkPBvuOq2Vr0bwMtAJQWabj
	/GkVwtOwipM+O4taGqkGmKfGXYGvV+mXyQr/a5XLGr9haq8FkOLqhkkRdZeujTPI
	moU+FIMJ9FxfcOT9ZEzELB8bMk1zrOKDGj0JpMDS0V2KlG4Hcf9/zHkZ45sjwoKj
	xTUgPZl3fF7xBu702GdZkaL/jMySfCBRehoiS1YR13tZbs8EWySJTJeZSJ4SnPOP
	djQ1PPBFLsTkeizxnb/dcs9zSnJYraoHy801ZUlZWsHW4eOfbIS50/Ad/WR7gKfU
	KxAMN2g7mo0dyfFjUTrI5s4xb7BIbsBcERir9UGCoKr+Wn6ZQQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x80w5hawm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 06:21:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4326LZfD001980;
	Tue, 2 Apr 2024 06:21:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3x6btm4hrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 06:21:35 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4326LZoY001975;
	Tue, 2 Apr 2024 06:21:35 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4326LYpD001974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 06:21:35 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id D5348240F0; Tue,  2 Apr 2024 11:51:33 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org
Cc: quic_vdadhani@quicinc.com, Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2] i2c: i2c-qcom-geni: Add support to share an I2C SE from two subsystem
Date: Tue,  2 Apr 2024 11:51:31 +0530
Message-Id: <20240402062131.9836-1-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-GUID: AnpG9WzQgGF5zV3Zo6Q1Qhv0UhwltM7V
X-Proofpoint-ORIG-GUID: AnpG9WzQgGF5zV3Zo6Q1Qhv0UhwltM7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_02,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020043

Add feature to share an I2C serial engine between two subsystems(SS) so
that individual clients from different subsystems can access the same bus.
For example single i2c slave device can be accessed by Client driver from
APPS OR modem subsystem image. Same way we can have slave being accessed
between APPS and TZ subsystems.

This is possible in GSI mode where driver queues the TREs with required
descriptors and ensures to execute TREs in an mutually exclusive way.
Issue a "Lock TRE" command at the start of the transfer and an "Unlock TRE"
command at the end of the transfer. This prevents other subsystems from
concurrently performing DMA transfers and avoids disturbance to data path.
Change MAX_TRE macro to 5 from 3 because of these two additional TREs.

Since the GPIOs are also shared for the i2c bus, do not touch GPIO
configuration while going to runtime suspend and only turn off the
clocks. This will allow other SS to continue to transfer the data.

This feature needs to be controlled by DTSI flag to make it flexible
based on the usecase, hence during probe check the same from i2c driver.

Export function geni_se_clks_off() to call explicitly instead of
geni_se_resources_off() to not modify TLMM configuration as other SS might
perform the transfer while APPS SS can go to sleep.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
v1 -> v2:
- Addressed review comments.
- Removed unwanted comments from the gpi_create_i2c_tre().
- Enhanced logic by removing ternary assignment in i2c-qcom-geni.c.
- Confirmed dt-bindings change is required too in separate patch.
- Formed LOCK_TRE and UNLOCK_TRE by using BIT fields similar to other TREs.
---
 drivers/dma/qcom/gpi.c             | 37 +++++++++++++++++++++++++++++-
 drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++++++++++++-----
 drivers/soc/qcom/qcom-geni-se.c    |  4 +++-
 include/linux/dma/qcom-gpi-dma.h   |  6 +++++
 include/linux/soc/qcom/geni-se.h   |  3 +++
 5 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 1c93864e0e4d..0997210df6b1 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2020, Linaro Limited
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -65,6 +66,14 @@
 /* DMA TRE */
 #define TRE_DMA_LEN		GENMASK(23, 0)
 
+/* Lock TRE */
+#define TRE_I2C_LOCK		BIT(0)
+#define TRE_MINOR_TYPE		GENMASK(19, 16)
+#define TRE_MAJOR_TYPE		GENMASK(23, 20)
+
+/* Unlock TRE */
+#define TRE_I2C_UNLOCK		BIT(8)
+
 /* Register offsets from gpi-top */
 #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
 #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
@@ -522,7 +531,7 @@ struct gpii {
 	bool ieob_set;
 };
 
-#define MAX_TRE 3
+#define MAX_TRE 5
 
 struct gpi_desc {
 	struct virt_dma_desc vd;
@@ -1644,6 +1653,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 	struct gpi_tre *tre;
 	unsigned int i;
 
+	/* create lock tre for first tranfser */
+	if (i2c->shared_se && i2c->first_msg) {
+		tre = &desc->tre[tre_idx];
+		tre_idx++;
+
+		tre->dword[0] = 0;
+		tre->dword[1] = 0;
+		tre->dword[2] = 0;
+		tre->dword[3] = u32_encode_bits(1, TRE_I2C_LOCK);
+		tre->dword[3] |= u32_encode_bits(0, TRE_MINOR_TYPE);
+		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
+	}
+
 	/* first create config tre if applicable */
 	if (i2c->set_config) {
 		tre = &desc->tre[tre_idx];
@@ -1702,6 +1724,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
 	}
 
+	/* Unlock tre for last transfer */
+	if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
+		tre = &desc->tre[tre_idx];
+		tre_idx++;
+
+		tre->dword[0] = 0;
+		tre->dword[1] = 0;
+		tre->dword[2] = 0;
+		tre->dword[3] = u32_encode_bits(1, TRE_I2C_UNLOCK);
+		tre->dword[3] |= u32_encode_bits(1, TRE_MINOR_TYPE);
+		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
+	}
+
 	for (i = 0; i < tre_idx; i++)
 		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
 			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index da94df466e83..fbfcd375c06f 100644
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
@@ -601,6 +603,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	peripheral.clk_div = itr->clk_div;
 	peripheral.set_config = 1;
 	peripheral.multi_msg = false;
+	peripheral.shared_se = gi2c->is_shared;
 
 	for (i = 0; i < num; i++) {
 		gi2c->cur = &msgs[i];
@@ -611,6 +614,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		if (i < num - 1)
 			peripheral.stretch = 1;
 
+		peripheral.first_msg = (i == 0);
+		peripheral.last_msg = (i == num - 1);
 		peripheral.addr = msgs[i].addr;
 
 		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
@@ -802,6 +807,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = KHZ(100);
 	}
 
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
+		gi2c->is_shared = true;
+		dev_info(&pdev->dev, "Multi-EE usecase with shared SE\n");
+	}
+
 	if (has_acpi_companion(dev))
 		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
 
@@ -964,14 +974,16 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
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
 
diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 2e8f24d5da80..20166c8fc919 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
@@ -482,13 +483,14 @@ void geni_se_config_packing(struct geni_se *se, int bpw, int pack_words,
 }
 EXPORT_SYMBOL_GPL(geni_se_config_packing);
 
-static void geni_se_clks_off(struct geni_se *se)
+void geni_se_clks_off(struct geni_se *se)
 {
 	struct geni_wrapper *wrapper = se->wrapper;
 
 	clk_disable_unprepare(se->clk);
 	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
 }
+EXPORT_SYMBOL_GPL(geni_se_clks_off);
 
 /**
  * geni_se_resources_off() - Turn off resources associated with the serial
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 6680dd1a43c6..8589c711afae 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -65,6 +65,9 @@ enum i2c_op {
  * @rx_len: receive length for buffer
  * @op: i2c cmd
  * @muli-msg: is part of multi i2c r-w msgs
+ * @shared_se: bus is shared between subsystems
+ * @bool first_msg: use it for tracking multimessage xfer
+ * @bool last_msg: use it for tracking multimessage xfer
  */
 struct gpi_i2c_config {
 	u8 set_config;
@@ -78,6 +81,9 @@ struct gpi_i2c_config {
 	u32 rx_len;
 	enum i2c_op op;
 	bool multi_msg;
+	bool shared_se;
+	bool first_msg;
+	bool last_msg;
 };
 
 #endif /* QCOM_GPI_DMA_H */
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 0f038a1a0330..caf2c0c4505b 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _LINUX_QCOM_GENI_SE
@@ -494,6 +495,8 @@ int geni_se_resources_off(struct geni_se *se);
 
 int geni_se_resources_on(struct geni_se *se);
 
+void geni_se_clks_off(struct geni_se *se);
+
 int geni_se_clk_tbl_get(struct geni_se *se, unsigned long **tbl);
 
 int geni_se_clk_freq_match(struct geni_se *se, unsigned long req_freq,
-- 
2.25.1


