Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81AC44687F9
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379621AbhLDWCL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 17:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345345AbhLDWBx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 17:01:53 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2DBC061359
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:58:26 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id y196so5168361wmc.3
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TQEb5+4d/MHt4xPSobaL7ml5ouD0gEGBDjqG0G4xX9M=;
        b=bMvib3+0+Wys7m2opfbcYMtwZH0h9iF7p5WHE975CgOxfIggqJfOAwhbBGQiOkpmLp
         Y7yrLRbn730nzfj7KgrVmU1ut8gDYH3Fh0l/e/Bje+IE62QakfP23MEcqkdYEPG9VF9q
         Ean/drejcExfdq6JZQdEa8CRmITPgg/mQ4YSk6PHwnja3k2790wCXwB1TowknWC5Bjq2
         9iwwAgaoij7yFXiepCq8DjpEE2YbgnJ9NWvg4I0UqvnY3KME+H0d7h0/Hunl4soe+P3U
         wYrCB/WjFHO10eut0MjupN93G9AD3QAA1DPPrlk4jWunAW6PSkJOXdBtk2wj2X4qzASk
         uokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQEb5+4d/MHt4xPSobaL7ml5ouD0gEGBDjqG0G4xX9M=;
        b=VVkzwfPKK7h9tWZabu1HdiMw+FvMvUHlLfjjF6zw81+sf7wpVLmvcepx4Xp/TFei8h
         RqctfRg+EUVIlfvdiAcs+5ihcZs9wlnEfZPU4WXNGAF4dcXquWmdzHGd7wIYhkRGGQzP
         sH6bWVwBbqCxuwxoeD1O6OCFB8+qkyzdIAlzULLbUDJm8g+CUBZ+SuHeV3Wrsx86GNzF
         qtMqeHut+WXHn989sX7VvviCw+09nDD4d+oj0+VrJ+qypeCOmaWkmijb64LW9dn1/FSU
         D1++qM2JeP/ZF0IzN11VR8kQtl6RcyEnN/IeU3hZ2GDj6fXB/Nc3RKdJrx+hmTWW2Evw
         M3rg==
X-Gm-Message-State: AOAM530R/zE0VoK46bIXjcikRtavlnL5NBy0nj6a/lHqy1wbRYMm3sy9
        bR2qcmDifYjkXhr7ekoeZkArzg==
X-Google-Smtp-Source: ABdhPJxsmUmcm4wGrsq5SHc9haax2YPJ+pJMSSGHPb093CeXkzhok2gdt19LICBfpHEVXblBur9Cbw==
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr25771329wmb.90.1638655105330;
        Sat, 04 Dec 2021 13:58:25 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id q8sm6570843wrx.71.2021.12.04.13.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:58:24 -0800 (PST)
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
Subject: [PATCH v2 RESEND 3/8] dt-bindings: i2c: exynos5: Add bus clock
Date:   Sat,  4 Dec 2021 23:58:15 +0200
Message-Id: <20211204215820.17378-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204215820.17378-1-semen.protsenko@linaro.org>
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In new Exynos SoCs (like Exynos850) where HSI2C is implemented as a
part of USIv2 block, there are two clocks provided to HSI2C controller:
  - PCLK: bus clock (APB), provides access to register interface
  - IPCLK: operating IP-core clock; SCL is derived from this one

Both clocks have to be asserted for HSI2C to be functional in that case.

Modify bindings doc to allow specifying bus clock in addition to
already described operating clock.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Added 'clock-names' property to 'required:' in case of ExynosAutoV9
  - Added example for two clocks case

 .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 59 +++++++++++++++++--
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index bb6c22fbc442..19874e8b73b9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -18,9 +18,6 @@ description: |
   define USI node in device tree file, choosing "i2c" configuration. Please see
   Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml for details.
 
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -49,11 +46,16 @@ properties:
       clock-frequency is >= 1MHz.
 
   clocks:
-    maxItems: 1
-    description: I2C operating clock
+    minItems: 1
+    items:
+      - description: I2C operating clock
+      - description: Bus clock (APB)
 
   clock-names:
-    const: hsi2c
+    minItems: 1
+    items:
+      - const: hsi2c
+      - const: hsi2c_pclk
 
 required:
   - compatible
@@ -61,6 +63,31 @@ required:
   - interrupts
   - clocks
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov9-hsi2c
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - clock-names
+
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
@@ -84,3 +111,23 @@ examples:
             reg = <0x66>;
         };
     };
+
+  - |
+    #include <dt-bindings/clock/exynos850.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    hsi2c_2: i2c@138c0000 {
+        compatible = "samsung,exynosautov9-hsi2c";
+        reg = <0x138c0000 0xc0>;
+        interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&cmu_peri CLK_GOUT_HSI2C2_IPCLK>,
+                 <&cmu_peri CLK_GOUT_HSI2C2_PCLK>;
+        clock-names = "hsi2c", "hsi2c_pclk";
+
+        pmic@66 {
+            /* compatible = "samsung,s2mps11-pmic"; */
+            reg = <0x66>;
+        };
+    };
-- 
2.30.2

