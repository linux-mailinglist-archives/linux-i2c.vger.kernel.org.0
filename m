Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 440507AEB91
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Sep 2023 13:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjIZLhh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 07:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbjIZLhg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 07:37:36 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA23E9
        for <linux-i2c@vger.kernel.org>; Tue, 26 Sep 2023 04:37:28 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B10521F74C;
        Tue, 26 Sep 2023 11:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695728246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=w2l/DwtBBXLIOdwZMsTEllqqwHC2f40Phf3VMYAm2bw=;
        b=YDU1yeELvu26dRKfPNTyd8m4g8O8M0u8aAdaz16UTnGchg9x9Co/bxIqiYqwP/HaWrUzSv
        8i/etCRcAIZYdX+Manfs8jfd1L5lFGRCNCXXPjEzK7D8glXKkulOkp/dz3jpPD+4lMYxgy
        GCAHeXMNBgr5ISBVn2cz8LEA5g9gves=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695728246;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=w2l/DwtBBXLIOdwZMsTEllqqwHC2f40Phf3VMYAm2bw=;
        b=b5xYq3uioAViM/+AxuxE9jyuppm/7/y2qRkLE2jHnJCQPDc+rENtRIj5Y1EA9twfUSyZdn
        3WkuQ20k1vjPACDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AA4D1390B;
        Tue, 26 Sep 2023 11:37:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id RwJUIHbCEmUNdQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 26 Sep 2023 11:37:26 +0000
Date:   Tue, 26 Sep 2023 13:37:25 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <20230926133725.5c3fb96e@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
written at a time when the i2c core did not support muxing. They are
essentially board-specific hacks. If we had to add support for these
boards today, we would implement it in a completely different way.

These Tyan server boards are 18 years old by now, so I very much doubt
any of these is still running today. So let's just drop this clumsy
code. If anyone really still needs this support and complains, I'll
rewrite it in a proper way on top of i2c-mux.

This also fixes the following warnings:
drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?
drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' was not declared. Should it be static?

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
---
 MAINTAINERS                            |    2 
 drivers/i2c/busses/Kconfig             |   26 ---
 drivers/i2c/busses/Makefile            |    2 
 drivers/i2c/busses/i2c-amd756-s4882.c  |  245 ---------------------------------
 drivers/i2c/busses/i2c-amd756.c        |    4 
 drivers/i2c/busses/i2c-nforce2-s4985.c |  240 --------------------------------
 drivers/i2c/busses/i2c-nforce2.c       |   16 --
 7 files changed, 1 insertion(+), 534 deletions(-)

--- linux-6.5.orig/MAINTAINERS
+++ linux-6.5/MAINTAINERS
@@ -9779,12 +9779,10 @@ F:	Documentation/i2c/busses/i2c-viapro.r
 F:	drivers/i2c/busses/i2c-ali1535.c
 F:	drivers/i2c/busses/i2c-ali1563.c
 F:	drivers/i2c/busses/i2c-ali15x3.c
-F:	drivers/i2c/busses/i2c-amd756-s4882.c
 F:	drivers/i2c/busses/i2c-amd756.c
 F:	drivers/i2c/busses/i2c-amd8111.c
 F:	drivers/i2c/busses/i2c-i801.c
 F:	drivers/i2c/busses/i2c-isch.c
-F:	drivers/i2c/busses/i2c-nforce2-s4985.c
 F:	drivers/i2c/busses/i2c-nforce2.c
 F:	drivers/i2c/busses/i2c-piix4.c
 F:	drivers/i2c/busses/i2c-sis5595.c
--- linux-6.5.orig/drivers/i2c/busses/Kconfig
+++ linux-6.5/drivers/i2c/busses/Kconfig
@@ -62,19 +62,6 @@ config I2C_AMD756
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-amd756.
 
