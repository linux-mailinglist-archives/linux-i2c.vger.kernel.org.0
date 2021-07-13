Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9623C6D86
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 11:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235304AbhGMJfP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 05:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbhGMJfO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 05:35:14 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD28C0613DD;
        Tue, 13 Jul 2021 02:32:23 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i5so19324868lfe.2;
        Tue, 13 Jul 2021 02:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=exzPflTZlKhHjc2qVoBz3QeibvHsyKH/UM3yc324PFI=;
        b=I3DPC0ko6enWQCZH3V51nlAj7hlee+aOTUb7lwEw2pj6/hnDGTdtLXFCPT4IETzAjJ
         TpIk94eXwDg82LnUqCBdaylUVoBk//FCu8u7Lf4mlacZVW4ySCuqvMvbN6vSW0LF2Iab
         QGWE1e4jblZsJaQiRfNqMkdk/i6a5LkCBKhfXeuZtEidpL05NSGCUiohMOB/Abq9MyN/
         36ti+zhrJdsC2VbeUjlYKyHnTMcsoCuBRavlc8EjajOZECCY/xUrzQcjpVXgkeSbniQb
         Te05Dop0phv6MDI7VQil87/ZXyafA+pGY6VdbGTHaoz4DfH/0eG/QEYcL7JgmMAbcJ5+
         jZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=exzPflTZlKhHjc2qVoBz3QeibvHsyKH/UM3yc324PFI=;
        b=N7AR251peHyUxIqB5xI5H7k1dGGCnwbJQtHup5eKsJCCmDvbwh0ZEjgWikbJN4FAhu
         QGaWPXAJnTTKtl7XQ4id1WJyr0hxJaknn88uu2s5kfcmXwwotCmZmtnGs1VSy79oSvWd
         npxFUvsTMI5RwS4ijgVS9iB5XJci/mUAI0GostPmCxLgGT7UtSDa/tBuNv+KlAm9fQgz
         lUrLklmGNgJlFcQodp4tV96AIJn6gsi3L1yaIRMQCGwtW2NHTB/YDJeF2l74Phypyz73
         tmPkE4MwMZVPTtamfm3ngUzBsqaHYs2kxaNc4FolYYY6b8dXLy1hSksS3hq0sI7a34UK
         s6nw==
X-Gm-Message-State: AOAM53384iW9CnY/2sZxMgr7hXR6+kGKa9BtU+sJQxGg6DDnleKLe7qG
        4UXf5JMM2FLPAZEXJ219G/b74mbaqjY=
X-Google-Smtp-Source: ABdhPJzkQPo5kXaoKhwLVrai9wHVz767uqIgF78auMZWDINaJpdQzR4uiYsVxMobeSP25YQmW25XOg==
X-Received: by 2002:ac2:4356:: with SMTP id o22mr2896126lfl.309.1626168742108;
        Tue, 13 Jul 2021 02:32:22 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id h14sm673934lfv.249.2021.07.13.02.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 02:32:21 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RESEND] dt-bindings: i2c: brcm,iproc-i2c: convert to the json-schema
Date:   Tue, 13 Jul 2021 11:31:55 +0200
Message-Id: <20210713093155.1752-1-zajec5@gmail.com>
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
RESEND: commit 11480dbfe1d5 ("ASoC: wm8750: convert to the json-schema")
is part of the 5.14-rc1 so Rob's bot should be happy this time.
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

