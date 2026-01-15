Return-Path: <linux-i2c+bounces-15182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D833D23E0C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 11:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B29B3030D78
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 10:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4B7361DB0;
	Thu, 15 Jan 2026 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcr/IgYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfrsOW7r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E08361674
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472028; cv=none; b=cJmceN7nP29nFRsCJgF0jjYZRqeN9w6ecCQocjiVMCdx26PiPO8FUMNwoa5La4BpuBL3Pkz8QPS2jDl9TlKhQepN8iYUagnCmBXns0QxPSdPiUrwFoQYN/ofZgrWiYr2q9r6k56fJb2GhN5p6zGN+4zpJ5jsLM+VNcgQH/ZNza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472028; c=relaxed/simple;
	bh=ee7juG52A66Kq9G11MxdDsIfF4O//tB5Jvajm3XXffo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KcXHKfngTRFCMyN8GeEa89Zydp1d6Xc9pqHx1azaIgFhYVONEJingj4bjoemYh5aww0FT/LThFy+VuaXx2KRhI0InxaEHDqzxhsj+yxOZU8u93gH7t73q3fWxEbEVTXw/a0YCnrMocadKcQxgDpPoPO3I1iH1WMcxGPJNU4lbi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcr/IgYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfrsOW7r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F9WpUZ2058110
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=; b=pcr/IgYkpOmqDp2C
	PXcFWpPvaOwlINQQha5P1I3nSFBeNmyLXm9N2+apOkJIIMUfnJJ4HyaXVxeU2mCh
	zNcTHK6JsE2VClegD5gtqM9uafeiCQEleEsgvULHT4VmAb9YGxhTqMBnj2p7xaBZ
	2kWCdWXqA5rIwRdwk3ijVu/58xeVBd1KFK/2ST2zHFypaoAyKpgR/+g6ag5sFXEw
	GmSa4RywY4J5okgFrkKEvpufEXS23AtZqPr1BRQ4DnDc4VYDAvCJCtfXeI358kjd
	7rEVtg0VUMvvTjvEQBQt5YowcMuM30Z3JbZXZlhenY3ZzuBAHpkmWWLdfwkqjdw4
	wh6nCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwpxg4dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ffb4222a4eso18374101cf.0
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 02:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472024; x=1769076824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=;
        b=LfrsOW7rovyRk8+uncoAzdTP0hdEcRuqf4tLECJ8sjP61yQ+J6PrNo/JIiAH0Re+0P
         Q0MjMPZFqTbtZPZTj60Z9HfLTAKOmp8QpbccviGaz4ZkUL2s9PmSzxurK6ml2iVgnra4
         +xYjD0TDB557v5tYiCcsoVRka8zxbRx5iTdOEiuTjpJXF0SWNEdfKxVIwn71ZxQ2ygbr
         MUXH4eJjufbhaQ7w0jSxVneIbsyo+ALFLH2iZrEuCClevhrkDBn7P/FBmZPQlSxaGBlP
         /5Yf7H1c/zqU+XX26UolRPp5AKssXm7cnmCqre4iosVsEL3/LxBWSKHBL6T0Ikl8xCbs
         XFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472024; x=1769076824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=;
        b=BLFmawKQyPS8Jagp/AIixTZ7rWm5ododgIQS1RHVNawallXOcPgXy8jNbtSV4di/2K
         ENNcIKa8OO7+cOc63rqA+D+ewSY5XVP5YU1nL0XQ+vOcfrwWjgnGC8ni50UN38wnh/uM
         0lys//+zNBy/nbU87WTeEiXX3FcmET/nnC8npSPMtfMKDvJb7H3pAmjfxxmrTQ/GiPuE
         9sh3z0GNxwz2GNgAFYUGQG7HwY4kUe1x+HC/T0cHrX1FM9I0vO0Vjuc+ixRTku0QzQjW
         BMrgr08CucIN9gDHO6ZHED7u+3SpMjU6vgFSyQjy4J08A7UHZh+6TZHfzUNwfJQJuvti
         npsw==
