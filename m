Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B5E4687BB
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378395AbhLDVyK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 16:54:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379027AbhLDVyH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 16:54:07 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96CF9C061751
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:50:40 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso4851963wmr.5
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TQEb5+4d/MHt4xPSobaL7ml5ouD0gEGBDjqG0G4xX9M=;
        b=ECrseyDNNiY7Jwt+Xpb95sq8CIAnKyFzaRW+DibI3Q3GeQPg8mlokWxa3tJAFNUm6U
         WxPnaJERAUPu024PUz2kuQMEqfRwhOCDhJkc2wZmI3uh4s1JU2qE+iL0EeE+Wacl91wc
         /ZwPaOMlrhVMG9mNoLLOQdF/bmBGhOsKOuIPd0lkWl6cKeS2IT9xuxeUIqHCttu/stXJ
         NcClP+N+R8aY/KrUmmX3tR5XZo0gaRYa+dQyvnxsi+HHA6uyhP/WK4Y8T4k5Psp2BBbK
         7mFx3CsBP6Oqvu0r/9OKxVls24ohgGvFb6H3EL+cJdTd2VyP3+Vo/QwU+VosyTF1+zpq
         tG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQEb5+4d/MHt4xPSobaL7ml5ouD0gEGBDjqG0G4xX9M=;
        b=iJPSuW8FY5BLNMG7P4/Yt9GuWsKTwf2BEvht+u1gW4QURElcLGEwpn0D4lP7DHeOZJ
         7gdi8u3fDO33etr/ejs1cpgT0TH+jaSf2gIbnEobSl3Fyn/hvylRVQIb0v3OGu9oOcSD
         D7kZamCJ+B6AyharyXuBd5qC/LiLg+MlWbPNQ/GaZjWW7zQkScY3jR4rh/TwZKco6g25
         YPVL1y8wnhN53zkGAyX7bcPUQ8ci3g9aJcrwtTH2KU6NgG4TtHXkJT/ck/6I0UdpNJbv
         D48ciIL/EVWMKW6LHbCq9kXg4eBlThUWPNrWIaEWZTp2ind5UrscXlGLdWNEruYMypHj
         k1fg==
X-Gm-Message-State: AOAM530z1w6MdVk3EXhfQRcbNXZ4mk0O6ghEdjSDz2B6R8HbciLNCxpZ
        u5o6C/CsgIwUbxcfELwbMEnr0Q==
X-Google-Smtp-Source: ABdhPJxqRgJbV168k4fnJHdw2UcyHL8bbzlF0Cak39dQhBh69mgkctv1/i1FtQtFYRLA5dH1VU4tMA==
X-Received: by 2002:a7b:c102:: with SMTP id w2mr25979442wmi.151.1638654639205;
        Sat, 04 Dec 2021 13:50:39 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id j40sm6699184wms.16.2021.12.04.13.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:50:38 -0800 (PST)
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
Subject: [PATCH v2 3/8] dt-bindings: i2c: exynos5: Add bus clock
Date:   Sat,  4 Dec 2021 23:50:28 +0200
Message-Id: <20211204215033.5134-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204215033.5134-1-semen.protsenko@linaro.org>
References: <20211204215033.5134-1-semen.protsenko@linaro.org>
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

