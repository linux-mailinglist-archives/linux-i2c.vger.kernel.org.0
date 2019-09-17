Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D95B2B4D3A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 13:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfIQLtW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 07:49:22 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:34637 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfIQLtW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Sep 2019 07:49:22 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAByy-00016A-1C; Tue, 17 Sep 2019 12:49:20 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iAByx-0001sQ-NG; Tue, 17 Sep 2019 12:49:19 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 2/2] i2c: core: remove #ifdef for CONFIG_X86
Date:   Tue, 17 Sep 2019 12:49:18 +0100
Message-Id: <20190917114918.7157-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917114918.7157-1-ben.dooks@codethink.co.uk>
References: <20190917114918.7157-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove the #ifdef CONFIG_X86 in i2c_default_probe() and move the test
logic out into i2c_try_x86_default_probe() helper function. This makes
less #ifdef usage and the code in i2c_default_probe() a bit cleaer.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/i2c/i2c-core-base.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index fb8fd32f2783..87ab906eb536 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2116,6 +2116,14 @@ EXPORT_SYMBOL_GPL(i2c_get_device_id);
  * ----------------------------------------------------
  */
 
+static bool i2c_try_x86_default_probe(struct i2c_adapter *adap, unsigned short addr)
+{
+	if (!IS_ENABLED(CONFIG_X86))
+		return false;
+	return (addr == 0x73 && (adap->class & I2C_CLASS_HWMON)
+		&& i2c_check_functionality(adap, I2C_FUNC_SMBUS_READ_BYTE_DATA));
+}
+
 /*
  * Legacy default probe function, mostly relevant for SMBus. The default
  * probe method is a quick write, but it is known to corrupt the 24RF08
@@ -2133,14 +2141,10 @@ static int i2c_default_probe(struct i2c_adapter *adap, unsigned short addr)
 	int err;
 	union i2c_smbus_data dummy;
 
-#ifdef CONFIG_X86
-	if (addr == 0x73 && (adap->class & I2C_CLASS_HWMON)
-	 && i2c_check_functionality(adap, I2C_FUNC_SMBUS_READ_BYTE_DATA))
+	if (i2c_try_x86_default_probe(adap, addr))
 		err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
 				     I2C_SMBUS_BYTE_DATA, &dummy);
-	else
-#endif
-	if (!((addr & ~0x07) == 0x30 || (addr & ~0x0f) == 0x50)
+	else if (!((addr & ~0x07) == 0x30 || (addr & ~0x0f) == 0x50)
 	 && i2c_check_functionality(adap, I2C_FUNC_SMBUS_QUICK))
 		err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_WRITE, 0,
 				     I2C_SMBUS_QUICK, NULL);
-- 
2.23.0

