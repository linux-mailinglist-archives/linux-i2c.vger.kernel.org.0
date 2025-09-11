Return-Path: <linux-i2c+bounces-12862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D03B53183
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A3311B26791
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 11:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB063320A24;
	Thu, 11 Sep 2025 11:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhydTPNs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C71B320A0B;
	Thu, 11 Sep 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757591815; cv=none; b=HFV4B3FiIv0qNm2C0v/SBKbX4rcKG7EPWI3Pll/dI0CtuMPB48NQbejB4KCz5+tuA6m9rLaBKRk+IyVAsdiUw1tvzXFCZ2XUpkx52KZ5xDNmaIaAnKFc6Tk2qsiYo6D5UKH3Qn28ugLyhrnWphFzAolrI2vRugij81XoybnI3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757591815; c=relaxed/simple;
	bh=CTQ2uJ0gKKGjYzMxUF7lMEm0aencAk/Qhedf6jIlwFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kBnUKz5AEcDqQPb0tNzwTsoobNejKGPuld3DLLaJvv3N51q5rdxk12/1to03WwifmMlobU3E6rmDYmgghAayA3BOV/0wwgLpfMOtJhYp6zDOxFdIVUQbut7MEk6fAuYAEkCjzxKbqwKl7fXwdNsHo5f+F7Lez1HG1jb3MDVDOaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhydTPNs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBFsG6015134;
	Thu, 11 Sep 2025 11:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJRwRky7HEXScqDVs6TiyYFrEUEYOFo2XTLfjKl1DLs=; b=EhydTPNspi+Gkkli
	FVaHQuLALZ+UsRprkOw/h9YcQsTYuNuCtlKnXfBT9X+vN3/rJlsDT6au3KUaPuFM
	gmf09F1HaLDgqdrDh7NH/HfOUht556+tN1ju9Edw8AwohyVDSBcXVQKrDfpwwxqx
	xQbJGb9n7O4heJRATDbgcQYnDRq+x5ZOkx+dDWB9VxgyBPuUOHIXjQFybFJdG92Q
	7UM5xShhumOqSrpw4bYjbX+Ja2eRFwfj2PzbqvZUOEx7nSNC2H6CE5ki9T300VcV
	lTIEWj7rjqhjLBF/jwT/NZG/IK9YkEALihXpgXCL5H8WHxbnRqF8Z+UGo7OjA8nZ
	iFdMXQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m7bf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:56:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BBumFv005033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:56:49 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 11 Sep 2025 04:56:44 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Date: Thu, 11 Sep 2025 19:55:15 +0800
Subject: [PATCH v5 2/3] arm64: dts: qcom: sa8775p: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250911-camss_rb8-v5-2-c078e4e22d91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757591794; l=7540;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=CTQ2uJ0gKKGjYzMxUF7lMEm0aencAk/Qhedf6jIlwFc=;
 b=HPstnu1IBG0BcDCN7ZibO2hVyVwp8GntTYNkaiPkA9HmNMlQJ/B/7CEuS9Qu1494HUIYkxIqY
 1nIQAyDCuykCFFMmFB/kzjjKT/9oCVhcb35h23rVtvl5mwOoDOdsaKW
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX6u0mfUX8VkbA
 3Bqel5/c78AuDKwcu9ikC19QguXF6RDWW+TBIW5wkGK4EDFJfx66DuxXGTeiqX4bzc2HZdbBBx0
 s9+Io7+v7LU8bdNLvbl00/zszZT5o4DQXx8Y7PLe2QuWmBadmv/h7iAqwu5IjFA4Ofp2VfgAW7U
 /QWZejeik5ZTll1EP242McBxpTmrnsViOiMVo/npuFVZW3SYZs7Gn0TkA/ZmWEdL8esRisjvAr/
 XYSzRy5ey5m+EdszPEqrdrEJAXc+yXBt1Fa4E1sWDKBzzPHo7+b0DItRHrA8YD9eHgUOUuXbeNX
 cAfAz5t4I1fSy7EfAk4gK1djmOdT3XUzmBfSZGiwa9uM7RNdALrqFlfhKpUJImcut2A0VMgK/yE
 dUpHzwPD
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2b901 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=CFfrEA4lfVCQpy_kl8YA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EXdwPU2CLbkNRj5-LqepGEV8oLe-agFH
X-Proofpoint-ORIG-GUID: EXdwPU2CLbkNRj5-LqepGEV8oLe-agFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

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


