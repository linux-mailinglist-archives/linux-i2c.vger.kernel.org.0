Return-Path: <linux-i2c+bounces-13135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A65B9CC91
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 500411BC450D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 00:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3F0146593;
	Thu, 25 Sep 2025 00:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfZv7oay"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0261397
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 00:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758585; cv=none; b=CN3vpoqTNj0AGGG0WXSKCtl1VVw65NaorAQNKg/v3dMhQq3Qq/xcZ57hpDYAMwBxZsy7IgfiKZdh0Zg7nPQIJW3Otzzp5vO94G1shyuuWsN8zKtdq3HVL+nJu60PghcPBP95Evdl+m39GiUZDptMiItn511HcjQQVLlIiBsrHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758585; c=relaxed/simple;
	bh=RpsDt6AfmyJar6HaUrbvvM9UHQECfIpfv9kFh5VPSdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDU8eGp4EYayY0awufp/PLkH5hTLqjYTv+msZ4Km6YQTpfAGL/yWArMdb5IXAvsZTUGImlLyHci+hkVQ50LQmaxcdTMeEvivYHVdPur8YT9AeSVpR/J0+ED/LcFw+PQvR9dMV0BIsBTyNFZ/EdRA044q+F5DrtXlYX+I5mDkU4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfZv7oay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODCR5C023441
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 00:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwkFrLt9CwZe3OTR8N2fT7/T3WpENDpj9uT84vDktvs=; b=mfZv7oayTPWKte5b
	DUFEWdNYEiNo/9Dz97qZaaHLZeHx6Wv3Jvzt9IGW+iWK9BmDm+AZseG0/TI0HJPM
	hEgxThrxj3BkZp8qtqEDIWF/QNn2H8HmA1W3tallSFix9TEO8vuihcjccnRDUxFL
	qDsi4M3wwthPIamsh0l42jlnT5vxVc4ipDdTlMjE92ZZu1sQQ+eSuLcXUNEWAxrz
	Z0EG7TVrzGLyY3DA6vnjQCtqCcdwbJZMF0v00BGjM77vy0SS1ma6JrDZfbx/eS2V
	WUm+xHvP9dDQo8S3LuhcAyX11xrYLtHTyTfHdOcqykn0FckYHhEt7D9C0FGZdPRC
	fmWlRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadntc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 00:03:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581953b8so3102275ad.2
        for <linux-i2c@vger.kernel.org>; Wed, 24 Sep 2025 17:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758581; x=1759363381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwkFrLt9CwZe3OTR8N2fT7/T3WpENDpj9uT84vDktvs=;
        b=CaOwbQtJmWozOoYyCedFF3Ecpkyh2AQF74jyZOk8H5UMEFn2+rzA2qZqa70rM34/jW
         NMw63mTUjdT7UdoswwqVx9gTWHWB61v6aLXmdnq1rpZrPukkf1Fp8U9I/XXqDioI5qEJ
         x2hF88M6S/3ytlFH4zK+HBWf5NWyeiOsH8eIbR37z9zuuqfbOA+g/UOGaYCNtQeGjd5Z
         nBVx/wGW6G+IaTjhBmsafPxCHjPqOh9OPGktBFN8vq21B0UmiK5stAInUt85PEVTm+hy
         NbRLvnEsJT8Y69BCreZfsC3k9NpG9M3fQ5FdXRR8Ew6m2dKSkZa6wO7cz99B7PMsvLyT
         4rnQ==
X-Gm-Message-State: AOJu0YzHFzkkoFoZ4YvQ+438AdovLq+xB2Ulp7va7IhFO3cFH6zPoHb1
	dg7KG7/4xWLHK/RczyYN3eoVYUCNyZh8NluM2Ko77caeFg/mT6ByFWm6GsBJdY3fi6V/2Ye7ArW
	9jwcMmg8c2ZbcpDtrC3QNg1+mg9RLbTrj0anwj+SZeyM3gmxOCWOEVatCRuB21es=
X-Gm-Gg: ASbGncvfP/6MpWRQ0yzeY5vOxvf2Yw5orXzBgqLCD5nsIfk+XzSAsYwOsZZMau3CnPV
	oHOrqkACt275WH8SrgNkxFigPH6dDZgNUhitpfocAmwINqJAP/AhvvJSegVfeXnIxRJ5DsDNBzM
	ijyv5WdE+YNP8PQvV6EQS2tr3DfADED7GXjWd4dJXyPtOL1+zetJgSYoPNVfmObxc2U8riOTUff
	x962CsqxGm8ImPteuz0uaioVYRppo3BNmCW4jaTw3suxg4GkrQbv01b7ERAszcLMLpuvtzBE0ur
	U9I0h5/PIVzFML6pxOmXa9cIykNjfYbldWhW6Gb0VFtmF/CHMKcGcA8U07s9/+fsotKTmwoqFKl
	lPqFG2nyX2l8jL8o=
X-Received: by 2002:a17:902:cec8:b0:264:5c06:4d7b with SMTP id d9443c01a7336-27ed4aab67dmr13116275ad.32.1758758581100;
        Wed, 24 Sep 2025 17:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg4OYy/wcHEm80h3cy0Kv7xZ4NhAqx6tS9+1F1Vhla9mXFmSnekp486y3cB9xDJ1tVDQQr9Q==
X-Received: by 2002:a17:902:cec8:b0:264:5c06:4d7b with SMTP id d9443c01a7336-27ed4aab67dmr13115885ad.32.1758758580513;
        Wed, 24 Sep 2025 17:03:00 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6715f0esm4807215ad.52.2025.09.24.17.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:03:00 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:02:50 -0700
Subject: [PATCH 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-cam-v1-3-b72d6deea054@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758574; l=2494;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Kdys2jJmwooCgeMAOsC7UrGVCJ/d9/5ByqD43NxfiGM=;
 b=lI1OzmIm+8NBUdhLMPuCT+AEpT0VAUkp8LHFgV9xz+9+b52RE+rDo/IHJjYNBOenj//hfFqKp
 a5dpvmn0TQ2CkCmljxrEQd+wCDNtdG0OUxNPKOQkip3veQrAXFMKdnx
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 1AvIQqDn0YNjA8wdGLmuH32qzKno4xCR
X-Proofpoint-ORIG-GUID: 1AvIQqDn0YNjA8wdGLmuH32qzKno4xCR
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d486b6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX86nvAWkH6g83
 uOD/jDlMjk0qE8T8eJVfFunislDAy8xAKkdcE6QVX37P23UW0YIRmd0gr2c4vefZJLrL53EgEVT
 OBzipyFn7V7T2lhwuKiTVXIxm5gDHVyupY/4OpZYbW7qHI6BYWYjP1cYvNzqgc2So7sit7rE0+5
 ZPf4j3TpQER0BAJO8mlP0uESrq+74EeL1i4dhvcM4LU3mbSBtCXbsdmj4n4thppjOQ4D2QOaup/
 IPJLWYR7x6TB2wLnx+ovLgBO5q7oaiPzhbQ7ORNtP2B06ZFoZ1tvLivREKI2fzyUa4I9T7znzvE
 +/fOoSrZvfObt/e2J/JS6kIFKpAOsoayJRbyvDemjU99SLWdDfWQF8FmbhPzr/hlW1QSaU9EbkE
 nSe+ELc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
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
index a70fbc78ccc3..9fc9e04b9dab 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -89,6 +89,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.25.1


