Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E66A478781
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbhLQJdd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:33:33 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:26574 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234336AbhLQJda (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733609; x=1671269609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YRf+J/CveN9v/mBBSULutpk2yICowM0+G8+Um5XzvjY=;
  b=lqdzW8wSyLhgX0wTgZSQdqq9lsb31QjH4VYdFhm7rYa/RuAbnObuwk4F
   dMsdaPUSyvoYI6+IpY4RR7FmpqDh/bRefPpsdnfatv6ikS0Nu8G9tH8KR
   /q8Sbyya3VqjPFukxZWzskDPO6UkO+NW+6dsMnLt3BVmP4Vo/mLiNMGrp
   sO+HibFygu37Jtm78aohWXGs8+X9kr18CmnAv3+hW+sPDiVgt9AH6Xkde
   C+6FsoHHAwzOfSgwqmBcVx+mtvrETyzOUeNnmOd4XwvFKwZmM/Rsaf257
   +Nst2olo+ytwF59BEu24UdBUOCsQ3z3bl1AvKCbmWPeSP3I4NNtomymFa
   Q==;
IronPort-SDR: 5kU8ugyR6rFeYPzzwUrOvEcmXLHtPPnE5vScHarLL9KZrqGgCDT9/heNLX87vVeTWwjG371zcS
 vOSSzHbuR/4/dQ/tktwTyH7jtnCqoRkniyVnm1coEwHESSlFti67Qz7O+gQMQ6OHyg2yU5Xuyy
 MUuVLwqM3PAAQJGhViph+1IOuzChZoym27O9pJRmbr96EbBGVIOxKb9pJSLNqlye+qPBv2vrKK
 2zD6YVS3VJzQZSDmKfUf+JhsvEH9aNbYXXIZ3QqQN5OJb6phHTMc1BsO1x3IB9CBDtrxkXgBQ0
 yn2XTxGFFYooSAIp1RZOZRJ8
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147571120"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:33:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:33:15 -0700
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
Subject: [PATCH v2 11/17] dt-bindings: usb: add bindings for microchip mpfs musb
Date:   Fri, 17 Dec 2021 09:33:19 +0000
Message-ID: <20211217093325.30612-12-conor.dooley@microchip.com>
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

Add device tree bindings for the usb controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/usb/microchip,mpfs-musb.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
new file mode 100644
index 000000000000..eec918046c73
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,mpfs-musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS USB Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-musb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  interrupt-names:
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
+    usb: usb@20201000 {
+        compatible = "microchip,mpfs-musb";
+        reg = <0x20201000 0x1000>;
+        clocks = <&clkcfg CLK_USB>;
+        interrupt-parent = <&plic>;
+        interrupts = <86>, <87>;
+        interrupt-names = "dma","mc";
+        dr_mode = "host";
+    };
+
+...
-- 
2.33.1

