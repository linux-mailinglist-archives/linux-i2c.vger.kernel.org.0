Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF6B4497C1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238098AbhKHPLZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:11:25 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:39196 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240713AbhKHPKV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384056; x=1667920056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gPBDUHEHryuXddDlP+HH2IgvmB76SJ44PJ4f76bXn7A=;
  b=rQp6h8oxxSQ4Hcu/QSri1D4aWEr42QIuT965+o9jygxFtttAovIRX2FA
   7lXVDOdgtOc6N242SFMjsgWb2uoI4Se/AsszzMHuxuqn/++yVbnt+TfbP
   mffJGLCxyYOvyctVYdn8VfJ9uEE9r0WP27BOIFqsVW14IrpXsZBLToadf
   hPyEBnxu+HRopGFH0d4xrzoaZjyVt7LNbriq2g4mOgduYJgcrC9m6qC6I
   EafT5U/ZeUSOvd9rHla6BITR2pSlXgUqnVsL9kOwtmGASAR/9hWDpt8ZF
   l5OnGsTRqt+n0sq95ucizw0zh/PYk/m92/mAJsQZz4Ssxyy7YJVFwctw1
   w==;
IronPort-SDR: GijAFQ3AR/eI2hQHdOazGp7fs6k3h/fM6DoGTF3/PI9F5jaeI+mLWWaA5/+heeXk/zOAI36I/5
 AyIIlzaiFz1zAj/XndPfJmSaVnWQyd264KIV1Ad7CnjoAmXbCajbGQl4dVtrN1OQfwiSMJIp+t
 PINcl39dudouAPo+ZM3734ygn59wCQZ3BKzZXyoQX4Nlp50uc8zxD0hWmFizPO9ZGXwmKq/nYh
 VbPAcJa5QLqcBdhJJxZY8tZlj5UK0vn4TYzdXHZnzsolTjOH2ZUVXYuD7rF1OY/prqRp6vAgLe
 W0s+ZMBC32dHW3/httigaMOp
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="151131546"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:07:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:32 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:07:28 -0700
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
Subject: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs spi
Date:   Mon, 8 Nov 2021 15:05:51 +0000
Message-ID: <20211108150554.4457-11-conor.dooley@microchip.com>
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

Add device tree bindings for the {q,}spi controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
new file mode 100644
index 000000000000..efed145ad029
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -0,0 +1,72 @@
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
+description: |
+  This {Q,}SPI controller is found on the Microchip PolarFire SoC.
+
+allOf:
+  - $ref: "spi-controller.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-spi
+      - microsemi,ms-pf-mss-spi
+      - microchip,mpfs-qspi
+      - microsemi,ms-pf-mss-qspi
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
+    maxItems: 2
+
+  num-cs:
+    description: |
+      Number of chip selects used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+    default: 8
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
+    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      spi0: spi@20108000 {
+        compatible = "microchip,mpfs-spi";
+        reg = <0x0 0x20108000 0x0 0x1000>;
+        clocks = <&clkcfg CLK_SPI0>;
+        interrupt-parent = <&plic>;
+        interrupts = <PLIC_INT_SPI0>;
+        spi-max-frequency = <25000000>;
+        num-cs = <8>;
+        status = "disabled";
+      };
+    };
+...
-- 
2.33.1

