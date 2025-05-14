Return-Path: <linux-i2c+bounces-10975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119BBAB60DE
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 04:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EABEC86791D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 02:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677841EB5C3;
	Wed, 14 May 2025 02:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="creA13za"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854941E130F;
	Wed, 14 May 2025 02:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190455; cv=none; b=XqKkjjo5CMYucaOQacSWAkR1/vg2O4lRN4qnYL5hrckHi4fJED35fvSRdPamw89VqcxsT78IdjokDypjQtXbxOwoguuRUgTX+ylE75WYsp6fHqs59ts0C5q37HX0PUjXBAkx/dE48YLTUmAvQw+uDRKiVpjl6EwR0WDudV5YnAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190455; c=relaxed/simple;
	bh=lCjgDt5j7RZSUjETxwPUBkxKf376VCBWhJ/wY+tphf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=M8ot+4EtZ4cZXPqJXq+HQHGiM0NLyyzuJmMnnvOwVe4tLrtUpw6AB/O9fLtKHZKDb6ssW3ZUj50ciBCzhZLUXAdhqGbehl2JU1anABNpXzfGO7uLf8E+OTMr7bP502i92LH1aW+Co5bwT0xhFZFF8JItkpqQtEEEC2XX0u22vMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=creA13za; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E1V0ZA009922;
	Wed, 14 May 2025 02:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uX94CkoNs6udmtUgNJZwPiOSMpmvTO6ahUzDuH0J4Q=; b=creA13za4XVfI9j6
	4la1qIGmlfnPtjl9DCdRSvzUXzNXtniFWv9lLQp7ciJRdemZeX37+GF5k7vblvyZ
	hsVnzcLaKoslQYFjwoffZzosxGItduIQ+CpD11YMAyJ7BLila/8gvX0tYWeuuihT
	cEuZx1DE8kYhdkaXsRtsgmPpv+35kl3HxyFbdtl9UwPc+2kQokx/eaHMuL8m2+gL
	ZbcQS/X17nueD4mtN/J61RSZ+cfYWypc/CIZopPL0Ev2PYfbcsCm0rIuOdDSdrx2
	M1bphOEVvvM/bRxOUsjGdcDPDOiiZvW+xFZmXE8SAS403YRZ0TX7xhg92qcauGMu
	VrcaFQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyh3e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E2el53019000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:47 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 19:40:40 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Wed, 14 May 2025 10:40:08 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: qcs9075-rb8: Enable IMX577 camera
 sensor
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250514-rb8_camera-v1-4-bf4a39e304e9@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747190420; l=6781;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=lCjgDt5j7RZSUjETxwPUBkxKf376VCBWhJ/wY+tphf8=;
 b=daWROMMUnREKit9xCBdhOvflTzagwgfJf61n8yt2Gi4DEB1BqP59Lc4Gy4G0nsnpAVlVGqb0O
 BjzMm1sU2FgB9DXWizpGIwlhF0MqEPoRXZCHhHaXbJ7s4rpf9IxF6ro
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vdqlBOIWvLpCC8nzFY7Bs59UMaKJHhah
X-Proofpoint-ORIG-GUID: vdqlBOIWvLpCC8nzFY7Bs59UMaKJHhah
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682402b0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Y4bAwII3Nl6dPSH8ue0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyMCBTYWx0ZWRfX+hd01CxvLj0/
 YwXNs1EeQueC9YqKwqrs3nK0LQIMriSEOwu4n++EfZpzA2njQ0hXxEfJtO6VRCqGmM2ObEKjCId
 lRHuvjNwj6bzJnyEaSbiP66nAGpR4Dn616P3iYzxE6+2uvOODhu4CRkgy7KsRw2vLECa8rm6Sy7
 ebZmDs7gdhJbokWFc53b0QemBZcOZw8XnHDGa53Ur68tz/HDWgX/b7K5Q5Kz4Eb2CMeZhHsTqnT
 3NXP3FYAMUqGrMgc+TmY/E0Hl9QyzpgWoIFxy2QOfUzjW7rKdbPrc68P3YVsFng3TpcmOYGP6Mn
 f0v6g4tto0z+9mGgJkHOcje2iEInGGOF4+TsPltH08jXxuoYK2dya7MZvts5DNu69KcjuNkTdnS
 9djsoHqAiaJnxNsVWWGkN27RhHhniMCWvcQKzRi+BTKtU+E0HfbI/5+Fe9KPh1sy3X8nImag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=787 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140020

