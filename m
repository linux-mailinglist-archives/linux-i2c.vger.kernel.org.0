Return-Path: <linux-i2c+bounces-7100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D185198A7A4
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 16:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FFE71C22E70
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 14:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5401922F6;
	Mon, 30 Sep 2024 14:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NS8u7rTo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B01922E3;
	Mon, 30 Sep 2024 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707666; cv=none; b=sEAn9Lev9kXJdUMe3WmolM34I30oq3ZXuNX7xDDDKnOwo3QcU8IO6ZQxYenSO2BLDaojIVmCm0vKFWacfr/DjtLPkkUFGVQlU/twOVoNYqtV6DCR66ypo5DKYsgjjR7iPWRP3WjhwOH9IbK/EXUH9DSjIFLrygllMf8I214rHNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707666; c=relaxed/simple;
	bh=7ICdLaeBJV7XmJ9jGs7OWALjtaVxkt6At4mEoM1g7OA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VaWuzFE8pd3zi7zvV0dpoWlDtXUWrIkXi0LzqiA3EOiXOUkVli71q5W2zQ80swvVk3Flze5D6NVZUIaxjD8GrxycFYT9/GfuK4l5jEMCImlscBYpCf++B9Ql/KvFafvmyaKkuaxOIOtdcnEtayyu8d8azc1Fcfa+M+ZjiMGcdDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NS8u7rTo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UBJFjG013905;
	Mon, 30 Sep 2024 14:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=clccw7WHx4ww1zLuegHgD8
	uebzO0KmHCI4GU1CtcIbQ=; b=NS8u7rToo+OFG74wmCBuI97UTE60s60zz0os1Y
	sWnlQ4jolf4s2gVyVKgVjd7HKu3l7eAJqAmq6cetRDUGa9cedHDWfjzF8SV53yPl
	umHL8WVOvsYp8Pg9KWZZgNlNIBWQYeUriOnWwWfOhuRTHmGCfYPCb9aS3DcBfraL
	jSY0sjSQUlg0JfjtRuGMOoWFOA1EFZ6q7heGIhvAPghzaadHukuGaPbCDf35TTsy
	ZNAuMw01R/2IQniHYnMB/2GLd1hGwxwnOGQspIxSDB+9qSRXVvF8RS1dCU/cW27X
	+dmKSXXp2XWIS+iXGjYnHzyN/pEfG3O+3M/PbzegVdQS1ezg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa6750ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 14:47:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UElSH3022046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 14:47:28 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Sep 2024 07:47:25 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andi.shyti@kernel.org>, <quic_mmanikan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v3 1/1] i2c: qcom-geni: Support systems with 32MHz serial engine clock
Date: Mon, 30 Sep 2024 20:17:09 +0530
Message-ID: <20240930144709.1222766-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iT_2kTwfrGXGQQHefdwIkTzIAQ-SIOJ1
X-Proofpoint-ORIG-GUID: iT_2kTwfrGXGQQHefdwIkTzIAQ-SIOJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300107

In existing socs, I2C serial engine is sourced from XO (19.2MHz).
Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).

The existing map table is based on 19.2MHz. This patch incorporates
the clock map table to derive the SCL clock from the 32MHz source
clock frequency.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in v3:
	- Updated geni_i2c_clk_map_32mhz array values
	- Added sentinel value to both 19.2MHz, 32MHz clk map arrays
	- Updated loop termination condition based on sentinel value

 drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 212336f724a6..579c01686823 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -16,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
+#include <linux/units.h>
 
 #define SE_I2C_TX_TRANS_LEN		0x26c
 #define SE_I2C_RX_TRANS_LEN		0x270
@@ -146,22 +147,36 @@ struct geni_i2c_clk_fld {
  * clk_freq_out = t / t_cycle
  * source_clock = 19.2 MHz
  */
-static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
+static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 	{KHZ(100), 7, 10, 11, 26},
 	{KHZ(400), 2,  5, 12, 24},
 	{KHZ(1000), 1, 3,  9, 18},
+	{},
+};
+
+/* source_clock = 32 MHz */
+static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
+	{KHZ(100), 8, 14, 18, 40},
+	{KHZ(400), 4,  3, 11, 20},
+	{KHZ(1000), 2, 3,  6, 15},
+	{},
 };
 
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
-	int i;
-	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
+	const struct geni_i2c_clk_fld *itr;
+
+	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
+		itr = geni_i2c_clk_map_32mhz;
+	else
+		itr = geni_i2c_clk_map_19p2mhz;
 
-	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
+	while (itr->clk_freq_out != 0) {
 		if (itr->clk_freq_out == gi2c->clk_freq_out) {
 			gi2c->clk_fld = itr;
 			return 0;
 		}
+		itr++;
 	}
 	return -EINVAL;
 }
-- 
2.34.1


