Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FBB47878D
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbhLQJdj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:33:39 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:26574 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234346AbhLQJdd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733612; x=1671269612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+4OyQOO2z/EslKlzMr6C+I3gExmtktcq7ncjc8J+Bgs=;
  b=fImXVkiY7+yqV6zm+yiB1N0UCIqeeK5Y4jawAfCvvC6MytcVk7EPIRbQ
   ELzljITpqSqCgVzEQ6+t1smsSr8YE8F98CeK4SLEAd7cv3M8PA7f5a08k
   QckI/FINMco+O616CBiVAeMdOzd55Ipp1zlJt4tCB2KNSBC/BwQ2mkSDS
   URz5Lk19tMlkAuDcnjMVxnOirxCzGI7oX2GjmsZnSGYlWsa7uzeHdf5dA
   lOwCGogiL6/M04V/LjK+LMTVHf6PO/+9/vtoeNS945PGYwSHU281ckr3v
   5FUA1BP6k4mH9DZMrfD4x1qD3JIRoF8R9Q8uM9K7MKpLNxDYVbJoABt7A
   Q==;
IronPort-SDR: j9YzdyjWy9vzcZPUTClMB8IlqKrR/QpfZGKU4Yk/B65HsAadK6145td29LTU7N1KD0UHmmyGkf
 DjqM7IxJ/mA9eKhX9KsWdsgmqXOJ9AWzmAIUdM5GEztoiZC2hI1n9F1Hsg3x2oe32s3KLmtvuW
 X4lu1jTQAwpmgWok5RsEFkWafifPHxqRV0SDDJTSTOSNabzZ/zMutC++itqr2TjPgj6uu38gop
 UVJuRTA8jYr0ki9Y3EmKRyhfV/gNU++hpmprd1SfxcVmhwaWXFkwrxWBCPRc4VqXKIuB+jsWeI
 JFCeuF5gBdGEKiJ+scOaQeJZ
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147571134"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:33:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:27 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:33:22 -0700
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
Subject: [PATCH v2 12/17] dt-bindings: pwm: add microchip corePWM binding
Date:   Fri, 17 Dec 2021 09:33:20 +0000
Message-ID: <20211217093325.30612-13-conor.dooley@microchip.com>
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

Add device tree bindings for the Microchip fpga fabric based "core" PWM controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pwm/microchip,corepwm.yaml       | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
new file mode 100644
index 000000000000..ed7d0351adc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
@@ -0,0 +1,61 @@
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
+      - const: microchip,corepwm
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
+
+    $ref: /schemas/types.yaml#/definitions/uint8
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
+    corePWN1: corePWM@41000000 {
+      compatible = "microchip,corepwm";
+      microchip,sync-update = /bits/ 8 <1>;
+      clocks = <&clkcfg CLK_FIC3>;
+      reg = <0x41000000 0xF0>;
+      #pwm-cells = <2>;
+    };
-- 
2.33.1

