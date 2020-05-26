Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664F21E31A0
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 23:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390491AbgEZVzv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 17:55:51 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59986 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389384AbgEZVzu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 17:55:50 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 2ED9A8030877;
        Tue, 26 May 2020 21:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Z0qVl-qB3sNO; Wed, 27 May 2020 00:55:39 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 06/12] i2c: designware: slave: Set DW I2C core module dependency
Date:   Wed, 27 May 2020 00:55:22 +0300
Message-ID: <20200526215528.16417-7-Sergey.Semin@baikalelectronics.ru>
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

DW APB I2C slave code in fact depends on the DW I2C driver core, but not
on the platform code. Yes, the I2C slave interface is currently supported
by the platform version of the IP core, but it doesn't make it dependent
on it. So make sure the DW APB I2C slave config is only available if the
I2C_DESIGNWARE_CORE config is enabled.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2ddca08f8a76..b907d4046942 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -540,8 +540,8 @@ config I2C_DESIGNWARE_PLATFORM
 
 config I2C_DESIGNWARE_SLAVE
 	bool "Synopsys DesignWare Slave"
+	depends on I2C_DESIGNWARE_CORE
 	select I2C_SLAVE
-	depends on I2C_DESIGNWARE_PLATFORM
 	help
 	  If you say yes to this option, support will be included for the
 	  Synopsys DesignWare I2C slave adapter.
-- 
2.26.2

