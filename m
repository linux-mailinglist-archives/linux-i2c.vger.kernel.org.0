Return-Path: <linux-i2c+bounces-7391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3CB99E8BC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 14:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01F6E1F23A73
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 12:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E6E1EF95B;
	Tue, 15 Oct 2024 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JA9dPEho"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C861EC00A;
	Tue, 15 Oct 2024 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994113; cv=none; b=LtWnzVFtw5Ev5VvWPh8J69oHs9dHrtC8O/tWU3uUftdjbdOXPdaZ4UYWEhD4tSmMF1TUZaZKBcZ60Mcyiuzft5hnIT3yk5lJXZxCkDzT6Eo0p7nmhCSJ7HWugVQbW3uRHVnD7N5ZXuV1HFhIsbT8KJmjo4+Lv+vTBOuUh+WCXqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994113; c=relaxed/simple;
	bh=sixd0htXLi4lq/+g5Wakv0O4vqNjU4vtXkII29g7DXM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9UvfeZP40wK8ydLc2nKmehKJaLgs36ZVqmCdloEvED6qnd+H4PfjFaVPpm0C16XNZLN2sZTOWEF0CH768P3VOpQMMwnefC/uHgLOHzyKJGT+iPGULiFbUdKuqiNMwbQMlSFTE4jaWiorPZwqAmZWFsO23iglTFWTsFDRswopro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JA9dPEho; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FAjba0022751;
	Tue, 15 Oct 2024 12:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zr0xCzl94Flfb4GNKrmacllY
	32cztycHSo5tJP0qt2Q=; b=JA9dPEhodvGEM56P/aMR2JS2WygD2LgZ5N+ABjNF
	bFWUY1OjIBUjjCl/aK6cjGyjKYNLQfwxNdEoF8lnoCIneYsJnl/DkVYNZKlETuHp
	5Z1/8tj8S734LMYvnlxAzcol7NAEdz5GzvDduTMPhGO4GuJqtzy+2hgEVb7jmc3N
	7lzrNUCNQHmLtYUIxdHe8KksQENQecBXcQ7fhHPJLVQQh/t8AJlgbJnk/nAoMqb2
	v54bXARoTuw+XC0DqJgmdBbD5a/ycibkKjuQUhLDWngCi4iUs12wPQbDlLHErMlB
	wxH2kf/K0kHItkdwZnHbkAyR80zd94uauKGpuE1cHRkkBA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g2rqg2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 12:08:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FC8LOB002234
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 12:08:21 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 05:08:16 -0700
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
Subject: [PATCH v1 2/5] arm64: dts: qcom: Add support for configuring channel TRE size
Date: Tue, 15 Oct 2024 17:37:47 +0530
Message-ID: <20241015120750.21217-3-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: X6G_FitGyw9X2VxUdzoYGsYIxqQ7wTX0
X-Proofpoint-GUID: X6G_FitGyw9X2VxUdzoYGsYIxqQ7wTX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150082

When high performance with multiple i2c messages in a single transfer
is required, employ Block Event Interrupt (BEI) to trigger interrupts
after specific messages transfer and the last message transfer,
thereby reducing interrupts.
For each i2c message transfer, a series of Transfer Request Elements(TREs)
must be programmed, including config tre for frequency configuration,
go tre for holding i2c address and dma tre for holding dma buffer address,
length as per the hardware programming guide. For transfer using BEI,
multiple I2C messages may necessitate the preparation of config, go,
and tx DMA TREs. However, a channel TRE size of 64 is often insufficient,
potentially leading to failures due to inadequate memory space.

Adjust the channel TRE size through the device tree.
The default size is 64, but clients can modify this value based on
their heigher channel TRE size requirements.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 132 +++++++++++++--------------
 1 file changed, 66 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402..c7c0e15ff9d3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1064,7 +1064,7 @@
 		};
 
 		gpi_dma0: dma-controller@900000 {
-			#dma-cells = <3>;
+			#dma-cells = <4>;
 			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0 0x00900000 0 0x60000>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
@@ -1114,8 +1114,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C 64>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1135,8 +1135,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI 64>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1174,8 +1174,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C 64>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1195,8 +1195,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI 64>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1234,8 +1234,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C 64>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1255,8 +1255,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI 64>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1294,8 +1294,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C 64>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1315,8 +1315,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI 64>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1354,8 +1354,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C 64>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1375,8 +1375,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI 64>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1414,8 +1414,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C 64>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1435,8 +1435,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI 64>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1474,8 +1474,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C 64>,
+				       <&gpi_dma0 1 6 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1495,8 +1495,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI 64>,
+				       <&gpi_dma0 1 6 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1534,8 +1534,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C 64>,
+				       <&gpi_dma0 1 7 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1555,8 +1555,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI 64>,
+				       <&gpi_dma0 1 7 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1579,7 +1579,7 @@
 		};
 
 		gpi_dma1: dma-controller@a00000 {
-			#dma-cells = <3>;
+			#dma-cells = <4>;
 			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0 0x00a00000 0 0x60000>;
 			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
@@ -1629,8 +1629,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C 64>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1650,8 +1650,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI 64>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1689,8 +1689,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C 64>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1710,8 +1710,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI 64>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1749,8 +1749,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C 64>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1770,8 +1770,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI 64>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1809,8 +1809,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C 64>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1830,8 +1830,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI 64>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1869,8 +1869,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C 64>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1890,8 +1890,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI 64>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1929,8 +1929,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C 64>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1950,8 +1950,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI 64>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1989,8 +1989,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C 64>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -2010,8 +2010,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI 64>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -2049,8 +2049,8 @@
 							"qup-memory";
 				power-domains = <&rpmhpd SC7280_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
-				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C 64>,
+				       <&gpi_dma1 1 7 QCOM_GPI_I2C 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -2070,8 +2070,8 @@
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
-				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI 64>,
+				       <&gpi_dma1 1 7 QCOM_GPI_SPI 64>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
-- 
2.17.1


