Return-Path: <linux-i2c+bounces-7007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B335986B72
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 05:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7B41C21559
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 03:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E27172BCC;
	Thu, 26 Sep 2024 03:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c+5vaWig"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0B158875;
	Thu, 26 Sep 2024 03:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727322213; cv=none; b=ixuwnndeAtYLdOnyKn8eniw2tsReNkMK4ShxZJgQPLHeTwpD42LKGm+4djXHCyyOATjA6MltK4Zr3qMBUw/0Mocax4LNLi+4kA4FPMSrNRVxfaRIU0R13ggdxyld+JlrbA21+71MGNs59zY4RVQoFZMnfZJifXRp2JWDGJzy+tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727322213; c=relaxed/simple;
	bh=ziaAltyUP6Uv8Cjn8kkY3y6IUbsSV9TI+PfBQwG5Jv8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lOy7S2jTKeIrtzxfoAIed/0LPJ2dYtcbTU/EOwq0nClCqKyPFIqx6SYO/e5ZIxfboNQWHeZkOumA+tfsGmvzXqWcylS8prsoalb3p4ObI6u4yBj6TFqDlZntohOhNvtNCxtscWfHl0HOHgR8JqDRnCMuUAIcQBuy8E9Nxjfe6j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c+5vaWig; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5Il3024289;
	Thu, 26 Sep 2024 03:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M8iyORpoieQKKkGuDSS3KK
	Ka6ITUXPm6ogPg7SXR1Ug=; b=c+5vaWigq+8j69liBXS7KMkSp+DxgesTj5ySIl
	QJilBcwgB6XE8XWewnNsNe0F2HjHGmb4ycpwqhd8EZFe9fF5BdkpDNLdoObaWsPT
	Q74ea5vyIE8uQWeaI9jbAmry3V7c4fEKJhrn9h2rBgGZDqoBs8Lm8T+jTlcw3HjC
	WPpbP0cFqG32w81TdEyhXHWBcXP4cHT6ZmE78OIOKg8TjqCOWybAxBQfrBklF1jZ
	s0PrgP6VG/gS4ptzbYjUGaZflSKy0dIErNNXOhKnsWBlMZiiR3HZ/4oY5ONzQg1M
	xFPWAqEsF8WUw+2tJ+XeuKWW/1VeGFDGeFxOwuPRFz87Rf1Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spwewx6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 03:43:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q3hRgk008776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 03:43:27 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 20:43:24 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andi.shyti@kernel.org>, <quic_mmanikan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial engine clock
Date: Thu, 26 Sep 2024 09:13:04 +0530
Message-ID: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: Lmy6Gsqk_xW23y_ojjDrtYsX0mox5qiL
X-Proofpoint-ORIG-GUID: Lmy6Gsqk_xW23y_ojjDrtYsX0mox5qiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260022

In existing socs, I2C serial engine is sourced from XO (19.2MHz).
Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).

The existing map table is based on 19.2MHz. This patch incorporate
the clock map table to derive the SCL clock from the 32MHz source
clock frequency.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in v2:
	- Dropped IPQ5424 from the commit title
	- Added else part to assign geni_i2c_clk_map_19p2mhz to itr
	- Dropped MHZ macro and used HZ_PER_MHZ macro
	- Expanded SE to serial engine
	- Added the reason for 32MHz clock in commit message

 drivers/i2c/busses/i2c-qcom-geni.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 212336f724a6..22f2a0d83641 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -16,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
+#include <linux/units.h>
 
 #define SE_I2C_TX_TRANS_LEN		0x26c
 #define SE_I2C_RX_TRANS_LEN		0x270
@@ -146,18 +147,30 @@ struct geni_i2c_clk_fld {
  * clk_freq_out = t / t_cycle
  * source_clock = 19.2 MHz
  */
-static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
+static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 	{KHZ(100), 7, 10, 11, 26},
 	{KHZ(400), 2,  5, 12, 24},
 	{KHZ(1000), 1, 3,  9, 18},
 };
 
+/* source_clock = 32 MHz */
+static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
+	{KHZ(100), 7, 14, 18, 40},
+	{KHZ(400), 4,  3, 11, 20},
+	{KHZ(1000), 4, 3,  6, 15},
+};
+
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	int i;
-	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
+	const struct geni_i2c_clk_fld *itr;
+
+	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
+		itr = geni_i2c_clk_map_32mhz;
+	else
+		itr = geni_i2c_clk_map_19p2mhz;
 
-	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
+	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map_19p2mhz); i++, itr++) {
 		if (itr->clk_freq_out == gi2c->clk_freq_out) {
 			gi2c->clk_fld = itr;
 			return 0;
-- 
2.34.1


