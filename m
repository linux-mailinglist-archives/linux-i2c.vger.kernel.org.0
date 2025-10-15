Return-Path: <linux-i2c+bounces-13489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640CBDC2F4
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 04:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C02D4FADF2
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 02:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070EE30C365;
	Wed, 15 Oct 2025 02:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjH63oWy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E9830C619
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496163; cv=none; b=E47kiG9o70ZRbmuIrX55o3Q82Teh+zikV7ade0FFKncNx7HC4PVi/9Se1c9g8eki/56AuAm2EkmFhzcuxvD0il071G1a1K9XlXXXtuduRxPkU8iTTpK1ypfqc9V58h7DagrNYDLHJZdY1u11OoX8VKbtX0COrvGu/RiF14kFffY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496163; c=relaxed/simple;
	bh=/6TPoOK2H46ODoVR5vH0U3mZt/KkWJx+/Oa6plnyqHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qQfxLupOOwcse3ZCGcJsMJzpMJsaJDlS2+ra2KJRlGFbXynC0MNyTe5k1/2v0/DZrrTNNgleIc9qsuwdjdiBUGvVO/EHe/A50CpJ+RhGbyGPiI5dASSGEslGf86UD7apaV8uy7wvmxXsTVwh1ctW+Wa7aAG6mdzw8HPkp4Epjtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjH63oWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2dM80006739
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dOCcVsAuRxmu1r6muulhHh
	87A+yiQ6uas2Eu9RO3UAg=; b=UjH63oWyXxi0phUyzS4u13zULHUEaOQm7/ETIu
	z6wekMrqatX5BiuVYg2yEF4iF68lKCd6BvJYQh3fjnbxde809CMxKg/zZR8TpsRA
	xFx9IUYsqc4hUPP1PpM+qmm7jU294SI+FUSrnK4oYVLdY7g5Ri27pQnPwN39NGkT
	BWFmfwtuRgWjtFo++HSo0nkv4slxeGESa0V2rBRJHqNkQ9tArDeraaP1EOf3d4zs
	rlC1b/0pH40t1dPuiPw+1BLWl16CBL/8Y+H0QuzZqxKz/XTho0rVguOxg7tg62mA
	gXnNLsGEq0l2a/wlEgDwtq5LFSe4/uzZ8zng3Y+AQNIGHNhA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8atrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:42:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b60992e3b27so9217178a12.3
        for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 19:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496159; x=1761100959;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOCcVsAuRxmu1r6muulhHh87A+yiQ6uas2Eu9RO3UAg=;
        b=nc9TQjp/Q0uQ6R64IyMxca7l2mIl0fDdR7Cr28hTuHO8hQSQ7D/3MZSS10ogM1gfbn
         Dec1FPJnykN9S2CAz/uyttI3IMLCluZVGZQ62dXiADKYupBFGSkEg8u+DHqhqo/VhzC5
         Qsehzatu0IdvX2MYtGicjtgpM6Ku/wdXN+kPLjKtQwEWTS5RE9DAPJgCXMqerCaeMysJ
         2vy6WeCG4CwbAwOOX4GczfIx1qnEPedIntOh5GHmaXIR3v+s/QpEXOeHYqOscibb9G/w
         tAWoWoUFUMAHzIWEFPDCeRzw5+g9eP3aR5tH64K2/1Jwv9mtM2wDAZS41bse6Rf/I2sT
         6eKg==
X-Gm-Message-State: AOJu0YxQVMWTajDwH/2AsX1AAd3iPhPvbIVa/uCr6p5GIORoBQL71CP3
	JDX3v+fQfzQ87cerlJscank01Se0oE8bPWsCg7Qc4j5yqXD3AePfahjFuUh4xaJha4mvdpRjt24
	qta+gZgXRzMroAtFaiAr0Lj3TP+a5Bma6cOHD6fi9vgiCZw2zJfhpymGQ30/8UgW02PzMgY481g
	==