X-Gm-Message-State: AOJu0YwqRIyJH/Igi0AWllVAJcYzZv03s4IkaRXaf2FP1SHOPkVeJUlb
	hYo15M2iiPl/I8AkePvEMkjgp2JyKSySDK2c9NlLodk3Tx7GrXb4oPWoFUmOiHkQRxzUki0N7T3
	SkgsjTp/rZrUgwVy4YxYGfieJJfiafABllXnpODEyItzaR4VXGMVI2ztN2V7t+bA=
X-Gm-Gg: AY/fxX4H+QoMhEDgmzD4eUpgAxzMxeKbMso2/emU/G4urZAD/xtgfU6xISUDfdNWE8o
	jMLga9bvxm9Fbx5Rbf6Y/GEmgnttrjmm0AOIBTl0saKkGddIlaR76asXtr7x/+848j+jObBx+cS
	uYbKgAV8FHIibVSe70Adq0TaCorbZK41xKfz0tfclWXJscgIAVSuIA8M6VT+9QrcEFRZ2wRTnRS
	A8Az1rDeNhPAjvVI6f8MTqfBY7f6qHBL0bYD8dnMR14g4QHR56fI6LPxOMFotRz+6TrMNXzTaFs
	i1J2CQD6Bf1fk3kRwJ1HteeaygYaRcBD7pvjCGMFv8LhLVN26rT/44TFZyFPN5a45qmCVJiQzGj
	7rTTiI9+JABQFe5NsJfhx7+57M3oQ0qc0nuUWXfukoSRpCgCcqIg0IA+Le6N5IRRFIg/odp9phJ
	hg
X-Received: by 2002:a05:622a:8c6:b0:4e7:2210:295f with SMTP id d75a77b69052e-501481e483dmr70948641cf.13.1768472023568;
        Thu, 15 Jan 2026 02:13:43 -0800 (PST)
X-Received: by 2002:a05:622a:8c6:b0:4e7:2210:295f with SMTP id d75a77b69052e-501481e483dmr70948331cf.13.1768472023101;
        Thu, 15 Jan 2026 02:13:43 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:42 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:41 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=2955;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ee7juG52A66Kq9G11MxdDsIfF4O//tB5Jvajm3XXffo=;
 b=ZH0SefqJdvjdAesIqr2NusUAYGk9tF2xZ+ky8RoKmgxqsxDaO/y+G2869byWdWgt0OjMxqqMr
 TzpfAs8J96KA0YXTMhM3zrhkPItDDOIxZ7MqFj1QmjhFOsiSeX+QYaZ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=6968bdd8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bL963-9QzuwlG1m339oA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: pp9TpfhWfpGIV638PBUXzDayzPOwMtj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX3if1yXBkjMXN
 LHJVsxRYCCp9zjY7bLHapGIMYh8Bgs4HjTZ0H4QJuI0AnM5FjCVGF8UiHn10qJZ5nvhu9WxvdUN
 txLqYLK7gPoeqt4tWRyNMo08hB1ZWPF1e6wzbY+1GXyAQmYvnr+8dkt9IKMqdSS0WSUlZZVt6Qp
 vBVaMNPdtv5yv+GlPPZC67gbghJdeR8y5tEyuLL1XIKuJHTgiGP5zZTwuqz/E0pCU07w+CoYU4n
 NGvOXop/rvY8T7YQP6sUQdo7AiPzakaOLfWOqfXPtPDTy1DRkZY+wAa9a8Xfnr1L99vx6xUWKe+
 D2uYu12ajw5hwLRGnfY5pdgmJ3YtYYaDlzaRQehd4GW8LFTciVQyqURUzxyKN7MK/7He5zC5Pb7
 DKuRkhI+XqZn2ABt3jur1Yc/LHonlm+odzhieU1/3K9vdUVgn9Jrd+UiB7Z/ojRG7hvt22DxM4Z
 TSdCM/Ra1xp0aKpxwsA==
X-Proofpoint-ORIG-GUID: pp9TpfhWfpGIV638PBUXzDayzPOwMtj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtbo-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
+talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


