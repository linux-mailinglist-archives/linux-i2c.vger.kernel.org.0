Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B4A48EC81
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238969AbiANPRL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:17:11 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:60739 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiANPRA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173419; x=1673709419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bIBkUQ3vjh7oytk/bGgn66qU7zWZlgKxXGlgkCOqeic=;
  b=BdXYJaJ0/8XgtFtGNgc1zkFEx+UwOqW6SE0hrivX/oLUfS2cgFsW5S9w
   v5f/fBg97cnP1DA4+X5cy0TbfG4qL+ojyR5UimgzC6TpUq1h5uzZ0aODJ
   TXHKy4mYa6xfDVUa0/hwoTIaEJKUFFhQIdy/nPjrdelPFqaLAWuXR13tS
   oENhQwfuVeUo9OSAEw7zf1vnZL/zL6Zkh2IQESXVUq98C3k897yMVPFAG
   OwsONMmw7GsIGXO0Pl5q1HxzfO8W2HziDS99T3qZIrgAGkTN02dhmbJyQ
   7X95aNb56Jv/z801eI2oX3zmSunXBBxdiLdifNw0kFkZQL7OYIjDYe1Lq
   w==;
IronPort-SDR: bE4AnhYMDYFQHqm6JsGS0tkSheiZnFHEyEOWGa6J0vD6NTieekAJmnDCdkzTbQDkmlJuRprg/5
 t7/52qxrEv9vTs6gmkp2ZTjNbphbItrgS7yHROFyrILqpCs7zk8cDPOIfhflWjEPSY0qDRNuGb
 NzN2Z3P7jFlXBs9bwQuViuHOagdbylx0Tn2IHAMPCXDb6Oei0mIvpPJ0+GlIaLe2nHLQKa8AdR
 //sRYggnDOS7mAOXQY4XTBxsN10szojs7Z1P5grxjog7O0+C2SMkIEqugE9lhLLNqlZtPoUBVN
 UB7qwWr/gKs2SfnomSFsXfna
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="158697743"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:16:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:16:57 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:16:51 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atishp@rivosinc.com>
Subject: [PATCH v3 06/15] dt-bindings: gpio: add bindings for microchip mpfs gpio
Date:   Fri, 14 Jan 2022 15:17:18 +0000
Message-ID: <20220114151727.2319915-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114151727.2319915-1-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the gpio controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
new file mode 100644
index 000000000000..47a76f0e32b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS GPIO Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microchip,mpfs-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
+    minItems: 1
+    maxItems: 32
+
+  interrupt-controller: true
+
+  clocks:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  "#interrupt-cells":
+    const: 1
+
+  ngpios:
+    description:
+      The number of GPIOs available.
+    minimum: 1
+    maximum: 32
+    default: 32
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+  - interrupt-controller
+  - "#gpio-cells"
+  - gpio-controller
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    gpio@20122000 {
+        compatible = "microchip,mpfs-gpio";
+        reg = <0x20122000 0x1000>;
+        clocks = <&clkcfg CLK_GPIO2>;
+        interrupt-parent = <&plic>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>;
+    };
+...
-- 
2.32.0

