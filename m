Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2109330CD68
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 21:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbhBBU4c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 15:56:32 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:43278 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhBBU4a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Feb 2021 15:56:30 -0500
Received: by mail-ot1-f46.google.com with SMTP id v1so21244231ott.10;
        Tue, 02 Feb 2021 12:56:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YcDLZh3Cqrzft9rIs/Kq27AfKEBZ9vkw9dbEJP0DrjM=;
        b=Y7rMbq9cJm7XnPC0pZuVKewonHDiuxEz/xL/aouk8lRqfkX2SdJJQ6viO7MQnE8l8S
         HfeiwAZQtKDQmdDWj4PFsEKIvR/hg8w+Ayly1z+r1TEhOaWTGE3aWzogxG8nUf+QMUJh
         MLv7v5hxjf+33ZS3YEDu4l25BimQ/Vw8u3Zk/tgzxOWXRe66kMSa7rIyxVvfUeqt0o3K
         QaNBoWOeDoYdHdIiAdqBheULxZfOLpONCKkXcfaSFT3qARhoict0s8dVz6soWYtgqZwv
         km8VwhlZs84TYGZ2sytM4/IiodccmBJzKRzE7Q7+ibGNUOCHAAdzmBptsAl7Ieyoi1y0
         5hlA==
X-Gm-Message-State: AOAM530VLVPgyzAudXUZ7/n06w8cEpnk7NkMj4ihz/E762XVDpG8jT9z
        3xdZ34q2fNC7q6IrVjvZyadZkciSPQ==
X-Google-Smtp-Source: ABdhPJz+bxVqZHcA6WQ+rYUVLbRdjFrxDoLmtrg5Q88bRT0/dSLxHv+dlmm7nH5rNIdmYX/wLxVRrA==
X-Received: by 2002:a05:6830:1041:: with SMTP id b1mr16514781otp.335.1612299347994;
        Tue, 02 Feb 2021 12:55:47 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id k15sm4206otp.10.2021.02.02.12.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 12:55:46 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in examples
Date:   Tue,  2 Feb 2021 14:55:42 -0600
Message-Id: <20210202205544.24812-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Running 'dt-validate -m' will flag any compatible strings missing a schema.
Fix all the errors found in DT binding examples. Most of these are just
typos.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Daniel Palmer <daniel@thingy.jp>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vincent Cheng <vincent.cheng.xh@renesas.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-watchdog@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml  | 4 ++--
 Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml        | 2 +-
 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml | 2 +-
 .../devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml          | 2 +-
 .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml         | 2 +-
 .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   | 2 +-
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   | 2 +-
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   | 2 +-
 Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml          | 4 +---
 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml    | 4 ++--
 11 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
index fa0ee03a527f..53cc6df0df96 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
@@ -18,7 +18,7 @@ properties:
     const: 1
 
   compatible:
-    const: allwinner,sun9i-a80-usb-clocks
+    const: allwinner,sun9i-a80-usb-clks
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
index eb241587efd1..118c5543e037 100644
--- a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
+++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
@@ -66,8 +66,8 @@ properties:
       - arm,syscon-icst525-integratorcp-cm-mem
       - arm,integrator-cm-auxosc
       - arm,versatile-cm-auxosc
-      - arm,impd-vco1
-      - arm,impd-vco2
+      - arm,impd1-vco1
+      - arm,impd1-vco2
 
   clocks:
     description: Parent clock for the ICST VCO
diff --git a/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml b/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml
index 1465c9ebaf93..1d48ac712b23 100644
--- a/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml
+++ b/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml
@@ -66,7 +66,7 @@ examples:
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
     main_crypto: crypto@4e00000 {
-        compatible = "ti,j721-sa2ul";
+        compatible = "ti,j721e-sa2ul";
         reg = <0x4e00000 0x1200>;
         power-domains = <&k3_pds 264 TI_SCI_PD_EXCLUSIVE>;
         dmas = <&main_udmap 0xc000>, <&main_udmap 0x4000>,
diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
index 1f2ef408bb43..fe1e1c63ffe3 100644
--- a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
@@ -46,7 +46,7 @@ examples:
     #include <dt-bindings/gpio/msc313-gpio.h>
 
     gpio: gpio@207800 {
-      compatible = "mstar,msc313e-gpio";
+      compatible = "mstar,msc313-gpio";
       #gpio-cells = <2>;
       reg = <0x207800 0x200>;
       gpio-controller;
diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index e3ef2d36f372..128444942aec 100644
--- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
@@ -17,7 +17,7 @@ maintainers:
 
 properties:
   compatible:
-    const: nuvoton,npcm7xx-i2c
+    const: nuvoton,npcm750-i2c
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
index cde1afa8dfd6..349633108bbd 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -93,7 +93,7 @@ examples:
     #include <dt-bindings/power/r8a7791-sysc.h>
 
     ipmmu_mx: iommu@fe951000 {
-        compatible = "renasas,ipmmu-r8a7791", "renasas,ipmmu-vmsa";
+        compatible = "renesas,ipmmu-r8a7791", "renesas,ipmmu-vmsa";
         reg = <0xfe951000 0x1000>;
         interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 54631dc1adb0..5dbb84049ff6 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -63,7 +63,7 @@ examples:
         reg = <0x1e6e2000 0x1a8>;
 
         pinctrl: pinctrl {
-            compatible = "aspeed,g4-pinctrl";
+            compatible = "aspeed,ast2400-pinctrl";
 
             pinctrl_i2c3_default: i2c3_default {
                 function = "I2C3";
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index a90c0fe0495f..ad1c33364b38 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -81,7 +81,7 @@ examples:
             reg = <0x1e6e2000 0x1a8>;
 
             pinctrl: pinctrl {
-                compatible = "aspeed,g5-pinctrl";
+                compatible = "aspeed,ast2500-pinctrl";
                 aspeed,external-nodes = <&gfx>, <&lhc>;
 
                 pinctrl_i2c3_default: i2c3_default {
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index c78ab7e2eee7..ad91c0bc54da 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -95,7 +95,7 @@ examples:
         reg = <0x1e6e2000 0xf6c>;
 
         pinctrl: pinctrl {
-            compatible = "aspeed,g6-pinctrl";
+            compatible = "aspeed,ast2600-pinctrl";
 
             pinctrl_pwm10g1_default: pwm10g1_default {
                 function = "PWM10";
diff --git a/Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml b/Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml
index 239b49fad805..658cec67743e 100644
--- a/Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml
+++ b/Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml
@@ -59,9 +59,7 @@ additionalProperties: false
 
 examples:
   - |
-    i2c@1 {
-        compatible = "abc,acme-1234";
-        reg = <0x01 0x400>;
+    i2c {
         #address-cells = <1>;
         #size-cells = <0>;
         phc@5b {
diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
index c1348db59374..054584d7543a 100644
--- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -57,8 +57,8 @@ examples:
      */
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
-    watchdog0: rti@2200000 {
-        compatible = "ti,rti-wdt";
+    watchdog@2200000 {
+        compatible = "ti,j7-rti-wdt";
         reg = <0x2200000 0x100>;
         clocks = <&k3_clks 252 1>;
         power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
-- 
2.27.0

