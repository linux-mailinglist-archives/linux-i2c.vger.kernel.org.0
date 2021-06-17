Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DF73AB010
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jun 2021 11:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhFQJrw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Jun 2021 05:47:52 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:42747 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbhFQJrv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Jun 2021 05:47:51 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15H9VHmn024645;
        Thu, 17 Jun 2021 17:31:17 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun
 2021 17:45:39 +0800
From:   Jamin Lin <jamin_lin@aspeedtech.com>
To:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        "Andrew Jeffery" <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Jean Delvare" <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
CC:     <chiawei_wang@aspeedtech.com>, <troy_lee@aspeedtech.com>,
        <steven_lee@aspeedtech.com>
Subject: [PATCH 2/3] dt-bindings: i2c-new: Add bindings for AST2600 I2C
Date:   Thu, 17 Jun 2021 17:43:39 +0800
Message-ID: <20210617094424.27123-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15H9VHmn024645
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

AST2600 support the new register set of I2C controller
Add bindings document to support the new driver of I2C

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 .../bindings/i2c/aspeed,new-i2c.yaml          | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
new file mode 100644
index 000000000000..2c264596b138
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/aspeed,new-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED I2C on the AST26XX SoCs Device Tree Bindings
+
+description: |
+  ASPEED I2C controller support the new register set since AST26XX
+  The i2c-global-regs device is used to enable new register set
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - aspeed,ast2600-i2c-bus
+      - items:
+          - enum:
+              - aspeed,ast2600-i2c-global
+          - const: syscon
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: address offset and range of bus
+      - description: address offset and range of bus buffer
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      root clock of bus, should reference the APB
+      clock in the second cell
+
+  resets:
+    maxItems: 1
+
+  bus-frequency:
+    minimum: 100
+    maximum: 5000000
+    default: 100000
+    description: frequency of the bus clock in Hz defaults to 100 kHz when not
+      specified
+
+  multi-master:
+    type: boolean
+    description:
+      states that there is another master active on this bus
+
+  buff-mode:
+    type: boolean
+    description:
+      buffer mode data transfer
+
+  byte-mode:
+    type: boolean
+    description:
+      byte mode tata transfer
+
+  smbus-alert:
+    type: boolean
+    description:
+      smbus alert protocol
+
+required:
+  - reg
+  - compatible
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    i2c_gr: i2c-global-regs@0 {
+      compatible = "aspeed,ast2600-i2c-global", "syscon";
+      reg = <0x0 0x20>;
+      clocks = <&syscon ASPEED_CLK_APB2>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+    };
+
+    i2c0: i2c-bus@80 {
+      compatible = "aspeed,ast2600-i2c-bus";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      #interrupt-cells = <1>;
+      reg = <0x80 0x80>, <0xC00 0x20>;
+      clocks = <&syscon ASPEED_CLK_APB2>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+      bus-frequency = <100000>;
+    };
-- 
2.17.1

