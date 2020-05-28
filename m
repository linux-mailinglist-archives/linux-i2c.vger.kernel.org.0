Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F77F1E5C1D
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 11:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387444AbgE1JeJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 05:34:09 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:40574 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387411AbgE1Jdf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 May 2020 05:33:35 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 57FE18030772;
        Thu, 28 May 2020 09:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id De2h5mldPOtA; Thu, 28 May 2020 12:33:30 +0300 (MSK)
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
Subject: [PATCH v6 05/11] i2c: designware: slave: Set DW I2C core module dependency
Date:   Thu, 28 May 2020 12:33:15 +0300
Message-ID: <20200528093322.23553-6-Sergey.Semin@baikalelectronics.ru>
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

DW APB I2C slave code in fact depends on the DW I2C driver core, but not
on the platform code as it used to be before commit 90bc1ee6de9f ("i2c:
designware: Allow slave mode for PCI enumerated devices"). Yes, the I2C
slave interface is currently supported by both the platform and PCI
versions of the IP core, but it still depends on the DW I2C core
functionality and must be available only if the last one is enabled.
So make sure the DW APB I2C slave config is only available if the
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
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 1d940810e47e..7f92f6a96042 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -529,6 +529,7 @@ config I2C_DESIGNWARE_CORE
 
 config I2C_DESIGNWARE_SLAVE
 	bool "Synopsys DesignWare Slave"
+	depends on I2C_DESIGNWARE_CORE
 	select I2C_SLAVE
 	help
 	  If you say yes to this option, support will be included for the
-- 
2.26.2

