Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366BF53048E
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349000AbiEVQ2c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344271AbiEVQ20 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:28:26 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BBC1408A;
        Sun, 22 May 2022 09:28:24 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id F06CDCCD4A;
        Sun, 22 May 2022 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236899; bh=4jjVuNpN2waSexMIPI/UK5ASkvRcWOM8+vg3R0n1bME=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=qk/znrqUl0dRNRrN37oWkvW+SmgwDzcJka9D6MVR/bOqhfiPWkpkKoc7hX6kybh+/
         reJR/aOuWCzi7YGc0WFo9PseyzrbUA2wit0EZexBkPimudCU0ontFGHUVyTRImYcFl
         SpsHynJWihwSqPtlTDd3bzPrlgOUgDhGFeK1pA3I=
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
Subject: [RFC PATCH 11/14] ARM: dts: qcom: msm8974: add CCI bus
Date:   Sun, 22 May 2022 18:27:59 +0200
Message-Id: <20220522162802.208275-12-luca@z3ntu.xyz>
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

Add a node for the camera-specific i2c bus found on msm8974.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 62 +++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index ffa6f874917a..a80b4ae71745 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1434,6 +1434,34 @@ blsp2_i2c5_sleep: blsp2-i2c5-sleep {
 
 			/* BLSP2_I2C6 info is missing - nobody uses it though? */
 
+			cci0_default: cci0-default {
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci0_sleep: cci0-sleep {
+				pins = "gpio19", "gpio20";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci1_default: cci1-default {
+				pins = "gpio21", "gpio22";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci1_sleep: cci1-sleep {
+				pins = "gpio21", "gpio22";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			spi8_default: spi8_default {
 				mosi {
 					pins = "gpio45";
@@ -1587,6 +1615,40 @@ dsi0_phy: dsi-phy@fd922a00 {
 			};
 		};
 
+		cci: cci@fda0c000 {
+			compatible = "qcom,msm8974-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xfda0c000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
+				 <&mmcc CAMSS_CCI_CCI_AHB_CLK>,
+				 <&mmcc CAMSS_CCI_CCI_CLK>;
+			clock-names = "camss_top_ahb",
+				      "cci_ahb",
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
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpu: adreno@fdb00000 {
 			compatible = "qcom,adreno-330.1", "qcom,adreno";
 			reg = <0xfdb00000 0x10000>;
-- 
2.36.0

