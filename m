Return-Path: <linux-i2c+bounces-14271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF24C8904F
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 10:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8619D353190
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 09:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DC43203A9;
	Wed, 26 Nov 2025 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuJ4zUFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCofYCZC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4578031BC82
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150016; cv=none; b=OEnTMe+QzLyynhC/e5LvfMfkZ6I203jXAHaaftkw7fWLabrv/TogxdsuFMutlKgHeckl1MRw8s2DEck3+KPLauEOYbLa3lmqvkZPDbMDug01F4IOQMmHB9UxV8XCMyGMYb+cXd/eELUWLWqErO5TYwQr/zy9OvDPK6/iFURR22o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150016; c=relaxed/simple;
	bh=y/hwvKvcNJO1h5CB8FsRktRU4+4mAgET9C2RtM3Ut44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOlHfrkpVJdV1ktxO3zw/uv1KqpJ7uRC/eyJF4vepWvMEdFbOrKoyhvf7XFOyKjVA1aF62rbA1d+pFlaXxkE5LjD/hPRKhYtFWHGoDlSoLphiq9kQvUwGmPS5r6I00vs6oo4PEHSufUcVhBzsEIp/SRkJx4VxCGnN3PaS/dDsBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuJ4zUFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCofYCZC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7SdSf2650901
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REs6ZBdLjDIF/e+cR7tJJA/2wQcglIdwSlvAhdROUFI=; b=UuJ4zUFg7MXKn/vr
	Pb6cTX+NczCT2sm2ZpSHLhAy3Bf/AiXSv6clGMAfqlzlw8XNfYOXFHBzecP6McIX
	BBNYATifPVNQkZAN+GFiFwbjMLJ3h0yTw4HKDQPNjYw4aER+YdkL4L6+Dg/WkK0A
	/Fcys/lEFhWJAhDdquAcqVBBa/an46y/jNZDMorRFJpMwhvFcjGcCfY22j2XH3UM
	lu6HW44JbKhVHNptmBUhx+ATw4NDp7vBlg2XR9LtfO1GVDdkChWZR6tWMA2c+6zS
	gn+D3vk2hBqFoA0ge4mb/BtMUT131VkLRQKTGjRMH+5xyym4W0yqmBsxQHTlBm5s
	kQjfIg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabukna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bde2d88e5e3so2425479a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150011; x=1764754811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REs6ZBdLjDIF/e+cR7tJJA/2wQcglIdwSlvAhdROUFI=;
        b=eCofYCZCVFyvUJ0bzrVl3ckm1Gd3aLEYwuU2JklLf2m0VLMkmDokPZBfLywFoTKgfY
         1gQU8kQU/ICGedW/cyvtcqC6Gfb8T1A68vIazozOnfxhDC8o7XGqgWszToC+63py5apF
         qGKJV4NwQfL93ETUd9PQcXLDM7qUGeGsUssY1IpIuBUtEguNb32Fr+MxiIUEtpRl1CzG
         TiR5TqvJDxVKLMbOk7uNL9BBdX6HjxSAyWHYxgItujMNg4L3KuR6teEj4XjfzytEKGLQ
         0uBusyKDU1MN3E9VYcOF/nhkHI3iRqPPct+hbW80gTACp0ZQG0C4isfkqLF0DCDRVJqf
         8Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150011; x=1764754811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=REs6ZBdLjDIF/e+cR7tJJA/2wQcglIdwSlvAhdROUFI=;
        b=sXlrQ6gpKwq1SFIyYFGSNKZErDKazOvKgCQrG+6syATHkbVZMz9i7gbTZNRXuVB+a4
         f6aQbWMv5oa/obxbZ5WJ+Ls6syVtjuJLO+lOvRnHkS9k2tq36SswqoCrLDpPJ5NWh52q
         HsFrFJKMnaUgNytHi8d8pqdGQj3PY9l0jULbtNbWuq2UNG0Sza7cfRRYGMepWckJ1XT9
         m/F+/Kal+0jxbuVjDjSYbk8qNg3E9DpWoJxPerYTpI2f5IoF9RpGmbIuqMe353oz5aGi
         p9CzEz2ITNGNv7I2g4Nf11dGciFXjie6HG8h1MdCisUjNY9kZ7MA1dx7nIKcHBjV1Rwd
         jrBA==
