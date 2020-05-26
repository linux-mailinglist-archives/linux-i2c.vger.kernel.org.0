Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832231E31C1
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 23:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389646AbgEZVzo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 17:55:44 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59830 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389384AbgEZVzo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 17:55:44 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A381C803086D;
        Tue, 26 May 2020 21:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uTdaH333Hlk4; Wed, 27 May 2020 00:55:36 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 01/12] scripts/dtc: check: Add 10bit/slave i2c reg flags support
Date:   Wed, 27 May 2020 00:55:17 +0300
Message-ID: <20200526215528.16417-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Recently the I2C-controllers slave interface support was added to the
kernel I2C subsystem. In this case Linux can be used as, for example,
a I2C EEPROM machine. See [1] for details. Other than instantiating
the EEPROM-slave device from user-space there is a way to declare the
device in dts. In this case firstly the I2C bus controller must support
the slave interface. Secondly I2C-slave sub-node of that controller
must have "reg"-property with flag I2C_OWN_SLAVE_ADDRESS set (flag is
declared in [2]). That flag is declared as (1 << 30), which when set
makes dtc unhappy about too big address set for a I2C-slave:

Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"

Similar problem would have happened if we had set the 10-bit address
flag I2C_TEN_BIT_ADDRESS in the "reg"-property.

In order to fix the problem we suggest to alter the I2C-bus reg-check
algorithm, so one would be aware of the upper bits set. Normally if no
flag specified, the 7-bit address is expected in the "reg"-property.
If I2C_TEN_BIT_ADDRESS is set, then the 10-bit address check will be
performed. The I2C_OWN_SLAVE_ADDRESS flag will be just ignored.

[1] Documentation/i2c/slave-interface.rst
[2] include/dt-bindings/i2c/i2c.h

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mips@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
---
 scripts/dtc/checks.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 4b3c486f1399..6321fc5b7404 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -1028,6 +1028,7 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
 	const char *unitname = get_unitname(node);
 	char unit_addr[17];
 	uint32_t reg = 0;
+	uint32_t addr;
 	int len;
 	cell_t *cells = NULL;
 
@@ -1044,17 +1045,21 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
 	}
 
 	reg = fdt32_to_cpu(*cells);
-	snprintf(unit_addr, sizeof(unit_addr), "%x", reg);
+	addr = reg & 0x3FFFFFFFU;
+	snprintf(unit_addr, sizeof(unit_addr), "%x", addr);
 	if (!streq(unitname, unit_addr))
 		FAIL(c, dti, node, "I2C bus unit address format error, expected \"%s\"",
 		     unit_addr);
 
 	for (len = prop->val.len; len > 0; len -= 4) {
 		reg = fdt32_to_cpu(*(cells++));
-		if (reg > 0x3ff)
+		addr = reg & 0x3FFFFFFFU;
+		if ((reg & (1 << 31)) && addr > 0x3ff)
 			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 10-bits, got \"0x%x\"",
-				  reg);
-
+				  addr);
+		else if (!(reg & (1 << 31)) && addr > 0x7f)
+			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 7-bits, got \"0x%x\"",
+				  addr);
 	}
 }
 WARNING(i2c_bus_reg, check_i2c_bus_reg, NULL, &reg_format, &i2c_bus_bridge);
-- 
2.26.2

