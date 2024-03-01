Return-Path: <linux-i2c+bounces-2093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFDA86E032
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 12:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40E73287B41
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 11:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7A06CBEE;
	Fri,  1 Mar 2024 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="loDoMeJm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0A6BB4E;
	Fri,  1 Mar 2024 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709292442; cv=none; b=GaC9acujgLZaZ9JOkAeNiDiC/EoDdSxV8anQ5Cgd9GhDLwMCFmriAyGDUhA8Tq4wJsdu6Q0Px7aqrnWk7qWcioxW4HTwwj5KiItgFt2rBdRwhM/2riAwhvKkFcU/iFfXaDfioTJjZelkiglIbzVgKOs/7ENR3Hvm2CEIkmDtqKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709292442; c=relaxed/simple;
	bh=3wSZMr6jXqrSrBs6PastZlK7BYh/mpxBaddDPNt8T3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FZEZjQcLQaxQJSy/Dn7WvmIq3DjqGginXdX+oc3MZonAPBH9CFGtGDGnty+fmN2ptaPN5pLnDI8usLdvKZ1Ii8d0xQIRnURbDDk6Ldd0Dq4CD/TPfjAnCuIwyA7jwUttSvzbKAiqIE9EOrEBZe3qbLquCvP+sOcaSDWA3xNgdVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=loDoMeJm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 421APdM8010584;
	Fri, 1 Mar 2024 11:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=ks+2/7qTGCYhLz4FsQtv
	6Umi+swCEt0JK/aTdDvEgO8=; b=loDoMeJmJhpYhCWYCqkx/vcZZmbSuRjE21kW
	ygdm9zA0AIEkfjAYvK9pqxStpdTBFMQurU2ShoFNW2qZ2a5IFz707i2K2zqeIMel
	tfiMELPXqtOV6G4Wx12ELnuMbjvt5s9tIdCW3iOV/yOKBl303sFlB+kiozUfCjln
	NnvwpOhttpgiYaDysGoZZm0gBHJd0eplDaQGDNmHFiqtXOA5GiCno7x3jp68FG9x
	WV1dXsMJPRCMMSBCe7CoQzoAaeqq0lS7MnkJ9eBNZKochEv7OSYLjHHgn/U/wiE1
	pWGs6LWqY33l303OPRNPc6qSmyR5U7nLUYMHuZtujrmXcVMdqg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wk9190sgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 11:27:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 421BQiOA029558;
	Fri, 1 Mar 2024 11:26:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3wf9hmcnp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 11:26:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 421BQNDr029454;
	Fri, 1 Mar 2024 11:26:43 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 421BQhXt029552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 11:26:43 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 19EAB254C8; Fri,  1 Mar 2024 16:56:42 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        andi.shyti@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
Date: Fri,  1 Mar 2024 16:56:38 +0530
Message-Id: <20240301112638.990045-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: kQrkgNdIaYRy3n-9mtAAK5BCa932TTuW
X-Proofpoint-ORIG-GUID: kQrkgNdIaYRy3n-9mtAAK5BCa932TTuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_10,2024-03-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010097

we are seeing protocol errors like NACK as transfer failure but
ideally it should report exact error like NACK, BUS_PROTO or ARB_LOST.

Hence we are adding such error support in GSI mode and reporting it
accordingly by adding respective error logs.

geni_i2c_gpi_xfer() needed to allocate heap based memory instead of
stack memory to handle and store the geni_i2c_dev handle.

