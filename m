Return-Path: <linux-i2c+bounces-12303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EEB279D8
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 09:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69353A23E95
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 07:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFD22E2841;
	Fri, 15 Aug 2025 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="laBn6bw6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C62E1C55;
	Fri, 15 Aug 2025 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241685; cv=none; b=DUCCRUKUMFJY3N9kce4Uf/GIecLkhx5BCjJ6Es7hW8u3mRzsyzupLqjHv2SC0s3dALdMgLbxjsd5Ah0f6pYXwTD3vaLGrNhZPihAFQOvr3Fb/1mQIdGaJA7SVU2dYPGmcE4xXw5BD9B6aO74j5zcX4ptf8v5Y6YsXJe8lMYrehY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241685; c=relaxed/simple;
	bh=Eo9blu/uB75fO2OTDG5onVskMvodTmkFxqkvOVRL9xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ehIdULJkOob6GBMiqAA7NsdI8HkUL5kt/vVVslSGsKRlfm7nAN3vWTxaCx6VZNeRv7Wz/SujC6AHqUg/i8Eu3tI2P0SBsUlg3ngcFableatVK0jvf0OSChndWLHNXzZEyFPQ+NS+EwTxRDgd5RriRJyRatwlfRYyvxzbB7ipeY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=laBn6bw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EI97Pe011995;
	Fri, 15 Aug 2025 07:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTjc1MxmFEC3Evk8ok6M/PITPWig5rRCnx6wWTvR4MU=; b=laBn6bw6RBtpEzQx
	2nC1LBL3LU6KoNiZcey67fUQ9oQxkYp+Iz8kVFIr0chWMscNUia0sdXoHeHW28A2
	hkl/PtmSBqf4S79E1nZ7kKU73R0Ll+FHlTUz+nKRqRptcLiBVND5bF03h2txnifB
	aKMf7mQ0TK639p5iBiwuo5l6qg4BDnWmDi/SZnCTdBMkX2aOhYJKj4vTRhBBnUMS
	zfQy1fLpbAH9EoCsKDhkFvalVERyPDEdl9XiVBmjnWlnMEOL1PA/gK9LDZDFp4QU
	d4E+zU/5cnrTyhtwRxMAIwfD6nRX1GrEeI05sVuN5RFgIlBS7AOEK2h/IJUlBKUF
	c7/XDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa1aw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 07:07:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57F77wqe005265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 07:07:58 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 15 Aug 2025 00:07:53 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Fri, 15 Aug 2025 15:07:19 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
In-Reply-To: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
	<rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <vladimir.zapolskiy@linaro.org>, <todor.too@gmail.com>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Wenmeng Liu
	<quic_wenmliu@quicinc.com>, <linux-media@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755241659; l=3389;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=Eo9blu/uB75fO2OTDG5onVskMvodTmkFxqkvOVRL9xg=;
 b=MrQzR1m9gqEm/Pqazn1F3VA7e8CP8apr4msmMD6PTC0HQVbZou0f+qmRZeN06D5dhw8Abu+TR
 efa2V57YVW+DKWGyuCvOb8LvB8usdZ/YxlitaSh47Wdg8F+7wVxTRmX
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689edccf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=kSm5t9dM_A3S1SNkfbEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hiuRTORQAZnVWiIaVvxgZtgCNfoOXchl
X-Proofpoint-ORIG-GUID: hiuRTORQAZnVWiIaVvxgZtgCNfoOXchl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX+cwpcoXndhRg
 GroILOb3+L6FAUhXSgiLv/45AcTQUIJNJxtlpeIKx6J1QnabylCWTrW+qjDdwoy3Y2WV9/PjpEz
 OBpF5B8KuwHSKReDLODrfiMFcyf3Zx/hJ4ZMotbg6+ECJPS17P2lZ8bA5hDfbuokHBeijXskysi
 MusUJScv6V83w+KoSwJJg0MHFWJjld1j7JbtxDy0d3ZK1P3ACZFCFocXm4CUK/TKW9GYfUabNUs
 XJaoJJzqRuZQQhnjCXNWhhhiftuVJGWaYr52eM87BP6/Hzy57mq1EjeMNlkm1Q9b8Y5217oUKuk
 7eBR/L02245iNcrZXnoGOgRxBuNmo/k2wwWHmzQ1+uewPYRyV49jFLqyy4s2vtqilGowU5OH/vn
 aY0fqqju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

Enable IMX577 via CCI1 on Lemans EVK.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   4 +
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 105 ++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 94a84770b0802a9dc0c56ce6c59eea20967a5d89..7efd113143013c6e9d211597a4c2defd44497c83 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -30,6 +30,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
+
+lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..4600d5441cce4507734b2fdcdbffc1ad7c67c32d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/*
+ * Camera Sensor overlay on top of leman evk core kit.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vreg_cam1_1p8: vreg_cam1_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_1p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&pmm8654au_0_gpios 8 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&camcc {
+	status = "okay";
+};
+
+&camss {
+	vdda-pll-supply = <&vreg_l1c>;
+	vdda-phy-supply = <&vreg_l4a>;
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
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	pinctrl-0 = <&cci1_0_default>;
+	pinctrl-1 = <&cci1_0_sleep>;
+
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply = <&vreg_s4a>;
+		avdd-supply = <&vreg_cam1_1p8>;
+
+		port {
+			imx577_ep1: endpoint {
+				clock-lanes = <7>;
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_default: cam1-default-state {
+		mclk-pins {
+			pins = "gpio73";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rst-pins {
+			pins = "gpio133";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};

-- 
2.34.1


