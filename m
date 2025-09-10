Return-Path: <linux-i2c+bounces-12824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5618DB514E2
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A30B1C82EDB
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 11:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A099031AF32;
	Wed, 10 Sep 2025 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOqh1HXB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3085931A06C;
	Wed, 10 Sep 2025 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502429; cv=none; b=NVfof8/tV+h0kd9ah8NB4/Q2S+dwHWfpfnxsy+0u/SQ7PxLAhPlEf3OB3NceiNBVeb0UINV3NLZ2/uqwKixzMBypv5Knk/0U3J+PkqXP2U7JJlGBNZ9k9hInMoBh8BJshO8fq+/jSF3mVlAqJzHPevH3WIlN3tO4wCkpQW8pswQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502429; c=relaxed/simple;
	bh=+suaSLm4yJYPG9kV3xvGc+0GubHGu6l0f5JoNC9Gz5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HbTgOku+SIRoFB0dQ64Fa0NQO33NXAnCYJG66IRZmDCpgz5YgsVoKVkrx8EsVn++uvfzY1X72XfY7G3TzNxSTKS9E3xMXFfqrNctLq8/I7qSFrqMjAhuAlX5msLnIi4mCTKR7J2AZjjRAyHXFL9iUH+s3FKpzWtrc/rSBYMx1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOqh1HXB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFON4031314;
	Wed, 10 Sep 2025 11:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zOC+e28qEhi3ys02J4XaU8bfLN4a/Y81MtwQs8+gDPA=; b=hOqh1HXBca5YhXDu
	WLpXk9mIF6exRL51aN4DdIxJLVialJxZA7t29zEVEU6vzaqm68Q5bG4WoLUotZzL
	cyAkOrGyQfd3h3nOFdQi3ZZ6UWz7SXDG9DE1cKZw9zxNjdcsS+mc2uiN5VMevOvl
	pS4A0TGjrqP5kpA2lygy+24ZC1YcWSIYqXlYAmsc+vflGLd4rm47n3zfESuYxxWE
	Ggm6MJueYDfVWB7aa+wGfyDXM2fGnGlke+vZnLQ59ROYf9+yJgPCzsfZ1eLAqq64
	3/tU54o5IPdfhi1+ik0rVJwp6WAiYJIKRh5GSNSo4xGOxbPNAvBlCHMkVMNKAHDk
	vfJQ0g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc27n7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 11:07:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58AB71Le017789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 11:07:01 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 10 Sep 2025 04:06:56 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Date: Wed, 10 Sep 2025 19:06:23 +0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250910-camss_rb8-v4-3-28f44e1880b8@oss.qualcomm.com>
References: <20250910-camss_rb8-v4-0-28f44e1880b8@oss.qualcomm.com>
In-Reply-To: <20250910-camss_rb8-v4-0-28f44e1880b8@oss.qualcomm.com>
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
	<konradybcio@kernel.org>, <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, <vladimir.zapolskiy@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Wenmeng Liu <quic_wenmliu@qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757502403; l=3482;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=+suaSLm4yJYPG9kV3xvGc+0GubHGu6l0f5JoNC9Gz5k=;
 b=qPzbdWePstHTedoWKpIUGqe2lldxyObUdVP9nUdy5e6Mi9n2VyKQtBytAyWnjDmznGjZCHZIS
 ZMF08bmzAziDhIfDSnwPNRUwbsz0cIuR9AbQSsiaVCfq+dqQkEp9MPm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c15bd7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=n2qAWu9mVDBvzsF7sgIA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IVlqsYFsOJyEUz0UWYPSHvUeufJpw603
X-Proofpoint-GUID: IVlqsYFsOJyEUz0UWYPSHvUeufJpw603
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX+5dDP/jGU56Z
 1bapFwnQlbV+2dkeHHww2ruhPz99eF5wQxxnU625g2KOWHEB5SjGo/QgV02BsfN93eqtx1Qo7wt
 Zp7tufpCdAgNzkynnJTnqViyNAorV+95yUyPdlNSChfqY1gvQWZUJpkad/qX4HhNLS1Omcefvqk
 j0u8oM6v190RisO7XpY2wPEvzcsp0mmyy1uxl5WibiNzniooO8nGEK3eMNhtqRxzakvlGDGJViV
 PdZhT8EV2bkjpnbPc6O96FMIZNaqYbpo7WVMh97SCpxSwpWp2m3e8mSva3sjsf+wSSo/2QrDzKv
 C9j76504AlzE++iMqPOysKLP32C7/iJfmEKokTdLcZnz+Enqz57HD8iOqQZynfs+BcC9dnbosmd
 xX85p4sb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

Enable IMX577 via CCI1 on LeMans EVK Core Kit.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   4 +
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 101 ++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0a7c308dec365263bbb7aa5f5cd306dbeacfd3f1..b27f60fbd527146027eebd4bb7b1f8a0a82b3af2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -30,6 +30,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
+
+lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
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


