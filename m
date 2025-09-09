Return-Path: <linux-i2c+bounces-12802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B35FB4AA60
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 12:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4229F3B5FDC
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 10:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F37631C585;
	Tue,  9 Sep 2025 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyCpsXrm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7548B31C570;
	Tue,  9 Sep 2025 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413367; cv=none; b=A1m8ffNxTITSyUPsyLfzvdVlwAZnuD5PDNBDA8sG/7fB0Kkk0tuCisZpieFzlYg8oI66KZ3sPaM2yh4iNDJHDPu6vhMkPhtHwJaRzDjY4Hm/ar7T3JmHR73OWmnXBItE5yS6sx+kZEYZIJO9tPevVjzvJzGEPHctCXOqQrbZ+c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413367; c=relaxed/simple;
	bh=CTQ2uJ0gKKGjYzMxUF7lMEm0aencAk/Qhedf6jIlwFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KgDycR9eQlmPhzjiJ/IeSzbY/ORiEE+4EHIt1jInQaTz2J4lQM/vDSjf23rID+J7M0h6woADSyRoe+ZVNSSyF5kspHrPPAI720rpszGSvG2noVJSRivk43uCvMd5an30dFxdMEU6CSayMfZhPEVZOl/mhnyPtwcgf3pdOdDrvQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyCpsXrm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LVEc011067;
	Tue, 9 Sep 2025 10:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJRwRky7HEXScqDVs6TiyYFrEUEYOFo2XTLfjKl1DLs=; b=YyCpsXrm3DJF5c7n
	imPtkW2+VSJM0xSSJ2t9I7biQjmEFW0wTztEoC0r6iaWrKZz7ZXA7f/mGbVxkVDo
	r4hDkIsxksQCy/QuFGS9NDpnDck6z7qcnY7anVCfvMjpERPla4BVluVueFS9vu6E
	StLcvFC9+YuyaXRbClWUGp8M8RImRWlfUw21byBXtyYp0hCilERYtfVarhCLJkyl
	pKjxofXQaLDxTtJdqww0BotLJNyLtQ6MCGNYeEw2v8a3LzKEEJpjpbmDcmhLp3yl
	PDyOqcVRiXYWHoU6pKb8OJc0FoLz/NNySIfzbsGU3iPndQWlT/cQb4guTcQ6u5Lm
	kIF+UA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0quyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 10:22:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589AMeeY020043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 10:22:40 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 03:22:35 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Date: Tue, 9 Sep 2025 18:21:57 +0800
Subject: [PATCH v3 2/3] arm64: dts: qcom: sa8775p: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250909-camss_rb8-v3-2-c7c8df385f9a@oss.qualcomm.com>
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
        <linux-media@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Wenmeng Liu <quic_wenmliu@qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757413345; l=7540;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=CTQ2uJ0gKKGjYzMxUF7lMEm0aencAk/Qhedf6jIlwFc=;
 b=5wA8AY00ePR6gDDyS5vtnN9zA35IAbTahX4M670lz8ysr//hZN8plk1KRDHfWqPpAWiMptdt0
 Zr/dDO6G/iyCVopaAtIIG6Lr7yDC+mL8SWvYM2iH5eGrcoCWD4sZKfS
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sxcY3NMyAoOTQyMBzeRJ9vxbua3InYJU
X-Proofpoint-GUID: sxcY3NMyAoOTQyMBzeRJ9vxbua3InYJU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX7OOATRkSxWiW
 2TJvVWVa/0w/WWidsrNNM1XzcsdIVSIR5oN4OT+tKFTjJDYWnPlQwDKuqSKUXL3yJUlUVq6Nchc
 6Is8wIwOqjOin9AlXmCbE1AcpbliD9YMSHSakRiB4r2Ft1usC5lBWd4nid5xwMU/k6f0SJfcPPw
 h3jFGnDmUEfrnQw+apF2Mt8JPeB91rieiRwc6/2epNPLZLOZArRS9podU/1SuDcObiUWrd0xsMu
 IWM71W3ZjWyJI4x6BYCSQDpARPLGdTIOtDJm3tqXbZEAqa9fNTauLSlXUCcRRqOlWD5zSOlxrmd
 F32mbNnwzKJtvwD78wvqATCp7Ge10e2SNpgEo/dJS585cPyoFAit14ikBAo4sw0nygMK7pI5wvn
 sIfP1+XF
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bffff1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=CFfrEA4lfVCQpy_kl8YA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 268 +++++++++++++++++++++++++++++++++++
 1 file changed, 268 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3246ba05a88cd4979de70e1a3c3db3cd5c894379..f557cf1f2bb54fd8d92e910fb6bfd17f39a1dd4f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4358,6 +4358,162 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac13000 {
+			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac13000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac14000 {
+			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac14000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@ac15000 {
+			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci3: cci@ac16000 {
+			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_3_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			pinctrl-0 = <&cci3_0_default &cci3_1_default>;
+			pinctrl-1 = <&cci3_0_sleep &cci3_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci3_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci3_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@ac78000 {
 			compatible = "qcom,sa8775p-camss";
 
@@ -5201,6 +5357,118 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 				bias-disable;
 			};
 
+			cci0_0_default: cci0-0-default-state {
+				pins = "gpio60", "gpio61";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				pins = "gpio60", "gpio61";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				pins = "gpio52", "gpio53";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				pins = "gpio52", "gpio53";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				pins = "gpio62", "gpio63";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				pins = "gpio62", "gpio63";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				pins = "gpio54", "gpio55";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				pins = "gpio54", "gpio55";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				pins = "gpio64", "gpio65";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				pins = "gpio64", "gpio65";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				pins = "gpio56", "gpio57";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				pins = "gpio56", "gpio57";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci3_0_default: cci3-0-default-state {
+				pins = "gpio66", "gpio67";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci3_0_sleep: cci3-0-sleep-state {
+				pins = "gpio66", "gpio67";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci3_1_default: cci3-1-default-state {
+				pins = "gpio58", "gpio59";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up = <2200>;
+			};
+
+			cci3_1_sleep: cci3-1-sleep-state {
+				pins = "gpio58", "gpio59";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_i2c0_default: qup-i2c0-state {
 				pins = "gpio20", "gpio21";
 				function = "qup0_se0";

-- 
2.34.1


