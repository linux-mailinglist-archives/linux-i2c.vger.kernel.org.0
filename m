Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3809B47876D
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbhLQJdP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:33:15 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:26521 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbhLQJdO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733594; x=1671269594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AZ9n/RyDSa/dhqvl7nTlTNh+a3wwb7PMc//RGFolf8w=;
  b=mM0x/glgcq7Do/QyCRX16aw/R+HMD1JIQmzQ+4hMKS0XpTRUCQ4SnjkW
   AxMgdx6hdz3hza84w9CizGKVkHDjB/eyAC/pafzT7SuKCjSRgnCg+/ELp
   ezvRFpotVDvbuuWxVrDtTWzUhI5WUSilmQ2fHmVHSjQvowodj+KnUB+T+
   QmOIXqB8qg050SgwAcHcMJRfkEWieq8dPPTW+WU5VkHaNFB0hZ7ppHwQ+
   i3TITGVcOgqkRYd/rM6/w4dXv6sISd+ZwTuuLx8Hj/arHnurOBqr2rqHf
   cXg+SLfV2iUpqTDNCwxYRdy8EzhrHC+wzuueJqmzDHXdtgPzBkr670Z1w
   g==;
IronPort-SDR: URrvqfHRIKuhsX04dHO5TwmpgWvtDIMhF78YdofCTrkXAmRTVPOmQ1RmHEd5wpIimtFRad8/Me
 uQoAlyKxdynFMA47OHC1uo3LoJpFqPy2tcj0+afKERlsVjGnbMgXYGCexsdH3BtFKvx/DzXegY
 VFOuScWBc3AeJXLHNVNjmtbHfWCK0cvx/QO0twyAVRXyzGBk/datukPaSSkACKcoZNRiumuQcB
 /1MbgOBrWhC+NAZxuRcCP65M9mpYxhCEn3iZBI1dPSPaJyGJ5ZVOmh4wr+cb3WTa/yaxkQQQ29
 58jmm0K0BLbxX/ZWbgCgcIPe
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147571047"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:33:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:32:55 -0700
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
Subject: [PATCH v2 08/17] dt-bindings: soc/microchip: add bindings for mpfs system services
Date:   Fri, 17 Dec 2021 09:33:16 +0000
Message-ID: <20211217093325.30612-9-conor.dooley@microchip.com>
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

Add device tree bindings for the services provided by the system
controller directly on the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-generic-service.yaml       | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
new file mode 100644
index 000000000000..d044525b3487
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs-generic-service.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS system services
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  The PolarFire SoC system controller is communicated with via a mailbox.
+  This binding represents several of the functions provided by the system
+  controller which do not belong in a specific subsystem, such as reading
+  the fpga device certificate, all of which follow the same format:
+    - a command + optional payload sent to the sys controller
+    - a status + a payload returned to Linux.
+
+properties:
+  compatible:
+    const: microchip,mpfs-generic-service
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    sysserv: sysserv {
+        compatible = "microchip,mpfs-generic-service";
+    };
-- 
2.33.1

