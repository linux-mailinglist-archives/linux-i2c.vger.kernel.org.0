Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0B4F12D75F
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2019 10:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfLaJXa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Dec 2019 04:23:30 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34225 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfLaJXa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Dec 2019 04:23:30 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so34723866wrr.1
        for <linux-i2c@vger.kernel.org>; Tue, 31 Dec 2019 01:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Vblv5LQYK0UdrRNc3BaK4/YCI0e3o6x+HZlNV5gbBAc=;
        b=nCMF+ruXNt+bZxp2o0LxaZ0LB6ihnQxMus3aNO121bmqxATMSOS6k9hV68RLYRblCK
         xoJ0ItmII4mn44ROY/C08Jfb7pjA5TBwNUU5RHNPaq0vnBxtwlDu7/Ld+6Vq3HqvFTt/
         8Fr+QY5OgWSz5tgiSpsG+5s5qqQ/sa3NSj7eBz1rISj7zrUnrAmsp1CKjETfZy1CiFov
         F+ciMQNc3qPQ7ZMn+Akij8RXfeD8Bb+NEqzYiTImUd9TgFR7BwvC8qGVfmWrbQZQo1Sn
         hSIvPbrmd+wbReOnajpnLN04H0yrYIJ/6JTSiMR1memDgRHVGOq1yBvrGVawxjmYDXd+
         Mcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Vblv5LQYK0UdrRNc3BaK4/YCI0e3o6x+HZlNV5gbBAc=;
        b=g6uxycT6hY1Lx5rL/pd1Ji8zmq/c+g2wwntxt085MPxS4BxdGlNr/Ppi0vNc6Zxp+B
         bxQe9vwYhR7RYzPsJ2TJ67sRXZoX2rMwquOMDtBYY9DWBN9lJI7/1NY6E0mu9hC6tcYE
         pV3TXg7WfEl4756SMDd+xtQf9KZGS63qn0A11zsm1gJEwwlJNrwHtsOFxryhadBEUzZa
         zak+oGZ5kasWKF/3gk082WZ0Kl3/7UzRyGQ1rbZ+QVMOSJWy7e7jeLp+QegrNlT76Czu
         qfVZFAakgJNDQ6OWwUd63cMTcMh87tE7nD5IG9KS6LEyyqeWTjRE6Fqbwsdn+7BLGbRq
         x58Q==
X-Gm-Message-State: APjAAAVz0kNbrVbeFDbHzDbLK+vTy0DeIHmX2Kw2Y4eiznkNeFvMPXtH
        dA9V1DdTSBbOWFZeK4knJyDScw==
X-Google-Smtp-Source: APXvYqzJbFXoYfz2M5fWsDkTgf0isrCne0Echoge3MHrdoDpPCkcvs9Sb7Lko14KUC2ZgDOFpPrxBg==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr70050083wrn.280.1577784207865;
        Tue, 31 Dec 2019 01:23:27 -0800 (PST)
Received: from lpoulain-ThinkPad-T470p.home (amontpellier-651-1-422-191.w92-133.abo.wanadoo.fr. [92.133.205.191])
        by smtp.gmail.com with ESMTPSA id f1sm48153410wro.85.2019.12.31.01.23.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 31 Dec 2019 01:23:27 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de, robh+dt@kernel.org
Cc:     vkoul@kernel.org, todor.too@gmail.com, linux-i2c@vger.kernel.org,
        bjorn.andersson@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: apq8016-sbc: Add CCI/Sensor nodes
Date:   Tue, 31 Dec 2019 10:26:37 +0100
Message-Id: <1577784397-28682-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577784397-28682-1-git-send-email-loic.poulain@linaro.org>
References: <1577784397-28682-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add cci device to msm8916.dtsi.
Add default 96boards camera node for db410c (apq8016-sbc).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: add this patch in the series

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 75 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi     | 27 +++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index e12a36c..9860286 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -494,6 +494,81 @@
 		wcnss@a21b000 {
 			status = "okay";
 		};
+
+		camera_vdddo_1v8: fixedregulator@0 {
+			compatible = "regulator-fixed";
+			regulator-name = "camera_vdddo";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		camera_vdda_2v8: fixedregulator@1 {
+			compatible = "regulator-fixed";
+			regulator-name = "camera_vdda";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-always-on;
+		};
+
+		camera_vddd_1v5: fixedregulator@2 {
+			compatible = "regulator-fixed";
+			regulator-name = "camera_vddd";
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-always-on;
+		};
+
+		cci@1b0c000 {
+			status = "ok";
+			i2c-bus@0 {
+				camera_rear@3b {
+					compatible = "ovti,ov5640";
+					reg = <0x3b>;
+
+					enable-gpios = <&msmgpio 34 GPIO_ACTIVE_HIGH>;
+					reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&camera_rear_default>;
+
+					clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+					clock-names = "xclk";
+					clock-frequency = <23880000>;
+
+					vdddo-supply = <&camera_vdddo_1v8>;
+					vdda-supply = <&camera_vdda_2v8>;
+					vddd-supply = <&camera_vddd_1v5>;
+
+					/* No camera mezzanine by default */
+					status = "okay";
+
+					port {
+						ov5640_ep: endpoint {
+							clock-lanes = <1>;
+							data-lanes = <0 2>;
+							remote-endpoint = <&csiphy0_ep>;
+						};
+					};
+				};
+			};
+		};
+
+		camss@1b00000 {
+			status = "ok";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					csiphy0_ep: endpoint {
+						clock-lanes = <1>;
+						data-lanes = <0 2>;
+						remote-endpoint = <&ov5640_ep>;
+						status = "okay";
+					};
+				};
+			};
+		};
 	};
 
 	usb2513 {
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e10..7e90e80 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1451,6 +1451,33 @@
 			};
 		};
 
+		cci@1b0c000 {
+			compatible = "qcom,msm8916-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1b0c000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_CLK>,
+				<&gcc GCC_CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb", "cci_ahb",
+				      "cci", "camss_ahb";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+					  <&gcc GCC_CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80000000>, <19200000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&cci0_default>;
+			status = "disabled";
+
+			i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: camss@1b00000 {
 			compatible = "qcom,msm8916-camss";
 			reg = <0x1b0ac00 0x200>,
-- 
2.7.4

