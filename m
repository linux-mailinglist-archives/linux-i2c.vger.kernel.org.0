Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B68248ECBC
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242856AbiANPRh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:17:37 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:45331 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242976AbiANPRX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173443; x=1673709443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m4uG6fn9Ja8wYJxOVT09ajA8/irJHQR89DHN80WIHNs=;
  b=gyffGj0B6q7n3ROkDKo5lScO/ptwk2l/Nl0Pd9xadJdG7TE75eVaLWp9
   o8F6Putd1SbdppybzPvKwQu1VteaVJHyTIWxPbg/KCZhIBPH1JHPKAPTa
   GjeFOpRNm+t5VlpBWSALfNVHWy44rBl9NeIMC/GUqms8psze8paa2NMTu
   5YF+o6uWSGic0FF9dU3kE6x0QTe6mDRU9vvPuGGOcPtanpYagIIyfrWiq
   snePOoEffywLxDheXB3JvTWRuAqjlbOJcqhp2ghSThS3jqOdDwzfALr3q
   PV1P2JwoqoWR/1QpDCBL95UPSzUIalJmOkkztqlDxcW3Lsxo76MUBblnl
   w==;
IronPort-SDR: 7WWftUvpn13G7qKUhXOz04JEV8/kCBG7ebs/rTJS2i4v2zFKV3EqpZTDzTaw808lER9PFlVDBb
 nY41tojVN326tiTitHsZ9Ou6NjITYOtdXPSeUJNoiCOpOUeLsrsmUyzFiDx6+hHqkNUpklNHTW
 ZItxpo+7ZALCCY5lPXVyXj6VIuL8NepKh8cDQg3bvY/l2i963o4oFHyPuyNLejrVQY4ULMSNZo
 vGS03LN+E/YAPHvGdN8C/gDFhZoCebIK5uwoZl0ANnn+spb1hNwVzk9DddQNMMJGJZJ3X7172m
 eMHce+RQ43VbhHaWwr4fvC1d
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="150236722"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:17:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:17:21 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:17:15 -0700
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
Subject: [PATCH v3 09/15] dt-bindings: pwm: add microchip corepwm binding
Date:   Fri, 14 Jan 2022 15:17:21 +0000
Message-ID: <20220114151727.2319915-10-conor.dooley@microchip.com>
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

Add device tree bindings for the Microchip fpga fabric based "core" PWM controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
new file mode 100644
index 000000000000..26a77cde2465
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/microchip,corepwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip ip core PWM controller bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  corePWM is an 16 channel pulse width modulator FPGA IP
+
+  https://www.microsemi.com/existing-parts/parts/152118
+
+properties:
+  compatible:
+    items:
+      - const: microchip,corepwm-rtl-v4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+  microchip,sync-update:
+    description: |
+      In synchronous mode, all channels are updated at the beginning of the PWM period.
+      Asynchronous mode is relevant to applications such as LED control, where
+      synchronous updates are not required. Asynchronous mode lowers the area size,
+      reducing shadow register requirements. This can be set at run time, provided
+      SHADOW_REG_EN is asserted. SHADOW_REG_EN is set by the FPGA bitstream programmed
+      to the device.
+      Each bit corresponds to a PWM channel & represents whether synchronous mode is
+      possible for the PWM channel.
+
+    $ref: /schemas/types.yaml#/definitions/uint16
+    default: 0
+
+  microchip,dac-mode:
+    description: |
+      Optional, per-channel Low Ripple DAC mode is possible on this IP core. It creates
+      a minimum period pulse train whose High/Low average is that of the chosen duty
+      cycle. This "DAC" will have far better bandwidth and ripple performance than the
+      standard PWM algorithm can achieve.
+      Each bit corresponds to a PWM channel & represents whether dac mode is enabled
+      that PWM channel.
+
+    $ref: /schemas/types.yaml#/definitions/uint16
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    pwm@41000000 {
+      compatible = "microchip,corepwm-rtl-v4";
+      microchip,sync-update = /bits/ 16 <0>;
+      clocks = <&clkcfg CLK_FIC3>;
+      reg = <0x41000000 0xF0>;
+      #pwm-cells = <2>;
+    };
-- 
2.32.0