X-Gm-Message-State: AOJu0Yx+riLYeCzQhNL177QCd2wA7AdKgDvGQe8pE0pXjrhkpTYitjZh
	3iLFFGaIPvM5W6R7nLgr3NpOU2WxuXXObpn5BfjX9ynCWQqJlh69TQpaWQ6GNf5kEuNlEU3uxm/
	+CNbNrjgEgx5WIFGlg4ADJaXxtrUMXUV2l1dcYVUXsvtuRb4IlNNzrCEhhPW8J8k=
X-Gm-Gg: ASbGncscXZlFPgF75V/NvQVxL/U18Eqxw1Q7KKFYjTMm/ks2MKOnQi3TXRnTwvWeKDT
	FFL/Um4QUJ56Jr1yHmRz0CoSRH1tkKvGd7NAfE9kpAoeuvIBJEUfq/le7I20/uX/vx+oLnGDfy7
	ceBG8vqRYNWGxwqzcBs3jcgAJI43+JZ3IZbbuvcS/33liZTjfa8Mykn3FL6ncv2RYs/AEFB+txp
	7P1QstAztVtOSJeIooCHKJdgW95BKGx09I5mbnY186npzv/GRGICPcWvH0hq1AgZhRRph7bMsL8
	oYcXdWPm2Vfcn7Jc5oBCSqv/0Hkd1HhNkolj2vaWy9lVg4YIMIGUCy13fuyCFMx54wG+biJ+Lji
	GW+36Txtj7JUL9tCkFyDeCtvCHFLxa5sUaQzWF4HnSJ01OLjJRa2AiQ0rwFvgv4zD
X-Received: by 2002:a05:7300:bc0b:b0:2a4:3593:6472 with SMTP id 5a478bee46e88-2a7192e5cb2mr12439762eec.34.1764150010749;
        Wed, 26 Nov 2025 01:40:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0lQEBRkJFx5hayI9QF9WUJYZBS6Sj0KxBz11xrhudU7eWgl42AvXm2kPJqinf0FD0/ZMy4Q==
X-Received: by 2002:a05:7300:bc0b:b0:2a4:3593:6472 with SMTP id 5a478bee46e88-2a7192e5cb2mr12439740eec.34.1764150009947;
        Wed, 26 Nov 2025 01:40:09 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e784sm69150307c88.5.2025.11.26.01.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:40:09 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 01:38:39 -0800
Subject: [PATCH 6/7] media: qcom: camss: vfe: Add support for VFE gen4
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-add-support-for-camss-on-sm8750-v1-6-646fee2eb720@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6926cafb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BHla8BSFx5Mbbv4c_UwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: tdwNYSxfHJ54S5wyh43jbIH6utj22A-y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfXyb1V7wyuS/jp
 g50Jcm6KqWdThr3OJ3JUOCKjMaTXN9qyg5WMARznPrP0oYb0//KfTty0Qh4kP3DwaGry+NZp7IU
 xlLQxdNPYWe6SV9gyvgniLNt16T9WvWhO9xwkQINAhhtJ+gZzlAQPkEPfxFr3PIsnqTmnyn+8+H
 dS44i67/rENidRmgOaic9rAxlyP8Hho6dWNTbJGQQ/W/Fdg/nbzNVx/Rf/KjgZSkJg6SyfZgkzy
 6k8W3bHdGet5yEnDZnroyANvH+J0zeT3yEYtvbG0M/t+01oCg1JESFORE5X6iDz7542Q5wiRbAY
 YjLvDDFlZ093toOzSitYQBuPd97xXDalF4ZC+z18zIy96VyphggHuQw5N/Mw9H9p0GbszxOhoN2
 izzKhazVbwSDcP/Thbdg1SJD0UX60Q==
X-Proofpoint-GUID: tdwNYSxfHJ54S5wyh43jbIH6utj22A-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260078

