Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65345142BA
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 00:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfEEWOU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 May 2019 18:14:20 -0400
Received: from rcdn-iport-9.cisco.com ([173.37.86.80]:14821 "EHLO
        rcdn-iport-9.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727232AbfEEWOS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 May 2019 18:14:18 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CaBADJXc9c/4wNJK1lHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBZYIRgToBMiisaocTEINZgRSCCCM4EwEDAQEEAQECAQJtKIZKgT8SgyK?=
 =?us-ascii?q?CC6sfiGOBRRSBHoZ4hFYXgX+BEYNQhA2GGQSLE4g2k2kJggtWkWMnbpRaLYt?=
 =?us-ascii?q?ulRGBZiGBVjMaCBsVgyeCGxeOPx8DMI5tglIBAQ?=
X-IronPort-AV: E=Sophos;i="5.60,435,1549929600"; 
   d="scan'208";a="469175710"
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 05 May 2019 22:07:08 +0000
Received: from tusi.cisco.com (tusi.cisco.com [172.24.98.27])
        by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTP id x45M76dt003095;
        Sun, 5 May 2019 22:07:07 GMT
From:   Ruslan Babayev <ruslan@babayev.com>
To:     linux@armlinux.org.uk, andrew@lunn.ch, f.fainelli@gmail.com,
        hkallweit1@gmail.com, mika.westerberg@linux.intel.com,
        wsa@the-dreams.de
Cc:     davem@davemloft.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, xe-linux-external@cisco.com
Subject: [PATCH net-next 1/2] i2c: acpi: export i2c_acpi_find_adapter_by_handle
Date:   Sun,  5 May 2019 15:05:22 -0700
Message-Id: <20190505220524.37266-2-ruslan@babayev.com>
X-Mailer: git-send-email 2.17.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 172.24.98.27, tusi.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This allows drivers to lookup i2c adapters on ACPI based systems similar to
of_get_i2c_adapter_by_node() with DT based systems.

Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
Cc: xe-linux-external@cisco.com
---
 drivers/i2c/i2c-core-acpi.c | 3 ++-
 include/linux/i2c.h         | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 272800692088..964687534754 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -337,7 +337,7 @@ static int i2c_acpi_find_match_device(struct device *dev, void *data)
 	return ACPI_COMPANION(dev) == data;
 }
 
-static struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
+struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 {
 	struct device *dev;
 
@@ -345,6 +345,7 @@ static struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 			      i2c_acpi_find_match_adapter);
 	return dev ? i2c_verify_adapter(dev) : NULL;
 }
+EXPORT_SYMBOL_GPL(i2c_acpi_find_adapter_by_handle);
 
 static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 383510b4f083..24859a26f167 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -33,6 +33,7 @@
 #include <linux/rtmutex.h>
 #include <linux/irqdomain.h>		/* for Host Notify IRQ */
 #include <linux/of.h>		/* for struct device_node */
+#include <linux/acpi.h>		/* for acpi_handle */
 #include <linux/swab.h>		/* for swab16 */
 #include <uapi/linux/i2c.h>
 
@@ -977,6 +978,7 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 u32 i2c_acpi_find_bus_speed(struct device *dev);
 struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 				       struct i2c_board_info *info);
+struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
 #else
 static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 					     struct acpi_resource_i2c_serialbus **i2c)
@@ -992,6 +994,10 @@ static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
 {
 	return NULL;
 }
+struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
+{
+	return NULL;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _LINUX_I2C_H */
-- 
2.17.1

