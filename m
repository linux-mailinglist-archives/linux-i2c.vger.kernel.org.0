Return-Path: <linux-i2c+bounces-14910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00305CF7A2E
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 10:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFAB6309ADA7
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 09:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91C2320A3B;
	Tue,  6 Jan 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3gfdMg5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCIy3AE+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E82320CA3
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692439; cv=none; b=JNenjaaaDThtcn2qMKoFJOZNyn5fRM7NnMs6e+4ycCZCZQahCJtQoWL617azMdMeoAiHUnlZKdKSvmmRBbSHA3acDp5uJfRTqTBUufLCiP2tFtMAnVrb9eSbQBTseMinkcuqXqNMwgCbPia9GiGTGK+Z5Oe8uMx9yyrvU/rdUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692439; c=relaxed/simple;
	bh=GzbWE4HtR5C1b1RFvKj9bOzbYDSyL9P3GiV/S2H6/8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0UopGLooOnDcRPQVmJZFbwk2GqXzwMuNr3aFqrmJh2oUbKEJWjg6JO1Au2tTr6XwumPV2yWK5bKc/jBszNlaF67elINTl8I8xN11VAnjN/vFJyr4yq4hKfet0Bc91frzTflabUqLvpQ8FW2QMUxAk78lGri9zMsQFD2S/JuozU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3gfdMg5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCIy3AE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QDlR2429882
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 09:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+nv+aowTLPfhLkFxsSphthW/oMeakS2xuIpmkskesQ=; b=f3gfdMg5gytJpNs0
	gwIRFxVkOn0/pt9sRFpbtO6cEL8ED9lU4UakQcPXG+g8MC5d3yoYUzdrMw0nUEKN
	cO4aFspdqB3fEdowaTB21zgMzby/LaE5vBFcaSAYPiF0HEveRBoGC7fUOfH4GfLC
	anaLk7K/gCyYFBuR3+MsNB/kuiifLGsDMRaflhfe8ONVQj7r/hBSIY7VN9I28jig
	TDTFu7305J6rcAAxhiMC4uLEhpHnRejZYLf8VXFQ0A6gezlAt2IwqK23P/act39z
	lCb/RUJjbSZ7BWSIAZuvrDZYRpoVKVzifE+JDShptVpJrHUPJtLf6c+NsmkjYYL8
	VJ+cdw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr739cum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 09:40:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a32bd53cdso29861696d6.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 01:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692430; x=1768297230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+nv+aowTLPfhLkFxsSphthW/oMeakS2xuIpmkskesQ=;
        b=aCIy3AE+lGMT8ATb8tDAAl6fUe+WCzChbzOkrc8mFFdOwQuSgj2AhPyLKH0NBC4+hb
         aQoG8GwPk3dG6a6aUrXQjcUMqqfUxSJsgvZY0H/wTXtuWOiMfiNkoDrIIfWmABBNSQsb
         VwgOx0H7iZfHP6L3ixIvfKiz/nB3zNhNjI9FLOmbnY6Dd7YeoKNd8IOKJRWAmp3qa3G/
         Z8PIlBMQMEY45k23uViSk5pONlJMjxKzKp0R/gc6S5iWa1DX372c6DA2Q+hjPU4v+nF4
         cwacAi8DaY1SqUvML9SrCLnGQAW0nNO/LzO8z1hWK5tGHQEkcuD7lPhDysbHkPuLU5wy
         v1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692430; x=1768297230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E+nv+aowTLPfhLkFxsSphthW/oMeakS2xuIpmkskesQ=;
        b=W6FG8g2AZ8J1WobXqcyshIzDST3fl3CcJtBp7/b50nLGvx3CAPY0Tsrb1DV7qODUk2
         7FhK7rbKzzPzop1t6qiCNvz67Q1OQM3i1twJitwUI08fK0qGR7K1EPetok7fPGNytH3G
         sHrVTIc2M+RTABn6rvKzrU5L6o4zsrbnxnee3XrBw/mlOfClMa0rDTY5ds8Td/nHYCOi
         T//xEJbgtTxD1SD5xeZPv1tyVeeovSUtKnRgWNQFMveqpoeLUj2GbXtmgqT3OHB64uy4
         L/unc2AH7AsQgeEdHS2m43/5LIKkyGgPWdA2LjMxWujb2rwDJSpZA7E89x+Qofefxloe
         b6vg==
X-Gm-Message-State: AOJu0YxhDFIfJIOqAf33tzycJuCWthw8l6B+MbkY5KZStjn3NP2j6DMp
	Xg267NfTd6ycKCe+KN+JWPcfnfEwrxAAWer00HpgOLKUknd6yROO82DxFtni+dsnyXIxH0l8gAa
	BxB2ON3Khghni1f2eG979iRMq7tTm7ihXwtnT67gJTBlVSN9Lk4SiuUx/KL0R5NM=
