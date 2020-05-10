Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88821CC9F8
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 11:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgEJJ7m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 05:59:42 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46264 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbgEJJ7l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 05:59:41 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 0EF0B803078D;
        Sun, 10 May 2020 09:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gyDqogqbM8Ej; Sun, 10 May 2020 12:50:34 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Frank Rowand <frowand.list@gmail.com>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 03/12] dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C controller
Date:   Sun, 10 May 2020 12:50:09 +0300
Message-ID: <20200510095019.20981-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the "baikal,bt1-sys-i2c" compatible string to the DW I2C binding and
make sure the reg property isn't required in this case because the
controller is embedded into the Baikal-T1 System Controller. The rest of
the DW APB I2C properties are compatible and can be freely used to describe
the Baikal-T1 I2C controller dts-node.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linux-mips@vger.kernel.org

---

Rob, I had to remove your acked-by tag because of the changes introduced
in v2 of the patch.

Changelog v2:
- Make the reg property being optional if it's Baikal-T1 System I2C DT
  node.
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 8d4e5fccbd1c..579964098eb9 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -21,6 +21,15 @@ allOf:
       properties:
         reg:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: baikal,bt1-sys-i2c
+    then:
+      required:
+        - reg
 
 properties:
   compatible:
@@ -31,6 +40,8 @@ properties:
         items:
           - const: mscc,ocelot-i2c
           - const: snps,designware-i2c
+      - description: Baikal-T1 SoC System I2C controller
+        const: baikal,bt1-sys-i2c
 
   reg:
     minItems: 1
@@ -98,7 +109,6 @@ unevaluatedProperties: false
 
 required:
   - compatible
-  - reg
   - "#address-cells"
   - "#size-cells"
   - interrupts
-- 
2.25.1

