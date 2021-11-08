Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C533E44979B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240831AbhKHPK2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:10:28 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:21335 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240769AbhKHPJt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384025; x=1667920025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o+1oOULA+X1tBNq85nvLBj0dUKiDbIcrC8BGtfHpz8s=;
  b=iWovsz2Wy914D3Lh9TAmMyj9WrNuqJpkaGAySaYJk424xLIUkhdTiRkl
   sA85xDwMX2wIaH3AyEIwRGOSI8CAPEtZvkbQpRDBrwqGRiEQNLDK9iFyl
   CxgleUugQQ5IPYB4YUpL7mdmaIUhy1ZJjb08iW0embDYCX3dC62NGBXkc
   dPCLaOUu6LfOqfO8hEbhQADN5SZXj8fXyRuEs7831zwHAMv6UizIX+yhY
   +isOwrrHDJEQck2f3jPHgK6gDvk1JwjlHYoVNoFlXbsAb7fefzDvP0EEV
   Dn45JIeeA0B237TroRnUoh4TCR/KY2EL1GCzwsynZaKM3xgTOLJSqtVhg
   Q==;
IronPort-SDR: FYAPzOnF3NwHb03IhyY9qlG6Hg3FjlKg1XstHYXF3//yvBDio1NwMMQOQJ64RI1AMmMinD1DRT
 LDT9fjLFRw/vol6AaQwr6bu9OTQdl9gv0JnAHfL6pknV+uGOJnwZlAP1sOgwYC8H7aMliZAS2Q
 y8P4G8Ufb9504wc9l2rZmvEDBIuYRAI2db4/7BRAJtpydfexRifC6m/Af3VwkTNnRsfa2UPwnq
 o0N42/tgwMO7mb+0DB56RQuRJQBn9PSSZwW3kuRKaMEdpDac+vIaSZ3Q+A8qcQPtbpvF9qkcpi
 CLsrYEpqcZQlPO7b0jnj70Lt
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="75727248"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:07:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:06:59 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>
Subject: [PATCH 05/13] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date:   Mon, 8 Nov 2021 15:05:46 +0000
Message-ID: <20211108150554.4457-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the i2c controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/i2c/microchip,mpfs-i2c.yaml      | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
new file mode 100644
index 000000000000..bc4ea4498d35
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS I2C Controller Device Tree Bindings
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+
+description: |
+  This I2C controller is found on the Microchip PolarFire SoC.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: Phandle of the clock feeding the I2C controller.
+    minItems: 1
+
+  clock-frequency:
+    description: |
+      Desired I2C bus clock frequency in Hz. As only Standard and Fast
+      modes are supported, possible values are 100000 and 400000.
+    enum: [100000, 400000]
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
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        i2c@2010a000 {
+            compatible = "microchip,mpfs-i2c";
+            reg = <0 0x2010a000 0 0x1000>;
+            interrupts = <58>;
+            clock-frequency = <100000>;
+            clocks = <&clkcfg CLK_I2C0>;
+        };
+    };
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        i2c@2010b000 {
+            compatible = "microchip,mpfs-i2c";
+            reg = <0 0x2010b000 0 0x1000>;
+            interrupts = <61>;
+            clock-frequency = <100000>;
+            clocks = <&clkcfg CLK_I2C1>;
+        };
+    };
+...
-- 
2.33.1

