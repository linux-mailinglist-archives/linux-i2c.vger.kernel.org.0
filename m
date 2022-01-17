Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE82C4906B3
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 12:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbiAQLGz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 06:06:55 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55978 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238959AbiAQLGj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 06:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642417599; x=1673953599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+qPRXox7zPzI+myjQz8NC5TP9D5voUl5Cp51OFrTMa8=;
  b=C1mSXSfTDFwE0LjkBM/l2DJZEzPkn+wKokAZ6ve5gKniISUVKUQXlXsb
   Eoji3hwl0ykdEUq24x/eSs2ca5UJ57xLb4EEPyKIKEGXJtbtJmYMk/2DX
   oRHHYNBUXrDgAB89okP3mY+InHeMGCHjbX1qsBsCFd6Vzqop4SPZ5ieFZ
   cWpIUIBfLDzWutcazWGqxQbZJjqV9dNrRHyyXAn/GeIkovIatkl0BC14Q
   Z/dmf6kOpph6hRV7PKOLCRv/1w22Ci/BmvW6FwYo03CDplz3zoNZQkTV3
   EqU7VruhX1p7D3jDGuXi2/deB5CnfY8v5KGjY5KbURks1sRY0lHXh0aty
   A==;
IronPort-SDR: FMFs/dVFm1dh3LHmbvCAhNMyWmd0VJdKgV3IDMMMmQj6E7NG6jOvEp6uASzQ61JMwzCbA8jRd0
 FafcqUJEWgltVhrtiMebFIIAT1QNaYvbCTLDsUiSfdt52t1wfic0I+qsd835tqYXcNrtY7AQqB
 m6CVKQMgrD3UeszrwuRW1tvKTEhDssiubO8ilpGNALGQNgLFt2Yu0SPwj/C/1nSTLS4dDqLnxX
 LDJvPWNHR+ZhqH6t6ObAj6SrBYrl5cRIOInHod9/XT/z7Gd35n7mKpQsipoWK6s2wMT+tE/Olg
 UA4NzN1mWxWYV6342OgmWRif
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="142923821"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2022 04:06:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:06:36 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 17 Jan 2022 04:06:31 -0700
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
Subject: [PATCH v4 07/14] dt-bindings: usb: add bindings for microchip mpfs musb
Date:   Mon, 17 Jan 2022 11:07:48 +0000
Message-ID: <20220117110755.3433142-8-conor.dooley@microchip.com>
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

Add device tree bindings for the usb controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/usb/microchip,mpfs-musb.yaml     | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
new file mode 100644
index 000000000000..48c458c65848
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,mpfs-musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS USB Controller Device Tree Bindings
+
+allOf:
+  - $ref: usb-drd.yaml#
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-musb
+
+  dr_mode: true
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    usb@20201000 {
+        compatible = "microchip,mpfs-musb";
+        reg = <0x20201000 0x1000>;
+        clocks = <&clkcfg CLK_USB>;
+        interrupt-parent = <&plic>;
+        interrupts = <86>, <87>;
+        interrupt-names = "dma", "mc";
+        dr_mode = "host";
+    };
+
+...
-- 
2.32.0

