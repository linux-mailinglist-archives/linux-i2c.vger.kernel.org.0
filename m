Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD53DEE9A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 16:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728812AbfJUOA5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 10:00:57 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52534 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728696AbfJUOA5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Oct 2019 10:00:57 -0400
Received: by mail-wm1-f66.google.com with SMTP id r19so13490386wmh.2
        for <linux-i2c@vger.kernel.org>; Mon, 21 Oct 2019 07:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b4PdhEAPlrJQgSDJoJmuRL85NouJ7ey9Hv6QLfk9XSI=;
        b=y3Y9t5g8UXkkEk/00dSN4HFMLQNR1yycajblNd55Mh8D4IdBHbxNogOQw5CGlkWQgH
         YwcR14PT4H4XOyFvcpLXb2jem2PSSobcm/TCiRmHYUETMTAjbhcKpRgg+RXAR31DUH8w
         LEKk6fiQb9Vv3bXL39T06H2HOUcudGeaO3dCD4xEm5VdtPaYDtn3BXmOlWi/tbCDhzPk
         a6/lGZIUFpgwK4nchsikZ9XwgrQxydZFvzJlXZ9Au4AzEBHHCaXo6ZywnfrY0FTP9TvE
         OID99UCsNywxSBSGRKmhM5WLpFU7uedHqlisx7W+DKJoiBOHlHY/fiVOd8ChrhyHNE/1
         jw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b4PdhEAPlrJQgSDJoJmuRL85NouJ7ey9Hv6QLfk9XSI=;
        b=sV50n3PG5S3BLvDBa9gwqao3mMH2jEThBfmCaFCghBW8K3xZRet/eBZ4M5TlvLH7Lv
         IqcdeYIOu4FqOCCYjtYbYuhXdoyP3iQmUUJLpyW/RcyLuLRGtWB1RJ11UF/YKab5PQdX
         LzJ3JPbJw7346Yi/ThPrWXIqq4SGYIeSzcQn+l6WmmBUn+BaZJLHaQclWlQS/O8jttbU
         Rxc3vUshKaV/S/6i30eyRQVOUzdkUQkLAMnU1rd2GGwa+nqLH8GayHeNjZYQCGFHIg1l
         LpXtHzNI6TlM0urA3sMARmfuctGTB3y2bzZWsasKDtlyS7pQ38DdCsd8HMU1zjhOL0T/
         8hLA==
X-Gm-Message-State: APjAAAVQKr1EieG8818Q/iEtYmYPumQO79azfPbtlMiO+AQECfE0DX2P
        VXarpi0XjnTE8XawyobWKwHLBQ==
X-Google-Smtp-Source: APXvYqzGAP+ASrRHNvDQUcOJw1l35OBgxCv/k+On7Hb80R6kwIsPcNWJRm1NTKq/GbYZO3CC6+L4kw==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr3522182wmc.139.1571666455508;
        Mon, 21 Oct 2019 07:00:55 -0700 (PDT)
Received: from localhost.localdomain (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f83sm14859235wmf.43.2019.10.21.07.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 07:00:55 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH] dt-bindings: i2c: meson: convert to yaml
Date:   Mon, 21 Oct 2019 16:00:53 +0200
Message-Id: <20191021140053.9525-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic I2C Controller over to YAML schemas.

Cc: Beniamino Galvani <b.galvani@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/i2c/amlogic,meson6-i2c.yaml      | 53 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-meson.txt     | 30 -----------
 2 files changed, 53 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-meson.txt

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
new file mode 100644
index 000000000000..49cad273c8e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson I2C Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Beniamino Galvani <b.galvani@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
+      - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
+      - amlogic,meson-axg-i2c # AXG and compatible SoCs
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    i2c@c8100500 {
+        compatible = "amlogic,meson6-i2c";
+        reg = <0xc8100500 0x20>;
+        interrupts = <92>;
+        clocks = <&clk81>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eeprom@52 {
+            compatible = "atmel,24c32";
+            reg = <0x52>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-meson.txt b/Documentation/devicetree/bindings/i2c/i2c-meson.txt
deleted file mode 100644
index 13d410de077c..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-meson.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Amlogic Meson I2C controller
-
-Required properties:
- - compatible: must be:
-	"amlogic,meson6-i2c" for Meson8 and compatible SoCs
-	"amlogic,meson-gxbb-i2c" for GXBB and compatible SoCs
-	"amlogic,meson-axg-i2c"for AXG and compatible SoCs
-
- - reg: physical address and length of the device registers
- - interrupts: a single interrupt specifier
- - clocks: clock for the device
- - #address-cells: should be <1>
- - #size-cells: should be <0>
-
-For details regarding the following core I2C bindings see also i2c.txt.
-
-Optional properties:
-- clock-frequency: the desired I2C bus clock frequency in Hz; in
-  absence of this property the default value is used (100 kHz).
-
-Examples:
-
-	i2c@c8100500 {
-		compatible = "amlogic,meson6-i2c";
-		reg = <0xc8100500 0x20>;
-		interrupts = <0 92 1>;
-		clocks = <&clk81>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-- 
2.22.0

