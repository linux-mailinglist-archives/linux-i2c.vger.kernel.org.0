Return-Path: <linux-i2c+bounces-5174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C46949B77
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 00:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739A31C22513
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 22:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4B1176248;
	Tue,  6 Aug 2024 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP94BFlm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D76174EDB;
	Tue,  6 Aug 2024 22:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722984163; cv=none; b=AHtrq2FpY3CBLWKR236qq50weU60Tm+cteRbav3P0H2RgYROr1vx7Oqj5wY8ObY34BrhtVtQsgO0RjyqT3Armts2FnPzxNPAbfkbfwu3CDgT6MzGZO23625gIY7JlrQisFhqXCTD8149JbtBUg4GYYCv6oEoVBQJ/yR1+exC6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722984163; c=relaxed/simple;
	bh=XJOCe/JiSz1vZpcIqEMQ/lx0AYlZnYYYKinT5FjAkL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLs6heAyPBBObm7XUTMfD/8J+FXxWY7NORZRCPz1MK4Sa7RCtih/02pj4zPdaCayEKbjl7h+fsyQ1vp+jY/BCiPZx1iJPq/5fbCT2c/gmwRJkDWbDuMHxsZ4ir8qHzpIegsP+8qzw7r98CpljM5HpktPGut/WM7AuZNNF4zWebA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JP94BFlm; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7093abb12edso708240a34.3;
        Tue, 06 Aug 2024 15:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722984161; x=1723588961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTK25qGEFF6ac4kxh1mLRl3zdqgy/GtWCM4odCganzA=;
        b=JP94BFlmDo3TP+HrgIgOW5rftzQDIIUyAJT1ovhlTRoUEn+qulhodF0L6ao1od6ICj
         /oi/RtAxeNtQMPjBdwFrO/lYCfp1+5z5mO87nAmSkccCM+WySp/CvbV1sD+JX32ra0A9
         LFa/PoFR3wGcAidqRCdgtJB7YVx/vb/l5Z6gW170XObryOExManWekqay0DcmJi5zTx0
         s1v9uCdUPLQ3Vatoe71KBbdarSyYRSrh07gr27KJXSnOhx86n7OvhzaztsuZWPxrH0tc
         UoI0AYkFVkj8dBz9ESswvpnOTezJoF+xsjNdQxSuBBJb+mXxJTScVEOpXpmk5aHYbkA1
         HE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722984161; x=1723588961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTK25qGEFF6ac4kxh1mLRl3zdqgy/GtWCM4odCganzA=;
        b=W5MnQCYhYY9SgNMTn4Rq5+ouUVcpSZSXU1QR7zneRXktzKNSCb3LlJXSOdV3W7Xi9X
         S5rk92aJPQ5SrZOMFWNjz2OoVADXfhSm9CGvf9JSfPvAgZs83l709ZrQxAZnCH4Bfggy
         iD5m84lTGXIVpOpOfkZgGtQIvqJR5H/zEcXTbet+lNVv2lM8Vf58VFgG1bCuwFqn4Q9x
         8zPqDXU5dR8J9WZfVtg+MdrIunAVseBbNR0Qyj4abOKoHIScuzRJI9O2ascf/MSugfzn
         kbWhcghQsIy1vf61Ntd70E6HJP3BtuSe/xb+/Y0y8ZBaqKXrLdlfOwK4IgmMr6vROTbV
         IaDg==
X-Forwarded-Encrypted: i=1; AJvYcCXoSZ16d49Xf2L6CLVbCJlV2ncW3VmWPGEbqoMsAu9OCz6b/133aGYgzpkR3//rJR8LyMbIlX9kb/yGIpBjklHJG0RmvW8MaD3cV9IWxmBn9i0VOQOIQQ9AkDSRngaEP1DkMGNF7Su8lsWnXrEiJvhDh2FDVlCQY+hVsrvXKuXTAzSyEhCgIEBNaC8Yz2XxHi9OrGOXfVcMdOmkP7CHJNzKYg==
X-Gm-Message-State: AOJu0YzRiZVEo4AYvzkqDoA38T1R1iico00u+fkKagV3b7YlgsmXvR59
	O+mpbPzHEgn/2kqrapuAc3TceC2cgBrtI5PBZb+d7ctPvb3DgEEz
X-Google-Smtp-Source: AGHT+IHEu91KJMJzTGW88X4s2/6wIA2k2NAoYgo3bY9dD2UtsMiQ+kz7eKpqM9S/jBK4uaZ+o5hsvA==
X-Received: by 2002:a05:6830:f85:b0:703:6003:11f4 with SMTP id 46e09a7af769-709b3238e28mr18915739a34.14.1722984161064;
        Tue, 06 Aug 2024 15:42:41 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785e2a79sm4072085a.46.2024.08.06.15.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:42:40 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 4/4] arm64: dts: qcom: sdm670: add camss and cci
Date: Tue,  6 Aug 2024 18:42:25 -0400
Message-ID: <20240806224219.71623-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806224219.71623-7-mailingradian@gmail.com>
References: <20240806224219.71623-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the camera subsystem and CCI used to interface with cameras on the
Snapdragon 670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 222 +++++++++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 187c6698835d..3ab5ecbf2faf 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -6,6 +6,7 @@
  * Copyright (c) 2022, Richard Acayan. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -1168,6 +1169,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				pins = "gpio17", "gpio18";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				pins = "gpio17", "gpio18";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_i2c0_default: qup-i2c0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0";
@@ -1400,6 +1429,199 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sdm670-cci", "qcom,msm8996-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0 0x0ac4a000 0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>,
+				 <&camcc CAM_CC_CCI_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "soc_ahb",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			assigned-clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+					  <&camcc CAM_CC_CCI_CLK>;
+			assigned-clock-rates = <80000000>, <37500000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
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
+		camss: camera-controller@ac65000 {
+			compatible = "qcom,sdm670-camss";
+			reg = <0 0x0ac65000 0 0x1000>,
+			      <0 0x0ac66000 0 0x1000>,
+			      <0 0x0ac67000 0 0x1000>,
+			      <0 0x0acaf000 0 0x4000>,
+			      <0 0x0acb3000 0 0x1000>,
+			      <0 0x0acb6000 0 0x4000>,
+			      <0 0x0acba000 0 0x1000>,
+			      <0 0x0acc4000 0 0x4000>,
+			      <0 0x0acc8000 0 0x1000>;
+			reg-names = "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "csid0",
+				    "vfe1",
+				    "csid1",
+				    "vfe_lite",
+				    "csid2";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK_SRC>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
+				 <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cphy_rx_src",
+				      "csi0",
+				      "csi0_src",
+				      "csi1",
+				      "csi1_src",
+				      "csi2",
+				      "csi2_src",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy0_timer_src",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy1_timer_src",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy2_timer_src",
+				      "gcc_camera_ahb",
+				      "gcc_camera_axi",
+				      "slow_ahb_src",
+				      "soc_ahb",
+				      "vfe0_axi",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe0_src",
+				      "vfe1_axi",
+				      "vfe1",
+				      "vfe1_cphy_rx",
+				      "vfe1_src",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_src";
+
+			iommus = <&apps_smmu 0x808 0x0>,
+				 <&apps_smmu 0x810 0x8>,
+				 <&apps_smmu 0xc08 0x0>,
+				 <&apps_smmu 0xc10 0x8>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				camss_port0: port@0 {
+					reg = <0>;
+				};
+
+				camss_port1: port@1 {
+					reg = <1>;
+				};
+
+				camss_port2: port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sdm845-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sdm670-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.46.0


