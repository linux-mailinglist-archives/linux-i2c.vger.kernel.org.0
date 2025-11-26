Return-Path: <linux-i2c+bounces-14267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 59154C8900D
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 10:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CC143529E8
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 09:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E47E31A55B;
	Wed, 26 Nov 2025 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alAHDnNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixls+7yE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37278302CDE
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150011; cv=none; b=THxZQA8oOlOf3TRxeyrumpK7U/tXl4LepA8x7865KsaZCyXV0MoDTJCE2z40s+0xtG9YuV5Eq+eZwJiUiThZJkGv4Ql3EIC4QrzYbf/9yHUqpgQDf3WCIED0umy30iexGWTM9kDtQisUXeGAb3UADAjd05Jotq9PgIZs2IMLxSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150011; c=relaxed/simple;
	bh=P+4vSBemr+XqaJS5CuSjW7s0tLIfkJf6/LU++jjhoLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNQ67BX76ClKkabYF0WmXMFFXfhwsPe4MVdYs1AKYC9GVJBfe6Us5Rrko9WeniJVpeh+eAVTOHCC4vbgmh/2HLogGmAbPeFZSmFsP8Cy/XDiCwjz7eWlaZmQz4d+9A8Zs7Maudwtgcgkstiv7ekFbsN4LToZadQrOq6GVHdWB+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alAHDnNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixls+7yE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8tlAv1522234
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKAXKIppPV+HGKkCBU59neJ6pS20d5mhwPpNkrTkzMU=; b=alAHDnNHPMWwDg8z
	x4fdf0eEq1OZqpjqMepI15qHoHSMf+YqhR0iThAlFU+A3N0yYVkNwyhKlBEy5idz
	g+Om3mCzCe5paf7hXQDdf644H5A6N/GZ6Gq4i5oQhuajqHhdy8S3gtDsgnvGOJ7/
	9J5HGsvTWhdx7+wfMNRspWEBaTkGaeVnOj56OE3ppFpyU5MWCIZaas/0uI9q3cHJ
	7lmMHWEZMykVtT76p5iPze+gNVKykGog7io37IalVOplZSKLfk64RRjwGyPNRnSP
	jzgNQzGXKpMKanGgDcQKooCsw7vf3D1c1n4++v8FNH64Ox108O1JvZ3FmbJZ1BJ0
	MQ+0uA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anxfk059u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630753cc38so10822947a12.1
        for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150008; x=1764754808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKAXKIppPV+HGKkCBU59neJ6pS20d5mhwPpNkrTkzMU=;
        b=ixls+7yEuNYEBx9sN9Wzqxa4/dsoTW9DIHsTWsu5TpfwTfHb+Q/5BuRO6Yn3jRQTDS
         0ipF3OACCYpF0devPn0aLtIQh5MW9MXYUsT5dpOP4vFzZeD4qTvw63O3wlzQErMrTlX2
         n3fGcG3xfwvXAKBzKGtfY50ch9PusyxKa2SP/GQ5FFW+7gdRpZrFUjq2335INrdzrQG7
         lpZ8dheYZi6E6zDmWTEyZEzkqKLcErmwgH3UCLI/3NOho6cSxPkbRWZe9vNfJ2WuwNdW
         4FrABY16vb+8+ncSpXbEI+TYrjRAjXwCW7bf0k3tZO2bC8iYluzSy4IeA2JrPs6/GvJf
         DbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150008; x=1764754808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XKAXKIppPV+HGKkCBU59neJ6pS20d5mhwPpNkrTkzMU=;
        b=iAODPbYtGzOBz2R7FaIFXyy3KXrZ0GqNS3TUI7qvdPpT1fAduHZ9S2ZZ5yS1cl9Tph
         lv4E65RK8XlYAU64upXw8zgMEkoydqRoJoLAeDITIUg3AogK7Xp1G0Nh5SJbbEyRtwhh
         e0H1hvpDFhLKfURFFggjLxQi+axEWgBOOYvh59rSrbOuD8YjrV/sAcgR7B9ZQPSgZtFl
         vvdB7o8GzlSf3JID93uS3A2Wbh2glC/S4n5CV2HLLfOHo5xq/ypv8EGI9WJpo2Aqrz8H
         ZWz7VIa9dFgK+b41Ri7a6/dJmNXKJCId6Qjri8SSgRb6TUTOb36vjTdRW/MBM2Rq25RF
         LEgQ==
