Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33AF44687C9
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379071AbhLDVyc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 16:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379214AbhLDVyO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 16:54:14 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C90AC0613F8
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:50:48 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id v11so13610425wrw.10
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K3czBnhF20hlEpxNiPEsab7v5hRpy0g/kc9Op3PQw6E=;
        b=ZkRzTnvt4ql3CNJptSHFHFnqI6C0lMOaG5TjlPGifpfU50QCdUjEzFiS7b6rEhmKvr
         8nuIX6W7DrSblZO7lPHCnTUzn5zNW93DeVQY4qXa3CkOigSRLyBmAYwF9TpTIC/NMwAf
         IYud44IcJYiTXYQmsNrsE4ApFzhHRB5NADKQc9xmQt7FWH8+8/P77xyW8QY3o5g/yTTK
         h2sQlAI/KPcD/13lQEA/3fTPK4ajIYxuyf5+VsAhXwMP2O0+t0kjTxXybL4VCvITsjeC
         SaobDJfJpOJZ7dxJ85gr8F7WBYqNfdtxCMg94cHPPD/wrHE9DuQxx9P/aZuC+GWWXanF
         VUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K3czBnhF20hlEpxNiPEsab7v5hRpy0g/kc9Op3PQw6E=;
        b=sRXG7aLcBpoKSbeFxfFNMvnGBO1sZVvO0gb7GzVA/hLCAFWYLkBA/ne8XvkuhCw/3y
         YbuXAYwNWO0FvSzFIgKRrW0Vsh+GN+jz5eQXiXxZ+1jj63aRVx9/x/L4zpf/yrPEji1P
         QW+JMA5y2aMXnqIONDirDBlhtnYvQJOOBbRU41cTewX5VF1If7Y2I0oUAGBoIhiyMuOz
         LCQEvDC73KN9qGhtftat1caaQ6lGPb50qRxObntIvuoI7ttOULTQmA1d7Kh9uXmhAAlJ
         pzD9ci4ixbZve4HsZwzuXoV6uEryUGWJKwb6YrCw2/CfEaLz+UkocCLZV8EwTeEryqHg
         jHZQ==
X-Gm-Message-State: AOAM531zbR6sNJsBXxgOyTjtcGbi/FDXKxE8GoopTHMqNqCmMB5+/8i/
        ezh8bAdmkFJLKCLWZcnxI3c3nQ==
X-Google-Smtp-Source: ABdhPJwYgQXAcOt8EZ1YPq7ydpSLx6y+FyyhU59Ff+vkJaMhr6uqXvFRjh/OIA+LCk2bppXI13r9eg==
X-Received: by 2002:adf:fa81:: with SMTP id h1mr30980791wrr.27.1638654646727;
        Sat, 04 Dec 2021 13:50:46 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id r17sm7385255wmq.11.2021.12.04.13.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:50:46 -0800 (PST)
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
Subject: [PATCH v2 8/8] arm64: dts: exynos: Rename hsi2c nodes to i2c for Exynos5433 and Exynos7
Date:   Sat,  4 Dec 2021 23:50:33 +0200
Message-Id: <20211204215033.5134-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204215033.5134-1-semen.protsenko@linaro.org>
References: <20211204215033.5134-1-semen.protsenko@linaro.org>
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