The qcs9075-iq-9075-evk board has 4 camera CSI interfaces.
Enable the third interface with an imx577 sensor for qcs9075-iq-9075-evk.

An example media-ctl pipeline for the imx577 is:

media-ctl --reset
media-ctl -V '"imx577 '0-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 110 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi            | 132 +++++++++++++++++++++++
 2 files changed, 242 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index eadc59739a4baafedfa456bdb71b72214810b1c1..83c286b3b1428bc90445f41740997f2421824a54 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -20,6 +20,38 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_cam0_1p8: vreg_cam0_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam0_1p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&pmm8654au_0_gpios 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_cam1_1p8: vreg_cam1_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_1p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&pmm8654au_0_gpios 8 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_cam2_1p8: vreg_cam2_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam2_1p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&pmm8654au_0_gpios 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_cam3_1p8: vreg_cam3_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam3_1p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&pmm8654au_0_gpios 10 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &apps_rsc {
@@ -241,6 +273,84 @@ vreg_l8e: ldo8 {
 	};
 };
 
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
+		port@3 {
+			reg = <3>;
+			csiphy3_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep3>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "disabled";
+	pinctrl-0 = <&cci0_0_default>;
+	pinctrl-1 = <&cci0_0_sleep>;
+};
+
+&cci1 {
+	status = "disabled";
+	pinctrl-0 = <&cci1_0_default>;
+	pinctrl-1 = <&cci1_0_sleep>;
+};
+
+&cci2 {
+	status = "disabled";
+	pinctrl-0 = <&cci2_0_default>;
+	pinctrl-1 = <&cci2_0_sleep>;
+};
+
+&cci3 {
+	status = "okay";
+	pinctrl-0 = <&cci3_0_default>;
+	pinctrl-1 = <&cci3_0_sleep>;
+};
+
+&cci3_i2c0 {
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default", "suspend";
+		pinctrl-0 = <&cam3_default>;
+		pinctrl-1 = <&cam3_suspend>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply = <&vreg_s4a>;
+		avdd-supply = <&vreg_cam3_1p8>;
+		/* dvdd-supply = <&vdc_5v>; */
+
+		port {
+			imx577_ep3: endpoint {
+				clock-lanes = <7>;
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a867694b15b307344b72041e972bae6e7543a98f..d50f0d84fdb5130d8386b107702800382bcaac47 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4756,6 +4756,138 @@ tlmm: pinctrl@f000000 {
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default {
+				mclk {
+					pins = "gpio72";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio132";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam0_suspend: cam0-suspend {
+				mclk {
+					pins = "gpio72";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio132";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+					output-low;
+				};
+			};
+
+			cam1_default: cam1-default {
+				mclk {
+					pins = "gpio73";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio133";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam1_suspend: cam1-suspend {
+				mclk {
+					pins = "gpio73";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio133";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+					output-low;
+				};
+			};
+
+			cam2_default: cam2-default {
+				mclk {
+					pins = "gpio74";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio134";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam2_suspend: cam2-suspend {
+				mclk {
+					pins = "gpio74";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio134";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+					output-low;
+				};
+			};
+
+			cam3_default: cam3-default {
+				mclk {
+					pins = "gpio75";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio135";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam3_suspend: cam3-suspend {
+				mclk {
+					pins = "gpio75";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio135";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+					output-low;
+				};
+			};
+
 			cci0_0_default: cci0-0-default-state {
 					pins = "gpio60", "gpio61";
 					function = "cci_i2c";

-- 
2.34.1