X-Gm-Message-State: AOJu0YyvLSyst2puBdM9Ru4gpufz1zej/xKCQKmVz09uOgIvSR+sW6kz
	SJpC0F0OVdP5IClSYfRoa6eHsKBa/7GOPhPK0QY7uCYcVKdQM/lIjbYje+EptVtP84lyEN7VZ0J
	4SCBfeyjiAJ8ml2Pi8p/XsgaAndm9pWjNGwPKrSJRaH3deAr+WeAyAdp6eR/jZuM=
X-Gm-Gg: ASbGncsD8eaaa+MfnHYPpvaq4qBUJ8iGwepcn1bDwIAz5QCRDVYhv1ie4yNkbpAas9l
	Ou8pnW3nXmP6Uo9eJy9XMNyk7COOtXzM7mtxFA9cCtJjC9K4T/7POd7hnFLZNfiaLRPSE9zk3cr
	F0QUENqstR/VFI3EzQZnPcosbbsp3KHqGWxoaZRIOJZNXOj+sjeZrB1ppSxZrs7gr5WrWrsaNd3
	yzHuyvZYMAAOPIIW3mjEDqr7Zi6W5RwPvp3RQNn/3OeQiLjVln5U7I2ww7r4NUkMCuxg9ux2hkU
	HK6izvNNlTldvfvrS0vqw0GysY0eNkDirZnSsaSqSEzoz9S69yl2DiLwF+CLTrWTTKFRJo35xd0
	IQb32KKVe376D2nUWUZOhUfYSAFEgQG/SF8NCVppAJCviOp46re/B0NEfexxxlcqd
X-Received: by 2002:a05:7022:2521:b0:11b:65e:f2c with SMTP id a92af1059eb24-11c9d60ea19mr14591432c88.10.1764150007647;
        Wed, 26 Nov 2025 01:40:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH49U7C0moElexCLrZcV2e+MlUgzEqGlJSAWySjH4yEsEcXnQAS0Ww7o7oxUV9i0HPgQkXFpg==
X-Received: by 2002:a05:7022:2521:b0:11b:65e:f2c with SMTP id a92af1059eb24-11c9d60ea19mr14591417c88.10.1764150007100;
        Wed, 26 Nov 2025 01:40:07 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e784sm69150307c88.5.2025.11.26.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:40:06 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 01:38:36 -0800
Subject: [PATCH 3/7] media: qcom: camss: Add SM8750 compatible camss driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-add-support-for-camss-on-sm8750-v1-3-646fee2eb720@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
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
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: yUSBcJpwqgs1BuWI2zz1quqwxEU3gf1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfX/Y3QuV7r1Yg+
 NwMq2bMrjdsNg084R/ij14OTUJCI713/DxAK3pcyBUlGR/Kc1m7K+gJaAFav9Qby0DM9uxJDkbI
 k+mLjXYHb1LImVftTIel+xe03gzbfdhYp/LoNhe83dbEOXN1yV0z3CDoIlsreUAj/feewVoYy9H
 NO69Z1ZpTDxmgoSd8EyPmNr3LRFGzunBicwXvtR7Cn73tcruk7S3ga2KYsV2xupgQ9cyxFX/1Fr
 abb0DaKlO90eqN4u/xZs/xejoZnaRDNvsLv1dgyk05XK5oSyqn+f/f/KDDakJhqKfN5SXlIBj26
 tHlIduJRqPergeF+8UeOhTJWBtCW0zjC2cd7rXXdW1E1oUruDYa6+0CxqbTMbS8Ivl/laHRSeRR
 ed96llwHGR81HszHwsGYKDE4obX3bA==
X-Authority-Analysis: v=2.4 cv=H4LWAuYi c=1 sm=1 tr=0 ts=6926caf8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: yUSBcJpwqgs1BuWI2zz1quqwxEU3gf1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260078

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5ee43c8a9ae4..805e2fbd97dd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3870,6 +3870,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5283,6 +5297,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -5314,6 +5335,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index b1cc4825f027..f87b615ad1a9 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -91,6 +91,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