-config I2C_AMD756_S4882
-	tristate "SMBus multiplexing on the Tyan S4882"
-	depends on I2C_AMD756 && X86
-	help
-	  Enabling this option will add specific SMBus support for the Tyan
-	  S4882 motherboard.  On this 4-CPU board, the SMBus is multiplexed
-	  over 8 different channels, where the various memory module EEPROMs
-	  and temperature sensors live.  Saying yes here will give you access
-	  to these in addition to the trunk.
-
-	  This driver can also be built as a module.  If so, the module
-	  will be called i2c-amd756-s4882.
-
 config I2C_AMD8111
 	tristate "AMD 8111"
 	depends on PCI
@@ -248,19 +235,6 @@ config I2C_NFORCE2
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-nforce2.
 
-config I2C_NFORCE2_S4985
-	tristate "SMBus multiplexing on the Tyan S4985"
-	depends on I2C_NFORCE2 && X86
-	help
-	  Enabling this option will add specific SMBus support for the Tyan
-	  S4985 motherboard.  On this 4-CPU board, the SMBus is multiplexed
-	  over 4 different channels, where the various memory module EEPROMs
-	  live.  Saying yes here will give you access to these in addition
-	  to the trunk.
-
-	  This driver can also be built as a module.  If so, the module
-	  will be called i2c-nforce2-s4985.
-
 config I2C_NVIDIA_GPU
 	tristate "NVIDIA GPU I2C controller"
 	depends on PCI
--- linux-6.5.orig/drivers/i2c/busses/Makefile
+++ linux-6.5/drivers/i2c/busses/Makefile
@@ -14,7 +14,6 @@ obj-$(CONFIG_I2C_ALI1535)	+= i2c-ali1535
 obj-$(CONFIG_I2C_ALI1563)	+= i2c-ali1563.o
 obj-$(CONFIG_I2C_ALI15X3)	+= i2c-ali15x3.o
 obj-$(CONFIG_I2C_AMD756)	+= i2c-amd756.o
-obj-$(CONFIG_I2C_AMD756_S4882)	+= i2c-amd756-s4882.o
 obj-$(CONFIG_I2C_AMD8111)	+= i2c-amd8111.o
 obj-$(CONFIG_I2C_CHT_WC)	+= i2c-cht-wc.o
 obj-$(CONFIG_I2C_I801)		+= i2c-i801.o
@@ -22,7 +21,6 @@ obj-$(CONFIG_I2C_ISCH)		+= i2c-isch.o
 obj-$(CONFIG_I2C_ISMT)		+= i2c-ismt.o
 obj-$(CONFIG_I2C_NCT6793)	+= i2c-nct6793.o
 obj-$(CONFIG_I2C_NFORCE2)	+= i2c-nforce2.o
-obj-$(CONFIG_I2C_NFORCE2_S4985)	+= i2c-nforce2-s4985.o
 obj-$(CONFIG_I2C_NVIDIA_GPU)	+= i2c-nvidia-gpu.o
 obj-$(CONFIG_I2C_PIIX4)		+= i2c-piix4.o
 obj-$(CONFIG_I2C_SIS5595)	+= i2c-sis5595.o
