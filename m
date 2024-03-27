Return-Path: <linux-i2c+bounces-2629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475AA88DB20
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 11:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74BF4B2371B
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 10:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081D84EB3B;
	Wed, 27 Mar 2024 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ANh/h3rm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2135466A;
	Wed, 27 Mar 2024 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711534719; cv=none; b=nZ7OsJa5uEg4L2aBaIcDQ42k1Bs+Gn2U2RiY9S9rFX/3PLlqk9/fv3WUVhjzypGMEyA5ttM6xt9ecfPP7QuwWNG6pkrQFaUs6Tu8l2uXk2zvNcNbG06hieM2uSSfbV6dYGD5mopaT+LpzFD7Mpahx0cO83MwHpQ/NI+0CRhtANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711534719; c=relaxed/simple;
	bh=2cwdjDWdQNwdG2AFXgvQd3AtY4rAAp1ycmhobWUGPAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hEsI8pt1JwDlrLh33TB6BGil+IttgT3zZQZj8kn5zGyt2ES6/I4X2iWKfWY6SmE8kLzrVigZaw2IjfKjZ1wFZPAhjhGfqrZlRvuw2NjwuCalixtwlnG9mh0jq3Os9HprD/lwBOIh1lQGiHH2Kmhq4F3N8Z3GKD7tPYajCGluDOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ANh/h3rm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42R8N58X018001;
	Wed, 27 Mar 2024 10:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=UPaL15+2ZEN75O8kzpmI
	I3VUsKKrhIUZqi8RNkbfcjQ=; b=ANh/h3rmVfOCKhH953+WpXwu5stxR0o6PMz1
	ZnaK2E9M12pIjOAU+RCeJBoF0l4DCcLRvpg6f9TZa4Np4cNbA1o8V2oiQcHuyCtJ
	Dlj7OprNmuUseK5PnUmpf22x2H/sE4jQY1wByKB7/hbtN6d+WqY5xX5XdQB/J5SJ
	HOITokhvqm7QAnkKqRnjR7v4v+Vyel/J9YKR6tf28LC5693alOP3res0eLKJFsVG
	7B3IlXISo99QbI7H7lrFSc5R6KO3UBUC2lUSoUCRvK8NLjJGp3ENQ4ed4OcVm/eG
	aED8cde2C0l+jbRl2XOUUMdalQUSp4+HEe3S48xAQHlh1VVLEg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4etk8dsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 10:18:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 42RAITQW006381;
	Wed, 27 Mar 2024 10:18:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3x1r5m43r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 10:18:29 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42RAITHO006375;
	Wed, 27 Mar 2024 10:18:29 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42RAISEn006374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 10:18:29 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id F1A39240CC; Wed, 27 Mar 2024 15:48:27 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org,
        andi.shyti@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1] i2c: i2c-qcom-geni: Add support to share an I2C SE from two subsystem
Date: Wed, 27 Mar 2024 15:48:25 +0530
Message-Id: <20240327101825.1142012-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: CYXoSqzouUtV1DnIGO9kvv1FeguX8pPI
X-Proofpoint-ORIG-GUID: CYXoSqzouUtV1DnIGO9kvv1FeguX8pPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_07,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxlogscore=803
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270069

Add feature to share an I2C serial engine from two subsystem(SS) so that
individual client from different subsystem can work on the same bus.

This is possible in GSI mode where driver queues the TRE with required
descriptors and ensures it executes them in a mutual exclusive way.
Add Lock TRE at the start of the transfer and Unlock TRE at the end of
the transfer protecting the DMA channel. This way not allowing other SS
to queue anything in between and disturb the data path.

Since the GPIOs are also shared for the i2c bus, do not touch GPIO
configuration while going to runtime suspend and only turn off the
clocks. This will allow other SS to continue to transfer the data.

To realize this, add below change:
1) Check if the Particular I2C requires to be shared during probe() time.
2) If shared SE add LOCK TRE inside gpi_create_i2c_tre() before first
   message.
3) If shared SE add UNLOCK TRE inside gpi_create_i2c_tre() before
   last transfer message.
4) Export function geni_se_clks_off() to call explicitly instead of
   geni_se_resources_off().

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/dma/qcom/gpi.c             | 33 +++++++++++++++++++++++++++++-
 drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++++++++++++++------
 drivers/soc/qcom/qcom-geni-se.c    |  4 +++-
 include/linux/dma/qcom-gpi-dma.h   |  6 ++++++
 include/linux/soc/qcom/geni-se.h   |  3 +++
 5 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 1c93864e0e4d..df276ccf9cbb 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2020, Linaro Limited
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -65,6 +66,12 @@
 /* DMA TRE */
 #define TRE_DMA_LEN		GENMASK(23, 0)
 
+/* Lock TRE */
+#define TRE_I2C_LOCK_WORD_3	(3 << 20 | 0 << 16 | BIT(0))
+
+/* Unlock TRE */
+#define TRE_I2C_UNLOCK_WORD_3	(3 << 20 | 1 << 16 | BIT(8))
+
 /* Register offsets from gpi-top */
 #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
 #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
@@ -522,7 +529,7 @@ struct gpii {
 	bool ieob_set;
 };
 
-#define MAX_TRE 3
+#define MAX_TRE 5
 
 struct gpi_desc {
 	struct virt_dma_desc vd;
@@ -1644,6 +1651,18 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 	struct gpi_tre *tre;
 	unsigned int i;
 
+	/* create lock tre for first tranfser */
+	if (i2c->shared_se && i2c->first_msg) {
+		tre = &desc->tre[tre_idx];
+		tre_idx++;
+
+		/* lock: chain bit set */
+		tre->dword[0] = 0;
+		tre->dword[1] = 0;
+		tre->dword[2] = 0;
+		tre->dword[3] = TRE_I2C_LOCK_WORD_3;
+	}
+
 	/* first create config tre if applicable */
 	if (i2c->set_config) {
 		tre = &desc->tre[tre_idx];
@@ -1702,6 +1721,18 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
 	}
 
+	/* Unlock tre for last transfer */
+	if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
+		tre = &desc->tre[tre_idx];
+		tre_idx++;
+
+		/* unlock tre: ieob set */
+		tre->dword[0] = 0;
+		tre->dword[1] = 0;
+		tre->dword[2] = 0;
+		tre->dword[3] = TRE_I2C_UNLOCK_WORD_3;
+	}
+
 	for (i = 0; i < tre_idx; i++)
 		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
 			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index da94df466e83..c5935c5f46e8 100644
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
 
+		peripheral.first_msg = (i == 0) ? true : false;
+		peripheral.last_msg = (i == num - 1) ? true : false;
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


