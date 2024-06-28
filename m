Return-Path: <linux-i2c+bounces-4482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEDA91C5C6
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5647286BBA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B091CCCD3;
	Fri, 28 Jun 2024 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pChDzUGD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD7B1CD5BE;
	Fri, 28 Jun 2024 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599595; cv=none; b=XOg9LqHB5QyiiBQe8rGTrJiRR1cL18gtUTGwbhFuuttSvzbE5NZTPh6NZZglR6zBHVGs7jr0vIEabhBBXu53BpQ3XANFR8KttauwDVHQWAy70JTwct9rfVz7UzOcs+dZ71ElCSLkul8DiuDNwoTxB8HE+UXkZZ4t3jTCcekO4+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599595; c=relaxed/simple;
	bh=T/nYD0hvutr/Nkf0GtWfokLifTj/dlrIqGu3gEF0miY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=U70jaePGNo2REL4UZSwBcwhzXk8ChnU1y7pDl6apZd97R2AEhvdhcDWifs7t8Fe52sKj8I8XzcdO/G834g3TnZ+24PaqasH3QeOLk5rGQGuKhyDBaflltpr/GsWnyyF8pg4qMDHkT0eHAl7JIwgIs7o50VOmquQ5ELnLuzedS8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pChDzUGD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SD3EOM031405;
	Fri, 28 Jun 2024 18:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jaLeF5zowLj56oKQWX0YfEMM3JE45KlNXy26NozBgk=; b=pChDzUGD8lfEtIyX
	LHgAgqqxZocnw9IigzneWWMy8HD4ymlmb7CiYd8IayG9/IfBVW2hR6NQrBHiWSfn
	uIaSZOtn1dmzL23cIvvY9x8UdDIrnktKaPZ6spt5etov9VjC+dWb6EIOmqoFykyF
	rSbaUrUd0BKA7XTDWOC3lLtjuV5uRtuAyC7vxdTvcgMOUL04YVGU+UrvIJGG0d9w
	9J8MLuR7WjKNpIIe05lXfD1SxmesPaPAU8c7eEnuh9PD27tGzCyXiI+AzQ+OvTDQ
	7RNrSHrvrH907uanN8VgFKxqJgw5RlwMvOcZob4DFQki5hMWGLRQ7A5PNKwQqGLz
	ubeK6A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm5ajpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SIX6S5030074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:06 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 11:33:00 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Sat, 29 Jun 2024 00:02:36 +0530
Subject: [PATCH 2/6] arm64: dts: qcom: sc7280: Add support for camss
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240629-camss_first_post_linux_next-v1-2-bc798edabc3a@quicinc.com>
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
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Trishansh Bhardwaj
	<quic_tbhardwa@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719599566; l=6004;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=T/nYD0hvutr/Nkf0GtWfokLifTj/dlrIqGu3gEF0miY=;
 b=AV1skkp87yTNwWgnouIDXnZmDuUBaWY+baaFXopOp5Ey98QlJUVdaHOS1x/YxmlAOGKiXdT/N
 kXC1gaNcUmhBbT64wyDD/3JGe+iFYTe97qQYs8GwGyre17szfzMD7Fs
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: STps6usgV1kHgaqZKS54yc8ECtYDb3LB
X-Proofpoint-ORIG-GUID: STps6usgV1kHgaqZKS54yc8ECtYDb3LB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_14,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=892 mlxscore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280138

This change adds camera subsystem changes.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 182 +++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index f8256d5a8f6b..9ac251fec262 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4415,6 +4415,188 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: camss@acaf000 {
+			compatible = "qcom,sc7280-camss";
+
+			reg = <0x0 0x0acaf000 0x0 0x5200>,
+			      <0x0 0x0acb6000 0x0 0x5200>,
+			      <0x0 0x0acbd000 0x0 0x5200>,
+			      <0x0 0x0acc4000 0x0 0x5000>,
+			      <0x0 0x0accb000 0x0 0x5000>,
+			      <0x0 0x0ace0000 0x0 0x2000>,
+			      <0x0 0x0ace2000 0x0 0x2000>,
+			      <0x0 0x0ace4000 0x0 0x2000>,
+			      <0x0 0x0ace6000 0x0 0x2000>,
+			      <0x0 0x0ace8000 0x0 0x2000>;
+
+			reg-names = "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_IFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_2_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_2_CLK>,
+				 <&camcc CAM_CC_IFE_2_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_0_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_1_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_0_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_1_CLK>;
+
+			clock-names = "cam_hf_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "camnoc_axi_src",
+				      "camnoc_axi",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy0_timer_src",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy1_timer_src",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy2_timer_src",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy3_timer_src",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy4_timer_src",
+				      "vfe0_csid",
+				      "vfe0_cphy_rx",
+				      "vfe0",
+				      "vfe0_axi",
+				      "csiphy_rx_src",
+				      "vfe1_csid",
+				      "vfe1_cphy_rx",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe2_csid",
+				      "vfe2_cphy_rx",
+				      "vfe2",
+				      "vfe2_axi",
+				      "vfe0_lite_csid",
+				      "vfe0_lite_cphy_rx",
+				      "vfe0_lite",
+				      "vfe1_lite_csid",
+				      "vfe1_lite_cphy_rx",
+				      "vfe1_lite",
+				      "vfe_lite0",
+				      "vfe_lite1";
+
+			iommus = <&apps_smmu 0x800 0x4e0>;
+
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0";
+
+			interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sc7280-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.25.1


