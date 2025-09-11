Return-Path: <linux-i2c+bounces-12863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54543B5318A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE5241B270D1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 11:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759CA32145C;
	Thu, 11 Sep 2025 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kv12Yqb9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2BA31D379;
	Thu, 11 Sep 2025 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757591820; cv=none; b=W0PSpU0bliHc+NqpKlJQWbslo4xDcEHrA1AOoCLa/A9e5JGpShnWuPnxc/NbsqcIFRXvUC1IndkwTN8TZeQ8r3l4ReiYwWohCGkpN/I+rKprnyGr+gvuzTJSXFyYZpsw5Vj7DIDoCBvjkAVbmSF9L/8x1u+mhBJRrgYGQivR8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757591820; c=relaxed/simple;
	bh=Se/EEkpSTl5S1WX4IJAO/LXl8V27STMRWlEhmlcj/Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gG1NXa54K3bq9PurGYN6i/sShr65PQtmb1hnymWJETjZ5lk/l7TAOlyOvorZ0wPfCyZ0tl2I6Y1iurplFYzoQjhLGJdJOucm3NxWTLRRBkMrZzG+PgnRObeC8TA+I3I7q0QLkyUeMaMD8Oj7tPwcDcaJnJptrwzpSxRNxwK0tvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kv12Yqb9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBDSV9015939;
	Thu, 11 Sep 2025 11:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MMny/KaIzxTslAKtahydekkcd/4Kixw2/E5AXWjJ5jg=; b=Kv12Yqb9u/Qaao3m
	BOqm9gu5DQ0iKxGlNQeR1QsVMombcDmaMnzeD6jjm+3mQo/xa9xlmMIJKp/FOsBD
	REx775OGm/qy4Rita185dC2weJMfPceIm94lDZuPE525ftloKK2f8s63+/cNgpys
	YdwDlj6AETwbZ63X10N1IC6oBBIjUO3+0NuYUFtBI+cZye1e0yypVGrNs8x5U3BD
	j7uDlz2t2NQyW9kyF9KEAfh8fr4nWZwX1nv0e7Jn0NardTDOSvFUgOEyCwilQ4IP
	Yw2F11AwfSPjSyVCHyLnS0pc/jKA3AG50pjP/gofIY4mcUtaBU5XoHkV7oKJFwkJ
	A2UW/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m7bfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:56:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BBurSR025777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:56:53 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 11 Sep 2025 04:56:49 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Date: Thu, 11 Sep 2025 19:55:16 +0800
Subject: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250911-camss_rb8-v5-3-c078e4e22d91@oss.qualcomm.com>
References: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
In-Reply-To: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
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
	<konradybcio@kernel.org>,
        <vladimir.zapolskiy@linaro.org>, <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Wenmeng Liu <quic_wenmliu@qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757591794; l=3679;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=Se/EEkpSTl5S1WX4IJAO/LXl8V27STMRWlEhmlcj/Q8=;
 b=XZlCxCoazhknXw/M9aDSk0th3bj+zsyTT3Gd/amVKbpGezx8p9PSIckVIQz4FVBtsI/Za5Ynw
 zQ1osDp/FDFCNDL+snmcMXN4q+N2sVBOzYqveRQ1cZ3kvtfjvj14Vy2
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX0UyS8CpSpIBA
 hpL8D7TRJQ7gcKUVHuz9UBWdBT2T4quDH8xWDwLMTlkiVhJYHgaL6g+evx/MrlFA09DQgYTGx4q
 jh2oXGMOzhfZjBmIN3bwdglugJrO82bjybEWZIdokJDuIE2W+jQycwU02uQVIv6ibkW54fWurac
 8xWyYN+aXF9jeNT2eTbNn8rRj3QuMGdFMgzW90BetaVo1Iv8C1UXFJCE2is/Zrtxpl7C28QZFug
 XIC7uyK9/LjHNJI9Qc5L1IHn8bJMtXPfluz97iUfipPrFiMrbJNPRudZ44IOn0EsGFQomDoxJc3
 3OcK2IUo+YCqhYoRiUKs3UTXDkjlVaHVFZS/3gxFCAtC7vQMiR7yZWOZpfg/WMSBpcsrUCa/Ugx
 t86Jon92
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2b906 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1OdwwFm9_eCMZ30vL7wA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VEBR9XknoiXPFAoxjI4muL2vfYQxfATO
X-Proofpoint-ORIG-GUID: VEBR9XknoiXPFAoxjI4muL2vfYQxfATO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

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
 arch/arm64/boot/dts/qcom/Makefile               |  4 +
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 97 +++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

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
index 0000000000000000000000000000000000000000..769befadd4e47d25c376dffab3546b78ce656aad
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
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


