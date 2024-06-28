Return-Path: <linux-i2c+bounces-4484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC991C5CE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 713D51C209D0
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21EA1CE09E;
	Fri, 28 Jun 2024 18:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jNNbF4ke"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC11CE095;
	Fri, 28 Jun 2024 18:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599608; cv=none; b=b0har60lTthKivqVq80AoGr/eCGGtSPxGrz4N/XYDvSNow80bw/UFirX5HAVIU6gqo7pope9LmsjLABL9hLgM1bdn9qGkGd1A1M9HI0mGHjhvm8DoFbFI2yUeT0RspkPMgXAZjMZzn7giECjmpr/s5g429hajLPEWksQn7WHhM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599608; c=relaxed/simple;
	bh=SAeTdhTzDtl0fFBhjpmwjz26B2o2pEXlFxAhnOSVl3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Po5pbrtfvI/NO4vkGSEmQO5geomwuTCrLEfjGdVdUpogHk6cGDXosGBa5rG+w8Qpcej4lMtrleYQKtFntnMpwtWjyCxJnjLcBFbdy1a79bwNLv/kqCIh23H6aZraxFVgmLLxUd2AW3/dsrSSzNCrz2svTB2amyME3VWqjT/5t3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jNNbF4ke; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SGSG3H010656;
	Fri, 28 Jun 2024 18:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mq39WuBjbbhXR4vJo5xCtDNEnz8QDl/elFG9Wu63Hvo=; b=jNNbF4kez7EzfpYH
	a5rsITzUcLbzVLX6wi8oG2h9/XpZHWWckAzXAyRcUnbcJKngr6iwY+hmlyYAGL6a
	fKCcvJdoeGHZYCjM1LPNGUv9qaPzh2Xy+vz0kg/SgCOhUL+bnPWDuYjWBOUYTE6v
	vmnjThwe1ULepiRdajzz170qPWR/Flbhqo1Rki8A6sPO4R2ZREbJ7KU7CJAi/ZxT
	hyLmPXyq8VBrNw4r0wIBHoo8CfILKBL1+ZTqknctgzgDCXxFKaFGIiPs7M30fbaa
	fBo4ms9JAToaxdFsS+f/fEp9BMFRlse2P9kEqWI7Pkj/PrAzLowISCqU/3SBWdHm
	Y/jnTA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdqgvqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SIXIHB030276
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:18 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 11:33:12 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Sat, 29 Jun 2024 00:02:38 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: qcs6490-rb3gen2: Enable IMX577
 camera sensor
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240629-camss_first_post_linux_next-v1-4-bc798edabc3a@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Loic
 Poulain" <loic.poulain@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
        Hariram Purushothaman <quic_hariramp@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719599566; l=2083;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=SAeTdhTzDtl0fFBhjpmwjz26B2o2pEXlFxAhnOSVl3w=;
 b=fSEkrDn5gOsEjxHEkYWvnC3QvQ9VI/wE5g8PQ6pVb9hJUKzmjiwXmWwKQaqfUmoyCByvgpo21
 XYbrovFrVE0DmaVLoxlNcueKscvXaJ6g3Va5sM1fA4mQDiQ9fRx5SOX
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q03Eu4Rhk116yCrrabxLyNLOGW_ZWbQl
X-Proofpoint-GUID: Q03Eu4Rhk116yCrrabxLyNLOGW_ZWbQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_14,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=805
 adultscore=7 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280138

Enable IMX577 camera sensor for qcs6490-rb3gen2.

Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 67 ++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index c4cde4328e3d..237231600dca 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -513,6 +513,73 @@ vreg_bob_3p296: bob {
 	};
 };
 
+&camcc {
+	status = "okay";
+};
+
+&camss {
+	status = "disabled";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* The port index denotes CSIPHY id i.e. csiphy2 */
+		port@3 {
+			reg = <3>;
+			csiphy3_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx412_ep>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@1a {
+		/*
+		 * rb3gen2 ships with an imx577. qcom treats imx412
+		 * and imx577 the same way. Absent better data do the same here.
+		 */
+		compatible = "sony,imx412";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default", "suspend";
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-1 = <&cam2_suspend>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>,
+				 <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>,
+				 <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>,
+							   <24000000>;
+
+		dovdd-supply  = <&vreg_l18b_1p8>;
+		/* avdd-supply = <&vdc_5v>;
+		 * dvdd-supply = <&vdc_5v>;
+		 */
+
+		port {
+			imx412_ep: endpoint {
+				clock-lanes = <7>;
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,

-- 
2.25.1


