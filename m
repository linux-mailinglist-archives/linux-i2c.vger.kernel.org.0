Return-Path: <linux-i2c+bounces-6102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788C96AE63
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 04:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC76C1C23E95
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 02:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA3A7F460;
	Wed,  4 Sep 2024 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vw0AZYFI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9497441A;
	Wed,  4 Sep 2024 02:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415511; cv=none; b=LJfXmumZZni1ZvRhKV2uVNsM0MNIZwwmwE1YiviBHTGGkvZFJUylFU3pw3vkTQaErD+U5NB6CUFQAqkT+jE6UZ9hm8kcMr8fbKDfefJVVDaqKydHdoRL/Cnsy8XpIHf8Dfof+V02SQJEsJigaUTv4n6Vrya7PbAyYiJle977vFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415511; c=relaxed/simple;
	bh=DNcwhfvK9gG8J99KHKjs549/2f6hr4jBJOU5E6g7v1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ribNkNeL9+DVVqarqrMYYSqVCqYVLUVHlfVBYk8s+HwSMi8syhNawds2RHP8YpZnE+OwaThMZvIptx1UfATrMNRsstlqisBRTq6PvPLdjflq8fJtVLSDT7onTFxDvG5i9Zjm8ZDTukSgJ8WDCCKMJ4fqRrBDF4SXnSbhzW09Ovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vw0AZYFI; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6c352bcb569so21465246d6.0;
        Tue, 03 Sep 2024 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725415508; x=1726020308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00BScPVM7vUN4VVMkawcgFv7d7Pa7x7HBlBJT3LSuSE=;
        b=Vw0AZYFIM7dH2PEnPRmFkdxLH8wLo7mdfUZzI0wgpRuslNkFfQLerm+i/Rx4WzVxUe
         92x64ImTZoPqIv/ZXMPNf/PlE1pgkjrN3bCsrkI/RHcdnvAfkNIFwoD9wPHChGxdehu+
         oi/RaziJ3wwjNL2UDMiMOOTU/nuBwv4QH3r+cC/oE/lUjOXiIU/m1sbt2wq5azxtvfOm
         syRKQonhDs50i0RjezbtQjHBa0sWCUnQvlceIGgWfsOB/JRdIZ780zM3Sy7D/ta5wWwt
         pGt42PBwJnRgXjID7fk3bt+8zxX0CxVhMr46zDngH50E1QI0juCAQ2+JkghS6sFwv9tV
         aXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725415508; x=1726020308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00BScPVM7vUN4VVMkawcgFv7d7Pa7x7HBlBJT3LSuSE=;
        b=kn/2VT7z2MqUzlDtM4QH2T6h/pqHVeDY8KsDUSMmHiALUKb9AaEKBufTN7M771OjZM
         i87LJbyNmkZS20lVBdL/vtVypgtmeUH6AkjDnUUeJtzViXtggHPKBCKu+aAJCHFbKN0K
         rD8xn1eMwnNu3UqcOhCVUge2rWZFyI9ayofiPUNlavftqch7s23YyHnHVzseMFZOYzzM
         ANRSskaCAiCoHiT9T+tYZzTmGdETPg+didWxV+rM7ocw47QregVXXYsVbVj0ICHyGOG5
         37+YaGyjtTmBE6K0pjfFiXF/Q9FGz+KEg2wlerWZpKrcf9ikKfYeEFyvAMSQS4jpH+Yi
         wFEA==
X-Forwarded-Encrypted: i=1; AJvYcCUJt4kKAI08N8yz9CKx7et9yxiBUpwyA9l51/rWYbNtQJyt3WSm8hBMHZNu6kEqBjzFDVZVHa1Fh5da@vger.kernel.org, AJvYcCUgROIT+cqU3Z50GdaX0HFv7lptUQy5GpY5kXqQjAwAC7JpLE5c8QkY4Kx7U9N4WPBoLqR1krhInENx@vger.kernel.org, AJvYcCV41JhFhVDKIx0eZ5p4LiyeypQyAlV88gG9jcuUVSR9JyZTsv1T8GQzPwuxgkIsSnf2Dt+wpOHfgfW3optwiQ==@vger.kernel.org, AJvYcCVZYKwLPig6SubXpYlXf5aZoO5HljEBMNZxI+70A07ylXTsWVQKAuVIpBuO1tH4B+8/wjeuQEUFEFSn@vger.kernel.org, AJvYcCXGXzBtIu6zjxhsXhzaNmF63mrH+sa5HkSYuMNDuP1TVzQv64q9NbhYMR+5CCePBqFQ5JsE0GL71mtbEBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZUU9crJK2DIWWDPbnLIaqizrQaqgd+mYr9w8T/loFR9GiDUbE
	MQQ4Kq3+9h8UFx0+mT0dUDJewRUMpxZJ4aRXZ+s6tWfKG0zXjhpzW4sd0E3Y
X-Google-Smtp-Source: AGHT+IGci0DDFe4iErJR+HBbxWZ6p5bJ8KPDz3wMiE5rlZfikepMiiMChSyLTWopk0uwCiNtvClV0g==
X-Received: by 2002:a05:6214:2b89:b0:6c3:6e19:aa0f with SMTP id 6a1803df08f44-6c36e19b1femr70487496d6.25.1725415508333;
        Tue, 03 Sep 2024 19:05:08 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::24da])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c356b2de00sm42329506d6.85.2024.09.03.19.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 19:05:08 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 7/7] arm64: dts: qcom: sdm670: add camss and cci
Date: Tue,  3 Sep 2024 22:04:56 -0400
Message-ID: <20240904020448.52035-16-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904020448.52035-9-mailingradian@gmail.com>
References: <20240904020448.52035-9-mailingradian@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 185 +++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 02f87200690a..0b0330975702 100644
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
@@ -1400,6 +1429,162 @@ spmi_bus: spmi@c440000 {
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
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
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
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_AXI_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+			clock-names = "gcc_camera_ahb",
+				      "gcc_camera_axi",
+				      "soc_ahb",
+				      "camnoc_axi",
+				      "cpas_ahb",
+				      "csi0",
+				      "csi1",
+				      "csi2",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "vfe0_axi",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1_axi",
+				      "vfe1",
+				      "vfe1_cphy_rx",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx";
+
+			iommus = <&apps_smmu 0x808 0x0>,
+				 <&apps_smmu 0x810 0x8>,
+				 <&apps_smmu 0xc08 0x0>,
+				 <&apps_smmu 0xc10 0x8>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
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
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sdm670-camcc", "qcom,sdm845-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;
-- 
2.46.0


