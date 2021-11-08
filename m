Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7637E4497C9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241006AbhKHPLh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:11:37 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:21335 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240767AbhKHPK0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384062; x=1667920062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2n9GIVVmCiRGA0iC1L+MwladkBD7mqRRs9RpfrJ5md4=;
  b=w3Qox3vV4dvClLAM8u1N0ci2WzXmENBBNBnHG4mjPOyE5ryVJeK5+9LA
   F1R8O1nREJWp3KyskbHZkXsO2/7OIaJTu6Q+8uE5ciCDPzC3ycge6xWBB
   Fq7HK86V8buMHlFAO9JyDOtwKZ1brTvaGdpXvIl2z8NXmQnCcPMRdiXHa
   1xTlWFb+Ubp+wvyn4yuWuYWr/4EOvKSJP88Gr21PJY8fW/pQmqXycbVFo
   gRoExPi+XEbhGL5CSjU2U0lZWvXsqJm9GNKt9vJ80kCG6q+QGg/4vntd2
   OHoNIdsjNzuPJdnATkOxcuuf1VWptq5JWE9YoVXZdQMzgRoWb83BYuD+g
   w==;
IronPort-SDR: r7HbJwr7nexggEpFJSRbMyvcbV+vuw7mdk4Dwj6UvhaaU2wF6vXwT3vPJ2zpHGbF9DMntkXnF6
 RjqpXDvVlyM26NG5XITgpyj2WgYyz5vGsg1IWIfN1RywZ+Uu5qj50VKZ4K5KBnYZfA9OZKpWb4
 j8170KXE3xPHqfFiitgen3YtXWjmwdLwXtC1gAnadV6MyXUTgFk3to8aKPboYGqaMtRWVUzB4J
 W78+mRWg/ZGo5kBCaldVWbaMWti3jiQeK9OcyQ1oDC0hmvl+ac+o2eYChkEhZrPXrPH6M0+Dhm
 icZlJxTAE3IZwvz1+5V++bT6
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="75727308"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:07:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:38 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:07:34 -0700
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
Subject: [PATCH 11/13] dt-bindings: usb: add bindings for microchip mpfs musb
Date:   Mon, 8 Nov 2021 15:05:52 +0000
Message-ID: <20211108150554.4457-12-conor.dooley@microchip.com>
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

Add device tree bindings for the usb controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/usb/microchip,mpfs-usb-host.yaml | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
new file mode 100644
index 000000000000..b867f49e7d70
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,mpfs-usb-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS USB Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  This USB controller is found on the Microchip PolarFire SoC.
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-usb-host
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    minItems: 2
+    items:
+      - const: dma
+      - const: mc
+
+  clocks:
+    maxItems: 1
+
+  dr_mode:
+    enum:
+      - host
+      - otg
+      - peripheral
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - dr_mode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      usb: usb@20201000 {
+        compatible = "microchip,mpfs-usb-host";
+        reg = <0x0 0x20201000 0x0 0x1000>;
+        clocks = <&clkcfg CLK_USB>;
+        interrupt-parent = <&plic>;
+        interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;
+        interrupt-names = "dma","mc";
+        dr_mode = "host";
+        status = "disabled";
+      };
+    };
+
+...
-- 
2.33.1

