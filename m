Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDCB4D5F13
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 11:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbfJNJiQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 05:38:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:54862 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725989AbfJNJiP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 05:38:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 1A59EBD2B;
        Mon, 14 Oct 2019 09:38:14 +0000 (UTC)
Date:   Mon, 14 Oct 2019 11:38:29 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 1/4] firmware: dmi: Remember the memory type
Message-ID: <20191014113829.7e8f5df1@endymion>
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

Store the memory type while walking the memory slots, and provide a
way to retrieve it later.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/firmware/dmi_scan.c |   25 ++++++++++++++++++++++++-
 include/linux/dmi.h         |    2 ++
 2 files changed, 26 insertions(+), 1 deletion(-)

--- linux-5.3.orig/drivers/firmware/dmi_scan.c	2019-10-08 14:27:23.783640227 +0200
+++ linux-5.3/drivers/firmware/dmi_scan.c	2019-10-08 16:35:35.442803880 +0200
@@ -35,6 +35,7 @@ static struct dmi_memdev_info {
 	const char *bank;
 	u64 size;		/* bytes */
 	u16 handle;
+	u8 type;		/* DDR2, DDR3, DDR4 etc */
 } *dmi_memdev;
 static int dmi_memdev_nr;
 
@@ -391,7 +392,7 @@ static void __init save_mem_devices(cons
 	u64 bytes;
 	u16 size;
 
-	if (dm->type != DMI_ENTRY_MEM_DEVICE || dm->length < 0x12)
+	if (dm->type != DMI_ENTRY_MEM_DEVICE || dm->length < 0x13)
 		return;
 	if (nr >= dmi_memdev_nr) {
 		pr_warn(FW_BUG "Too many DIMM entries in SMBIOS table\n");
@@ -400,6 +401,7 @@ static void __init save_mem_devices(cons
 	dmi_memdev[nr].handle = get_unaligned(&dm->handle);
 	dmi_memdev[nr].device = dmi_string(dm, d[0x10]);
 	dmi_memdev[nr].bank = dmi_string(dm, d[0x11]);
+	dmi_memdev[nr].type = d[0x12];
 
 	size = get_unaligned((u16 *)&d[0xC]);
 	if (size == 0)
@@ -1128,3 +1130,24 @@ u64 dmi_memdev_size(u16 handle)
 	return ~0ull;
 }
 EXPORT_SYMBOL_GPL(dmi_memdev_size);
+
+/**
+ * dmi_memdev_type - get the memory type
+ * @handle: DMI structure handle
+ *
+ * Return the DMI memory type of the module in the slot associated with the
+ * given DMI handle, or 0x0 if no such DMI handle exists.
+ */
+u8 dmi_memdev_type(u16 handle)
+{
+	int n;
+
+	if (dmi_memdev) {
+		for (n = 0; n < dmi_memdev_nr; n++) {
+			if (handle == dmi_memdev[n].handle)
+				return dmi_memdev[n].type;
+		}
+	}
+	return 0x0;	/* Not a valid value */
+}
+EXPORT_SYMBOL_GPL(dmi_memdev_type);
--- linux-5.3.orig/include/linux/dmi.h	2019-10-04 16:14:24.575714482 +0200
+++ linux-5.3/include/linux/dmi.h	2019-10-08 17:42:19.726907967 +0200
@@ -113,6 +113,7 @@ extern int dmi_walk(void (*decode)(const
 extern bool dmi_match(enum dmi_field f, const char *str);
 extern void dmi_memdev_name(u16 handle, const char **bank, const char **device);
 extern u64 dmi_memdev_size(u16 handle);
+extern u8 dmi_memdev_type(u16 handle);
 
 #else
 
@@ -142,6 +143,7 @@ static inline bool dmi_match(enum dmi_fi
 static inline void dmi_memdev_name(u16 handle, const char **bank,
 		const char **device) { }
 static inline u64 dmi_memdev_size(u16 handle) { return ~0ul; }
+static inline u8 dmi_memdev_type(u16 handle) { return 0x0; }
 static inline const struct dmi_system_id *
 	dmi_first_match(const struct dmi_system_id *list) { return NULL; }
 

-- 
Jean Delvare
SUSE L3 Support