X-Gm-Gg: AY/fxX6Ht7AxahEPS6mAiZPfdaZQuRD7zart80qYNFFAa9g1fsLmIqg6IrU/Q3Kyeoa
	VoeJuRugjYIhBRgb23sXsaBLUzD6+o0fk8nX1Q79pfcW6BG6o2VRXJu5Brkepjqj6osMns8gtbf
	bdSMVQmy+WDN2Zx0gIvlebpWTpTr3IDpfWoTUpbxSyYeVmrpj488AiJwDxt9wkTFbw7jclyHbuk
	VSAX9cJFR2aOtr7MqdT+GdCK7/S9kK1LAfnfaLpH5ERGo2yugiSy3v/RP9KHVTIO/FlLqCabK5g
	o3VUNRTy1aB/uQ+FB+LsTw4rum34fX5bg7sw854Co4TfvTXE6d418WpB9Tz6yIQTcsDW5vCmldQ
	IGTpn+zS5081AkaUDaSCq56Sjl/kH9yzAfE+A3F8tX4mN/p5iW4zbC1P8kr94rc/S8L5CXxNhzI
	UK
X-Received: by 2002:a05:620a:280c:b0:8b2:d256:d064 with SMTP id af79cd13be357-8c37ebce256mr297202985a.41.1767692429879;
        Tue, 06 Jan 2026 01:40:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzjg417KZ8UQ7XSRkClfJTUyxVpYPdsytNk9Sb1rtVrUkCFtBCKZbzw1xTOiaz70BsWVDmAw==
X-Received: by 2002:a05:620a:280c:b0:8b2:d256:d064 with SMTP id af79cd13be357-8c37ebce256mr297200885a.41.1767692429451;
        Tue, 06 Jan 2026 01:40:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:28 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:39:54 +0800
Subject: [PATCH v2 2/4] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150_evk-v2-2-bb112cb83d74@oss.qualcomm.com>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=2687;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GzbWE4HtR5C1b1RFvKj9bOzbYDSyL9P3GiV/S2H6/8Q=;
 b=gZTQsZ6ESoZqhyEtTpL2UgTR/HbQntYNQpfxYGx9UIGIo8ETk51u0EKjSIQixiJAIGdk1p1RO
 gaMUdCkXGMmDLUhhc8EEur+Gmfe3h+Ap6b+/suLS3vwN/PTxD1HOSvA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cd890 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aTPIHvGNz_4l9C3dtW8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: nwBcYWD7q0PkDHG1rQy4oulgFA9Q0Zk4
X-Proofpoint-GUID: nwBcYWD7q0PkDHG1rQy4oulgFA9Q0Zk4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfX9Z+ubpYosAb9
 BlPMNdbq8Zje7TiznKksXiveUnUieZlcrWUBOd0m75aVD6UoIXuxSjo0WtVxEo/ylkljbbfADbD
 kuZrS5glz/dvghTMRYqjD4BfWwXtYIZ9FpedxExuZqD8VrQoDOpPWDQpJmYjbCDw0e8iEWYLqyK
 zTjK2tVXcGBisDUXcYqpMATS3FQksoq/o73itk+zPPE15Ah071orM865sgvGbkF/qAo68+dsS4J
 ctMyR4gZvP/RLCjPA1t52FFih2CTy2IGP0BJE6+x7nn4JBT2TxoFDXuYgYpIryf6LjElsAIX0VX
 jC2KKIrLeiKXAdg3kiDTi037/NcJTD7/9jpMKq+S9CFFK7Quj2kcN9ERLujdsboXu8XOsVHF/nc
 yfX19BxI5QordrEqFrd2aeU3x+tooOiPKLFZdgvUHh4/NMrrDordmxdeRyS1SkSZu7jJLkzcogF
 d1ULnSfmco4HIWGCSKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060082

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index e1dfaff9b6bf8641b19a685e74d60ad4e1e99d41..461a39968d928260828993ff3549aa15fd1870df 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1549,6 +1549,42 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_default: cci0-default-state {
+				cci_i2c0_default: cci-i2c0-default-pins {
+					/* SDA, SCL */
+					pins = "gpio32", "gpio33";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci_i2c1_default: cci-i2c1-default-pins {
+					/* SDA, SCL */
+					pins = "gpio34", "gpio35";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci_sleep: cci-sleep-state {
+				cci_i2c0_sleep: cci-i2c0-sleep-state {
+					/* SDA, SCL */
+					pins = "gpio32", "gpio33";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci_i2c1_sleep: cci-i2c1-sleep-state {
+					/* SDA, SCL */
+					pins = "gpio34", "gpio35";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3785,6 +3821,42 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000  0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_default>;
+			pinctrl-1 = <&cci_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


