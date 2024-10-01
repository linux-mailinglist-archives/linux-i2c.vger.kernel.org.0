Return-Path: <linux-i2c+bounces-7111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F175698B246
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 04:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE614282E37
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 02:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA236CDCC;
	Tue,  1 Oct 2024 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7m42Ag2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893803A267;
	Tue,  1 Oct 2024 02:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750211; cv=none; b=me6OTnvQIns7VA978zxO6Tv6EcXu/yK+QG/P0r5METu9zAmTUCqMjGi2QlR+0L+jriHtNFnCAAXFj67kQHlJlwnaLBnqekfOwkhCfMsBBIxKFHzILKiVRJZUi2+uHOQ4VWqTzlKOBpypbjFjYMVPG1eyFT+U/9CenrwkD+uijYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750211; c=relaxed/simple;
	bh=RUzfem2+A+6X/IbGCFdAYXlDUmmSXdAtuhH7PjAg9Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSvsjlK/qy6QXZmcwkxK7qgli5oVfiMWOtmsUaXi2IxRpyIDp/Hj1XtbOy4l7nEX2PjL8G12ShaF6prXXZnCqdN/tSecSmkqRzosqoKRpn5Nm250T/5OKyr30xjHVxDcizLzGIW4Eushh17lS4p+N7H8J+4IdGwPwlRiDTKVGms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7m42Ag2; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7acd7d9dbefso600101885a.3;
        Mon, 30 Sep 2024 19:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727750208; x=1728355008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvE1bk25FPWJ1QwZ3W8oNtHHuv+uTz4I7G4xaEVim6M=;
        b=m7m42Ag2pOrZCbpaeVh+xmfbVpDYxKfl3PCSvleyr3HgkSES02BJBsSBtVaU1pj9xn
         HXufTUDICpJNOPHwfeidCLzdMHSulavWUF+SXROqvDS/3LaxRutTjM7rnjtgwdJC4KM4
         Q+wIpiTO/+aHUwFzq+dAtmOWlMtrS7yIDjqRwBwFJeQntd3IHXwLTEHroAg/fQ0ne0ck
         bQ5QV9IuawOc4X3wAK9QchBMg0mzypapstPAZsmVx9NGB146z4xkgdNe5Wq+1lOhk3lC
         /TKbLdpONRmM7PHvIDMn57iTbODCzI3ywq13ovs0rc54WUso77M4OquDbSymMwPzRRso
         5zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727750208; x=1728355008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvE1bk25FPWJ1QwZ3W8oNtHHuv+uTz4I7G4xaEVim6M=;
        b=kSvuPOp78Q2QFTHJ7Wahe6slHTcNnh8cCZDv4unOT1CDqTBUSRuzSiq3WsrrZ4puPB
         AhpUGTIE78fn7pautnJM7kY5OTclqmOSpTO2oC8lVVYNga5ueeXDnUPMRszrvwhQjPZk
         CRqONaGQIgjsD8v8NkKsnZvMp+sh4sDW7DKtTOfPFS0sm3Rfp1k548JOurV6+bUoRqmi
         JC2dcfdZNcWniWzAxFHHi0JCHzQxmZ38HfZxIogV3bTqUAbIZij2RANtXFMO7brjIB8l
         P4o/OyOgg871nFV7S8iRM4+x718uylp3XI+SMRP8r6sAYLM8cmjFMTwO6YsEZ/N6BBYf
         xPFg==
X-Forwarded-Encrypted: i=1; AJvYcCUNaGVK/StmR26EyfHbEtQLnxuFmyVGedbKTr35g+fw4LpfepUFrEu99PcruFie2UidvShsiYVv0jRRvlw=@vger.kernel.org, AJvYcCV3T3IFooRXyMmDS198BEMioWM0gYhs/1Jt0/tOG0nYqBr4E3jtDMBU8iEyF0pIee0FOSRezvcWB6RA/OBMww==@vger.kernel.org, AJvYcCW3PlFKR2Riu0rWkGXwvKYDevSKAieVnryVXkpAYZT3bACKscgazGlsnd1EKMsyZdZ0H/3IgdLI0D95@vger.kernel.org, AJvYcCX4RIvZdAbJb6hF0ZdkuBWlHpoahYqJ23c44JaqHjojTA9NlEvM+GSF8bGKsJfXDjLUSWTx5+JBPjDH@vger.kernel.org, AJvYcCXf+VKECcH7n4+7fmQmmOVv7JIeZbMznwLWt+3u1g6K4+3Bv7VbApE1p5IBK3gBu+PD0WKMKC85Uqve@vger.kernel.org
X-Gm-Message-State: AOJu0YwWO4fO2zHVkLfdHKgPg9DVixj8Ei5hQzOyaQJMRI5NeWlgDtV5
	xlCUZWCf6y6/BkFeQupDuY/sQVco2CNHsSnWmyY8u+9KpKPaRlUB0ZZGTeUf
X-Google-Smtp-Source: AGHT+IGNUqg0hfxOcyGETnBGMq5zhNJSkpMojzUxGvdbwCaDBmGSxkwKmQ4Q8I2ALZy9X92Ycu2/wA==
X-Received: by 2002:a05:620a:1791:b0:7ac:9aa1:b64d with SMTP id af79cd13be357-7ae378dd74emr2340578485a.57.1727750208340;
        Mon, 30 Sep 2024 19:36:48 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::1a17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377bc91asm463743385a.25.2024.09.30.19.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 19:36:47 -0700 (PDT)
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
Subject: [PATCH v5 7/7] arm64: dts: qcom: sdm670: add camss and cci
Date: Mon, 30 Sep 2024 22:35:28 -0400
Message-ID: <20241001023520.547271-16-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241001023520.547271-9-mailingradian@gmail.com>
References: <20241001023520.547271-9-mailingradian@gmail.com>
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
index 02f87200690a..d1b84c9f7481 100644
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
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
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
2.46.2


