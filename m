Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6A1490694
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 12:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238930AbiAQLGa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 06:06:30 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:34340 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238878AbiAQLGZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 06:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642417585; x=1673953585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bIBkUQ3vjh7oytk/bGgn66qU7zWZlgKxXGlgkCOqeic=;
  b=1w0IntyJpcHPz2l1dFDlRuXbqHgyChLScoYKFiGaACdjbmlHgvQeB/h4
   qTac7FeRZldUzbGd5l9XPrF8e7akVLNgtC5rs4ZXPKpCUuMHJp3QawaHr
   RHz6UYwK3/lNDKOxePCPmwj4ayNB8rf5ADc/bztLll40qJL0/bL0U/h1m
   Vemj9rcBXUV6hsVRc3XgegKTQH7E+VpghqWCOGLsjfUlZFSa5eRVhzdP/
   rOG7IEoEhSaR8C2b79Q5RH8lhXkMYaD5ZlB6O19P+hK2Zc6SvVftpU3F4
   QEl6J9k4qi57BP5AiBh1ZSJSV+iRhpMBUXMxoyCzkrOhCwRe0Ieo8Xp61
   g==;
IronPort-SDR: b7RufQwVDdzvSjjojIq+aH2sxdrk69Xd/vHba924bSatmU/2J2hZBg+PtRLObAwUmwEGVsrS2z
 RiPjLt3wuMhzoSWz+wTQpMUZfegbFXujJOuagIgQgZjjhs6cPVRepiygiLYYpuvnBKZ7G3Dl6l
 gMb6K9UPmrCc8ehJFE9knUPT3PDTbk2WFdOhHKzwlpLrRKeZi/qXIycfVUzbRqH9XhmAwidPsf
 QLpeBw/FigHjM6oPYMidD4/jqDY+Gte4fqpuNj9T1F26VqWIlvLqq0pCforb5OdfCKMSTyzhEa
 BhYzNtaRhBP82DUhCHjXbVxN
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="145638439"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2022 04:06:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:06:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 17 Jan 2022 04:06:17 -0700
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
Subject: [PATCH v4 05/14] dt-bindings: gpio: add bindings for microchip mpfs gpio
Date:   Mon, 17 Jan 2022 11:07:46 +0000
Message-ID: <20220117110755.3433142-6-conor.dooley@microchip.com>
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

