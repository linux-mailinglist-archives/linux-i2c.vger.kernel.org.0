Return-Path: <linux-i2c+bounces-14912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9DDCF79C2
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 10:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD38631600A4
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC2A1519AC;
	Tue,  6 Jan 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBKbMFk6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lbec037o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6AA3242CA
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692448; cv=none; b=GqFIcCF17Kv2kTVNWsDMIGP3A9xzhXsIQ4atpC/HJSzIL/xahNcRhwBrE9Ov/SQl0POJgK77vN4UVA2q2m5oE/IWGDMBME5un9iKBjaoU8zuYzRCOgyaFmOxUYy7cMslbCOd3PH9pqlFIkquPUCOMLGH6l3pLhZSXRO9s6g1ahI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692448; c=relaxed/simple;
	bh=qNL03PYuDa7zYQoE2ixEmUSblmXdpnNGEuV5SywZbG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3HRB6OFhUmzYEtcyj1UnJdDEkITMna0+3BKaYjK67Za6CvBfC13/8x9UB9Sz4QtB1SrXjZEbvopqNmMc8+d9reCrZZ4qoEsiyKdIe8jSxWIvKkiHBlKR/h0kF5JNmSxLObdCLimCIKK/vp7pHkIGS66lQYUmEZsD4xGoOxVeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBKbMFk6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lbec037o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QPQu3271952
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 09:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50uGPgremaZPgc01PJvtHho9EVHbAkAnUxBw58+hi+o=; b=mBKbMFk6szSfF6dn
	lPoGvIlHufqRWy9ir9rjuRJiJz6xy8Eks7kIshus3YspIfjfq9+pOfMToPCr/9Xp
	QyC2VRG5wtqR1f6jtp/B4ONpC08MIPocIVRY9hWp6eGxg507A38CioS1h7sUNxjO
	/5amBG8RWpp4dWcaRigc+tWj/CuyvEwx7ATsbVcn2yw5mociWZevAamY/9FAP9eC
	aXwTimuemV4f4aaBLdpztNjQo8gwFsfUNiXwNgIUAVtPu08fj6X1NhrKHV+JwJI2
	UEEGjQu8TPPfR1AN/H2j6GxAK1JFWZ1znPABd5Cs/l2LmiouFsYh0seS4TsETg35
	c+8sRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02tfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 09:40:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9fa6f808cso236792785a.1
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 01:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692442; x=1768297242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50uGPgremaZPgc01PJvtHho9EVHbAkAnUxBw58+hi+o=;
        b=Lbec037oqOL/TC1t+NOLjY4MvGj88UfIaL1JGctDZr0njjoa6jr3nvBzv++kQiapCW
         9g4LsRgeOh/OLFX7Wd9fatMK+w+CYZwVpruNoRIqtZD3C8Q3uxw3UpMJmJEj8z6gsg8/
         OHmkVS3Td+yMCsmuutoCoGMYq4XosVsagYXZzljI0iejb2SH3e/0Yz7ZUfEnas8r6VDI
         IdygRszffsGm3EsjPxsZCwFj4iqPcD4LrFxdWuBbxRTZxcRjcSpkSj4VkaEpCvoJ5X7n
         kQMkDnHpBhkZa3gLIKqTEOyqgod01UkkrES5Tm3gNiQG6UwL1FE6nQVua6Tz/QoTZtxG
         VTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692442; x=1768297242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=50uGPgremaZPgc01PJvtHho9EVHbAkAnUxBw58+hi+o=;
        b=Ip4KyeaY5b2jN414mfufNOiqtDYRXwNWLmkUX5sqh8U26Fg2x3+XmIkdWGJNXB/5rd
         JaUew72hLeRfk1zzScHhAFHsmB8maiawHFEBcV7sYSXp5kCv2K2IQNDd++8kKTqGvULs
         xZ1a+i6gszK9/OHXTH3MawkWA2w7sE+35XE71gU36O+7uVzglgVHbujGNytIEj4IM4/p
         knJpbGW0fMhmYjU5ofOYe5ZVjz1+b3ZIo9x+y8V7/oLY4+bTqyU6WaGg16h3cek4QBiI
         +Wnv4ztrxdgKZQ6LfMHEBzDFTOHXPgvpdNRrZE4HBt12GbUMV00yoWMo18InI1YieZHT
         NEWw==