--- linux-6.5.orig/drivers/i2c/busses/i2c-amd756-s4882.c
+++ /dev/null
@@ -1,245 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * i2c-amd756-s4882.c - i2c-amd756 extras for the Tyan S4882 motherboard
- *
- * Copyright (C) 2004, 2008 Jean Delvare <jdelvare@suse.de>
- */
- 
-/*
- * We select the channels by sending commands to the Philips
- * PCA9556 chip at I2C address 0x18. The main adapter is used for
- * the non-multiplexed part of the bus, and 4 virtual adapters
- * are defined for the multiplexed addresses: 0x50-0x53 (memory
- * module EEPROM) located on channels 1-4, and 0x4c (LM63)
- * located on multiplexed channels 0 and 5-7. We define one
- * virtual adapter per CPU, which corresponds to two multiplexed
- * channels:
- *   CPU0: virtual adapter 1, channels 1 and 0
- *   CPU1: virtual adapter 2, channels 2 and 5
- *   CPU2: virtual adapter 3, channels 3 and 6
- *   CPU3: virtual adapter 4, channels 4 and 7
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/init.h>
-#include <linux/i2c.h>
-#include <linux/mutex.h>
-
-extern struct i2c_adapter amd756_smbus;
-
-static struct i2c_adapter *s4882_adapter;
-static struct i2c_algorithm *s4882_algo;
-
-/* Wrapper access functions for multiplexed SMBus */
-static DEFINE_MUTEX(amd756_lock);
-
-static s32 amd756_access_virt0(struct i2c_adapter * adap, u16 addr,
-			       unsigned short flags, char read_write,
-			       u8 command, int size,
-			       union i2c_smbus_data * data)
-{
-	int error;
-
-	/* We exclude the multiplexed addresses */
-	if (addr == 0x4c || (addr & 0xfc) == 0x50 || (addr & 0xfc) == 0x30
-	 || addr == 0x18)
-		return -ENXIO;
-
-	mutex_lock(&amd756_lock);
-
-	error = amd756_smbus.algo->smbus_xfer(adap, addr, flags, read_write,
-					      command, size, data);
-
-	mutex_unlock(&amd756_lock);
-
-	return error;
-}
-
-/* We remember the last used channels combination so as to only switch
-   channels when it is really needed. This greatly reduces the SMBus
-   overhead, but also assumes that nobody will be writing to the PCA9556
-   in our back. */
-static u8 last_channels;
-
-static inline s32 amd756_access_channel(struct i2c_adapter * adap, u16 addr,
-					unsigned short flags, char read_write,
-					u8 command, int size,
-					union i2c_smbus_data * data,
-					u8 channels)
-{
-	int error;
-
-	/* We exclude the non-multiplexed addresses */
-	if (addr != 0x4c && (addr & 0xfc) != 0x50 && (addr & 0xfc) != 0x30)
-		return -ENXIO;
-
-	mutex_lock(&amd756_lock);
-
-	if (last_channels != channels) {
-		union i2c_smbus_data mplxdata;
-		mplxdata.byte = channels;
-
-		error = amd756_smbus.algo->smbus_xfer(adap, 0x18, 0,
-						      I2C_SMBUS_WRITE, 0x01,
-						      I2C_SMBUS_BYTE_DATA,
-						      &mplxdata);
-		if (error)
-			goto UNLOCK;
-		last_channels = channels;
-	}
-	error = amd756_smbus.algo->smbus_xfer(adap, addr, flags, read_write,
-					      command, size, data);
-
-UNLOCK:
-	mutex_unlock(&amd756_lock);
-	return error;
-}
-
-static s32 amd756_access_virt1(struct i2c_adapter * adap, u16 addr,
-			       unsigned short flags, char read_write,
-			       u8 command, int size,
-			       union i2c_smbus_data * data)
-{
-	/* CPU0: channels 1 and 0 enabled */
-	return amd756_access_channel(adap, addr, flags, read_write, command,
-				     size, data, 0x03);
-}
-
-static s32 amd756_access_virt2(struct i2c_adapter * adap, u16 addr,
-			       unsigned short flags, char read_write,
-			       u8 command, int size,
-			       union i2c_smbus_data * data)
-{
-	/* CPU1: channels 2 and 5 enabled */
-	return amd756_access_channel(adap, addr, flags, read_write, command,
-				     size, data, 0x24);
-}
-
-static s32 amd756_access_virt3(struct i2c_adapter * adap, u16 addr,
-			       unsigned short flags, char read_write,
-			       u8 command, int size,
-			       union i2c_smbus_data * data)
-{
-	/* CPU2: channels 3 and 6 enabled */
-	return amd756_access_channel(adap, addr, flags, read_write, command,
-				     size, data, 0x48);
-}
-
-static s32 amd756_access_virt4(struct i2c_adapter * adap, u16 addr,
-			       unsigned short flags, char read_write,
-			       u8 command, int size,
-			       union i2c_smbus_data * data)
-{
-	/* CPU3: channels 4 and 7 enabled */
-	return amd756_access_channel(adap, addr, flags, read_write, command,
-				     size, data, 0x90);
-}
-
-static int __init amd756_s4882_init(void)
-{
-	int i, error;
-	union i2c_smbus_data ioconfig;
-
-	if (!amd756_smbus.dev.parent)
-		return -ENODEV;
-
-	/* Configure the PCA9556 multiplexer */
-	ioconfig.byte = 0x00; /* All I/O to output mode */
-	error = i2c_smbus_xfer(&amd756_smbus, 0x18, 0, I2C_SMBUS_WRITE, 0x03,
-			       I2C_SMBUS_BYTE_DATA, &ioconfig);
-	if (error) {
-		dev_err(&amd756_smbus.dev, "PCA9556 configuration failed\n");
-		error = -EIO;
-		goto ERROR0;
-	}
-
-	/* Unregister physical bus */
-	i2c_del_adapter(&amd756_smbus);
-
-	printk(KERN_INFO "Enabling SMBus multiplexing for Tyan S4882\n");
-	/* Define the 5 virtual adapters and algorithms structures */
-	if (!(s4882_adapter = kcalloc(5, sizeof(struct i2c_adapter),
-				      GFP_KERNEL))) {
-		error = -ENOMEM;
-		goto ERROR1;
-	}
-	if (!(s4882_algo = kcalloc(5, sizeof(struct i2c_algorithm),
-				   GFP_KERNEL))) {
-		error = -ENOMEM;
-		goto ERROR2;
-	}
-
-	/* Fill in the new structures */
-	s4882_algo[0] = *(amd756_smbus.algo);
-	s4882_algo[0].smbus_xfer = amd756_access_virt0;
-	s4882_adapter[0] = amd756_smbus;
-	s4882_adapter[0].algo = s4882_algo;
-	s4882_adapter[0].dev.parent = amd756_smbus.dev.parent;
-	for (i = 1; i < 5; i++) {
-		s4882_algo[i] = *(amd756_smbus.algo);
-		s4882_adapter[i] = amd756_smbus;
-		snprintf(s4882_adapter[i].name, sizeof(s4882_adapter[i].name),
-			 "SMBus 8111 adapter (CPU%d)", i-1);
-		s4882_adapter[i].algo = s4882_algo+i;
-		s4882_adapter[i].dev.parent = amd756_smbus.dev.parent;
-	}
-	s4882_algo[1].smbus_xfer = amd756_access_virt1;
-	s4882_algo[2].smbus_xfer = amd756_access_virt2;
-	s4882_algo[3].smbus_xfer = amd756_access_virt3;
-	s4882_algo[4].smbus_xfer = amd756_access_virt4;
-
-	/* Register virtual adapters */
-	for (i = 0; i < 5; i++) {
-		error = i2c_add_adapter(s4882_adapter+i);
-		if (error) {
-			printk(KERN_ERR "i2c-amd756-s4882: "
-			       "Virtual adapter %d registration "
-			       "failed, module not inserted\n", i);
-			for (i--; i >= 0; i--)
-				i2c_del_adapter(s4882_adapter+i);
-			goto ERROR3;
-		}
-	}
-
-	return 0;
-
-ERROR3:
-	kfree(s4882_algo);
-	s4882_algo = NULL;
-ERROR2:
-	kfree(s4882_adapter);
-	s4882_adapter = NULL;
-ERROR1:
-	/* Restore physical bus */
-	i2c_add_adapter(&amd756_smbus);
-ERROR0:
-	return error;
-}
-
-static void __exit amd756_s4882_exit(void)
-{
-	if (s4882_adapter) {
-		int i;
-
-		for (i = 0; i < 5; i++)
-			i2c_del_adapter(s4882_adapter+i);
-		kfree(s4882_adapter);
-		s4882_adapter = NULL;
-	}
-	kfree(s4882_algo);
-	s4882_algo = NULL;
-
-	/* Restore physical bus */
-	if (i2c_add_adapter(&amd756_smbus))
-		printk(KERN_ERR "i2c-amd756-s4882: "
-		       "Physical bus restoration failed\n");
-}
-
-MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
-MODULE_DESCRIPTION("S4882 SMBus multiplexing");
-MODULE_LICENSE("GPL");
-
-module_init(amd756_s4882_init);
-module_exit(amd756_s4882_exit);
--- linux-6.5.orig/drivers/i2c/busses/i2c-amd756.c
+++ linux-6.5/drivers/i2c/busses/i2c-amd756.c
@@ -283,7 +283,7 @@ static const struct i2c_algorithm smbus_
 	.functionality	= amd756_func,
 };
 
