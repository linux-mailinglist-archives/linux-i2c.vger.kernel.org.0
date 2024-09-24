Return-Path: <linux-i2c+bounces-6949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5410983D58
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 08:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EFF51F23EF3
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 06:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34075A79B;
	Tue, 24 Sep 2024 06:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VOU1qraA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE471B85FA;
	Tue, 24 Sep 2024 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727160648; cv=none; b=sQ7ZB43ZK2TnbRSl+v/lvyzNudYzckHs2IOA4qDo/SqBo+bxlHp2OJmU95zqNiaXYZampqEcXz42WgSu2dTkqPRdPvv2makDaSdmuoYMMgSR+GGufIjRNu8d2p7hqQwYSU/9lA0ihKMaCQ81HC4Wogp5AI3VUL/MnhDbwAPDXSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727160648; c=relaxed/simple;
	bh=tWofrc5xVHCQ/I19ABq8XnJLeDIn0tc0/92bJU+yU5s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MfUtlnY3arnCLgjURwhO6vZ37SGKVRXuCuMQcMcaqjxY32zZ5ORKS3IBc/KJv2QBUJZMPJ3smAbRRdq8MQCeKrQMD0jI80VSNKSi0+a+yNfu2k6kU7SHLVrsUZLRiMHXMVAHhJKpA/AG9MqrJmi/0TveA+H+iaJ2yqzuT9keQ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VOU1qraA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NJY5eo032019;
	Tue, 24 Sep 2024 06:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jy8n0AXAXsvpmfm4lUag73
	aDe0oaTe2SqKumv3ksNH0=; b=VOU1qraAM+ATKV/MgOgwbE5x1EUnzZXudhtYaL
	ynbLiNl8BoYoD7SRus3Erd4nUyNqHtkdpPp/ooRlWGEseZcnFZ4/+0+fD9iN+yh2
	zYa02Ljxb2dS6UA8VtOOhyGRxyNH3qnq0N1N72sYIwNjwNPV596m3jmWjJOXnq/S
	9GzrnZz2O75upr6ysPwA5uZNbrED35AoMhtEX+xxU4wBAS8JSDL0bk8iUbx7J3D3
	tGDjEWJtLGhEQS3Fg37UutZ2nrb012Ts/0RWHAlgbzCqoyA0zRPQHJHdNfX5KDIK
	ppp+6TWS+UujkdFp3DuLCp0gO+2QVxXL2+BrPsCLMAs1355g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn3s7a3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 06:50:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O6oh7X020917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 06:50:43 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 23:50:40 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andi.shyti@kernel.org>, <quic_mmanikan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 1/1] i2c: qcom-geni: add 32MHz I2C SE clock support for IPQ5424
Date: Tue, 24 Sep 2024 12:20:20 +0530
Message-ID: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 75rfzgEOEziYocWEoaNdA-pGPmIhLAlA
X-Proofpoint-ORIG-GUID: 75rfzgEOEziYocWEoaNdA-pGPmIhLAlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240046

The IPQ5424 I2C SE clock operates at a frequency of 32MHz. Since the
existing map table is based on 19.2MHz, this patch incorporate the
clock map table to derive the SCL clock from the 32MHz SE clock.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 212336f724a6..bbd9ecf09f4b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -71,6 +71,7 @@ enum geni_i2c_err_code {
 
 #define I2C_AUTO_SUSPEND_DELAY	250
 #define KHZ(freq)		(1000 * freq)
+#define MHZ(freq)		(1000000 * freq)
 #define PACKING_BYTES_PW	4
 
 #define ABORT_TIMEOUT		HZ
@@ -152,11 +153,21 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
 	{KHZ(1000), 1, 3,  9, 18},
 };
 
+/* source_clock = 32 MHz */
+static const struct geni_i2c_clk_fld geni_i2c_clk_map_32M[] = {
+	{KHZ(100), 7, 14, 18, 40},
+	{KHZ(400), 4,  3, 11, 20},
+	{KHZ(1000), 4, 3,  6, 15},
+};
+
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	int i;
 	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
 
+	if (clk_get_rate(gi2c->se.clk) == MHZ(32))
+		itr = geni_i2c_clk_map_32M;
+
 	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
 		if (itr->clk_freq_out == gi2c->clk_freq_out) {
 			gi2c->clk_fld = itr;
-- 
2.34.1


