Return-Path: <linux-i2c+bounces-13494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D1BBDC38D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 04:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B48B1922CE8
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 02:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2836B30C61D;
	Wed, 15 Oct 2025 02:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0Lo8gil"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31B7299944
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496983; cv=none; b=UHozQ631MU21ys5+4aaao/If5vn2SBkuqBe4xJLZ66t0/Bjt19wZ67dNleGy+qDMOBIw0Lj5DqUdbhvQLwdDlEwBJM4bdGsC5pi1MMv3jaOr5d15MMJdCZkUSAOvGj45CEAFdL9VIpE394Mvt2pLbG6JxbQnacsu9jz7Atvu5go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496983; c=relaxed/simple;
	bh=rR6/8g9HpS0WjNNfiScilIsYrlz4c5/yKVO/1c2K5Rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WoMX2y5U9tMPdiVsVA1M0P3i89gUL+WOZRlkYnLGfU81ZXV2fSzIQfcbydFBh1uEIT+WlxS+w5Z5j/AKHEQT9xOmXneGAZXu10NbyHpc9bNOu1OAJmjjsYBTZyUi9881QjMOY2XtS2z3Gb7PrURCC5FZjCgGugh4j/n3g9V/bqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0Lo8gil; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sLAp003609
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgjToRlAFCLqOwSb7emxbEIZZEXm4uhTqmsunIze4Ws=; b=F0Lo8gilQt9Tn0gh
	MQMnpkBxIB8OryS5IIddPb0tk3zT2fDescYryboxL/0wWs2r3v7LCIIMWM67Zcye
	pauYmGG35ZHC9pHzJUx4J8LrxHNFB2UGADhWfjaCZUdnSeS2ntXJvh11bJ8JqS/Q
	Z41KUIwl5lMQ/AgoVBmcTHJ34d1GrcfKSPD7xKAc7lGy6GKEojL54Uy01pKOdOqf
	ErxqM1btf712DMxPOLdEVMFck/cUoMbqBgli5+QjuuLm4GOQcPEwxP1ttKDHcXod
	vU/6LsjVGNqkKtXyDWLDvhOUQzHL23e4Gol9qO6I9UGInpCPz8ClQipH7sNSkN6O
	cSTUGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8hcjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:56:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28e8d1d9b13so103016965ad.0
        for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 19:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496979; x=1761101779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgjToRlAFCLqOwSb7emxbEIZZEXm4uhTqmsunIze4Ws=;
        b=JnWNKy50xV6T7Q/0wHWS1bAyrgGYvzt3bWz6eyApMRiQCW8VPoI4U+BEXvak/QsDd0
         ABNu2dgMegNVqPE2zyzJ3GPm2WaATDv9N6KNWSQdBeb6GDX4l32kKtQyjbH66wu3SYvu
         rmDjltebmeRl2uTSG9PLXu+sR6mCLmHJtN9qlAestSyjBeKkCihz6m57PGCLkqXKExKP
         JCbqiN6vakF9SpPhTBNPXTrNGpRTAIXK3Df3+VmmeX3p9r6ukq2lCKUfwUaEzlvHEanN
         y08jo+UypktAgmgJkjBjISkjCBDqinP6vDx8aGRiGS6kbA558cMoDO0Lf97TChxyz5xr
         Kc2w==
X-Gm-Message-State: AOJu0YyLI2f3BcahHQ5QeYEmSugMamxQShZ4frzDqNWBoCsnhIAQ1BCp
	dqBjw2YEldrkJ4K9s8gf+iUTxJAgoOkOKfbJ7QoZRLsylShhKkvcDpmLucAZQlIhm+LuiNxwo+n
	vxBqwYgt4MJeYztXl+AYyfttIdKnniHstPJbBwX3um2qXnLzytBkaA/wfZp6wCbY=
X-Gm-Gg: ASbGncvSTC2B9sT8N2hXwuA6PGB6wYh+BOKu2W2wIMejkNYc/gFsU6BopX3V/zwJg5U
	Y4qfjeiMVbC8brE/RJeFovVIwu0N0XbtemMiFAvQIm069viVa53KQGlcugwPllxelNfB2WnTasK
	eWo39GC52Z6RXNwlI+MGuWVGVb5Tnvm5Eppeum5eTLyTPSB8VNvbp4hp+r1S5yx4prB3kok7K98
	nnkcty40ScfzkrJLuVgT8JHqm2XEstw0pocZjfNvwdpf0MHxU6b0nKmuoxk7QBxHLDdSrNLg9EQ
	TEucS1FT1bqI+s3TFtyIIAeIM9I2+JkSe/AYjcMfKapQKp8Miaxs0jPB/FMJwRMyeFv3542tfNT
	YHe2qDKUXx00Pz0xFV+M=
X-Received: by 2002:a17:902:d584:b0:269:6e73:b90a with SMTP id d9443c01a7336-290272aeebemr351370855ad.15.1760496979286;
        Tue, 14 Oct 2025 19:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0wD/t8NYX0XxivHtewIN2wQLEwA52QjaUl5YXrgjbud9zmuMZOs7Cm0SSD1cYvMG8t8VMPA==
X-Received: by 2002:a17:902:d584:b0:269:6e73:b90a with SMTP id d9443c01a7336-290272aeebemr351370645ad.15.1760496978814;
        Tue, 14 Oct 2025 19:56:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54d2sm179122855ad.12.2025.10.14.19.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:56:18 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:56:03 -0700
Subject: [PATCH v2 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-support-for-camss-on-kaanapali-v2-3-f5745ba2dff9@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: sIwtlLI9Qdc7NaeeASOyvSPWY47cZQj_
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef0d54 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX/75yuv7w66mH
 N9sX+2q1POPUl8hyqi+PYonpKGzi708NWuUIOwWjqZXaQr6Hrxekde57r4ZxxHJ2vz9g1rQvs4X
 rpiTZh4yUOfS/qybZ+yXcDu2o84EhT+o3PRFV8/9hWd7TFkFHmU4m+vQH5QZP0Z3VmqeelVUIn0
 K/xtkRcYM2p1DZF0FIc1veH3azEKadavmgdeqodyOhUcc3cYDGp8b2m5K/ZUqqvbspO2Iv2RmPG
 g1xrA3AQFLCOBpDZcLsUoxDl9QWfNfvBj2NmwCwKAUgavAqSmSNo5wohR7WQGrC4jteXZAL6svu
 qmZBbdK4POHeW7CWbL+IPYaWIdM6wBhglV9lpfYnYxQlnosl6Uclh35w8eyDsBDteopCHeg0BSN
 5u7GbPu7yvx5E4DAiq4VaUF8mLo9UQ==
X-Proofpoint-ORIG-GUID: sIwtlLI9Qdc7NaeeASOyvSPWY47cZQj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

Add support for kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..4a5caf54c116 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 925857,
+		.icc_bw_tbl.peak = 925857,
+	},
+	{
+		.name = "hf_0_mnoc",
+		.icc_bw_tbl.avg = 925857,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -4291,6 +4305,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -4467,6 +4488,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 901f84efaf7d..876cd2a64cbe 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -90,6 +90,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


