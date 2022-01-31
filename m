Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C82D4A45EF
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 12:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346374AbiAaLsm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 06:48:42 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:59093 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380701AbiAaLqA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 06:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643629560; x=1675165560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CHRZOpuL/m9qzVgModijBDCCLSMHHYovHwMK3VqF6rM=;
  b=1Um3beXpa3Zf1uqasAAFuE/8QcvcNRlcOdPeE04fBf1qqp/tuHgtkf/E
   D+GBIsfGTYe7kkpkGboIK6d9cMkKF191Z8Vdi+GqAjLC5lZH03BRur1Xx
   TNqyBOphvTAJzw7EhWGp0x5blnUTrrDUNC767SRd/9w48dxj+DR8fjEAT
   sJ2T5gISu0A8pxnA7h3OFPDcf/20ZWVf5MrQs9zfr/bH1fCq0/wVQL1yJ
   ENbxVNfinHLL2KjJVeiSbZbFGJU3HxlAQKSpzCeMw2as6Pjt1jZjhsiFR
   VGCJdHTOqpf2mia7TykIiYysROFSqM+N3t71bE/Oki2mA7zD+j5Lz/aWW
   Q==;
IronPort-SDR: 81mI5yQ+eopGG6f8m6IRL/uSCNiP05eBifqKcJWoBKLU4+kwH58K8zKfaniYuVN33Vwx8vhK/W
 /Vhm9gsqh/fGVxiyn97slcVQmLFGR3eepMZzSxp1MbcrllJhdIHzWWsISpL3b76vTKTxgzWDIJ
 lbdpeoRv6GqOFHFuk5c84Xp6wZ7UXhCC3KajzpXoi1l1vmNXOXbkAcmf8dSdYM2Xed5ldIMVA3
 XGHS1g7EepcurI/Yu5EcSO8iTAWPlwBMJf+Xelg1LQIX5+b8u2iNHgd8mELmtHkUoVvi41jc8i
 72lHYAN5Xv9Rrv94y2PAfoDZ
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="160544975"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2022 04:45:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:45:58 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 31 Jan 2022 04:45:53 -0700
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
Subject: [PATCH v5 05/12] dt-bindings: gpio: add bindings for microchip mpfs gpio
Date:   Mon, 31 Jan 2022 11:47:20 +0000
Message-ID: <20220131114726.973690-6-conor.dooley@microchip.com>
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

Add device tree bindings for the gpio controller on
the Microchip PolarFire SoC.

Reviewed-by: Rob Herring <robh@kernel.org>

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
2.35.0

