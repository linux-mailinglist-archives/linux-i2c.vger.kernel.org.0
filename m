Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FBA271807
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Sep 2020 23:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgITVI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Sep 2020 17:08:29 -0400
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:55417 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726126AbgITVI3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Sep 2020 17:08:29 -0400
X-Greylist: delayed 1130 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 17:08:28 EDT
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 08KKmfuV002773;
        Sun, 20 Sep 2020 23:48:41 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id AF7F5639D5; Sun, 20 Sep 2020 23:48:41 +0300 (IDT)
From:   Tali Perry <tali.perry1@gmail.com>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        kunyi@google.com, benjaminfair@google.com, avifishman70@gmail.com,
        joel@jms.id.au, tmaimon77@gmail.com
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v1] i2c: npcm7xx: Clear LAST bit after a failed transaction.
Date:   Sun, 20 Sep 2020 23:48:09 +0300
Message-Id: <20200920204809.132911-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Due to a HW issue, in some scenarios the LAST bit might remain set.
This will cause an unexpected NACK after reading 16 bytes on the next
read.

Example: if user tries to read from a missing device, get a NACK,
then if the next command is a long read ( > 16 bytes),
the master will stop reading after 16 bytes.
To solve this, if a command fails, check if LAST bit is still
set. If it does, reset the module.

Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index dfcf04e1967f..2ad166355ec9 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2163,6 +2163,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	if (bus->cmd_err == -EAGAIN)
 		ret = i2c_recover_bus(adap);
 
+	/*
+	 * After any type of error, check if LAST bit is still set,
+	 * due to a HW issue.
+	 * It cannot be cleared without resetting the module.
+	 */
+	if (bus->cmd_err &&
+	    (NPCM_I2CRXF_CTL_LAST_PEC & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
+		npcm_i2c_reset(bus);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	/* reenable slave if it was enabled */
 	if (bus->slave)

base-commit: 856deb866d16e29bd65952e0289066f6078af773
-- 
2.22.0

