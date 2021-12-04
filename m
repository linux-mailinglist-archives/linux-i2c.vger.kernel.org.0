Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291754687EF
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379606AbhLDWCC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 17:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355804AbhLDWCA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 17:02:00 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00371C0611F7
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:58:33 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id i5so13727814wrb.2
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K3czBnhF20hlEpxNiPEsab7v5hRpy0g/kc9Op3PQw6E=;
        b=BwaXfdv9uHPs4/S9MCysQwKfbqm+jRls2xetHfv7k/INNCJY1MZBG0P+Yyt5CQjUq1
         iU7tVhKGQFyzhFoJKl/sUovosGLTdgjRG74tuvqJDkvHEFx+n+oqqVOidF4qjTyLHNCX
         JbZHOcGWBoFRF7LuHNldZGos/kJOhKprlYgjjSfAssUdeiTrvm6Z2hIEqrzu9q13MPD7
         yiIhQK2gjPaHsurlqNkQ66hUejwvGBndWaqjVzbt2wv32/jz8jIjvJbkyyrQkVuQCRIw
         QTxAkBnCH5w6Kjudbw3GheGJh/Pu0c/XUQTJ1Iz5krkIekpmonrFKVEb/pCrawhyYXaz
         BM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K3czBnhF20hlEpxNiPEsab7v5hRpy0g/kc9Op3PQw6E=;
        b=PTLK3Ph4KoDxNelN+doB2glY6LvVEdrr6lMaX/w6oc+GeTJwBi/jCCv360uh/SQr9/
         ReT7nbatdzwGgBnB3eGg2afxWKZ+zh9z+4Kna9cGadEMXjATdeG0gNt0QbfmniLTOwAq
         ASy4Z7OvaoILx/DzhIsh3AomR2utcWS/t9n3ZeIikkTfFnKTjQAtpOWBdB9QheLs/YEp
         esesWaiqsHYkP03AYPpHn2QacAERDMJLH7Myqm9stD+9vnWplK+oLSuR31fMlr3oQHG2
         W+W+86UUHiSNhHV7t3nC4pcs+o9eY3yzsG588xn6l+X53Hiv35KZbX0eKMCADjNeaTjk
         XVGQ==
X-Gm-Message-State: AOAM532KgIUsmNc7BrmufeabA6yoB1bW8b0hOw2nPUGWNsutyuuCErCc
        vAX03UGoBNIw+v46jWES17SDVg==
X-Google-Smtp-Source: ABdhPJzRzXh9PoQKBWgC49dO5zw8dDQvG3kBQOHpIfzrNE0X2J0p6J5ntD0kS+faZJyLGgscMtRqxw==
X-Received: by 2002:adf:e512:: with SMTP id j18mr31678383wrm.532.1638655112603;
        Sat, 04 Dec 2021 13:58:32 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id a10sm9315145wmq.27.2021.12.04.13.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:58:32 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 RESEND 8/8] arm64: dts: exynos: Rename hsi2c nodes to i2c for Exynos5433 and Exynos7
Date:   Sat,  4 Dec 2021 23:58:20 +0200
Message-Id: <20211204215820.17378-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204215820.17378-1-semen.protsenko@linaro.org>
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In Device Tree specification it's recommended to use "i2c" name for I2C
nodes. Now that i2c-exynos5 dt-schema binding was added, it shows some
warnings like this when validating HS-I2C nodes:

    hsi2c@xxxxxxxxx: $nodename:0: 'hsi2c@xxxxxxxx' does not match
                                  '^i2c(@.*)?'
    From schema: Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml

Rename hsi2c@* to i2c@* to fix those warnings.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - This patch was added in v2

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 24 +++++++++++-----------
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 24 +++++++++++-----------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 4422021cf4b2..bfe4ed8a23d6 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1585,7 +1585,7 @@ pwm: pwm@14dd0000 {
 			status = "disabled";
 		};
 