X-Gm-Message-State: AOJu0Yw3bEZKidhLjmWOPHVfgr3D9CHZ+BDh0mc5FFiHlD5WgB6V9svD
	RDfia/MaYqZUIPa+UjN5O/6zG9x+5GmbbazzDI0uRIXJEfCak7AJF1Cj7PsOusRoP5MgXbcpQo3
	7h0ckDOfH3i4nOA0J5e4XYCV0uaXFOMAaDhs5+Xv9dVKDkvW8nuIhJRuBMMx309g=
X-Gm-Gg: AY/fxX7FFWjFFn05VCtsWSS+JiXUrVvAku7bQw/ugDB6JL8ex8dxmo7l0fg31QXjCQ4
	fGMyZ7jNaToR4W/P6K9uSnCaogOp3wQkR7k1QfKyIJuLgPSoY3iHwHrdkOZY/QTM7lgWwuzIZLZ
	09ClQQA2h7NAePiuKPHehG+4DGmw66aFLxkAux9gomVaJPLhZY4SFOjDAj7tVufU4WQLI7MTDNz
	jyX6S9Jf2LQtPVtrgOUQK9WUDj9MrMM6XauDxT05r4G1itkEW6nOqwAbhyNahxGlXAMzg3QCOIV
	HJf3/WT/7Fv5GY5gJLoNbxU4TOPIbALXnHYK3cl3jnSizGDgh7mvT9SVLZUF7GG4KfaNokfJJS1
	Zd8EmPp2YyrhHivIyje/yhfkxzR8nG8pJKjE30hexZfNP013Q0ptD6MB+ONM/2ICwSvZ4nXWS5T
	MZ
X-Received: by 2002:a05:620a:468f:b0:8b2:745c:f770 with SMTP id af79cd13be357-8c37ebee205mr311804085a.77.1767692441640;
        Tue, 06 Jan 2026 01:40:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzmqr0sIU1T8rAjETrwYmJaA2AIPD9Ca4WO/R2S3Ug8BRQeR5VlDtRUVT3CC3A9ZxOK/1M+A==
X-Received: by 2002:a05:620a:468f:b0:8b2:745c:f770 with SMTP id af79cd13be357-8c37ebee205mr311802185a.77.1767692441248;
        Tue, 06 Jan 2026 01:40:41 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:40 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:39:56 +0800
Subject: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=2970;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=qNL03PYuDa7zYQoE2ixEmUSblmXdpnNGEuV5SywZbG0=;
 b=S9vvds46ZDgLtaIcAVjt1Lxuu4uhj7iF6n3cTOb3r/LJ2S4HF3CO0cF8KG2SVtXT3cyJReZ8c
 zpV691CX8yQAkbAZkg0OuV8vWOHrmKIUpuKcNFqIoe+0otyhMRLVDzw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695cd89a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ASysW7YtxmCszPwO3C4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9dzOv_dqKaD48zZK06BiUbZUhgZgWjvO
X-Proofpoint-ORIG-GUID: 9dzOv_dqKaD48zZK06BiUbZUhgZgWjvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfXzO6tfWB45G+Q
 LxODxMFiQ6c2lVDZy3CP/htlD3iTTtQgOLXk08dd5vo5ZnJgUuSBZ01SUYXunYumBYgceHdiTVT
 jyTNh4xzOTkHuetYoB1hxhCFzHTkX6n3wNWqhWHLpMxlaiY+SgLeWa/CDRNNo0lIiiCNAfoMXro
 /Ffe7x/kXN84xGhIoUHZcSgHHGpF5jPV0QPzHzFgH+MZRmnJVNXXlLhH66y8US+l3isrgS5jefd
 8xpDq9cxKyLvVUPjDQxt/N+AwFisZDdFsk7JsISkmfR9odWWEyEhv/NUJnOX3AEWrRwv5YqvHht
 u++wP8pMKbz6IFw/ya7N1dwUtqdk5s+3URcBeg7veqFYtv6kZ94Vy5mCeOxQzeBhur0ZhHxF6DF
 MMGgqFrMoYxuBm5zKZs+GsXRpq/I0OKJVrh087Rs+4JYNwUxNMCwVkmOYBuVpFRRam3olZEQcGb
 6/V6XiKYqZxi/aVu5qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060082

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this overlay reflects the possibility of
attaching an optional camera sensor.
For this reason, the camera sensor configuration is
placed in talos-evk-camera.dtso, rather than
modifying the base talos-evk.dts.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  2 +
 arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4258776b71bdba351de8cefa33eb29a0fe3ec6f3..bfaa0b47ab5cabc9aa1c6fba29faa3e6fd18f913 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -333,8 +333,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+talos-evk-camera-dtbs	:= talos-evk.dtb talos-evk-camera.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


