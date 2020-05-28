Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3E51E5BF9
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 11:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387406AbgE1Jdd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 05:33:33 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:40510 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728224AbgE1Jdc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 May 2020 05:33:32 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id D0A5180307C7;
        Thu, 28 May 2020 09:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id D73ABvCPvBA9; Thu, 28 May 2020 12:33:29 +0300 (MSK)
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
Subject: [PATCH v6 02/11] dt-bindings: i2c: Convert DW I2C slave to the DW I2C master example
Date:   Thu, 28 May 2020 12:33:12 +0300
Message-ID: <20200528093322.23553-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
i2c "reg" property. If dtc finds an i2c-slave sub-node having an address
higher than ten-bits wide it'll print an ugly warning:

Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"

In order to silence dtc up let's replace the corresponding DT binding
example with a normal DW I2C master mode-based one. It's done by clearing
the I2C_OWN_SLAVE_ADDRESS bit in the reg property and converting the
sub-node to be compatible with normal EEPROM like "atmel,24c02".

Just revert this commit when dtc is fixed.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mips@vger.kernel.org

---

Rob, even though you asked for such modification, it might be a better to
just ignore the warning until dtc is properly fixed. Andy and me agree
with that. If you are also on the same side with us, just explicitly nack
this patch so Jarkko or Wolfram would ignore it when merging in the series.

Changelog v3:
- This is a new patch created as a result of the Rob request to remove
  the EEPROM-slave bit setting in the DT binndings example until the dtc
  is fixed.

Changelog v6:
- Replace the "linux,slave-24c02" compatible string with "atmel,24c02" one
  so the example would be perceived as a normal DW I2C master mode.
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 4bd430b2b41d..dff3f267bdee 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -136,8 +136,8 @@ examples:
       interrupts = <0>;
 
       eeprom@64 {
-        compatible = "linux,slave-24c02";
-        reg = <0x40000064>;
+        compatible = "atmel,24c02";
+        reg = <0x64>;
       };
     };
   - |
-- 
2.26.2

