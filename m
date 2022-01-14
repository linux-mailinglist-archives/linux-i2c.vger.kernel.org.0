Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5D048ECA4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242961AbiANPRV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:17:21 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:50699 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242886AbiANPRN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173432; x=1673709432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+qPRXox7zPzI+myjQz8NC5TP9D5voUl5Cp51OFrTMa8=;
  b=XTHsGst4bMv67gKdofTTX809TGBjhF4Gpfmf3UrdSIs0vtsSld11U6Zm
   rQ3liVj14/yxBknT08D0OCFeEn6Qv2ZRbNI6h+klFB0TCnL6mCT/Kc8T6
   yWMTiQ93eO+L8UV8WQPBYABR/tZSVHNgDG6gZTsyvJCfovLiJ7iazgGzW
   ojAT5yUuRj5hc8XtLqeA31s2NIcz0Yke0ZcHbgoofyoRJ1647XQkbtf9J
   5H80p4CCDmyx1GIO3V145M+k5InmSE0ACqrpk5XgFp4OXWX303XZYe3B0
   nlLBAirVwc4JBKZbIj58rV6Q0IldsLK+NXI6d/NZeP1h3pLX1p5TomRVL
   Q==;
IronPort-SDR: pv1M3xpiwF4GwIuMI+y3FQnMDgMJogxLnT3187uonLweWF6/G9UfkbLepORDDd8bG7yn6jm5tN
 nnMJ0cJN8/lPD3bLaAqcKsxlY+1fjVJNOiTqp0AsC866FkUOV3Re+icAsmeST3PVp2GDkEmz25
 cygmWSJNt2M953p0ZcLMS2RhhS3BKDLyC5yPmIrMf1Z+o5cBEqvowR9hCdkwPIGTvLOlVfnxCb
 Tq2y8igpUDBnvAIpvhifRPFWsZbndr2Y5Gxf7JH4c5SMptzcx9uSP00enpXLKeWowUmQSFnk20
 z76AZYgCSKNnCqs25q1nTtTz
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="142730887"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:17:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:17:11 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:17:05 -0700
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
Subject: [PATCH v3 08/15] dt-bindings: usb: add bindings for microchip mpfs musb
Date:   Fri, 14 Jan 2022 15:17:20 +0000
Message-ID: <20220114151727.2319915-9-conor.dooley@microchip.com>
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

