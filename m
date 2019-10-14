Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFA8DD5F1C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 11:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730872AbfJNJjh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 05:39:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:55712 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725989AbfJNJjg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 05:39:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8DFA8BDB8;
        Mon, 14 Oct 2019 09:39:34 +0000 (UTC)
Date:   Mon, 14 Oct 2019 11:39:50 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 3/4] i2c: smbus: Add a way to instantiate SPD EEPROMs
 automatically
Message-ID: <20191014113950.1f989ba6@endymion>
In-Reply-To: <20191014113636.57b5ce89@endymion>
References: <20191014113636.57b5ce89@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
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
---
 drivers/i2c/i2c-smbus.c   |  104 +++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/i2c-smbus.h |   11 ++++
 2 files changed, 113 insertions(+), 2 deletions(-)

--- linux-5.3.orig/drivers/i2c/i2c-smbus.c	2019-10-04 15:04:16.601640711 +0200
+++ linux-5.3/drivers/i2c/i2c-smbus.c	2019-10-11 13:01:59.596425003 +0200
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
@@ -203,6 +204,107 @@ EXPORT_SYMBOL_GPL(i2c_handle_smbus_alert
 
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
--- linux-5.3.orig/include/linux/i2c-smbus.h	2019-10-04 15:04:16.601640711 +0200
+++ linux-5.3/include/linux/i2c-smbus.h	2019-10-11 11:03:51.432166962 +0200
@@ -2,7 +2,7 @@
 /*
  * i2c-smbus.h - SMBus extensions to the I2C protocol
  *
- * Copyright (C) 2010 Jean Delvare <jdelvare@suse.de>
+ * Copyright (C) 2010-2019 Jean Delvare <jdelvare@suse.de>
  */
 
 #ifndef _LINUX_I2C_SMBUS_H
@@ -42,6 +42,15 @@ static inline int of_i2c_setup_smbus_ale
 {
 	return 0;
 }
+#endif
+
+#if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
+void i2c_register_spd(struct i2c_adapter *adap);
+#else
+static void i2c_register_spd(struct i2c_adapter *adap)
+{
+	return 0;
+}
 #endif
 
 #endif /* _LINUX_I2C_SMBUS_H */

-- 
Jean Delvare
SUSE L3 Support
