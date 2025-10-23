Return-Path: <linux-i2c+bounces-13737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 463EFC002AF
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 11:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91847188BEB1
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 09:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD222FABFA;
	Thu, 23 Oct 2025 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGS8CuAo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E772FD69B
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210890; cv=none; b=F0EXQRYDfJHkthyN7D7JXC3VcVgbTbmWXDJ9LmPHXRuWDBlXgRix8ONfJcpwQejYoR4IDUUgZqJGNHJe5JudhfVwwba+51ZYZa9PDQANrIjaADLbA2uB14fVVXJHhxk3r8PEP7+C+VWN85NnAdktc3WJm3cLzgsOl7ELX6NLRLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210890; c=relaxed/simple;
	bh=p8ySBPeMhhgOjthdspe7wrGny1MNgnBjciz9CWlWZqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRyDjxDw2KCoXwoBwr54JziyYsiWQzibyVFEYjfz/y2l27pl5ytgls8Famq6A/SijRTyMvGi6Y2UWdioeGOEcYn2vmwX0yza9YdJPt9HkgDpf5REUg4gz+asYfPQVCjsJaplt5eSKdep46C7XgKtcjKcrCSzQfh9ye45DF1SOpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGS8CuAo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7JQsG009131
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGA6jyIhggMQN7nzJCboVgsPOrhbc0c0lh6rLgR6WNM=; b=hGS8CuAo7fLi9wKK
	SXrMos5CUSsVLapIEvG1Rwe5kH7FNnE48OiBk6lR0gj0qD4ykwpHc5SZm0nPMUOC
	Ce4SxL097iIdKlo7ZpKNT0LswUIfsApTIkru5wc/ChwkqqudISz2WongRXNu8IkZ
	zib+oYjDRH188ysY2S+Okx3WD/qLlQXjtDWeedJOU4/aXxCaJ4btvmtvaPd2+7Zo
	X9M8Z+TZ0Ya/5z3E6XCdqXaGXUnQ9E93NwOPwgvCfKztYroo9LUe75jFtRoJ7Pdi
	8+JKD+x4zMQa4Lhz6zVGlSiMFh/BiVqSIkHOxGqBj7z5rmGZKaoYfmUEpn1Y2QxW
	DXI6HA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j7qbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:14:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-272b7bdf41fso7444645ad.0
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 02:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210886; x=1761815686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGA6jyIhggMQN7nzJCboVgsPOrhbc0c0lh6rLgR6WNM=;
        b=US7vr+W1HuHlBQSpGjPZkXLKgL03649q5bGxODGBlgUsqY6Y1qQq1yya9bgNdKkymE
         InxNRLk/PIPCKnOu28H0TfdTgbXI0LHTrYUjayX0Or9DGc9I0Pg2hhmXZmq0XbK3Q+1d
         umDFyKfoGBh5ZEt7A8RNRJuR/I2Eu4rYOkvxwpiapGrGuxVB4R43394DkeuRXgqMCarT
         SnxNAdPepNeYfzdGcdiBkxtixrBjLPyY0UCw4flwpsKwnOatzi4RvHaxQDwJbFvwLamZ
         jZAFiRYgiU8ZY4Ec66MgPTVFsaNQ+MZJlFe6SZ1VoLiv8ClXWquQUn8gmCoAcaQGJyam
         2uwg==
X-Gm-Message-State: AOJu0YwZfukRsx0KENHamcXB3cHy9Zflr97v3kV+ZXDg5fHJNgSGgoWO
	L9oiQX+m7gwTNPnL1bsE+KpB9dgd+vPxZe1rWMmjxW7cGhgC8RGq74XAJVhch4pFHs5FGU8/zG1
	WwIKlbT/M5ksCZOzJMhhB1PS1IXP+dq0/OBy1IAHR2IdZySLqJTx8AM7H4vMKV+4=
X-Gm-Gg: ASbGncvB76jV4IkRbiM8Mqo+sXdN+7uC+jvu+NY589eAuMsxj0SfntWFpgTq7Zul9P5
	BnVPj3xTGroqiqiDpdsKZ0jF6new4X/Swhpytl1Hiz9+cTbV1yz2g7pqtL8OyAQZHYnM1o8xQkw
	QPT+avS0/8gS4xvtuLZYYOO7V3S6LyoAXzus99hrhR0S5Wc/jO6zrjhO2sA4nXGDTPkd7c/lRyf
	qmYHDuMF8/AztctqD0X4nfiuFL+d67z1inrqAMN7vxrBtxrI6YAgqvn/oXXL3f7RZWvDT014OOI
	bfmCGP0cRvqufYA/lVi+ktEKQHZQY16A/kY1zjWRr34EUlDOtKpsJMc4Fo58BtyEjzSkpyOx29h
	vsgsuU9kwp2H9epGAHucnlsiZtgMiUHR8tu7z9CXAo35CQa9nLoGc3w==
X-Received: by 2002:a17:903:2348:b0:290:c0d7:237d with SMTP id d9443c01a7336-2946e0ec1bamr20297255ad.36.1761210886108;
        Thu, 23 Oct 2025 02:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYmSv4dzjKvhhMBl2sFcfxbzFtb5/wLQ0uyVcJuavpj67hpqEsvJuFLylB5+oHXs3MbJxkBw==
X-Received: by 2002:a17:903:2348:b0:290:c0d7:237d with SMTP id d9443c01a7336-2946e0ec1bamr20296985ad.36.1761210885654;
        Thu, 23 Oct 2025 02:14:45 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e318a2sm1490081a12.33.2025.10.23.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:14:45 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 02:14:35 -0700
Subject: [PATCH v3 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-add-support-for-camss-on-kaanapali-v3-3-02abc9a107bf@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX3S6HfvJD/0u+
 yT2SozRSwqRjqU43LEYNfXlWPfpfGKks8Slt7MtY4wFfIcaUbSUvQ9c04/934gXzkfO7ArBpQT2
 DQF8JzOhETtJgNBbQdhWMZbMUlX6oRD91IMDZkHjxFFcJvrLxUe0ZLJW7Ey4fMFe+mufms8C5X9
 IOvAyVKjMJAa8An1uZ1Uv0FxMv9EUUuwa1vY6pLbC5was5RiBzK4FGlrVGbI8KK2rFp384pyocg
 zJcK7gU7m+NeHAmFgYrJD1dVY7vydqRAULsxktfU8FhnfyKjFWj8qVHSQt8OIWkOuo1+ltYyHOO
 9abazygfDcREBEIF/jLBmfdxT8i5nsJLSS2Fl0kOiDHTahhbLq7PdOu1OHsNX/rgj3R7qWfUnkB
 2mT3NUm5GKers9gHNf7gy+63QgFdyg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f9f207 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: nUiKOf1W34tnUFmzALG5Gi4F2K6ebU_F
X-Proofpoint-ORIG-GUID: nUiKOf1W34tnUFmzALG5Gi4F2K6ebU_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

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
index 2fbcd0e343aa..658d9c9183d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
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


