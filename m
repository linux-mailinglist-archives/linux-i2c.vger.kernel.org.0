Return-Path: <linux-i2c+bounces-12793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2DB4A182
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 07:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F37E61B25BCA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 05:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161D62FFDEC;
	Tue,  9 Sep 2025 05:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i/XTbnkH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E812FF643;
	Tue,  9 Sep 2025 05:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757396917; cv=none; b=OI4ZoBTqjAerUtbamVawMssssMxFgBpDTcZ2KhfLzbD2fxIRGaAcIhEun5TdGrAMfqLsGqPGhgS6wgCDHbGUDPLlfCwOFnbrYYbpcOD3hyCIUEdUdhfLFbEaPk3RWfJ98y9owzPgO1DThTtrKAcJkbvAytFXZj9ivm/iVjeeUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757396917; c=relaxed/simple;
	bh=bXXO3H0v+v2Raj6fofEU6hD1YV8TSbwylg+XFndiOCw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o1Fu1bi0SVf+h3un2VYGR6NvnGKMK9yaZvTgA0b3/CCJZzOveO9E7lGm4b3Xlwtyqs9LNqhPWARCEaOLk9QoLcgEgmHSbPdn0XhA20ATj5ipkoK1m7AOL3clwBuKeeDqAFf7YJ5+wU/qrQnGGVXsuBIUP6feE8QYqpuUntin9Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i/XTbnkH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5895aRrU022382;
	Tue, 9 Sep 2025 05:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dknxw3wNR4wWzoxzNq2cE1MspeyuzkKh6kAvP4rLlIM=; b=i/XTbnkHjOAxhKQD
	AI31f9JWQN3tiNqSFW34YZ7bE1/rxaB2U9t5zMsZdswaQ9UAWyDoYG8nOZA0PcRO
	XL4rK/rTzxZ348PaLSutGrwOCYoDTq2eR4uoF3mTJJmis99Msr6iYlCIVGeW3lGo
	k8wnytbB7KdxIMuaaCzRbR5MkK30u0Uc5Sc+GfAJc+bBgRJP8X+9J0cXNyVCFBzg
	JPSS4ixW6kS+sTNq42lsEknTfERs/GWQFzyrn1XG0cEjBp2vz7rk/h4fh7aDg5Sz
	LvJPHHMyxiijKhYc+GdyCC1/4Nhs0cX1ymn2reGh6EQ/vlNkXHqDwZ0LlQVevbb3
	ws0kTg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfxvtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 05:48:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5895mXxS029552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 05:48:33 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 8 Sep 2025 22:48:29 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_vdadhani@quicinc.com>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: ipq5424: add i2c nodes
Date: Tue, 9 Sep 2025 11:18:11 +0530
Message-ID: <20250909054811.3991901-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909054811.3991901-1-quic_mmanikan@quicinc.com>
References: <20250909054811.3991901-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -izg1lcFbEVsbomWQv_tZ3tgoNvgt4Td
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX3aVm0JAGLQmz
 dyC3891U3HNQCP1buD+afndJ/oYyktoLgo1XXQhUX4KSMTinGxe/in/Kv462x0zcGKQxgPkieS3
 XKESMyXbNTDit5mlJ2rRyniDpzgx+/CBWj1gd0xvUTIuu3n+noD1rCfMgAV0oG4IPxT02aw7OJj
 vwsjUJnojG6R+9VC22gwrLzSTSQ65sX5M/efIFwVORRgNYznLUR7dh2mgW6ImHyiGUaeKnV+ZT4
 /eTDuq8JJnDKJRaNEi1GlDuTxqpvhQpqEfxa8vM9WhlcIn3j+MVhbH7MoGkb0lGOiukZ5aY3Bjh
 vIU49XxIvcYTfvp7tPNDtceTVGPjr4tep4S9FVpTMBS5dRs4fAjUTwj4lnFo64KDCTwVsrcE8Qm
 l1xOCBlK
X-Proofpoint-GUID: -izg1lcFbEVsbomWQv_tZ3tgoNvgt4Td
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bfbfb2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=fvVXwsyH9HWL8OlT880A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

Serial engines 2 and 3 on the IPQ5424 support I2C. The I2C instance
operates on serial engine 2, designated as i2c0, and on serial engine 3,
designated as i2c1. Add both the i2c0 and i2c1 nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
v3: Pick up R-b tag.

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index ef2b52f3597d..81a89e425c20 100644
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
@@ -525,6 +533,26 @@ uart1: serial@1a84000 {
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


