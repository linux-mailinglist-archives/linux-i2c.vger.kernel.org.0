Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2E41868E0
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 11:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730596AbgCPKW2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 06:22:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:33286 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730593AbgCPKW2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 06:22:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D5B34B1A2;
        Mon, 16 Mar 2020 10:22:25 +0000 (UTC)
Date:   Mon, 16 Mar 2020 11:22:24 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 1/2] i2c: smbus: Add a way to instantiate SPD EEPROMs
 automatically
Message-ID: <20200316112224.0eaeb925@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In simple cases we can instantiate SPD EEPROMs on the SMBus
automatically. Start with just DDR2, DDR3 and DDR4 on x86 for now,
and only for systems with no more than 4 memory slots. These
limitations may be lifted later.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Wolfram Sang <wsa@the-dreams.de>
---
The dependencies have been merged into the dmi subsystem in kernel v5.5
so I think we are good to merge this now.

 drivers/i2c/i2c-smbus.c   |  104 +++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/i2c-smbus.h |    8 +++
 2 files changed, 110 insertions(+), 2 deletions(-)

--- linux-5.5.orig/drivers/i2c/i2c-smbus.c	2020-01-27 01:23:03.000000000 +0100
+++ linux-5.5/drivers/i2c/i2c-smbus.c	2020-02-11 12:54:11.588866579 +0100
@@ -3,10 +3,11 @@
  * i2c-smbus.c - SMBus extensions to the I2C protocol
  *
  * Copyright (C) 2008 David Brownell
- * Copyright (C) 2010 Jean Delvare <jdelvare@suse.de>
+ * Copyright (C) 2010-2019 Jean Delvare <jdelvare@suse.de>
  */
 
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/i2c-smbus.h>
 #include <linux/interrupt.h>
@@ -196,6 +197,107 @@ EXPORT_SYMBOL_GPL(i2c_handle_smbus_alert
 
 module_i2c_driver(smbalert_driver);
 
+/*
+ * SPD is not part of SMBus but we include it here for convenience as the
+ * target systems are the same.
+ * Restrictions to automatic SPD instantiation:
+ *  - Only works if all filled slots have the same memory type
+ *  - Only works for DDR2, DDR3 and DDR4 for now
+ *  - Only works on systems with 1 to 4 memory slots
+ */
+#if IS_ENABLED(CONFIG_DMI)
+void i2c_register_spd(struct i2c_adapter *adap)
+{
+	int n, slot_count = 0, dimm_count = 0;
+	u16 handle;
+	u8 common_mem_type = 0x0, mem_type;
+	u64 mem_size;
+	const char *name;
+
+	while ((handle = dmi_memdev_handle(slot_count)) != 0xffff) {
+		slot_count++;
+
+		/* Skip empty slots */
+		mem_size = dmi_memdev_size(handle);
+		if (!mem_size)
+			continue;
+
+		/* Skip undefined memory type */
+		mem_type = dmi_memdev_type(handle);
+		if (mem_type <= 0x02)		/* Invalid, Other, Unknown */
+			continue;
+
+		if (!common_mem_type) {
+			/* First filled slot */
+			common_mem_type = mem_type;
+		} else {
+			/* Check that all filled slots have the same type */
+			if (mem_type != common_mem_type) {
+				dev_warn(&adap->dev,
+					 "Different memory types mixed, not instantiating SPD\n");
+				return;
+			}
+		}
+		dimm_count++;
+	}
+
+	/* No useful DMI data, bail out */
+	if (!dimm_count)
+		return;
+
+	dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
+		 dimm_count, slot_count);
+
+	if (slot_count > 4) {
+		dev_warn(&adap->dev,
+			 "Systems with more than 4 memory slots not supported yet, not instantiating SPD\n");
+		return;
+	}
+
+	switch (common_mem_type) {
+	case 0x13:	/* DDR2 */
+	case 0x18:	/* DDR3 */
+	case 0x1C:	/* LPDDR2 */
+	case 0x1D:	/* LPDDR3 */
+		name = "spd";
+		break;
+	case 0x1A:	/* DDR4 */
+	case 0x1E:	/* LPDDR4 */
+		name = "ee1004";
+		break;
+	default:
+		dev_info(&adap->dev,
+			 "Memory type 0x%02x not supported yet, not instantiating SPD\n",
+			 common_mem_type);
+		return;
+	}
+
+	/*
+	 * We don't know in which slots the memory modules are. We could
+	 * try to guess from the slot names, but that would be rather complex
+	 * and unreliable, so better probe all possible addresses until we
+	 * have found all memory modules.
+	 */
+	for (n = 0; n < slot_count && dimm_count; n++) {
+		struct i2c_board_info info;
+		unsigned short addr_list[2];
+
+		memset(&info, 0, sizeof(struct i2c_board_info));
+		strlcpy(info.type, name, I2C_NAME_SIZE);
+		addr_list[0] = 0x50 + n;
+		addr_list[1] = I2C_CLIENT_END;
+
+		if (i2c_new_probed_device(adap, &info, addr_list, NULL)) {
+			dev_info(&adap->dev,
+				 "Successfully instantiated SPD at 0x%hx\n",
+				 addr_list[0]);
+			dimm_count--;
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(i2c_register_spd);
+#endif
+
 MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("SMBus protocol extensions support");
 MODULE_LICENSE("GPL");
--- linux-5.5.orig/include/linux/i2c-smbus.h	2020-01-27 01:23:03.000000000 +0100
+++ linux-5.5/include/linux/i2c-smbus.h	2020-02-11 12:54:11.588866579 +0100
@@ -2,7 +2,7 @@
 /*
  * i2c-smbus.h - SMBus extensions to the I2C protocol
  *
- * Copyright (C) 2010 Jean Delvare <jdelvare@suse.de>
+ * Copyright (C) 2010-2019 Jean Delvare <jdelvare@suse.de>
  */
 
 #ifndef _LINUX_I2C_SMBUS_H
@@ -44,4 +44,10 @@ static inline int of_i2c_setup_smbus_ale
 }
 #endif
 
+#if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
+void i2c_register_spd(struct i2c_adapter *adap);
+#else
+static inline void i2c_register_spd(struct i2c_adapter *adap) { }
+#endif
+
 #endif /* _LINUX_I2C_SMBUS_H */


-- 
Jean Delvare
SUSE L3 Support
