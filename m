Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA2D37CDC1
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 19:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245403AbhELQ6C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 12:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236911AbhELQcW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 12:32:22 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B408C061240;
        Wed, 12 May 2021 09:08:04 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id p12so30296137ljg.1;
        Wed, 12 May 2021 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EFUqatXFcYynCbDY6/O5QHoLQn2Iw8/bOL3++Grnj0k=;
        b=LyOy6jKC+HEvJmIG6dcl25mKN+A6hINsqDwEQWnQ/tI1x3egzx2ZZEQ0GFFwLEpUhF
         sRH9TgGcS5Yhxzrirr9Zizt2utTz9gAaOc6WFm99Ow4D3BxX38ajUIjAUkjsH45DVIfY
         frgvLALpsHWeS2Y8oC3S90NIA7REf1jVMN2Px3fRH7n1D9dU2vg32wfKBa02CNxicjNe
         FEgFhGMET9xKOtjN2F8ylVYI2+eLpCxIcHr3UPKR0ItcxjvptEnjNKHkjy/uD//AhDsa
         T1m4NOESbZJ6E3LGBUKF+4CLov2LvmtBB46gbW6ch7wEaE6k+zhzJ2XMWgMmDhf+9jm8
         +oLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EFUqatXFcYynCbDY6/O5QHoLQn2Iw8/bOL3++Grnj0k=;
        b=CfedAFDA8Uzn7P4Ppu5frB3v/N3qsA+7PXawwY/VQXpsKWigHYGb6Ny3UDiLABZZJc
         ClMduEhY8zmM68+frKnqi/hhOQpR6sF1G99lgzNYBGCHN0qsWGwwImVx8kYysdgd4Qzw
         sHXJqwKwWv47a9KDP50lsRpetQ1ysLW5B1ibj+bYRbzpXxfRIU+m5tXosQA0ZNIXmGIY
         ZemJ7cLb9irdzPzqLHmjDoD+uf4F5rkhtU1qUddHS7hPZ9Xgr0eUl+v1grByJU3To+Rg
         Dl9Ac1dxCd/Di9jyMPfw6OUaPXXLUZ2UDAEiphwVdFzFAI/UlKjGibI9EQJag5Ul33Z1
         K9WQ==
X-Gm-Message-State: AOAM530Vukt0BC49wL0tOHZQNtAW5uaZeI/xTPERtrCopDItd7fLs41X
        7drhoKyA/vcvy9Z/MonI4fM=
X-Google-Smtp-Source: ABdhPJxsRLAELF/wAu9LwuvCU9T9itzN8m3FmjU6PGT/rSWEBHEaQcXTNpE7z/txdNK96uUcGOStNw==
X-Received: by 2002:a2e:6e03:: with SMTP id j3mr29047247ljc.218.1620835682627;
        Wed, 12 May 2021 09:08:02 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id r19sm9078lfi.246.2021.05.12.09.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 09:08:02 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: convert to the json-schema
Date:   Wed, 12 May 2021 18:07:50 +0200
Message-Id: <20210512160750.15183-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Introduced changes:
1. Added arm-gic.h include

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/i2c/brcm,iproc-i2c.txt           | 46 ------------
 .../bindings/i2c/brcm,iproc-i2c.yaml          | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt b/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
deleted file mode 100644
index d12cc33cca6c..000000000000
--- a/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Broadcom iProc I2C controller
-
-Required properties:
-
-- compatible:
-    Must be "brcm,iproc-i2c" or "brcm,iproc-nic-i2c"
-
-- reg:
-    Define the base and range of the I/O address space that contain the iProc
-    I2C controller registers
-
-- clock-frequency:
-    This is the I2C bus clock. Need to be either 100000 or 400000
-
-- #address-cells:
-    Always 1 (for I2C addresses)
-
-- #size-cells:
-    Always 0
-
-Optional properties:
-
-- interrupts:
-    Should contain the I2C interrupt. For certain revisions of the I2C
-    controller, I2C interrupt is unwired to the interrupt controller. In such
-    case, this property should be left unspecified, and driver will fall back
-    to polling mode
-
-- brcm,ape-hsls-addr-mask:
-    Required for "brcm,iproc-nic-i2c". Host view of address mask into the
-    'APE' co-processor. Value must be unsigned, 32-bit
-
-Example:
-	i2c0: i2c@18008000 {
-		compatible = "brcm,iproc-i2c";
-		reg = <0x18008000 0x100>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		interrupts = <GIC_SPI 85 IRQ_TYPE_NONE>;
-		clock-frequency = <100000>;
-
-		codec: wm8750@1a {
-			compatible = "wlf,wm8750";
-			reg = <0x1a>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml b/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
new file mode 100644
index 000000000000..2aa75b7add7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom iProc I2C controller
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+properties:
+  compatible:
+    enum:
+      - brcm,iproc-i2c
+      - brcm,iproc-nic-i2c
+
+  reg:
+    maxItems: 1
+
+  clock-frequency:
+    enum: [ 100000, 400000 ]
+
+  interrupts:
+    description: |
+      Should contain the I2C interrupt. For certain revisions of the I2C
+      controller, I2C interrupt is unwired to the interrupt controller. In such
+      case, this property should be left unspecified, and driver will fall back
+      to polling mode
+    maxItems: 1
+
+  brcm,ape-hsls-addr-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Host view of address mask into the 'APE' co-processor
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,iproc-nic-i2c
+    then:
+      required:
+        - brcm,ape-hsls-addr-mask
+
+unevaluatedProperties: false
+
+required:
+  - reg
+  - clock-frequency
+  - '#address-cells'
+  - '#size-cells'
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@18008000 {
+        compatible = "brcm,iproc-i2c";
+        reg = <0x18008000 0x100>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 85 IRQ_TYPE_NONE>;
+        clock-frequency = <100000>;
+
+        wm8750@1a {
+            compatible = "wlf,wm8750";
+            reg = <0x1a>;
+        };
+    };
-- 
2.26.2

