Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3871E418A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 14:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387486AbgE0MI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 08:08:29 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34924 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728440AbgE0MH3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 08:07:29 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 372748030835;
        Wed, 27 May 2020 12:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MeOxT80o2dj2; Wed, 27 May 2020 15:07:24 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 03/11] dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C controller
Date:   Wed, 27 May 2020 15:01:03 +0300
Message-ID: <20200527120111.5781-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the "baikal,bt1-sys-i2c" compatible string to the DW I2C binding. Even
though the corresponding node is supposed to be a child of the Baikal-T1
System Controller, its reg property is left required for compatibility.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mips@vger.kernel.org

---

Changelog v2:
- Make the reg property being optional if it's Baikal-T1 System I2C DT
  node.

Changelog v3:
- Get back the reg property being mandatory even if it's Baikal-T1 System
  I2C DT node. Rob says it has to be in the DT node if there is a
  dedicated registers range in the System Controller registers space.
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 101d78e8f19d..8c9b3db1b1b8 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -31,6 +31,8 @@ properties:
         items:
           - const: mscc,ocelot-i2c
           - const: snps,designware-i2c
+      - description: Baikal-T1 SoC System I2C controller
+        const: baikal,bt1-sys-i2c
 
   reg:
     minItems: 1
-- 
2.26.2

