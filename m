Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87FAC49066B
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 12:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238848AbiAQLGE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 06:06:04 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:7945 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbiAQLGD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 06:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642417563; x=1673953563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9RoxyME0To67rTp4UnxoJYhB75vCOPsYiumTKz8Sv7o=;
  b=wZYIxDh28sYlkEwiRlhd05lQTPFKzY2XJ+YhCIcVHzXKSOpXe5+gk5eG
   P1MKhCm8Vfk3HDvl+t5oOCCGCPQoPHIu9PlLMr/071crj084AnLEuhcNb
   oTXrQUrp1Dlz1EoxY4sluTBDMym+7/t0izJ4oXceuq3/jFltknyds5u66
   FQmPwy83fY38seZqH7sJ4QIldYoVJxbP9QEOc68ekGdMQTwC5neJ2YAn2
   PxyMxXfWXN3RTQ+eUr31UBMqMVWBftEju6ig1USllk1WO3q9/+FyxUblm
   qVuVIA0J6XQ5TUVR1gGFKy8kZNRbMjja5kY+acQLASjMd9OVmla23a1aF
   A==;
IronPort-SDR: e7PU2hGGVC6WZlwVJ8bEMMIKbTA8pPKuOH/3JpdMcBMm50PoH0qQBPkT6/a+qw4ROvz9fBYT3m
 b7besKOjLF45qTTMWxkbEGBD4q/MPzYCdPplAp02+KQTqJQtORZPgnwlVijV/+hDUeM9BEmvaR
 0tdbLPVfM/XAx0LvAk63pqkKb18tfdboUjqsRYapz2oPcHgdb4simXyWKiMB4DLkJAeDdfOO4j
 0yDo1sCeab/ndZeIn43LUdHt3Lpw9+rpMUe2qQXjHRf7A/0U9cMEtzSyY7868pQQSuJWpQE1YT
 rcHW5F3u+tEJB5Alo9KxAX6G
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="150422965"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2022 04:06:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:05:54 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 17 Jan 2022 04:05:49 -0700
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
Subject: [PATCH v4 01/14] dt-bindings: soc/microchip: update syscontroller compatibles
Date:   Mon, 17 Jan 2022 11:07:42 +0000
Message-ID: <20220117110755.3433142-2-conor.dooley@microchip.com>
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

The Polarfire SoC is currently using two different compatible string
prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
its system controller in order to match the compatible string used in
the soc binding and device tree

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
 ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
 rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
rename to Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
index bbb173ea483c..082d397d3e89 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/microchip,polarfire-soc-mailbox.yaml#"
+$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
@@ -11,7 +11,7 @@ maintainers:
 
 properties:
   compatible:
-    const: microchip,polarfire-soc-mailbox
+    const: microchip,mpfs-mailbox
 
   reg:
     items:
@@ -38,7 +38,7 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
       mbox: mailbox@37020000 {
-        compatible = "microchip,polarfire-soc-mailbox";
+        compatible = "microchip,mpfs-mailbox";
         reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
         interrupt-parent = <&L1>;
         interrupts = <96>;
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
similarity index 75%
rename from Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
rename to Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index 2cd3bc6bd8d6..f699772fedf3 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/microchip/microchip,polarfire-soc-sys-controller.yaml#"
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs-sys-controller.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) system controller
@@ -19,7 +19,7 @@ properties:
     maxItems: 1
 
   compatible:
-    const: microchip,polarfire-soc-sys-controller
+    const: microchip,mpfs-sys-controller
 
 required:
   - compatible
@@ -30,6 +30,6 @@ additionalProperties: false
 examples:
   - |
     syscontroller: syscontroller {
-      compatible = "microchip,polarfire-soc-sys-controller";
+      compatible = "microchip,mpfs-sys-controller";
       mboxes = <&mbox 0>;
     };
-- 
2.32.0