Add support for Video Front End (VFE) that is on the SM8750 SoCs. The
bus_wr configuration and the registers offsets closely match with the
driver that had been added for Kaanapali. Hence, rename the previously
added driver as 'gen4' and use that for both to avoid redundancy. Handle
the minor differences in the driver using the chipset version.

This change limits SM8750 VFE output lines to 3 for now as constrained
by the CAMSS driver framework.

Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   4 +-
 .../camss/{camss-vfe-1080.c => camss-vfe-gen4.c}   |  60 +++++----
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +-
 drivers/media/platform/qcom/camss/camss.c          | 150 ++++++++++++++++++++-
 5 files changed, 182 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 74e12ec65427..6e54d2d11ed3 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -23,9 +23,9 @@ qcom-camss-objs += \
 		camss-vfe-340.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
-		camss-vfe-1080.o \
-		camss-vfe-gen3.o \
 		camss-vfe-gen1.o \
+		camss-vfe-gen3.o \
+		camss-vfe-gen4.o \
 		camss-vfe-vbif.o \
 		camss-vfe.o \
 		camss-video.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
similarity index 75%
rename from drivers/media/platform/qcom/camss/camss-vfe-1080.c
rename to drivers/media/platform/qcom/camss/camss-vfe-gen4.c
index 9ad3dee2e80b..d0218950c05c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * camss-vfe-1080.c
+ * camss-vfe-gen4.c
  *
- * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v1080
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen4
  *
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
@@ -13,8 +13,12 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-/* VFE-1080 Bus Register Base Addresses */
-#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define IS_VFE_980(vfe)		((vfe)->camss->res->version == CAMSS_8750)
+
+#define BUS_REG_BASE_980	(vfe_is_lite(vfe) ? 0x200 : 0x800)
+#define BUS_REG_BASE_1080	(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define BUS_REG_BASE \
+	    (IS_VFE_980(vfe) ? BUS_REG_BASE_980 : BUS_REG_BASE_1080)
 
 #define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
@@ -55,7 +59,7 @@
  * DISPLAY_DS2_C		6
  * FD_Y				7
  * FD_C				8
- * PIXEL_RAW			9
+ * RAW_OUT(1080)/IR_OUT(980)	9
  * STATS_AEC_BG			10
  * STATS_AEC_BHIST		11
  * STATS_TINTLESS_BG		12
@@ -86,7 +90,7 @@
  */
 #define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
 
