Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4AF48EC9F
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242947AbiANPRU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:17:20 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:50678 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239003AbiANPRH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173426; x=1673709426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lpP0lJkn+kaM0L/dSWda42EaX0finN6iz9h/n2ezhV4=;
  b=w31JYp2MXfmi6mlO1dDNAihgSyzbHPDNNffTh3bJK8zKxLIjFG7ePqLM
   ts9HPWD9iEqkQ5EDFBZN2vopS0qMFZ2oXUzCWtXqtEGqgLtlchfIc75Fr
   ZKDDUHnaYhRL0VZku0VtNJUonFCeLI7zoGmrA9tEhREVBitFP5vKsFWmK
   k/nc8hRI8dVqNnOzoY9xw4f8UJvGJ/vs7hoZMU1BczFLmw2n9dUDRaGEy
   u99zDYB9IXSIbiB+JHpfwL4QI/oZU4POk9fLm0f7HKeB4brqsdHHZbDgq
   HEcuEgLIVhryg3TytHNaFm7Y7TwL6Z3nb83f588uX0zyJ7GH3ifSmyzaZ
   g==;
IronPort-SDR: kL4RnFizd87JjLb3wBExb9VGp/CQLgM9veBpyNfYNTt4VZmRcCsq3hqrBznCBZiOMZCFnx9okJ
 foSSuR27NRK8A7nKbyyejmO8W2SiHFvJ+90ihRZiU6yEHQ4T5P3qG9AAxgVAuLF5FxboZyVqzG
 cS/LkpRsKRtOd7wxYquw2dlGdo4+LVj6E5LFHCFhh+tFey09pnrpVzHzldUsv2Hcaj/OTG3UTv
 Uc6vIjwssw0VukRe9MizhaLB9oy5zH+ljRxPw9o4u11i4UYEcNSpwqowoexC2Pm8MXnaW+uAYq
 zYupVGPBuB+ZKQ3gjfbMPnIt
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="142730876"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:17:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:17:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:16:58 -0700
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
Subject: [PATCH v3 07/15] dt-bindings: spi: add bindings for microchip mpfs spi
Date:   Fri, 14 Jan 2022 15:17:19 +0000
Message-ID: <20220114151727.2319915-8-conor.dooley@microchip.com>
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

Add device tree bindings for the {q,}spi controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/spi/microchip,mpfs-spi.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
new file mode 100644
index 000000000000..ece261b8e963
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/microchip,mpfs-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS {Q,}SPI Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-spi
+      - microchip,mpfs-qspi
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
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    spi@20108000 {
+        compatible = "microchip,mpfs-spi";
+        reg = <0x20108000 0x1000>;
+        clocks = <&clkcfg CLK_SPI0>;
+        interrupt-parent = <&plic>;
+        interrupts = <54>;
+        spi-max-frequency = <25000000>;
+    };
+...
-- 
2.32.0

