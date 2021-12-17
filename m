Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CAA47872A
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbhLQJcF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:32:05 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:9358 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbhLQJcF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733525; x=1671269525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=16jgpAx4F4blz9pktkPhV+VzkFMZmKHu4glaJ+JJ1JU=;
  b=DH8XIJI9t3mywIn5Zpunqg2+xpp6GLot2tATAtaYI48gHQOpdcoDx8LR
   puzWlboex+3Ipa59HsRYPRWNxegdBk+T6ytzqmJJ7ssls1RcLg+2uk+LK
   VvKc+xZrWgMfcL57JHPrsFRL6fzI/lg3i5Ja4nm90bxN2usXu14OtqZT8
   SNl72BDal3vJY95k/mL7D4JaDec2B/hgpoZDLhKQPHG20gRAuuZbvdNCK
   apEnKC//eB03sGRDQ+ldJT3P5mdXWY0+iUZ1NH3e3EcUA+XZ1kdN/wDM1
   zOE5CHf9wTQqxX5qewHKFZ8Dgrmnqoa6x3SS4rsu9nr/onAv2BKG1s9JB
   Q==;
IronPort-SDR: y7Pj9EsqDH1vKmXDTh1Ap4fPnhWsI7lzCjMYFRMIEHwMa2AeCYLhVzzGngzc86Suat2YLYWdrq
 Ox4EHt8IHkjHMwYqFowANjywCJ+UrXIIWnCb0yIJ+GkI9sUrFbUKBRcYqVMJ+88DJgWNrKuF1z
 f439KV8hJsf/yYe/Kq/WDJCb71vDNiapCOEEuOo4Qt2Y2f/BJDZDehI4dBlTZjGguvqxTjvMpr
 9DL3N+DcdHXfhpfoCX5aV763w99Goi0OzjemaIfe8ZnnpjGQLhV+LP1sai7LvYPBKNEbm4Zye0
 TfhAPsRqH7YHunD/+lUuT7WE
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="142745546"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:32:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:02 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:31:57 -0700
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
Subject: [PATCH v2 02/17] dt-bindings: soc/microchip: update syscontroller compatibles
Date:   Fri, 17 Dec 2021 09:33:10 +0000
Message-ID: <20211217093325.30612-3-conor.dooley@microchip.com>
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

The Polarfire SoC is currently using two different compatible string
prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
its system controller in order to match the compatible string used in
the soc binding and device tree.

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
index bbb173ea483c..9251c2218c68 100644
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
+        compatible = "mpfs-mailbox";
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
2.33.1

