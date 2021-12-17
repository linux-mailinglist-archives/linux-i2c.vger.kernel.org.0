Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED36478760
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbhLQJdJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:33:09 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:9472 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232819AbhLQJdF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733585; x=1671269585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gS2HEVkFP5ZT4c04g14Ry523BXpa4eJOH4ez0d0CMYg=;
  b=sMANZTmBy9d42cLfdWeS6CQAb6zG6I6s+vMLxBxdz2lav3aWnZFcLlD9
   WDDlRpsYkHj4+ddsWTO6ckPARX1YHo9g4FwyWNUy0vTGSp8btYpFzmqAn
   e3gZ/vTqHGEgDrtEryviCZ2ZuFzn2CfS7yl+M0VYKNo30L/d+puX+eUhY
   VO0t4YpqpePgherJrLiXjEsf+BwHFGINXheviwiX9dhvEKrp0iSl1jfkz
   ROCZyYMX6+SMoBQDHitXXrXQy2yiqUSTc+1tNPfTisEgRMNftCn+x4RiH
   QMxU6ACDrbSvZRev2QeJKBGVweMxOalyq0HeHQQabKRXnXXPUKMHzi6ds
   g==;
IronPort-SDR: RpqDwPDYdO0XhcVYtN2cMX5kcR6mmBvXnuh+MkWOJ7snVHp8GWWgynwZ2ASVR4aMpPXVT6v6GN
 myhE6XlJRvSLmmTOpeKIqWHfdUzQ2RWKvgn7ahkXd8Rn0sEfPeg4lCV9/BH3tWmZlYhsclXEQU
 dp5EZecfYu8MOz/qF1oN7o46DtxhViDCGFZawUJJHMDMqzXRmYWaIg1fHh9TJCauoxNJQfM/34
 zzIXwwvfRPqULw0uMNSVYomrNLZIsi0jJsywpJMrQFCAD7zfpD4BIgssxMmdlInzmQDNmCUSX7
 KHq+Do9zN9H35WLG/ZqGA9YT
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="142745628"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:33:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:32:48 -0700
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
Subject: [PATCH v2 07/17] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date:   Fri, 17 Dec 2021 09:33:15 +0000
Message-ID: <20211217093325.30612-8-conor.dooley@microchip.com>
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

Add device tree bindings for the real time clock on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
new file mode 100644
index 000000000000..d57460cbe5e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
+
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+  - Lewis Hanly <lewis.hanly@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 2
+
+  microchip,prescaler:
+    description: |
+      The prescaler divides the input frequency to create a time-based strobe (typically 1 Hz) for
+      the calendar counter. The Alarm and Compare Registers, in conjunction with the calendar
+      counter, facilitate time-matched events. To properly operate in Calendar or Binary mode,
+      the 26-bit prescaler must be programmed to generate a strobe to the RTC.
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: rtc
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    rtc@20124000 {
+        compatible = "microchip,mpfs-rtc";
+        reg = <0x20124000 0x1000>;
+        clocks = <&clkcfg CLK_RTC>;
+        clock-names = "rtc";
+        interrupts = <80>, <81>;
+    };
+...
-- 
2.33.1

