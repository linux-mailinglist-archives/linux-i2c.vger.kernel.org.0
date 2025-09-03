Return-Path: <linux-i2c+bounces-12572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9044AB41813
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 10:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 799BF179E54
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 08:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9A12E7BBD;
	Wed,  3 Sep 2025 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OKxm9u5g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10CC2EAB98;
	Wed,  3 Sep 2025 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756887025; cv=none; b=CqDjsxBmJjSuuwcTwaEmnBsUIxJMK51SZuBp16uV9ahOVdNqHUpBakue02AZwx2Qy9goIOZ0Ud4Uu9pTY2P41jZlw1RoNeWoRUctDwZny8JbGOreaxQUyTX/iwyL5Z0ZhrMOGzrB4GzHWwY1bv8J8xbJgjiHCIZxNFxNn0WEqWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756887025; c=relaxed/simple;
	bh=4XxNXMCtP+0UFGsELPfxjk/UT5QryuVz3UbxbhJYews=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kv7Rx4aYf2Y6xV35eK+pPsDPv6udfiDGtX7IU5mYTUQK4g2yRgARwPia26QJyU2EhuY3FV7t8m6RHYZcwx/KSyLuWTH5ji81g3kkDB9mai89KHav5RGvYpH9TiR7rkMhspNAmb4wtYI4905LqiasGInKwSMAVfV4DCpufLZhCGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OKxm9u5g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832Ucuw019740;
	Wed, 3 Sep 2025 08:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGgkCKgxJSPoqAojbJbakGTTfWHHsWtUjXMAF1vAHEU=; b=OKxm9u5gVFVRMP0x
	voNqhSu0Z3lIQu/C46/h4Is7zhbNfhKsBKy4+oRZuKTO/n/yR+56gB2wGy14jup0
	/sa6j35PJ1iC3FH+1ZQCoFtDHGnH4U9UxCXv3rle0XNN0olJODIk5Z8EX18wg1o/
	foUtbTdIviEZk5sXcjW4bmmVrIGRZJM4cIN0NvFWRyQJbCJuLurP4Ts40GJEc4kA
	rqJFZkaEbXXUaUqxHQM67xzEsCuGQzZtfMgibXLSO1zvzrI6hUyjnItRLtjkNLGD
	LAfDWiuyVWEaMSBwyXnj8X28zHECG80rg5/kvshff9Y+LRodG23vox0NBvbiSl/N
	2ioz/g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw02tbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:10:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5838ABfd013861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 08:10:11 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 3 Sep 2025 01:10:07 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_vdadhani@quicinc.com>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: ipq5424: add i2c nodes
Date: Wed, 3 Sep 2025 13:39:48 +0530
Message-ID: <20250903080948.3898671-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903080948.3898671-1-quic_mmanikan@quicinc.com>
References: <20250903080948.3898671-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MGK7SCmoDPa-9T4uTS6iGohWB9CssDX6
X-Proofpoint-ORIG-GUID: MGK7SCmoDPa-9T4uTS6iGohWB9CssDX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX5Zw3u+L1V91x
 O09x9JU538h+6IdvKIxLBiKMtLk/6/p1UlfWzNa66FoLmIaBhDfxROfOoFHDP3kEzG6Bh666ZHs
 nxoFyGU9wMR/6lHhYFMyw4EdgZ94qJuEGl47StnLDPEYfV14sVPmAkk4lvGjZPKavC84Rpbm/jj
 1shUxC886PFjilfoaiOV8OO2JqX9TeEzM/0MYaYg7CzCXf5djwcQxNGh3dI2ESjK/OX374gbzv4
 z5TInVxPTU7brrkErbcRNrD7a4iqx9Bf+70bmNr5mMWuq4HiHnG1BRBwvlqDaPF+ifiyyPVsXSR
 lz4Z2xruYSqTwtzcqe+2uj3crMeZTGpeyPmd4d+LXmI7w+jXL/lsPtqZN+fdGZseokhdhCrUFCQ
 0wlI2Duk
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b7f7eb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=5VfnTfZ0KsacMTR8VH4A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Serial engines 2 and 3 on the IPQ5424 support I2C. The I2C instance
operates on serial engine 2, designated as i2c0, and on serial engine 3,
designated as i2c1. Add both the i2c0 and i2c1 nodes.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
v2: Remove assigned-clock and add opp table to configure the frequency of se clock

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 67877fbbdf3a..0d8ea9a8c600 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -173,6 +173,14 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	i2c_opp_table_64mhz: opp-table-qup64mhz {
+		compatible = "operating-points-v2";
+
+		opp-64000000 {
+			opp-hz = /bits/ 64 <64000000>;
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -519,6 +527,26 @@ uart1: serial@1a84000 {
 				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x01a88000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_I2C0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_64mhz>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x01a8c000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_I2C1_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_64mhz>;
+				status = "disabled";
+			};
+
 			spi0: spi@1a90000 {
 				compatible = "qcom,geni-spi";
 				reg = <0 0x01a90000 0 0x4000>;
-- 
2.34.1


