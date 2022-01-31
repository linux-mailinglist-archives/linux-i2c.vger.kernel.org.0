Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7964A45EC
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 12:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343738AbiAaLsl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 06:48:41 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:59063 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379032AbiAaLpu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 06:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643629550; x=1675165550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d/Ij+ZoegdPKUHf5fPnbf1WX33hvhyGyLbuNgg8uHv8=;
  b=iQRjhlvXiEC3DgO95OT2Oundfr0fi8u0p0ozCJ19dAQ9Q61/lMx/C3i0
   OiG9OQMv0A/v590nRRiyMW7NHLeF7MMX3eSP7HncJVjmRnd93mKWweDnX
   6KA687nOmgPt2KM0MDnHXbevAFj1FaTQyDlQnfgkZ7CbJqXESXTtIx6PO
   4VJFb4OQSRGQ5m2EMI3hQPUBAnIqEJJOaAgmKn0EinEazlHeDnuiU7PEW
   IppwsqR06BV1ZY1Ug50XKy7GcNtmxnt1/lnBJSDFXQOqEO0w1Bd7YLCUx
   DBnaPCX7ICdRyox28qMGbSUlKwJAKQ33fLV7taymlXuMIQslTqS2n0HpG
   Q==;
IronPort-SDR: ApHrUhmjM+hxBbdO4+mA1APl8M6WM02B+guqrQjA7GJKR9hIDN8e8B5OBwUlNDcFcJCDL960ta
 rqQyWj4pwqy7r6WgxUmKffqEgjCGGV9aWqxQNUEKdEcgx7BCusQcAnCXryjxNq9CZ2RjpOUvcn
 oSTVDNjaOSoyMsM7Quo2EJuChIounXix7IjZHAV9YWGrjemI3S218YsMcrFScSzVHV862wWvWU
 IA6ZoBXnXhiCQFG0BcPgrxim/lFsAWX65iMj0AIcj6ppFHssodngXGxckbwE7wzWt1UNwnA1ZQ
 IHxABhtf+apNbbe47vlJ0CI7
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="160544963"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2022 04:45:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:45:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 31 Jan 2022 04:45:42 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
CC:     <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <ivan.griffin@microchip.com>, <atishp@rivosinc.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date:   Mon, 31 Jan 2022 11:47:18 +0000
Message-ID: <20220131114726.973690-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the i2c controller on
the Microchip PolarFire SoC.

Reviewed-by: Rob Herring <robh@kernel.org>

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/i2c/microchip,mpfs-i2c.yaml      | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
new file mode 100644
index 000000000000..065ec3d4c95e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
@@ -0,0 +1,57 @@
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
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
+      - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
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
+    i2c@2010a000 {
+      compatible = "microchip,mpfs-i2c", "microchip,corei2c-rtl-v7";
+      reg = <0x2010a000 0x1000>;
+      clocks = <&clkcfg CLK_I2C0>;
+      interrupt-parent = <&plic>;
+      interrupts = <58>;
+      clock-frequency = <100000>;
+    };
+...
-- 
2.35.0

