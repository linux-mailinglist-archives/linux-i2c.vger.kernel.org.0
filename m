Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7C1587F1B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Aug 2022 17:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbiHBPkL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Aug 2022 11:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbiHBPkJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Aug 2022 11:40:09 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7120D1D0DD
        for <linux-i2c@vger.kernel.org>; Tue,  2 Aug 2022 08:40:07 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t1so22498146lft.8
        for <linux-i2c@vger.kernel.org>; Tue, 02 Aug 2022 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6U0K0h4XfCxZ6J88e7aNUQxYgHcQqggkH+1chvRPQrA=;
        b=NELq2s9YVjKFC0Zg3wUCSM5EfibpG68Oh5KtmFcV2J3SB8SekFdPhgcXQdX14jYTK4
         sW4Ta1Xo9RuEMyAYsN81qJObrjWKGpjPtOpqBxx65+9gHtohFSllO0j1IkIvscOQ86gV
         1fROcfZW5QDI4U+Ozux/OHjBgSUxmi1R6YMSsoGoXQjdCvzMJPyMT2xcYT+5g4GF6scN
         EWFMPONp97dEssVj0N5Ct2aCUc1uJwEHbIqcdWp6IxYpg0fH6Dk228BHMjMrNqWiydDo
         42XKZH5sL9KamcEAg8s1sU/TRRfgfaQFGIVM80ywNLfJINP1CX5m98601MCcnPhpllbm
         hlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6U0K0h4XfCxZ6J88e7aNUQxYgHcQqggkH+1chvRPQrA=;
        b=GkBskBAFYwTjJugCQSmVE8h4/Z5J2i2WbATpaXEt9f5o/zeNqWywGmTJXpMiFm9BGh
         U2CkAavh+fZEtVOSnT88W+MNZjmbHkUhOK5Jy9tgVSLtm5RBgDgycdRoLbY035JoHY+g
         BYhnlF0zFKVF61xoLR9Uqs6GE0f9/vpKb8Zb9UdluReoR5uwUPWbb1frBSB9G8whcExY
         D6K/EQFo168ZBlOWffpp63OzvVqsnVC9pv5vsTChnxl3fgvEWQdPnC551/is+BAIVVuo
         ZmmgshvfhiG7FLcdhwiDCU6qgHHHbsH1zml64dffTtpmaB44obqROuXUdiMd3Z52VBxy
         riCQ==
X-Gm-Message-State: AJIora/lDaM1JrW8O4T9rZxwwKELP3vkwI68U+TvmYcvxX//Isl3+8mp
        Nt69otdHOOwlFRDIc1+Hf+w7Fw==
X-Google-Smtp-Source: AA6agR5t1E3bEfgdy3JYeJ7AgQkrUCDx1qVi1ExbWCxlf3PshWe2xgu+y3rowdsDBbkZWlrhDGRGWQ==
X-Received: by 2002:a05:6512:33c4:b0:489:da1c:76cc with SMTP id d4-20020a05651233c400b00489da1c76ccmr8303662lfg.237.1659454805247;
        Tue, 02 Aug 2022 08:40:05 -0700 (PDT)
Received: from krzk-bin.. ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512074200b0048b06f34566sm407669lfs.76.2022.08.02.08.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 08:40:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     corbet@lwn.net,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/5] arm64: dts: qcom: use GPIO flags for tlmm
Date:   Tue,  2 Aug 2022 17:39:45 +0200
Message-Id: <20220802153947.44457-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
References: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use respective GPIO_ACTIVE_LOW/HIGH flags for tlmm GPIOs.  Include
gpio.h header if this is first usage of that flag.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts               | 2 +-
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi                      | 3 ++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi                      | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                 | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts       | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts       | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts           | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts                    | 2 +-
 10 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
index 567b33106556..92f264891d84 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
@@ -368,7 +368,7 @@ &sdhc2 {
 
 	bus-width = <4>;
 
-	cd-gpios = <&tlmm 38 0x1>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vreg_l13a_2p95>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index f430d797196f..ff60b7004d26 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -471,7 +471,7 @@ &sdhc1 {
 &sdhc2 {
 	status = "okay";
 
-	cd-gpios = <&tlmm 100 0>;
+	cd-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
 	vmmc-supply = <&pm8994_l21>;
 	vqmmc-supply = <&pm8994_l13>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 8bc6c070e306..86ef0091caff 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,gcc-msm8994.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8994.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 
 / {
@@ -502,7 +503,7 @@ sdhc2: mmc@f98a4900 {
 			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
 			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
 
-			cd-gpios = <&tlmm 100 0>;
+			cd-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
 			bus-width = <4>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 742eac4ce9b3..0815b31c9e10 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/interconnect/qcom,msm8996.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -3337,7 +3338,7 @@ wcd9335: codec@1{
 					interrupt-names = "intr1", "intr2";
 					interrupt-controller;
 					#interrupt-cells = <1>;
-					reset-gpios = <&tlmm 64 0>;
+					reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
 
 					slim-ifc-dev = <&tasha_ifd>;
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index f313f6964810..dff49e3dfe56 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1081,7 +1081,7 @@ &wcd9340{
 	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
-	reset-gpios = <&tlmm 64 0>;
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
 	vdd-buck-supply = <&vreg_s4a_1p8>;
 	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
 	vdd-tx-supply = <&vreg_s4a_1p8>;
@@ -1251,7 +1251,7 @@ camera@60 {
 		reg = <0x60>;
 
 		// CAM3_RST_N
-		enable-gpios = <&tlmm 21 0>;
+		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam3_default>;
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 82c27f90d300..0f470cf1ed1c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -546,7 +546,7 @@ &wcd9340{
 	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
-	reset-gpios = <&tlmm 64 0>;
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
 	vdd-buck-supply = <&vreg_s4a_1p8>;
 	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
 	vdd-tx-supply = <&vreg_s4a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 7747081b9887..6a2b98c23628 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -126,7 +126,7 @@ vreg_tp_vddio: vreg-tp-vddio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 
-		gpio = <&tlmm 23 0>;
+		gpio = <&tlmm 23 GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
@@ -712,7 +712,7 @@ &wcd9340 {
 	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
-	reset-gpios = <&tlmm 64 0>;
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
 	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
 	vdd-buck-supply = <&vreg_s4a_1p8>;
 	vdd-tx-supply = <&vreg_s4a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index a7af1bed4312..be59a8ba9c1f 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -772,7 +772,7 @@ &wcd9340{
 	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
-	reset-gpios = <&tlmm 64 0>;
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
 	vdd-buck-supply = <&vreg_s4a_1p8>;
 	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
 	vdd-tx-supply = <&vreg_s4a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index b0315eeb1320..f954fe5cb61a 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -704,7 +704,7 @@ &wcd9340{
 	pinctrl-names = "default";
 	clock-names = "extclk";
 	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
-	reset-gpios = <&tlmm 64 0>;
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
 	vdd-buck-supply = <&vreg_s4a_1p8>;
 	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
 	vdd-tx-supply = <&vreg_s4a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 7ab3627cc347..a102aa5efa32 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -635,7 +635,7 @@ &soc {
 	wcd938x: codec {
 		compatible = "qcom,wcd9380-codec";
 		#sound-dai-cells = <1>;
-		reset-gpios = <&tlmm 32 0>;
+		reset-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
 		vdd-buck-supply = <&vreg_s4a_1p8>;
 		vdd-rxtx-supply = <&vreg_s4a_1p8>;
 		vdd-io-supply = <&vreg_s4a_1p8>;
-- 
2.34.1