-static void vfe_wm_start_1080(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
 		&line->video_out.active_fmt.fmt.pix_mp;
@@ -121,14 +125,14 @@ static void vfe_wm_start_1080(struct vfe_device *vfe, u8 wm, struct vfe_line *li
 	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_stop_1080(struct vfe_device *vfe, u8 wm)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
 {
 	wm = RDI_WM(wm);
 	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_update_1080(struct vfe_device *vfe, u8 wm, u32 addr,
-			       struct vfe_line *line)
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+			  struct vfe_line *line)
 {
 	wm = RDI_WM(wm);
 	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
@@ -136,62 +140,62 @@ static void vfe_wm_update_1080(struct vfe_device *vfe, u8 wm, u32 addr,
 	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
 }
 
-static void vfe_reg_update_1080(struct vfe_device *vfe, enum vfe_line_id line_id)
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 {
 	int port_id = line_id;
 
 	camss_reg_update(vfe->camss, vfe->id, port_id, false);
 }
 
-static inline void vfe_reg_update_clear_1080(struct vfe_device *vfe,
-					     enum vfe_line_id line_id)
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
 {
 	int port_id = line_id;
 
 	camss_reg_update(vfe->camss, vfe->id, port_id, true);
 }
 
-static const struct camss_video_ops vfe_video_ops_1080 = {
+static const struct camss_video_ops vfe_video_ops = {
 	.queue_buffer = vfe_queue_buffer_v2,
 	.flush_buffers = vfe_flush_buffers,
 };
 
-static void vfe_subdev_init_1080(struct device *dev, struct vfe_device *vfe)
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
-	vfe->video_ops = vfe_video_ops_1080;
+	vfe->video_ops = vfe_video_ops;
 }
 
-static void vfe_global_reset_1080(struct vfe_device *vfe)
+static void vfe_global_reset(struct vfe_device *vfe)
 {
 	vfe_isr_reset_ack(vfe);
 }
 
-static irqreturn_t vfe_isr_1080(int irq, void *dev)
+static irqreturn_t vfe_isr(int irq, void *dev)
 {
 	/* nop */
 	return IRQ_HANDLED;
 }
 
-static int vfe_halt_1080(struct vfe_device *vfe)
+static int vfe_halt(struct vfe_device *vfe)
 {
 	/* rely on vfe_disable_output() to stop the VFE */
 	return 0;
 }
 
-const struct vfe_hw_ops vfe_ops_1080 = {
-	.global_reset = vfe_global_reset_1080,
+const struct vfe_hw_ops vfe_ops_gen4 = {
+	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
-	.isr = vfe_isr_1080,
+	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
-	.reg_update = vfe_reg_update_1080,
-	.reg_update_clear = vfe_reg_update_clear_1080,
-	.subdev_init = vfe_subdev_init_1080,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
+	.subdev_init = vfe_subdev_init,
 	.vfe_disable = vfe_disable,
 	.vfe_enable = vfe_enable_v2,
-	.vfe_halt = vfe_halt_1080,
-	.vfe_wm_start = vfe_wm_start_1080,
-	.vfe_wm_stop = vfe_wm_stop_1080,
+	.vfe_halt = vfe_halt,
+	.vfe_wm_start = vfe_wm_start,
+	.vfe_wm_stop = vfe_wm_stop,
 	.vfe_buf_done = vfe_buf_done,
-	.vfe_wm_update = vfe_wm_update_1080,
+	.vfe_wm_update = vfe_wm_update,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 399be8b70fed..b8aa4b7d1a8d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -350,6 +350,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -2012,6 +2013,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 118cac5daf37..c402ef170c81 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -249,8 +249,8 @@ extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
-extern const struct vfe_hw_ops vfe_ops_1080;
 extern const struct vfe_hw_ops vfe_ops_gen3;
+extern const struct vfe_hw_ops vfe_ops_gen4;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9dea343c1ac5..48d8f282d780 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -245,7 +245,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
 			.reg_update_after_csid_config = true,
 			.has_pd = true,
 			.pd_name = "vfe0",
-			.hw_ops = &vfe_ops_1080,
+			.hw_ops = &vfe_ops_gen4,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -274,7 +274,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
 			.reg_update_after_csid_config = true,
 			.has_pd = true,
 			.pd_name = "vfe1",
-			.hw_ops = &vfe_ops_1080,
+			.hw_ops = &vfe_ops_gen4,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -303,7 +303,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
 			.reg_update_after_csid_config = true,
 			.has_pd = true,
 			.pd_name = "vfe2",
-			.hw_ops = &vfe_ops_1080,
+			.hw_ops = &vfe_ops_gen4,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -327,7 +327,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
 			.line_num = 4,
 			.is_lite = true,
 			.reg_update_after_csid_config = true,
-			.hw_ops = &vfe_ops_1080,
+			.hw_ops = &vfe_ops_gen4,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -351,7 +351,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
 			.line_num = 4,
 			.is_lite = true,
 			.reg_update_after_csid_config = true,
-			.hw_ops = &vfe_ops_1080,
+			.hw_ops = &vfe_ops_gen4,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4053,6 +4053,144 @@ static const struct camss_subdev_resources csid_res_8750[] = {
 	}
 };
 
+static const struct camss_subdev_resources vfe_res_8750[] = {
+	/* VFE0 - TFE Full */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe0_fast_ahb", "vfe0",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "vfe0",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe1_fast_ahb", "vfe1",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "vfe1",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe2_fast_ahb", "vfe2",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "vfe2",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
+			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
+			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "ahb",
@@ -5485,9 +5623,11 @@ static const struct camss_resources sm8750_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8750,
 	.csid_res = csid_res_8750,
+	.vfe_res = vfe_res_8750,
 	.icc_res = icc_res_sm8750,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.csid_num = ARRAY_SIZE(csid_res_8750),
+	.vfe_num = ARRAY_SIZE(vfe_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


