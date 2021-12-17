Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71BA478752
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhLQJdB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:33:01 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:26483 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbhLQJdA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733580; x=1671269580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3qRUHoobo/ppmfZjVVOkiLMq+8SBs80cxkclQbTplqc=;
  b=cpGmqao+Vuezq2hnc1IKNGL5p5B+XpwP/dXS2bbrNlSE9hm+3Woieicx
   i09mnjgDNETfw71/ik6605X9KWGNWzjlhuqdqbzqS7kDBpgXnT+g5UxWV
   BdpvshJZ5bA7HHWNc+bECaHRT6AVMs1Irx1qfFX7GN8VQIPiUAS6Utojg
   GBiQWaXjYlNQXWZPdIUBeGovZzKF2EVSqs5oabP58CZshRqkgOS7Vxz39
   FMgdxakBdDwirHS18ocCkUrkAfW+WWjva47ZCAA5oSAX1hDohkCuTLbCu
   UuG6q7agauZaC7GtHYTs2G9r/lejo9kFQPKsdUr88h22i7dLIgtG0W9Jn
   A==;
IronPort-SDR: 3ygXOh/lCCf1GWWoDG1pNOmSe9s+0/SonRioONOLWMlNd71V19TUnY9pWwjY06utrZEimrJtTX
 KXYI86g9Mz8TPSblA705fF3WCqL+VKENe+k6kU9w5ibWzU9i+A9IMlh3sJraQhQJ+lxjtQ1Akb
 OUttu+zT67bycGgXyDmiys9XFDUk9dYbnOF1XB61505C+iYmTtanlKifiyra0Zb/jFIV4Sbfo4
 tIVokdiiQqmKPGjZS0kWQip37KAOTNFPnTQHZnH/sSZRMmMqsjQqVi+klazChN8c/ITWj135dA
 aVvfiLmnjRQnc9uRtMSEMUd0
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147571014"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:32:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:32:28 -0700
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
        <atish.patra@wdc.com>
Subject: [PATCH v2 05/17] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date:   Fri, 17 Dec 2021 09:33:13 +0000
Message-ID: <20211217093325.30612-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
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
 .../bindings/i2c/microchip,mpfs-i2c.yaml      | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
new file mode 100644
index 000000000000..2acaf1a7e0de
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
@@ -0,0 +1,54 @@
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
+    i2c0: i2c@2010a000 {
+      compatible = "microchip,mpfs-i2c";
+      reg = <0x2010a000 0x1000>;
+      clocks = <&clkcfg CLK_I2C0>;
+      interrupt-parent = <&plic>;
+      interrupts = <58>;
+      clock-frequency = <100000>;
+    };
+...
-- 
2.33.1

