Return-Path: <linux-i2c+bounces-12803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50861B4AA71
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 12:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DB86343F23
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 10:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2828F31CA56;
	Tue,  9 Sep 2025 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcSnxhFp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05331C59D;
	Tue,  9 Sep 2025 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413371; cv=none; b=RBgIBQslXulGdrqTgecWRQiHB8GDFfYAEa9kdsBjPFAW1Y6PGg9ye9nnu1t6MYHBLIIrCgniuDT5WZep0H0rMwqqiTiADeu7+HO1NuXEyTmTiq6dZoHpr1hRSnlC49YzWnz/ZsEXDWmUraC8AVL1DLeBrcIJh1sLxW5OqJL2sB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413371; c=relaxed/simple;
	bh=oos7Pd52XEeF6ShFlAUe7hAsjS5w5kuDiJRTuAmcAsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nH8aPKWWFZwgEAHC3ZqwHqAEVIHQeOfmHdSAVtTCTsI88YkhNykCelIWPVbI8wUefBIYi6rZye2P2zIRurAWJjKnRtls9r7py9QzlDHLzzSwdfA1HRfwKXai9Eq43RAk228fmbnzyI+5j0uG9ydO0V2SxdGgdVtf4GXK8Va8Pks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcSnxhFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRhL009159;
	Tue, 9 Sep 2025 10:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16Pd8QCyw0Zqwi5s32kr+ZkMH8X+yHAJXvMkhnLd/a0=; b=kcSnxhFpx9Xv62xE
	K/MvbfdspSbtbLIhjeXnbv+pzb8Ro0Gh4DoEIHX6izMuzRTVIaFyQ6D/QcsqgXbV
	8zs8pcKzxl6sp7tUzgfdcKky8wTPsSyK3k+iOhdwi/isx2nv4nyRWCtfN1HcYB3E
	TRZARCFI+7/EWN3S6vcxYU2VIhy9WWJi+Y3lDFLezFFvWqYQPMpqM0keXp50uPvD
	xerdAO7hcn6MlwpfP8/7rRV9ZbcH06i9wv6PldBqLp3n/fSYG9+vXxt5MzZhJrnf
	PvryWI9yd2cEaWUHJAp+cLtTxdCV3E9Y9dc8FgWYcPYk4oWN7lWXPVGdEoJxTFYG
	XBIDpw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdvp4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 10:22:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589AMimx020110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 10:22:44 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 03:22:40 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Date: Tue, 9 Sep 2025 18:21:58 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250909-camss_rb8-v3-3-c7c8df385f9a@oss.qualcomm.com>
References: <20250909-camss_rb8-v3-0-c7c8df385f9a@oss.qualcomm.com>
In-Reply-To: <20250909-camss_rb8-v3-0-c7c8df385f9a@oss.qualcomm.com>
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
        <todor.too@gmail.com>, <vladimir.zapolskiy@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757413346; l=3421;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=oos7Pd52XEeF6ShFlAUe7hAsjS5w5kuDiJRTuAmcAsA=;
 b=esTYbpDc1rsL3OgF2NdWaCXybexRtWXeL3c5CTKuCBEF2JuSrtGXrOrYiN1HkjfbXWBkBPQkp
 ApKf8rQHA/6BdY2Yf9Z2Sfkdr/+uI6DdMjCX/mk3E3Ey0Wr1Z69DgU7
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HYZvt7LCOpHjYlOxGOWNesOM3BPtwhJw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXywzAvQxAwb0Q
 Yd1ZLpwhz/IhNS55DuV8vfukSnck9t2vNBaqRy988NnRZff1RSNNWbYKCrkAvgYdGTLW7v3JGGx
 btK72AayDNjir5sB7F/rJ3ZhVupt0S7G0tRc/1J/YaPTVcGjuVwbLcqvPrbEu4pjGUioW32+Ggy
 wtTKXCbVmoFKntqZZE2X8Syk3JoKIcQUe1TCGzTyH/tUswd0IaLSpIM8WHpj6QSGpNtEPjbhkoB
 XPoEVdav0rlG+/RruySf5varW1QpBUx7p/gpTnHhlTtYKK6+D6F45jXPsAHmvBhFyhgIBwWGlps
 9HGxgVchranJNKXXwZhWV15Vrck1C6jQisDH2VnEWC9eDRSjQJFfMOqHTdB1PCadekuHZqzKZkM
 pQF86RK1
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bffff5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=n2qAWu9mVDBvzsF7sgIA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HYZvt7LCOpHjYlOxGOWNesOM3BPtwhJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

Enable IMX577 via CCI1 on LeMans EVK Core Kit.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   4 +
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 101 ++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0a7c308dec365263bbb7aa5f5cd306dbeacfd3f1..500733ec00ee10e7c83a2c2c6d2bdc1ce0519773 100644
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
index 0000000000000000000000000000000000000000..629992ced9b13b23505fc20562929a0ed17a9566
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/*
+ * Camera Sensor overlay on top of LeMans EVK Core Kit.
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


