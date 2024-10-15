Return-Path: <linux-i2c+bounces-7392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE399E8C3
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 14:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53E9AB24018
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 12:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA011F4FB1;
	Tue, 15 Oct 2024 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AK3zCtGx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E191EBA0B;
	Tue, 15 Oct 2024 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994117; cv=none; b=Lmu+O9ZOu/cK4gJBEFQuci47lzxSGdcYXuWHhs6rRuZOho5nmrtDJ1x45k/yZO+ne57PqjLauMQSSJsdmAJogUy7P0HYz5YnFW/YHjyElB8HirDklJjLzJ3Aqby9mvJale1Z2FGazolQ+30H+03LmHwsou+sfCcAdH8h+0Z49HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994117; c=relaxed/simple;
	bh=CwV2sK0pp1WyVLDW1vlXY12XTJ2+Xbe7ibdwMmAHJ68=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pc3XW+E1ueugp+UuxeGJ4xgvA3Eo8N9kI225Umw2qu6jC+UD4gdBKd4xIN0K/RvhXUFLHKfAfp2yUbLSV5VxOrM9T79V1xYwK6SROAlkaDlKxFbxt1UHrfwoLaErsp1L19gf2Qlv8Uh+qhel4aA7do+d/x/a2Ro38TJGrGQPVS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AK3zCtGx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F81YGZ007476;
	Tue, 15 Oct 2024 12:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cm3GaeCM1QlNiivJ92AjVRJE
	WR8TMLzyrFLl8F5Vwi0=; b=AK3zCtGxZDuOsfiDxmFIiq4HTRZ5XNdy1b+9sHh7
	cMQOf46waZop2PkeM2XT/H1Ye9G8Uo2zYIGUT2xIX+pn8p3LWOw8W7JP844nJgyH
	xcf38hDQhocrPl2yDQm14VJ1PMXTX0tJXMMcQWyeGUSJba3iwZv57lmp9VzT53N3
	HqzZwImiDYGHx1YbB7YrL7Ei0S8Y47rcd0aDr65d5u91zwu0DWhTp/RX65ZXd9jZ
	Gva32B8TMF6VBWNvc6VLbyBukuiEakNJ6OJB5Oqips2bBJEQaf8oWOyaMC82LaGY
	jcoCC4hA55/hMdGNYr6+PQtGi6aIV0bn8SfloQjhGpe21Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh50m13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 12:08:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FC8Rbi025944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 12:08:27 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 05:08:21 -0700
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
Subject: [PATCH v1 3/5] dmaengine: qcom: gpi: Add provision to support TRE size as the fourth argument of dma-cells property
Date: Tue, 15 Oct 2024 17:37:48 +0530
Message-ID: <20241015120750.21217-4-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F8Yq6o2FdINgvP5nTWcx35aTMAssJSks
X-Proofpoint-ORIG-GUID: F8Yq6o2FdINgvP5nTWcx35aTMAssJSks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150083

The current GPI driver hardcodes the channel TRE (Transfer Ring Element)
size to 64. For scenarios requiring high performance with multiple
messages in a transfer, use Block Event Interrupt (BEI).
This method triggers interrupt after specific message transfers and
the last message transfer, effectively reducing the number of interrupts.
For multiple transfers utilizing BEI, a channel TRE size of 64 is
insufficient and may lead to transfer failures, indicated by errors
related to unavailable memory space.

Added provision to modify the channel TRE size via the device tree.
The Default channel TRE size is set to 64, but this value can update
in the device tree which will then be parsed by the GPI driver.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---
 drivers/dma/qcom/gpi.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 52a7c8f2498f..3c89b4a88ac1 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -234,7 +234,7 @@ enum msm_gpi_tce_code {
 #define GPI_RX_CHAN		(1)
 #define STATE_IGNORE		(U32_MAX)
 #define EV_FACTOR		(2)
-#define REQ_OF_DMA_ARGS		(5) /* # of arguments required from client */
+#define REQ_OF_DMA_ARGS		(3) /* # of arguments required from client */
 #define CHAN_TRES		64
 
 struct __packed xfer_compl_event {
@@ -481,6 +481,7 @@ struct gchan {
 	u32 chid;
 	u32 seid;
 	u32 protocol;
+	u32 num_chan_tres;
 	struct gpii *gpii;
 	enum gpi_ch_state ch_state;
 	enum gpi_pm_state pm_state;
@@ -1903,8 +1904,8 @@ static int gpi_ch_init(struct gchan *gchan)
 	}
 
 	/* allocate memory for event ring */
-	elements = CHAN_TRES << ev_factor;
-	ret = gpi_alloc_ring(&gpii->ev_ring, elements,
+	elements = max(gpii->gchan[0].num_chan_tres, gpii->gchan[1].num_chan_tres);
+	ret = gpi_alloc_ring(&gpii->ev_ring, elements << ev_factor,
 			     sizeof(union gpi_event), gpii);
 	if (ret)
 		goto exit_gpi_init;
@@ -2042,7 +2043,7 @@ static int gpi_alloc_chan_resources(struct dma_chan *chan)
 	mutex_lock(&gpii->ctrl_lock);
 
 	/* allocate memory for transfer ring */
-	ret = gpi_alloc_ring(&gchan->ch_ring, CHAN_TRES,
+	ret = gpi_alloc_ring(&gchan->ch_ring, gchan->num_chan_tres,
 			     sizeof(struct gpi_tre), gpii);
 	if (ret)
 		goto xfer_alloc_err;
@@ -2107,9 +2108,9 @@ static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
 	int gpii;
 	struct gchan *gchan;
 
-	if (args->args_count < 3) {
-		dev_err(gpi_dev->dev, "gpii require minimum 2 args, client passed:%d args\n",
-			args->args_count);
+	if (args->args_count < REQ_OF_DMA_ARGS) {
+		dev_err(gpi_dev->dev, "gpii require minimum %d args, client passed:%d args\n",
+			REQ_OF_DMA_ARGS, args->args_count);
 		return NULL;
 	}
 
@@ -2138,6 +2139,16 @@ static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
 	gchan->seid = seid;
 	gchan->protocol = args->args[2];
 
+	/*
+	 * If the channel tre size entry is present in device tree and
+	 * channel tre size is greater than 64 then parse the value from
+	 * the device tree, otherwise use the default value, which is 64.
+	 */
+	if (args->args_count > REQ_OF_DMA_ARGS && args->args[3] > CHAN_TRES)
+		gchan->num_chan_tres = args->args[3];
+	else
+		gchan->num_chan_tres = CHAN_TRES;
+
 	return dma_get_slave_channel(&gchan->vc.chan);
 }
 
-- 
2.17.1


