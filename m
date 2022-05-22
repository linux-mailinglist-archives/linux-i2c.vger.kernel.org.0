Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5B35304B3
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349798AbiEVQaA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349919AbiEVQ3N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:29:13 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BE43BBC2;
        Sun, 22 May 2022 09:29:01 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id C260BCCD4C;
        Sun, 22 May 2022 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236900; bh=IgPmeXh7eVwr5HxZ2OomHFKNX8KpazVLkhoxxY0pExM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=c4i9i5n8jBgfDVKePplF1mJyCQ/ynI+kLQKvgP50y5sbU9Z1GPJ4G7mLcnnM7GTgB
         PpLG8h4PsyQxOiB4gL3hf4OMzvaZO3xtwgQEKbWVbnuvdRH3wE9xgAOtWoQUdEoIdk
         oDSbNoV9vWuSFXT1oSqjBubD2zua86FWq4HVTLlw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com, Luca Weiss <luca@z3ntu.xyz>
Subject: [RFC PATCH 13/14] ARM: dts: qcom: msm8974-FP2: Add OV8865 rear camera
Date:   Sun, 22 May 2022 18:28:01 +0200
Message-Id: <20220522162802.208275-14-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220522162802.208275-1-luca@z3ntu.xyz>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Configure the rear camera found in the 8MP camera module for
Fairphone 2. There's also a AD5823 autofocus coil and an EEPROM present
on the module but currently not included.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 .../dts/qcom-msm8974pro-fairphone-fp2.dts     | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
index 0fad82fc9e03..9a2c3a9177de 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
@@ -77,6 +77,60 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&camss {
+	status = "okay";
+
+	vdda-supply = <&pm8941_l12>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <0 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&ov8865_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	ov8865: camera-sensor@10 {
+		compatible = "ovti,ov8865";
+		reg = <0x10>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&mclk0_pin_a>;
+
+		clocks = <&mmcc CAMSS_MCLK0_CLK>;
+
+		avdd-supply = <&pm8941_l17>;
+		dovdd-supply = <&pm8941_lvs3>;
+		dvdd-supply = <&pm8941_l3>;
+
+		powerdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		/* Rear camera */
+		orientation = <1>;
+		rotation = <90>;
+
+		port {
+			ov8865_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <0 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
 &dsi0 {
 	status = "okay";
 
@@ -413,6 +467,15 @@ pm8941_l24: l24 {
 			regulator-max-microvolt = <3075000>;
 			regulator-boot-on;
 		};
+
+		pm8941_lvs3: lvs3 {
+			/*
+			 * TODO: Used as CCI0 and CCI1 pull-up.
+			 * Replace with vbus-supply or similar once this lands
+			 * upstream!
+			 */
+			regulator-always-on;
+		};
 	};
 };
 
@@ -449,6 +512,13 @@ &smbb {
 };
 
 &tlmm {
+	mclk0_pin_a: mclk0-pin-active {
+		pins = "gpio15";
+		function = "cam_mclk0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	panel_pin: panel {
 		te {
 			pins = "gpio12";
-- 
2.36.0

