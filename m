Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE9C2CE1C5
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 23:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731872AbgLCWd5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 17:33:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:55830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731857AbgLCWd4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 17:33:56 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Vadim Pasternak <vadimp@mellanox.com>,
        Wolfram Sang <wsa@kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mlxbf: select CONFIG_I2C_SLAVE
Date:   Thu,  3 Dec 2020 23:32:50 +0100
Message-Id: <20201203223311.1251788-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

If this is not enabled, the interfaces used in this driver do not work:

drivers/i2c/busses/i2c-mlxbf.c:1888:3: error: implicit declaration of function 'i2c_slave_event' [-Werror,-Wimplicit-function-declaration]
                i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
                ^
drivers/i2c/busses/i2c-mlxbf.c:1888:26: error: use of undeclared identifier 'I2C_SLAVE_WRITE_REQUESTED'
                i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
                                       ^
drivers/i2c/busses/i2c-mlxbf.c:1890:32: error: use of undeclared identifier 'I2C_SLAVE_WRITE_RECEIVED'
                ret = i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED,
                                             ^
drivers/i2c/busses/i2c-mlxbf.c:1892:26: error: use of undeclared identifier 'I2C_SLAVE_STOP'
                i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
                                       ^

Fixes: b5b5b32081cd ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a97a9d058198..a49e0ed4a599 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -734,6 +734,7 @@ config I2C_LPC2K
 config I2C_MLXBF
         tristate "Mellanox BlueField I2C controller"
         depends on MELLANOX_PLATFORM && ARM64
+	select I2C_SLAVE
         help
           Enabling this option will add I2C SMBus support for Mellanox BlueField
           system.
-- 
2.27.0

