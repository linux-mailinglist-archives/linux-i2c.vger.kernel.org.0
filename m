Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96E7210013A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 10:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfKRJ0J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 04:26:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:56452 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726460AbfKRJ0J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Nov 2019 04:26:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DCDD6AC4D;
        Mon, 18 Nov 2019 09:26:07 +0000 (UTC)
Date:   Mon, 18 Nov 2019 10:26:06 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 2/4] firmware: dmi: Add dmi_memdev_handle
Message-ID: <20191118102606.6dbccfdf@endymion>
In-Reply-To: <20191118102410.78cd8e6e@endymion>
References: <20191118102410.78cd8e6e@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a utility function dmi_memdev_handle() which returns the DMI
handle associated with a given memory slot. This will allow kernel
drivers to iterate over the memory slots.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/firmware/dmi_scan.c |   16 ++++++++++++++++
 include/linux/dmi.h         |    2 ++
 2 files changed, 18 insertions(+)

--- linux-5.3.orig/drivers/firmware/dmi_scan.c	2019-10-10 11:33:02.871034637 +0200
+++ linux-5.3/drivers/firmware/dmi_scan.c	2019-10-10 11:45:37.275549638 +0200
@@ -1151,3 +1151,19 @@ u8 dmi_memdev_type(u16 handle)
 	return 0x0;	/* Not a valid value */
 }
 EXPORT_SYMBOL_GPL(dmi_memdev_type);
+
+/**
+ *	dmi_memdev_handle - get the DMI handle of a memory slot
+ *	@slot: slot number
+ *
+ *	Return the DMI handle associated with a given memory slot, or %0xFFFF
+ *      if there is no such slot.
+ */
+u16 dmi_memdev_handle(int slot)
+{
+	if (dmi_memdev && slot >= 0 && slot < dmi_memdev_nr)
+		return dmi_memdev[slot].handle;
+
+	return 0xffff;	/* Not a valid value */
+}
+EXPORT_SYMBOL_GPL(dmi_memdev_handle);
--- linux-5.3.orig/include/linux/dmi.h	2019-10-10 11:33:02.871034637 +0200
+++ linux-5.3/include/linux/dmi.h	2019-10-10 11:34:46.146337207 +0200
@@ -114,6 +114,7 @@ extern bool dmi_match(enum dmi_field f,
 extern void dmi_memdev_name(u16 handle, const char **bank, const char **device);
 extern u64 dmi_memdev_size(u16 handle);
 extern u8 dmi_memdev_type(u16 handle);
+extern u16 dmi_memdev_handle(int slot);
 
 #else
 
@@ -144,6 +145,7 @@ static inline void dmi_memdev_name(u16 h
 		const char **device) { }
 static inline u64 dmi_memdev_size(u16 handle) { return ~0ul; }
 static inline u8 dmi_memdev_type(u16 handle) { return 0x0; }
+static inline u16 dmi_memdev_handle(int slot) { return 0xffff; }
 static inline const struct dmi_system_id *
 	dmi_first_match(const struct dmi_system_id *list) { return NULL; }
 


-- 
Jean Delvare
SUSE L3 Support
