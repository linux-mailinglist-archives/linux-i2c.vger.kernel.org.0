Return-Path: <linux-i2c+bounces-12925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E89B55328
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 17:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7932C1D618D3
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 15:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD69221703;
	Fri, 12 Sep 2025 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZsbtMqog"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4393128D9;
	Fri, 12 Sep 2025 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690457; cv=none; b=cfYQS9KhxG8aEN/XIWXCsViZBxwhvqVJxCDHDIy61bOA5u5w2NtbAJLj43s7p/aGtajrZoJSnO4JCBs0OsQtAJALOtsEaNHYyKYCnCZ8OqI8JSy9sVRk/DAJ5svEPtT0mb1bI9mk3zfsXYLkcLGCgq9trWWHwjwXhriwKRq1vB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690457; c=relaxed/simple;
	bh=ZExld5NlfLaYJJS6avDhNG0mHf+xckBbTIdqFGBnIQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WpmLH7B8te5qKBnYQK1d9l/3X9rh5kSIKtl0gQwW8+OtqBrRvk4t01OUsdvHdKYUBrBAwR5Rr784uT5+mWVrzerc2lUnYTE4baost+oVpPGs6LjiIcACl2WsU/5UaVpNAN4/C2wvR6StaNMl+TxA23MLBlVj2TZcp0uCyjAy/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZsbtMqog; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDgK015058;
	Fri, 12 Sep 2025 15:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKcUn67qkiyXMHku1I6F0LmB7yuk5akinxcDQ3gCNTY=; b=ZsbtMqogVUSvzdxH
	cI+0SqW3W32Pqs9rqQl7Yw7iGUHjrASe7520JHcwHkORrKzP3tTjxoJJ4XwMOS6G
	B4/jGOhSW7eCFops8p4OK06oSXtvCZPTTPibnwcakFr600tX/jNwnekWOBLb6S4A
	cddcWjMaoPmS19lUjwGnbYeHsjAHGv1VeYugkT4faNTczWVy9HotxwOsl/00SWD/
	M4Bc/FhLDQCDg12RA5l5wpmYOMWGi9DMfoDdVLJHgcFUTTgvUsQWW87Z76/PnMfe
	gYTc8rtnRTdTfr2kHpNDH3ubFQ7kFOe+anKnMP3EwahQgOypC3YLhpKMHVDNhDGh
	4IJp8w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapvad7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 15:20:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CFKpFx016971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 15:20:51 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 08:20:46 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Fri, 12 Sep 2025 23:19:27 +0800
Subject: [PATCH v6 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-camss_rb8-v6-3-c9a6c3d67392@oss.qualcomm.com>
References: <20250912-camss_rb8-v6-0-c9a6c3d67392@oss.qualcomm.com>
In-Reply-To: <20250912-camss_rb8-v6-0-c9a6c3d67392@oss.qualcomm.com>
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
	<konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757690433; l=3754;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=PiXcy2dl2ytrYvBUkeqv8nnU7EHei9uFX/GLijOxy48=;
 b=R6vkkUN8DYwclL4RrDjzVIwJ7KXKsyLJNQYFe95g7dnp+vFxT8cbnIqQHGwLmKV/ts4eQgh2I
 zN0tyvqzz0cBZXZU1aOH4Rn839uEeQEymjfR0hnj7krdfqdWX1M9FOK
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c43a54 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=1OdwwFm9_eCMZ30vL7wA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7i3DzHer4Ur-udyZvjcheA09IL5ahnRq
X-Proofpoint-ORIG-GUID: 7i3DzHer4Ur-udyZvjcheA09IL5ahnRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXxfKEaGoZUPSf
 TPN9kFFVUrW8YNRSoRQscs3jV3IG2mpS3kZdm9PHNdi8Tr3Zf/iTtYvFo1DSYAXJsysYzVSRREC
 4zIr7Uq2q+uwXXeyUHoX88eFDgavVoAKa8C8XQcR/a+FlSPmOSRMYLUNYw2xYZZPwOY1KBH7NdI
 5n3EKSm46lAiH+VkY2RwVfGiM6SjdUWbwxdfQKV9F93J5wVPrV7ohMvrJDqJ/eMXnK1CmHUTkKH
 q8ughsH8BdWxymitEOHXcxmYMVi2r2EbVHF4xN9tmYmAPnu5qdeUdPFPiaclySv/dIOr+/kvoOz
 pwSiKTLbjGtSGMI5RnQ/2HE9Z4Y81D0btdd/TBRTIpUh5dOeMzfaAONsR3roP9PBfa2rSS+R9s0
 l6hdZQV/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

From: Wenmeng Liu <quic_wenmliu@qualcomm.com>

Enable IMX577 via CCI1 on LeMans EVK Core Kit.

The LeMans EVK board does not include a camera sensor
by default, this overlay reflects the possibility of
attaching an optional camera sensor.
For this reason, the camera sensor configuration is
placed in lemans-evk-camera.dtso, rather than
modifying the base lemans-evk.dts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 +
 .../dts/qcom/lemans-evk-camera-csi1-imx577.dtso    | 97 ++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0a7c308dec365263bbb7aa5f5cd306dbeacfd3f1..b0f39e56d06954e382c7d51623bb315cf15f1bdf 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -30,6 +30,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
+
+lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..769befadd4e47d25c376dffab3546b78ce656aad
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtso
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vreg_cam1_1p8: regulator-cam1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1";
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


