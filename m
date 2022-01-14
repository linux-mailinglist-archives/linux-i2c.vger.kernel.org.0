Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE5548EC9C
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241984AbiANPQo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:16:44 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:8118 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242762AbiANPQm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173402; x=1673709402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wWDJRTpp9y+U/y/0XA3ayvzfqpzbVzNVpbQ9F2yWO+o=;
  b=Qdk09MY4riUJzmbMYwm3ek7z/n4DCy9Z4ceio9me93k20P6LoZA5+9j/
   4DNi2kmzVt950JY1baE8Rb97g1jOwirM91RtxLXvCTIK6T9mXIjMTv7tA
   CJQSiSzSJWpQZZJh8Q/ASlCBsB+AvlMCJRU+SEWQ7LcCm8z4pEskkdzJQ
   XweM3OkVp3/FVS4dT0mw84N0kaJKe76KmwfHkdOnsl4cXYzPHoWB1tY7H
   wpHhBf4419EiS9l+X1inswlBtV/i3wr/ZrPqGCJ8uL+HI/ZuSG6l4onEK
   w1gB2Xmu4ZgPkZ0euzRSWNYCV91vVCv7vVT7zpUMjU5+OssxDfxN21fdl
   Q==;
IronPort-SDR: 7THUJYzdHvfCAk1hHen0bIy/vPUs/6gvtCaHheXXBwOadZP0AcxVv9vIkMP3CmLz2olh8o6ZRM
 l72dv2FwGwHcsVhB/N4/EgIEowFd1MMmUSxQxSRa8a3yKgydidkLgvBHQGl53plT7YaLiam53g
 jDp8YDJmYU3joNyjEGfzeJeffJp6RsjfToAJALRxa8ajI32KJ1VYFKWZ7n9BPwVvY9AOztrMwx
 m5te96aFxX+awZDlZycEb553KG9MbpPYqVxfb9+eFkbV/qdpMwq4bjhVsQO1Lcmkx2TvPjTF28
 84JgPucTQ/5L1L3XFrlxCc7C
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="149688457"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:16:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:16:40 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:16:35 -0700
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
Subject: [PATCH v3 04/15] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date:   Fri, 14 Jan 2022 15:17:16 +0000
Message-ID: <20220114151727.2319915-5-conor.dooley@microchip.com>
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

