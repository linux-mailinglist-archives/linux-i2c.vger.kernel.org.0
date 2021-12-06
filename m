Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F7846A4DF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 19:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347436AbhLFSt4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 13:49:56 -0500
Received: from ixit.cz ([94.230.151.217]:55824 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229657AbhLFSty (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Dec 2021 13:49:54 -0500
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 9957221F5E;
        Mon,  6 Dec 2021 19:46:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1638816383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KMnX90Nv+m5GJBS0htoe+zW4SS/+Tp3wHwgEGIlnf68=;
        b=wiNV03kCkQUnjwf0zdzhNJxpSE3dd7lYr4Ec5vgU3iaKjYdPSRAq9AMubmcUrxgvIzKsbd
        v2XEFxjEmVNTmV8i6a2WAfliOAZ7QCDLufAurxgwV5oJvP4E5kY1WCEijExSNhX2e1pc7N
        RPtT9KdzFKV6jplMIh2JGZgAkGk2nfg=
From:   David Heidelberg <david@ixit.cz>
To:     Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stephen Warren <swarren@wwwdotorg.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: brcm,bcm2835-i2c: convert to YAML schema
Date:   Mon,  6 Dec 2021 19:46:12 +0100
Message-Id: <20211206184613.100809-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch the DT binding to a YAML schema to enable the DT validation.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/i2c/brcm,bcm2835-i2c.txt         | 22 --------
 .../bindings/i2c/brcm,bcm2835-i2c.yaml        | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
deleted file mode 100644
index a8a35df41951..000000000000
--- a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Broadcom BCM2835 I2C controller
-
-Required properties:
-- compatible : Should be one of:
-	"brcm,bcm2711-i2c"
-	"brcm,bcm2835-i2c"
-- reg: Should contain register location and length.
-- interrupts: Should contain interrupt.
-- clocks : The clock feeding the I2C controller.
-
-Recommended properties:
-- clock-frequency : desired I2C bus clock frequency in Hz.
-
-Example:
-
-i2c@7e205000 {
-	compatible = "brcm,bcm2835-i2c";
-	reg = <0x7e205000 0x1000>;
-	interrupts = <2 21>;
-	clocks = <&clk_i2c>;
-	clock-frequency = <100000>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.yaml b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.yaml
new file mode 100644
index 000000000000..8256490a7af2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/brcm,bcm2835-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835 I2C controller
+
+maintainers:
+  - Stephen Warren <swarren@wwwdotorg.org>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - brcm,bcm2835-i2c
+      - items:
+          - const: brcm,bcm2711-i2c
+          - const: brcm,bcm2835-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@7e205000 {
+        compatible = "brcm,bcm2835-i2c";
+        reg = <0x7e205000 0x1000>;
+        interrupts = <2 21>;
+        clocks = <&clk_i2c>;
+        clock-frequency = <100000>;
+    };
-- 
2.33.0