Copy event status from GSI driver to the i2c device status and parse
error when callback comes from gsi driver to the i2c driver. In the
gpi.c, we need to store callback param into i2c config data structure
so that inside the i2c driver, we can check what exactly the error is
and parse it accordingly.

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/dma/qcom/gpi.c             | 12 +++++++-
 drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++-----------
 include/linux/dma/qcom-gpi-dma.h   |  4 +++
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 1c93864e0e4d..6d718916fba4 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
 
 	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	if (gchan->protocol == QCOM_GPI_I2C) {
+		struct dmaengine_desc_callback cb;
+		struct gpi_i2c_config *i2c;
+
+		dmaengine_desc_get_callback(&vd->tx, &cb);
+		i2c = cb.callback_param;
+		i2c->status = compl_event->status;
+		dmaengine_desc_callback_invoke(&cb, &result);
+	} else {
+		dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	}
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index da94df466e83..5092d10e8f47 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -484,9 +484,16 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
 {
-	struct geni_i2c_dev *gi2c = cb;
-
-	if (result->result != DMA_TRANS_NOERROR) {
+	struct gpi_i2c_config *i2c = cb;
+	struct geni_i2c_dev *gi2c = i2c->gi2c;
+
+	if (i2c->status & (BIT(NACK) << 5)) {
+		geni_i2c_err(gi2c, NACK);
+	} else if (i2c->status & (BIT(BUS_PROTO) << 5)) {
+		geni_i2c_err(gi2c, BUS_PROTO);
+	} else if (i2c->status & (BIT(ARB_LOST) << 5)) {
+		geni_i2c_err(gi2c, ARB_LOST);
+	} else if (result->result != DMA_TRANS_NOERROR) {
 		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
 		gi2c->err = -EIO;
 	} else if (result->residue) {
@@ -568,7 +575,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	}
 
 	desc->callback_result = i2c_gpi_cb_result;
-	desc->callback_param = gi2c;
+	desc->callback_param = peripheral;
 
 	dmaengine_submit(desc);
 	*buf = dma_buf;
@@ -585,33 +592,38 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int num)
 {
 	struct dma_slave_config config = {};
-	struct gpi_i2c_config peripheral = {};
+	struct gpi_i2c_config *peripheral;
 	int i, ret = 0, timeout;
 	dma_addr_t tx_addr, rx_addr;
 	void *tx_buf = NULL, *rx_buf = NULL;
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 
-	config.peripheral_config = &peripheral;
-	config.peripheral_size = sizeof(peripheral);
+	peripheral = devm_kzalloc(gi2c->se.dev, sizeof(*peripheral), GFP_KERNEL);
+	if (!peripheral)
+		return -ENOMEM;
+
+	config.peripheral_config = peripheral;
+	config.peripheral_size = sizeof(struct gpi_i2c_config);
 
-	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
-	peripheral.cycle_count = itr->t_cycle_cnt;
-	peripheral.high_count = itr->t_high_cnt;
-	peripheral.low_count = itr->t_low_cnt;
-	peripheral.clk_div = itr->clk_div;
-	peripheral.set_config = 1;
-	peripheral.multi_msg = false;
+	peripheral->gi2c = gi2c;
+	peripheral->pack_enable = I2C_PACK_TX | I2C_PACK_RX;
+	peripheral->cycle_count = itr->t_cycle_cnt;
+	peripheral->high_count = itr->t_high_cnt;
+	peripheral->low_count = itr->t_low_cnt;
+	peripheral->clk_div = itr->clk_div;
+	peripheral->set_config = 1;
+	peripheral->multi_msg = false;
 
 	for (i = 0; i < num; i++) {
 		gi2c->cur = &msgs[i];
 		gi2c->err = 0;
 		dev_dbg(gi2c->se.dev, "msg[%d].len:%d\n", i, gi2c->cur->len);
 
-		peripheral.stretch = 0;
+		peripheral->stretch = 0;
 		if (i < num - 1)
-			peripheral.stretch = 1;
+			peripheral->stretch = 1;
 
-		peripheral.addr = msgs[i].addr;
+		peripheral->addr = msgs[i].addr;
 
 		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
 				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 6680dd1a43c6..af264f769344 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -64,6 +64,8 @@ enum i2c_op {
  * @set_config: set peripheral config
  * @rx_len: receive length for buffer
  * @op: i2c cmd
+ * @status: stores gpi event status based on interrupt
+ * @gi2c: pointer to i2c device handle
  * @muli-msg: is part of multi i2c r-w msgs
  */
 struct gpi_i2c_config {
@@ -78,6 +80,8 @@ struct gpi_i2c_config {
 	u32 rx_len;
 	enum i2c_op op;
 	bool multi_msg;
+	u32 status;
+	struct geni_i2c_dev *gi2c;
 };
 
 #endif /* QCOM_GPI_DMA_H */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