-struct i2c_adapter amd756_smbus = {
+static struct i2c_adapter amd756_smbus = {
 	.owner		= THIS_MODULE,
 	.class          = I2C_CLASS_HWMON | I2C_CLASS_SPD,
 	.algo		= &smbus_algorithm,
@@ -398,5 +398,3 @@ module_pci_driver(amd756_driver);
 MODULE_AUTHOR("Merlin Hughes <merlin@merlin.org>");
 MODULE_DESCRIPTION("AMD756/766/768/8111 and nVidia nForce SMBus driver");
 MODULE_LICENSE("GPL");
-
-EXPORT_SYMBOL(amd756_smbus);
--- linux-6.5.orig/drivers/i2c/busses/i2c-nforce2-s4985.c
+++ /dev/null
@@ -1,240 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * i2c-nforce2-s4985.c - i2c-nforce2 extras for the Tyan S4985 motherboard
- *
- * Copyright (C) 2008 Jean Delvare <jdelvare@suse.de>
- */
-
-/*
- * We select the channels by sending commands to the Philips
- * PCA9556 chip at I2C address 0x18. The main adapter is used for
- * the non-multiplexed part of the bus, and 4 virtual adapters
- * are defined for the multiplexed addresses: 0x50-0x53 (memory
- * module EEPROM) located on channels 1-4. We define one virtual
- * adapter per CPU, which corresponds to one multiplexed channel:
- *   CPU0: virtual adapter 1, channel 1
- *   CPU1: virtual adapter 2, channel 2
- *   CPU2: virtual adapter 3, channel 3
- *   CPU3: virtual adapter 4, channel 4
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/init.h>
-#include <linux/i2c.h>
-#include <linux/mutex.h>
-
-extern struct i2c_adapter *nforce2_smbus;
-
-static struct i2c_adapter *s4985_adapter;
-static struct i2c_algorithm *s4985_algo;
-
-/* Wrapper access functions for multiplexed SMBus */
-static DEFINE_MUTEX(nforce2_lock);
-
-static s32 nforce2_access_virt0(struct i2c_adapter *adap, u16 addr,
-				unsigned short flags, char read_write,
-				u8 command, int size,
-				union i2c_smbus_data *data)
-{
-	int error;
-
-	/* We exclude the multiplexed addresses */
-	if ((addr & 0xfc) == 0x50 || (addr & 0xfc) == 0x30
-	 || addr == 0x18)
-		return -ENXIO;
-
-	mutex_lock(&nforce2_lock);
-	error = nforce2_smbus->algo->smbus_xfer(adap, addr, flags, read_write,
-						command, size, data);
-	mutex_unlock(&nforce2_lock);
-
-	return error;
-}
-
-/* We remember the last used channels combination so as to only switch
-   channels when it is really needed. This greatly reduces the SMBus
-   overhead, but also assumes that nobody will be writing to the PCA9556
-   in our back. */
-static u8 last_channels;
-
-static inline s32 nforce2_access_channel(struct i2c_adapter *adap, u16 addr,
-					 unsigned short flags, char read_write,
-					 u8 command, int size,
-					 union i2c_smbus_data *data,
-					 u8 channels)
-{
-	int error;
-
-	/* We exclude the non-multiplexed addresses */
-	if ((addr & 0xfc) != 0x50 && (addr & 0xfc) != 0x30)
-		return -ENXIO;
-
-	mutex_lock(&nforce2_lock);
-	if (last_channels != channels) {
-		union i2c_smbus_data mplxdata;
-		mplxdata.byte = channels;
-
-		error = nforce2_smbus->algo->smbus_xfer(adap, 0x18, 0,
-							I2C_SMBUS_WRITE, 0x01,
-							I2C_SMBUS_BYTE_DATA,
-							&mplxdata);
-		if (error)
-			goto UNLOCK;
-		last_channels = channels;
-	}
-	error = nforce2_smbus->algo->smbus_xfer(adap, addr, flags, read_write,
-						command, size, data);
-
-UNLOCK:
-	mutex_unlock(&nforce2_lock);
-	return error;
-}
-
-static s32 nforce2_access_virt1(struct i2c_adapter *adap, u16 addr,
-				unsigned short flags, char read_write,
-				u8 command, int size,
-				union i2c_smbus_data *data)
-{
-	/* CPU0: channel 1 enabled */
-	return nforce2_access_channel(adap, addr, flags, read_write, command,
-				      size, data, 0x02);
-}
-
-static s32 nforce2_access_virt2(struct i2c_adapter *adap, u16 addr,
-				unsigned short flags, char read_write,
-				u8 command, int size,
-				union i2c_smbus_data *data)
-{
-	/* CPU1: channel 2 enabled */
-	return nforce2_access_channel(adap, addr, flags, read_write, command,
-				      size, data, 0x04);
-}
-
-static s32 nforce2_access_virt3(struct i2c_adapter *adap, u16 addr,
-				unsigned short flags, char read_write,
-				u8 command, int size,
-				union i2c_smbus_data *data)
-{
-	/* CPU2: channel 3 enabled */
-	return nforce2_access_channel(adap, addr, flags, read_write, command,
-				      size, data, 0x08);
-}
-
-static s32 nforce2_access_virt4(struct i2c_adapter *adap, u16 addr,
-				unsigned short flags, char read_write,
-				u8 command, int size,
-				union i2c_smbus_data *data)
-{
-	/* CPU3: channel 4 enabled */
-	return nforce2_access_channel(adap, addr, flags, read_write, command,
-				      size, data, 0x10);
-}
-
-static int __init nforce2_s4985_init(void)
-{
-	int i, error;
-	union i2c_smbus_data ioconfig;
-
-	if (!nforce2_smbus)
-		return -ENODEV;
-
-	/* Configure the PCA9556 multiplexer */
-	ioconfig.byte = 0x00; /* All I/O to output mode */
-	error = i2c_smbus_xfer(nforce2_smbus, 0x18, 0, I2C_SMBUS_WRITE, 0x03,
-			       I2C_SMBUS_BYTE_DATA, &ioconfig);
-	if (error) {
-		dev_err(&nforce2_smbus->dev, "PCA9556 configuration failed\n");
-		error = -EIO;
-		goto ERROR0;
-	}
-
-	/* Unregister physical bus */
-	i2c_del_adapter(nforce2_smbus);
-
-	printk(KERN_INFO "Enabling SMBus multiplexing for Tyan S4985\n");
-	/* Define the 5 virtual adapters and algorithms structures */
-	s4985_adapter = kcalloc(5, sizeof(struct i2c_adapter), GFP_KERNEL);
-	if (!s4985_adapter) {
-		error = -ENOMEM;
-		goto ERROR1;
-	}
-	s4985_algo = kcalloc(5, sizeof(struct i2c_algorithm), GFP_KERNEL);
-	if (!s4985_algo) {
-		error = -ENOMEM;
-		goto ERROR2;
-	}
-
-	/* Fill in the new structures */
-	s4985_algo[0] = *(nforce2_smbus->algo);
-	s4985_algo[0].smbus_xfer = nforce2_access_virt0;
-	s4985_adapter[0] = *nforce2_smbus;
-	s4985_adapter[0].algo = s4985_algo;
-	s4985_adapter[0].dev.parent = nforce2_smbus->dev.parent;
-	for (i = 1; i < 5; i++) {
-		s4985_algo[i] = *(nforce2_smbus->algo);
-		s4985_adapter[i] = *nforce2_smbus;
-		snprintf(s4985_adapter[i].name, sizeof(s4985_adapter[i].name),
-			 "SMBus nForce2 adapter (CPU%d)", i - 1);
-		s4985_adapter[i].algo = s4985_algo + i;
-		s4985_adapter[i].dev.parent = nforce2_smbus->dev.parent;
-	}
-	s4985_algo[1].smbus_xfer = nforce2_access_virt1;
-	s4985_algo[2].smbus_xfer = nforce2_access_virt2;
-	s4985_algo[3].smbus_xfer = nforce2_access_virt3;
-	s4985_algo[4].smbus_xfer = nforce2_access_virt4;
-
-	/* Register virtual adapters */
-	for (i = 0; i < 5; i++) {
-		error = i2c_add_adapter(s4985_adapter + i);
-		if (error) {
-			printk(KERN_ERR "i2c-nforce2-s4985: "
-			       "Virtual adapter %d registration "
-			       "failed, module not inserted\n", i);
-			for (i--; i >= 0; i--)
-				i2c_del_adapter(s4985_adapter + i);
-			goto ERROR3;
-		}
-	}
-
-	return 0;
-
-ERROR3:
-	kfree(s4985_algo);
-	s4985_algo = NULL;
-ERROR2:
-	kfree(s4985_adapter);
-	s4985_adapter = NULL;
-ERROR1:
-	/* Restore physical bus */
-	i2c_add_adapter(nforce2_smbus);
-ERROR0:
-	return error;
-}
-
-static void __exit nforce2_s4985_exit(void)
-{
-	if (s4985_adapter) {
-		int i;
-
-		for (i = 0; i < 5; i++)
-			i2c_del_adapter(s4985_adapter+i);
-		kfree(s4985_adapter);
-		s4985_adapter = NULL;
-	}
-	kfree(s4985_algo);
-	s4985_algo = NULL;
-
-	/* Restore physical bus */
-	if (i2c_add_adapter(nforce2_smbus))
-		printk(KERN_ERR "i2c-nforce2-s4985: "
-		       "Physical bus restoration failed\n");
-}
-
-MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
-MODULE_DESCRIPTION("S4985 SMBus multiplexing");
-MODULE_LICENSE("GPL");
-
-module_init(nforce2_s4985_init);
-module_exit(nforce2_s4985_exit);
--- linux-6.5.orig/drivers/i2c/busses/i2c-nforce2.c
+++ linux-6.5/drivers/i2c/busses/i2c-nforce2.c
@@ -117,20 +117,6 @@ static const struct dmi_system_id nforce
 
 static struct pci_driver nforce2_driver;
 
-/* For multiplexing support, we need a global reference to the 1st
-   SMBus channel */
-#if IS_ENABLED(CONFIG_I2C_NFORCE2_S4985)
-struct i2c_adapter *nforce2_smbus;
-EXPORT_SYMBOL_GPL(nforce2_smbus);
-
-static void nforce2_set_reference(struct i2c_adapter *adap)
-{
-	nforce2_smbus = adap;
-}
-#else
-static inline void nforce2_set_reference(struct i2c_adapter *adap) { }
-#endif
-
 static void nforce2_abort(struct i2c_adapter *adap)
 {
 	struct nforce2_smbus *smbus = adap->algo_data;
@@ -411,7 +397,6 @@ static int nforce2_probe(struct pci_dev
 		return -ENODEV;
 	}
 
-	nforce2_set_reference(&smbuses[0].adapter);
 	return 0;
 }
 
@@ -420,7 +405,6 @@ static void nforce2_remove(struct pci_de
 {
 	struct nforce2_smbus *smbuses = pci_get_drvdata(dev);
 
-	nforce2_set_reference(NULL);
 	if (smbuses[0].base) {
 		i2c_del_adapter(&smbuses[0].adapter);
 		release_region(smbuses[0].base, smbuses[0].size);


-- 
Jean Delvare
SUSE L3 Support
