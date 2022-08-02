Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C2F587F21
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Aug 2022 17:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiHBPkX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Aug 2022 11:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbiHBPkR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Aug 2022 11:40:17 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C0321834
        for <linux-i2c@vger.kernel.org>; Tue,  2 Aug 2022 08:40:08 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z25so22550912lfr.2
        for <linux-i2c@vger.kernel.org>; Tue, 02 Aug 2022 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=54qGZ5ZtcQLmbPgrY9r61txc+HSHHzp+1aVpwosOhFg=;
        b=KbkrfsFx1CLARK2mO6QEEYEilbFtrSH16CB1lUAEp6DPy3veI1uxqdWYWeso30e2Vk
         vFzPpoZFZFdY+4jXENjHpikimOalS7QAsEtYXmJg6vduKi5F5Z5K9v3NHfGA0bg0H3ZB
         gMTRlXQboZHgI8XRWRwKDx0Dj1bwjRss00diD9ZsrzwXUps5Kbq/wu8cKBg1nzAK558z
         NvtzMNTS7W+I9u5eGKCD2F7O4Ck7SoyeByf0KvZi7at74JrB0MOnulKq0TUQf/LQDso7
         xfLx/1whPIHwSD5BbgPM4e9/xe52yVOvARwyH15C3ppOBE3Tvk729JApianqBYy0ayaq
         3IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=54qGZ5ZtcQLmbPgrY9r61txc+HSHHzp+1aVpwosOhFg=;
        b=i2+Oky1KeEBBK50wFAKAdrVOwD8rrQ+gYXKkdYR+93n4eRWYhdwrKIRUwKw69Xjf6F
         wIZPNzrGTaBtSHbgU3hWNaJCrzR4X+mqR7wrkg6oZSXKO4GlxL3dVMBsGBEIhUAgDz2c
         NEnSKJ7GcVECoQxJNX5M/lgXr7lJ+8VR5E39Od5/7LPQ6PxSKbtjfWxz8VZbHp6zw7Qo
         nHlYu7unSs4S5S2x1AM7EkHhDP2/wkuSLoPIaZI6T2p/kgdmDSYPB2fByS3J4PVyw1yb
         quDbD936lSzQ7RmoLvHl6YHMw+3ocSLpns41OxYeUbYXKvCunZ6lVes37uJLDEdF2zO/
         wb2w==
X-Gm-Message-State: AJIora+UMcouA5XtiIqKYIZUdVOg2SxwG/xtqWO2v91NYviib0amE2eK
        UDiCVgfoi/u5JZJWlGrKqfepDlK6zWyqxw==
X-Google-Smtp-Source: AGRyM1sUEAZ8IGSI0gRQ0uUJbPt0qOg4rWpgcB8wkEnVLcLiyAeS0M9vgT7ebXPt9ip/HEVoYEqk+Q==
X-Received: by 2002:a05:6512:3b82:b0:48a:a3f4:abae with SMTP id g2-20020a0565123b8200b0048aa3f4abaemr8120077lfv.155.1659454807145;
        Tue, 02 Aug 2022 08:40:07 -0700 (PDT)
Received: from krzk-bin.. ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512074200b0048b06f34566sm407669lfs.76.2022.08.02.08.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 08:40:06 -0700 (PDT)
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
Subject: [PATCH 4/5] ARM: dts: qcom: use GPIO flags for tlmm
Date:   Tue,  2 Aug 2022 17:39:46 +0200
Message-Id: <20220802153947.44457-5-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts           | 3 ++-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi            | 3 ++-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi            | 4 ++--
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts          | 5 +++--
 arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts | 2 +-
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 3051a861ff0c..91716298ec5e 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/gpio/gpio.h>
 #include "qcom-msm8974.dtsi"
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
@@ -261,7 +262,7 @@ &sdhc_1 {
 &sdhc_2 {
 	status = "okay";
 
-	cd-gpios = <&tlmm 62 0x1>;
+	cd-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&pm8941_l21>;
 	vqmmc-supply = <&pm8941_l13>;
 
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
index 03bb9e1768c4..0505270cf508 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
@@ -14,6 +14,7 @@
  *
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include "qcom-ipq4019.dtsi"
 
 / {
@@ -72,7 +73,7 @@ spi@78b5000 {
 			pinctrl-0 = <&spi_0_pins>;
 			pinctrl-names = "default";
 			status = "okay";
-			cs-gpios = <&tlmm 54 0>;
+			cs-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
 
 			mx25l25635e@0 {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
index 44a9597d8bfd..c2f5222e72de 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
@@ -87,7 +87,7 @@ spi@78b5000 { /* BLSP1 QUP1 */
 			pinctrl-0 = <&spi_0_pins>;
 			pinctrl-names = "default";
 			status = "okay";
-			cs-gpios = <&tlmm 12 0>;
+			cs-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
 
 			flash@0 {
 				#address-cells = <1>;
@@ -100,7 +100,7 @@ flash@0 {
 
 		pci@40000000 {
 			status = "okay";
-			perst-gpio = <&tlmm 38 0x1>;
+			perst-gpio = <&tlmm 38 GPIO_ACTIVE_LOW>;
 		};
 
 		qpic-nand@79b0000 {
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
index c7a6e77da272..7fc33149060c 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
+#include <dt-bindings/gpio/gpio.h>
 #include "qcom-ipq4019-ap.dk07.1.dtsi"
 
 / {
@@ -10,7 +11,7 @@ / {
 	soc {
 		pci@40000000 {
 			status = "okay";
-			perst-gpio = <&tlmm 38 0x1>;
+			perst-gpio = <&tlmm 38 GPIO_ACTIVE_LOW>;
 		};
 
 		spi@78b6000 {
@@ -50,7 +51,7 @@ spi@78b5000 {
 			pinctrl-0 = <&spi_0_pins>;
 			pinctrl-names = "default";
 			status = "okay";
-			cs-gpios = <&tlmm 12 0>;
+			cs-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
 
 			flash@0 {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index ec5d340562b6..6daceaa87802 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -175,7 +175,7 @@ i2c-gate {
 			ak8963@f {
 				compatible = "asahi-kasei,ak8963";
 				reg = <0x0f>;
-				gpios = <&tlmm 67 0>;
+				gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
 				vid-supply = <&pm8941_lvs1>;
 				vdd-supply = <&pm8941_l17>;
 			};
-- 
2.34.1