X-Gm-Gg: ASbGnctHAh4rkNP1+5FsxAMzWiZ2JG3e9C8qj+31B6G2050/Rx4xd/MTD0T6dZzf3Ik
	9f5d4k9EnFC9k5uOP5FhySwOuHOzk2uTozLILrbSbfWflF7zhqVLYAnog2Xn+h0VWdvIl1z8LIQ
	8jhvUoujhE35oYefQTMH+Fnwg3M0iRmDz16XYeb0ua0kJRHnciNEPLrSQf1uFz3IefrPWeJHj3N
	HToQGl971owQwJEwvbzQFkmKIzmiI39BzrDrWEFhrrWMa+EO5J4ds5i/Qf2mPRhYt8tQDM5K+Sx
	Q4cwRgYsnlbOuL7Z4XKe8iBoOoFzL7gkPA5CDWYGR+zCdXH7Bz03q2fn1odfjztv2n//0N12slW
	hJEM4bNaGxyWmj6M8zN4=
X-Received: by 2002:a05:6a21:6d93:b0:2f5:ba02:a2a2 with SMTP id adf61e73a8af0-32da839f958mr39408106637.36.1760496159190;
        Tue, 14 Oct 2025 19:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVDUEuabDTwYSs9PWSrrtbuyqOQI43lG/pFTuKEjT/hk8Y2pr3EkOb62jBuR5TAFgHA/XjeA==
X-Received: by 2002:a05:6a21:6d93:b0:2f5:ba02:a2a2 with SMTP id adf61e73a8af0-32da839f958mr39408069637.36.1760496158707;
        Tue, 14 Oct 2025 19:42:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddcc604sm13174412a12.11.2025.10.14.19.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:42:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:42:30 -0700
Subject: [PATCH] media: qcom: camss: Use a macro to specify the initial
 buffer count
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABUK72gC/y2NSwoCMRBErzL02oYkfvEq4iLJdLQXSbSTiDDM3
 W3UVfGKR9UCjYSpwXlaQOjFjWtRsJsJ4t2XGyHPyuCM21tjHY5GmL3Eir3iTKV2VbJXMYyUSLC
 MHDRioGiONpx22wPo2kMo8fv7dLn+WOg59LD/y3X9AIs1TTmOAAAA
X-Change-ID: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: KJ01o1FUObeXMHpV29BVP-3OG4M3Bbod
X-Proofpoint-ORIG-GUID: KJ01o1FUObeXMHpV29BVP-3OG4M3Bbod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXzNNdEDqFh06a
 ap4kl0I5W8EGzpJDiIZfNzl+F2/Yx8LEyPnAu5o5KPfx7jY975YuYwB/MynzdE+gLZn6Atd12PZ
 jN6IK5gkS10FNDFTep7a69wXGsgVT6WQJFOaAbqKYPKvgqvRlTIROXZkyPo20Bf5apufJ/1iEFH
 p3ed+yG5zZO2DMBzWMQRYWtrlhGB8/Y9K+Y36qvLSNKBO4fjO7DRryVwrYXTyIMcIIed4YnB+Si
 j/PBchvvw2zI0vNdXDEyXV4OE5HwPNHp26MMh7R1vmTpWJ1qObrlhzn4iNckcQcwXgvr4DpQf6Q
 ifi/hF7xdHb89ekax49tDpPv4BG/01tk1hFGqX62FnpQVaw2IdB9uqkfqQ8MkZ7MqQQkaZFIGi7
 cHGk+aiMA/DII5UmWLboAzJqcfOdpQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ef0a20 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=z1bv0FqhIyCrtqLIgW4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

Replace the hardcoded buffer count value with a macro to enable
operating on these buffers elsewhere in the CAMSS driver based on this
count. Some of the hardware architectures require deferring the AUP and
REG update until after the CSID configuration and this macro is expected
to be useful in such scenarios.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
This change use a global macro to specify the initial buffer count. It
meets the requirement that some hardware architectures need to defer the
AUP and REG update to CSID configuration stage.
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
 drivers/media/platform/qcom/camss/camss.h     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 09b29ba383f1..2753c2bb6c04 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -541,7 +541,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
 		output->buf[i] = vfe_buf_get_pending(output);
 		if (!output->buf[i])
 			break;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a70fbc78ccc3..901f84efaf7d 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -41,6 +41,7 @@
 	(to_camss_index(ptr_module, index)->dev)
 
 #define CAMSS_RES_MAX 17
+#define CAMSS_INIT_BUF_COUNT 2
 
 struct camss_subdev_resources {
 	char *regulators[CAMSS_RES_MAX];

---
base-commit: 59a69ef338920ca6a5bca3ec0e13ce32809cea23
change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


