Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E2D49067C
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 12:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238903AbiAQLGP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 06:06:15 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:34317 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238874AbiAQLGL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 06:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642417571; x=1673953571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wWDJRTpp9y+U/y/0XA3ayvzfqpzbVzNVpbQ9F2yWO+o=;
  b=b2WJQXnsGizpBnR3A2BLS2eZ58ewcTjEhd93Ml9eSrwN0J7smN228cqE
   Kdw0fx3uzJzqe1zXb75ymSjzMBwLI0Dp4xNkr4YM1gbcKQfcvZQdTECM2
   +rN7+KMyL3Lr8An6drkk49YqvXSs20tR+kqaKTI18aUXcXwQddU1rNurM
   g5ZpJD6JbyKFIco3NBVhpmRYvhFJXvtkwi6m/H1dDV1/sVxwIugaRbE5Q
   gB1i4v9yn0+8e6yF8ckFJjaALBUZJX04R3LFKpas5p/YH8p7ffN4aGtgQ
   ZOyKc+PAh02nRZoXZzNwIkG1eAmNdJxNmlm3FC7lqDghCIwtU0L/4SkLI
   Q==;
IronPort-SDR: eFylxy1KcXwC3BL15AoyjJRf+oE4/SZznCHSTrIRI1eUC5tsYZDNtWcaqSildEsw3u9uDFHr2z
 pvbWE1BrUa45R3tBB7jGovmEEYz21WXoM4mrTrIETx+F61EclGqqS3H7GaCfSvBEAIQen5q408
 MQXanU0P1aWKs0JYsRwbHY6plHujHTj8rPnkNQdzPfBFGBYKPeOLvBPHk7+V/7TjIZgnn1x2Hz
 3Iba+m2mpzAV8EC7w0bvwHr096pMC3yjsBj4mcSvmvMTJppcsEo3GAmtEoggoe6bQWix+BNqLb
 ReCBqCAOqkhHPmIFfdN441oD
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="145638414"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2022 04:06:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:06:09 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 17 Jan 2022 04:06:03 -0700
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
Subject: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date:   Mon, 17 Jan 2022 11:07:44 +0000
Message-ID: <20220117110755.3433142-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the i2c controller on
the Microchip PolarFire SoC.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/i2c/microchip,mpfs-i2c.yaml      | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
new file mode 100644
index 000000000000..ced843e78844
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
@@ -0,0 +1,55 @@
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
+    enum:
+      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+      - microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
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
+      compatible = "microchip,mpfs-i2c";
+      reg = <0x2010a000 0x1000>;
+      clocks = <&clkcfg CLK_I2C0>;
+      interrupt-parent = <&plic>;
+      interrupts = <58>;
+      clock-frequency = <100000>;
+    };
+...
-- 
2.32.0

