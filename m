Return-Path: <linux-i2c+bounces-10974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E061AB60D5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 04:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F82C467C4A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 02:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F13E1F4C8C;
	Wed, 14 May 2025 02:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TogoEyL4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B2F1E130F;
	Wed, 14 May 2025 02:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190448; cv=none; b=RNUO1RLR7NJR//VZxJkFla3Q3AU8Aa7QlNGo6dusiNRIn4cewE1Sowyy2KRjdLwWsJ5T3CeDs8d0q8Gor5kzMuhY7PgoVuEFJk7wdylMCFE3MqLHTDcIrF3LSvOhMASh8Mzfh+AhIsDjyo03sf8xBwsdLIiCgMvNCKvdIyif5xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190448; c=relaxed/simple;
	bh=D9zQGa38J4c1ko28yM1wKwu5Jjunf1UN1tgBD+5vk08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZYoFmZaQTzGtHk9VB8NAKYHM92qy+VUfYE/K4fWaX2W5QeVDNP9U6E/1GGTL2lv4lsEUliaHI7lREGO9Vc4RnZj1qUZc4fbbEPBJhhel2yKi0TN5ZOsB31RjRWqGLqqoBxd83o26iz99GWDZd6779EpXb3RlVskRKyQK/sDUFHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TogoEyL4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DITmu5021079;
	Wed, 14 May 2025 02:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xvkrk1nvvTn0DkQj6AD74RehdVSYE9G12pZuAsXSaRQ=; b=TogoEyL4Xij3D/rs
	qqbwWWnFldz4Sy3FHGxDoTQFDrXtuZL7DCrb1r3C/s5WnviW8/bfamj2FIyU2kxU
	uodkVLiWlVV3yX8MmUFfzu/NLvqLKn6RDk7drAhMgJDbli7BG4rVZJZ+gEQKIHxZ
	ZVXOljIp0ShTGOUbPQU9tBjujB6QA88OXJzsMXFNtfI43K9itTh3kNHfmAOJ6MAk
	yJWcCCRCZoq2FsLnc94dCA1V/6CruRQdq+8FXynUUwZg/MUHqRhBN6N1f1UtFQ86
	mexzGzVQLOSWo/w1YeLCXiTP4RfTldrZeBMyjELDV2qfjHoZGfzujl587mHb9qUK
	tYSYww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcms3t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E2eeVV018006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:40 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 19:40:35 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Wed, 14 May 2025 10:40:07 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: sa8775p: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
In-Reply-To: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747190420; l=7932;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=D9zQGa38J4c1ko28yM1wKwu5Jjunf1UN1tgBD+5vk08=;
 b=dQr/XhP7xDVGZ4/TIQOErv9ydI2xwkChcl9kmwbrE3J+fQQ+8jY6DuqgaBB9lnqm5NRGTV88+
 EctZRRX9a+/DZ14/OM6FUIYFjb71yIY30N9OUdxYyHBb/ZfHskU5z5P
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cMGA-YlNS2xm2pMdrOg425xfVjxfeOIe
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=682402a8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=CFfrEA4lfVCQpy_kl8YA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cMGA-YlNS2xm2pMdrOg425xfVjxfeOIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyMSBTYWx0ZWRfX5yZQONdXNfsy
 gkgAjX5O5j8jal8jmYUpXxXDAymjblDupaq36WKl1RqQ/vadiuG3UD3W9psy/eBHCzio8gSyjzX
 sdxKcvOr7KeJUv4GLI/B6aAnazpAzjG/g5wX5ggsLkUjMddUiRym6n2NUAE1l+2x+YPol6eidfc
 ptGIlWc2Ck0MFykUtmcfqUmu3mjwBsOADM5L8iA3EqdnLIEG9yFlMSmfiLwfmrK5uyIJDdqMO+E
 YsC8jQf0/c1W45FGnRkc3z6DGL7F/bI/VjFvCUuDUVGslmVVMCxfOTrbXiz3Uk37sn8bxeG/wqW
 x5bBgTCq7Zyu7H0SHdwWGgMJOYeadaS+xwMAF7Vn57s8XyBwXumJ6dl99XCbVbECRJPCftZEfnp
 34Bt7+f5OSvWm2leByDiljoNFXALfV9hQICNofHmbUJMH5DX98EF7chvQDFFHj5/EkhNOhhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=356 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140021

Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 268 ++++++++++++++++++++++++++++++++++
 1 file changed, 268 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9a8f60db87b1afdf16cf55eb2e95f83eb45803a5..a867694b15b307344b72041e972bae6e7543a98f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3941,6 +3941,162 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac13000 {
+			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0x0 0xac13000 0x0 0x1000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0x0 0xac14000 0x0 0x1000>;
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0x0 0xac15000 0x0 0x1000>;
+			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0x0 0xac16000 0x0 0x1000>;
+			interrupts = <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_3_CLK>,
+				 <&camcc CAM_CC_CCI_3_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+			pinctrl-0 = <&cci3_0_default &cci3_1_default>;
+			pinctrl-1 = <&cci3_0_sleep &cci3_1_sleep>;
+			pinctrl-names = "default", "sleep";
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
 		camss: isp@ac7a000 {
 			compatible = "qcom,sa8775p-camss";
 
@@ -4599,6 +4755,118 @@ tlmm: pinctrl@f000000 {
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
+
+			cci0_0_default: cci0-0-default-state {
+					pins = "gpio60", "gpio61";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+					pins = "gpio60", "gpio61";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+			};
+
+			cci0_1_default: cci0-1-default-state {
+					pins = "gpio52", "gpio53";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+					pins = "gpio52", "gpio53";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+			};
+
+			cci1_0_default: cci1-0-default-state {
+					pins = "gpio62", "gpio63";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+					pins = "gpio62", "gpio63";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+			};
+
+			cci1_1_default: cci1-1-default-state {
+					pins = "gpio54", "gpio55";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+					pins = "gpio54", "gpio55";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+			};
+
+			cci2_0_default: cci2-0-default-state {
+					pins = "gpio64", "gpio65";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+					pins = "gpio64", "gpio65";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+			};
+
+			cci2_1_default: cci2-1-default-state {
+					pins = "gpio56", "gpio57";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+					pins = "gpio56", "gpio57";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+			};
+
+			cci3_0_default: cci3-0-default-state {
+					pins = "gpio66", "gpio67";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+			};
+
+			cci3_0_sleep: cci3-0-sleep-state {
+					pins = "gpio66", "gpio67";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+			};
+
+			cci3_1_default: cci3-1-default-state {
+					pins = "gpio58", "gpio59";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+			};
+
+			cci3_1_sleep: cci3-1-sleep-state {
+					pins = "gpio58", "gpio59";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+			};
 		};
 
 		sram: sram@146d8000 {

-- 
2.34.1