-		hsi2c_0: hsi2c@14e40000 {
+		hsi2c_0: i2c@14e40000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e40000 0x1000>;
 			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
@@ -1598,7 +1598,7 @@ hsi2c_0: hsi2c@14e40000 {
 			status = "disabled";
 		};
 
-		hsi2c_1: hsi2c@14e50000 {
+		hsi2c_1: i2c@14e50000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e50000 0x1000>;
 			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
@@ -1611,7 +1611,7 @@ hsi2c_1: hsi2c@14e50000 {
 			status = "disabled";
 		};
 
-		hsi2c_2: hsi2c@14e60000 {
+		hsi2c_2: i2c@14e60000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e60000 0x1000>;
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
@@ -1624,7 +1624,7 @@ hsi2c_2: hsi2c@14e60000 {
 			status = "disabled";
 		};
 
-		hsi2c_3: hsi2c@14e70000 {
+		hsi2c_3: i2c@14e70000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e70000 0x1000>;
 			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
@@ -1637,7 +1637,7 @@ hsi2c_3: hsi2c@14e70000 {
 			status = "disabled";
 		};
 
-		hsi2c_4: hsi2c@14ec0000 {
+		hsi2c_4: i2c@14ec0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14ec0000 0x1000>;
 			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
@@ -1650,7 +1650,7 @@ hsi2c_4: hsi2c@14ec0000 {
 			status = "disabled";
 		};
 
-		hsi2c_5: hsi2c@14ed0000 {
+		hsi2c_5: i2c@14ed0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14ed0000 0x1000>;
 			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
@@ -1663,7 +1663,7 @@ hsi2c_5: hsi2c@14ed0000 {
 			status = "disabled";
 		};
 
-		hsi2c_6: hsi2c@14ee0000 {
+		hsi2c_6: i2c@14ee0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14ee0000 0x1000>;
 			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
@@ -1676,7 +1676,7 @@ hsi2c_6: hsi2c@14ee0000 {
 			status = "disabled";
 		};
 
-		hsi2c_7: hsi2c@14ef0000 {
+		hsi2c_7: i2c@14ef0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14ef0000 0x1000>;
 			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
@@ -1689,7 +1689,7 @@ hsi2c_7: hsi2c@14ef0000 {
 			status = "disabled";
 		};
 
-		hsi2c_8: hsi2c@14d90000 {
+		hsi2c_8: i2c@14d90000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14d90000 0x1000>;
 			interrupts = <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>;
@@ -1702,7 +1702,7 @@ hsi2c_8: hsi2c@14d90000 {
 			status = "disabled";
 		};
 
-		hsi2c_9: hsi2c@14da0000 {
+		hsi2c_9: i2c@14da0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14da0000 0x1000>;
 			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
@@ -1715,7 +1715,7 @@ hsi2c_9: hsi2c@14da0000 {
 			status = "disabled";
 		};
 
-		hsi2c_10: hsi2c@14de0000 {
+		hsi2c_10: i2c@14de0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14de0000 0x1000>;
 			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
@@ -1728,7 +1728,7 @@ hsi2c_10: hsi2c@14de0000 {
 			status = "disabled";
 		};
 
-		hsi2c_11: hsi2c@14df0000 {
+		hsi2c_11: i2c@14df0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14df0000 0x1000>;
 			interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index c73a597ca66e..c3efbc8add38 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -359,7 +359,7 @@ pinctrl_bus1: pinctrl@14870000 {
 			interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		hsi2c_0: hsi2c@13640000 {
+		hsi2c_0: i2c@13640000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x13640000 0x1000>;
 			interrupts = <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>;
@@ -372,7 +372,7 @@ hsi2c_0: hsi2c@13640000 {
 			status = "disabled";
 		};
 
-		hsi2c_1: hsi2c@13650000 {
+		hsi2c_1: i2c@13650000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x13650000 0x1000>;
 			interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
@@ -385,7 +385,7 @@ hsi2c_1: hsi2c@13650000 {
 			status = "disabled";
 		};
 
-		hsi2c_2: hsi2c@14e60000 {
+		hsi2c_2: i2c@14e60000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e60000 0x1000>;
 			interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>;
@@ -398,7 +398,7 @@ hsi2c_2: hsi2c@14e60000 {
 			status = "disabled";
 		};
 
-		hsi2c_3: hsi2c@14e70000 {
+		hsi2c_3: i2c@14e70000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e70000 0x1000>;
 			interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>;
@@ -411,7 +411,7 @@ hsi2c_3: hsi2c@14e70000 {
 			status = "disabled";
 		};
 
-		hsi2c_4: hsi2c@13660000 {
+		hsi2c_4: i2c@13660000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x13660000 0x1000>;
 			interrupts = <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>;
@@ -424,7 +424,7 @@ hsi2c_4: hsi2c@13660000 {
 			status = "disabled";
 		};
 
-		hsi2c_5: hsi2c@13670000 {
+		hsi2c_5: i2c@13670000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x13670000 0x1000>;
 			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
@@ -437,7 +437,7 @@ hsi2c_5: hsi2c@13670000 {
 			status = "disabled";
 		};
 
-		hsi2c_6: hsi2c@14e00000 {
+		hsi2c_6: i2c@14e00000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e00000 0x1000>;
 			interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
@@ -450,7 +450,7 @@ hsi2c_6: hsi2c@14e00000 {
 			status = "disabled";
 		};
 
-		hsi2c_7: hsi2c@13e10000 {
+		hsi2c_7: i2c@13e10000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x13e10000 0x1000>;
 			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
@@ -463,7 +463,7 @@ hsi2c_7: hsi2c@13e10000 {
 			status = "disabled";
 		};
 
-		hsi2c_8: hsi2c@14e20000 {
+		hsi2c_8: i2c@14e20000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e20000 0x1000>;
 			interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>;
@@ -476,7 +476,7 @@ hsi2c_8: hsi2c@14e20000 {
 			status = "disabled";
 		};
 
-		hsi2c_9: hsi2c@13680000 {
+		hsi2c_9: i2c@13680000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x13680000 0x1000>;
 			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
@@ -489,7 +489,7 @@ hsi2c_9: hsi2c@13680000 {
 			status = "disabled";
 		};
 
-		hsi2c_10: hsi2c@13690000 {
+		hsi2c_10: i2c@13690000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x13690000 0x1000>;
 			interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
@@ -502,7 +502,7 @@ hsi2c_10: hsi2c@13690000 {
 			status = "disabled";
 		};
 
-		hsi2c_11: hsi2c@136a0000 {
+		hsi2c_11: i2c@136a0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x136a0000 0x1000>;
 			interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.30.2

