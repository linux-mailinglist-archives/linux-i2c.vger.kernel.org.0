Return-Path: <linux-i2c+bounces-4483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2EC91C5CB
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F9BFB222D1
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D411CF3FA;
	Fri, 28 Jun 2024 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="irtIyVFW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB5B1CF3E4;
	Fri, 28 Jun 2024 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599599; cv=none; b=cOGn/x50mL9kMt70HnEGPpdPkDe5dNArOY+stJFnl6SaZS/987oT1EJefZ9f0BF4Gs8OG/oWLbj1IhQmPT0qMD7t5GXR/xcL2KK0tha+ZO2V7feQCWRf+bW24NJtXRXeiTinClyPDPD58WuuDYU/cfKrHXYXMyO0xtDbQtXdObA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599599; c=relaxed/simple;
	bh=9ZCWgBcK36oLyuIJKfAwQKYyFXJfLfPlYGRYAKKqD+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IWIqnCuqHoaEuP3npwKgxbB+atqLugCIPMu8vtRJYKR7ia+67Fp7gp057Q8XgdbjOiq1OFcpsxaeX6IOtbqIk8vkUY7z7hUY8svQ6KwaRRnqMczXblvWfNtme0g4jPrczcPLRrv1cb6GT11q52czh+4+VUFF9JPTP9teC+/bxhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=irtIyVFW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SCZlAX032442;
	Fri, 28 Jun 2024 18:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+TGd4NxWUb+vnHHOLIFtH624luyIYhJeG2CLWe2pN0=; b=irtIyVFWEPkU8ZRW
	8Cciw+cMUIgaKpHp/FPTwr2KYKiHG2BUfJ1APoYNnGTofgQz9uXas4+vkLVuwrBk
	DFzx8B892Px1kHv6U6st/HafNVKfvkcPnPCReSom2ImR+gTqMXOG3bEdSww0O8vk
	q5bPrSgDwXzY9cXz+B42cJpIUtLvyDFtcfQXexeU16OOjUV13BVNxQoYg+h720sD
	oh5jWZKjiHvttwQwfJn5qbyVQM5TmpPs3dt2+od6d847mJPp+x2sQg6L/KZIzisy
	1Y0hiBDX83CIA9K4uc9dUvptG5AT3uZ3b7XPKTFe1pLoWXI2tKoxBIKsZroqtuN6
	d6f2Eg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm5ajq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SIXC5M019241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:12 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 11:33:06 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Sat, 29 Jun 2024 00:02:37 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: sc7280: Add IMX577 camera sensor
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240629-camss_first_post_linux_next-v1-3-bc798edabc3a@quicinc.com>
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
        Hariram Purushothaman <quic_hariramp@quicinc.com>,
        Trishansh Bhardwaj
	<quic_tbhardwa@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719599566; l=1469;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=9ZCWgBcK36oLyuIJKfAwQKYyFXJfLfPlYGRYAKKqD+Y=;
 b=8EsSR5VsE1MtVo3lrfgAbu+5wJ0y2q9X8TLRuLgeJP15vMeYeW7vhPr8HzmKl4244TnVVE12c
 KbImGNoZJjECfnK/NXvL0QxS7jz1LLIq0PXA/cGm4WTwOsVEQQUfMxe
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Aq0GdNa4gXKNr439QoJEsAlF46iVFSsg
X-Proofpoint-ORIG-GUID: Aq0GdNa4gXKNr439QoJEsAlF46iVFSsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_14,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=702 mlxscore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280138

Add support for IMX577 camera sensor for SC7280 SoC.

Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 9ac251fec262..1c99ee09a11a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -5167,6 +5167,39 @@ cci3_sleep: cci3-sleep-state {
 				bias-pull-down;
 			};
 
+			cam2_default: cam2-default {
+				rst {
+					pins = "gpio78"; /*cam3*/
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				mclk {
+					pins = "gpio67"; /*cam3*/
+					function = "cam_mclk";
+					drive-strength = <2>; /*RB5 was 16 and i changed to 2 here*/
+					bias-disable;
+				};
+			};
+
+			cam2_suspend: cam2-suspend {
+				rst {
+					pins = "gpio78"; /*cam3*/
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+					output-low;
+				};
+
+				mclk {
+					pins = "gpio67"; /*cam3*/
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			dp_hot_plug_det: dp-hot-plug-det-state {
 				pins = "gpio47";
 				function = "dp_hot";

-- 
2.25.1


