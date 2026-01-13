Return-Path: <linux-i2c+bounces-15104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C55BCD1946E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E27C03015903
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078CC392B98;
	Tue, 13 Jan 2026 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAe7LQyi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB0392B8B;
	Tue, 13 Jan 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313079; cv=none; b=pD4xEm3otCMQk0nj1OENRSdt6tKaA0FHkTRzi/ansJLzPjhrv6tIR067SS03l/R197bu9pRWVz3tt1HZF6oZsHmbqumTK1i+ElxYLxbJlBauPWBF0+Y2iFQwj3YxPSFqwhr+ktL9wgpqKI4Sp6tfOZ85DgPS7L/NMiJ8ykc4Jjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313079; c=relaxed/simple;
	bh=ez6Mg9p2GQ9Uz5Rp6ANvnPtHndHmiaQHucJzUUuKJjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlEI41ffz3BSdme3sUTBg9bXLwQc5b3P6uqCK8jWk58kL9X3SMbi1NO6m4JNJOjTR2tGRtW928dPT7sDYu+HLKnU+BcP5/en98sTiUCgJtetRlXZmeAhpFp/i1uX25+hunqKMcVweKHEVcHcMSJm/8v0GhSV70udlNDdTVYerbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAe7LQyi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768313075; x=1799849075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ez6Mg9p2GQ9Uz5Rp6ANvnPtHndHmiaQHucJzUUuKJjg=;
  b=NAe7LQyiEikLuDeVQSiVc/mRbt2TcTTUNfifKpqt0nuoXcvZQRhON0H2
   Yt2CfjEk2YsooZqfV8lQt83jaXwgXSauOVTzC/wqKT1pO4JXpUSQywSJx
   eJWw1nQxcEnVtFJR66SU/KnYdCLxxA416VWf89efXIA+Hvx+lZWxnpgc6
   oGpUOaq8VeCy7Y5uaxyWuYYRDZLFSRCPFJGrYcXt7+JMMGYzNeVsm7vwp
   oxgaUBP/+GQvNbq8U82fPnrtb1sd+qFz5e1Lk2ljs+LwKFk7v0XJE1GjL
   T8gmNrIdTj4q6I96YSMD+RVedE0XpU0V3oxy3qdaqy3lzAU3Rus58+MvW
   w==;
X-CSE-ConnectionGUID: jEs/ysS6TfaNSk03T3SD1g==
X-CSE-MsgGUID: mzS0Maj6RKy+0oXnOY56wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95072074"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95072074"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:04:35 -0800
X-CSE-ConnectionGUID: VSd7BnQwQTSq5l3OVSMN2Q==
X-CSE-MsgGUID: SQVNh0vuThOCaPMGqcO7sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204667359"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 06:04:33 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] i2c: SMBus Address Resolution Protocol implementation for host side
Date: Tue, 13 Jan 2026 15:04:27 +0100
Message-ID: <20260113140430.207990-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113140430.207990-1-heikki.krogerus@linux.intel.com>
References: <20260113140430.207990-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SMBus Address Resolution Protocol (ARP) is a standard (but
optional) method to detect and identify devices on SMBus.
The ARP is higher level message protocol that can be fully
emulated. ARP will therefore always be supported, and the
ARP-capable devices will be scanned automatically for every
adapter that is registered.

The ARP devices are identified with the Unique Device
Identifier (UDID). The UDID can be used for device matching
in drivers with a new struct smbus_device_id.

The function i2c_handle_smbus_host_notify() is also modified
so that the hotplugged ARP devices that send Notify ARP
Controller command can be detected.

Link: https://www.smbus.org/specs/smbus20.pdf
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/Makefile              |   2 +-
 drivers/i2c/i2c-core-arp.c        | 334 ++++++++++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c       |  47 ++++-
 drivers/i2c/i2c-core.h            |   8 +
 include/linux/i2c-smbus.h         |  67 ++++++
 include/linux/i2c.h               |  10 +
 include/linux/mod_devicetable.h   |  13 ++
 scripts/mod/devicetable-offsets.c |   8 +
 scripts/mod/file2alias.c          |  24 +++
 9 files changed, 503 insertions(+), 10 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-arp.c

diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index d27de18de46f..4fdb37b94aa4 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -5,7 +5,7 @@
 
 obj-$(CONFIG_I2C_BOARDINFO)	+= i2c-boardinfo.o
 obj-$(CONFIG_I2C)		+= i2c-core.o
-i2c-core-y			:= i2c-core-base.o i2c-core-smbus.o
+i2c-core-y			:= i2c-core-base.o i2c-core-smbus.o i2c-core-arp.o
 i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
 i2c-core-$(CONFIG_I2C_SLAVE)	+= i2c-core-slave.o
 i2c-core-$(CONFIG_OF)		+= i2c-core-of.o
diff --git a/drivers/i2c/i2c-core-arp.c b/drivers/i2c/i2c-core-arp.c
new file mode 100644
index 000000000000..706508e5dd37
--- /dev/null
+++ b/drivers/i2c/i2c-core-arp.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SMBus Address Resolution Protocol
+ *
+ * Copyright (C) 2026 Intel Corporation
+ */
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/dev_printk.h>
+#include <linux/device/devres.h>
+#include <linux/idr.h>
+#include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
+#include <linux/list.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/sprintf.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include "i2c-core.h"
+
+#define I2C_SMBUS_DEFAULT_ADDR	0x61
+
+#define ARP_CMD_PREPARE_TO_ARP	0x01
+#define ARP_CMD_RESET_DEVICE	0x02
+#define ARP_CMD_GET_UDID	0x03
+#define ARP_CMD_ASSIGN_ADDRESS	0x04
+
+struct get_udid_data {
+	struct i2c_arp_udid	udid;
+	u8			target_address;
+} __packed;
+
+struct arp_work {
+	struct work_struct	work;
+	struct i2c_adapter	*adapter;
+	u8			target;
+};
+
+struct i2c_smbus_arp {
+	struct list_head	clients;
+	struct mutex		lock; /* ARP controller lock */
+};
+
+/* SMBus Specification Appendix C. */
+static const DECLARE_BITMAP(reserved_addrs, (1 << 7)) = {
+	[BIT_WORD(0)] = GENMASK(12, 0) |	/* SMBus v1.1 */
+			BIT_MASK(0x28) |	/* PMBus ZONE READ */
+			BIT_MASK(0x2c) |	/* Reserved */
+			BIT_MASK(0x2d) |	/* Reserved */
+			BIT_MASK(0x55),		/* PMBus ZONE WRITE */
+
+	[BIT_WORD(64)] = BIT_MASK(0x40) |	/* Reserved */
+			 BIT_MASK(0x41) |	/* Reserved */
+			 BIT_MASK(0x42) |	/* Reserved */
+			 BIT_MASK(0x43) |	/* Reserved */
+			 BIT_MASK(0x44) |	/* Reserved */
+			 BIT_MASK(0x48) |	/* Prototype Address */
+			 BIT_MASK(0x49) |	/* Prototype Address */
+			 BIT_MASK(0x4a) |	/* Prototype Address */
+			 BIT_MASK(0x4b) |	/* Prototype Address */
+			 BIT_MASK(0x61) |	/* SMBus Default Address */
+			 BIT_MASK(0x78) |	/* 10-bit target addressing */
+			 BIT_MASK(0x79) |	/* 10-bit target addressing */
+			 BIT_MASK(0x7a) |	/* 10-bit target addressing */
+			 BIT_MASK(0x7b) |	/* 10-bit target addressing */
+			 BIT_MASK(0x7c) |	/* Reserved */
+			 BIT_MASK(0x7d) |	/* Reserved */
+			 BIT_MASK(0x7e) |	/* Reserved */
+			 BIT_MASK(0x7f)		/* Reserved */
+};
+
+const struct smbus_device_id *i2c_smbus_match_id(const struct i2c_client *client,
+						 const struct smbus_device_id *id)
+{
+	struct i2c_arp_udid *udid;
+
+	if (!(id && client && client->udid))
+		return NULL;
+
+	udid = client->udid;
+
+	while (id->vendor) {
+		if ((id->vendor == SMBUS_ANY_ID || id->vendor == udid->vendor) &&
+		    (id->device == SMBUS_ANY_ID || id->device == udid->device) &&
+		    /* The interface is split into "version" and "protocol". */
+		    (id->interface == SMBUS_ANY_ID ||
+		      /* minimum version must be supported */
+		     (((id->interface & 0xf) <= (udid->interface & 0xf)) &&
+		      /* the protocol must match */
+		      ((id->interface & 0xf0) == (udid->interface & 0xf0)))) &&
+		    (id->subvendor == SMBUS_ANY_ID || id->subvendor == udid->subvendor) &&
+		    (id->subdevice == SMBUS_ANY_ID || id->subdevice == udid->subdevice) &&
+		    (id->vendor_specific_id == SMBUS_ANY_VENDOR_SPECIFIC_ID ||
+		     id->vendor_specific_id == udid->vendor_specific_id))
+			return id;
+		id++;
+	}
+
+	return NULL;
+}
+
+static int i2c_smbus_arp_get_udid(struct i2c_adapter *adapter, u8 target,
+				  struct get_udid_data *get_udid)
+{
+	union i2c_smbus_data data;
+	u8 command;
+	int ret;
+
+	if (target)
+		command = (target << 1) | 1;
+	else
+		command = ARP_CMD_GET_UDID;
+
+	ret = i2c_smbus_xfer(adapter, I2C_SMBUS_DEFAULT_ADDR,
+			     I2C_CLIENT_PEC, I2C_SMBUS_READ,
+			     command, I2C_SMBUS_BLOCK_DATA, &data);
+	if (ret)
+		return ret;
+
+	memcpy(get_udid, &data.block[1], sizeof(*get_udid));
+
+	return 0;
+}
+
+static int i2c_smbus_arp_verify_address(struct i2c_adapter *adapter,
+					struct get_udid_data *get_udid)
+{
+	u8 addr_type = FIELD_GET(ARP_CAP_ADDRESS_TYPE_MASK,
+				 get_udid->udid.capabilities);
+	u8 addr = get_udid->target_address;
+
+	if (addr_type == ARP_CAP_ADDRESS_TYPE_FIXED)
+		return 0;
+
+	/* Find a free address if necessary. */
+	if (addr == 0xff || i2c_check_addr_busy(adapter, addr)) {
+		for_each_clear_bit(addr, reserved_addrs, 128)
+			if (!i2c_check_addr_busy(adapter, addr))
+				break;
+		if (addr == 128)
+			return -EBUSY;
+
+		get_udid->target_address = addr;
+	}
+
+	return 0;
+}
+
+static int i2c_smbus_arp_assign_address(struct i2c_adapter *adapter,
+					struct get_udid_data *get_udid)
+{
+	union i2c_smbus_data data;
+	int ret;
+
+	ret = i2c_smbus_arp_verify_address(adapter, get_udid);
+	if (ret)
+		return ret;
+
+	data.block[0] = sizeof(*get_udid);
+	memcpy(&data.block[1], get_udid, data.block[0]);
+
+	ret = i2c_smbus_xfer(adapter, I2C_SMBUS_DEFAULT_ADDR,
+			     I2C_CLIENT_PEC, I2C_SMBUS_WRITE,
+			     ARP_CMD_ASSIGN_ADDRESS, I2C_SMBUS_BLOCK_DATA, &data);
+	if (ret)
+		return -EAGAIN;
+
+	return 0;
+}
+
+static void i2c_smbus_arp_remove_client(void *udid)
+{
+	kfree(udid);
+}
+
+static int i2c_smbus_arp_new_client(struct i2c_adapter *adapter,
+				    struct get_udid_data *data)
+{
+	struct i2c_board_info info = { };
+	struct i2c_client *client;
+	int ret;
+
+	info.udid = kmemdup(&data->udid, sizeof(data->udid), GFP_KERNEL);
+	if (!info.udid)
+		return -ENOMEM;
+
+	info.addr = data->target_address;
+	info.flags = I2C_CLIENT_HOST_NOTIFY;
+
+	if (data->udid.capabilities & ARP_CAP_PEC_SUPPORTED)
+		info.flags |= I2C_CLIENT_PEC;
+
+	sprintf(info.type, "%d:arp-%zu", i2c_adapter_id(adapter),
+		list_count_nodes(&adapter->arp->clients));
+	info.dev_name = info.type;
+
+	client = i2c_new_client_device(adapter, &info);
+	if (IS_ERR(client)) {
+		kfree(info.udid);
+		return PTR_ERR(client);
+	}
+
+	ret = devm_add_action_or_reset(&client->dev, i2c_smbus_arp_remove_client, info.udid);
+	if (ret)
+		return ret;
+
+	list_add_tail(&client->detected, &adapter->arp->clients);
+
+	return 0;
+}
+
+static void i2c_smbus_arp_work(struct work_struct *work)
+{
+	struct arp_work *awork = container_of(work, struct arp_work, work);
+	struct i2c_adapter *adapter = awork->adapter;
+	u8 target = awork->target;
+	struct get_udid_data data;
+	int ret;
+
+	mutex_lock(&adapter->arp->lock);
+
+	do {
+		if (i2c_smbus_arp_get_udid(adapter, target, &data))
+			break;
+
+		ret = i2c_smbus_arp_assign_address(adapter, &data);
+		if (ret == -EAGAIN)
+			continue;
+		if (ret < 0) {
+			dev_warn(&adapter->dev, "out of addresses\n");
+			break;
+		}
+
+		if (i2c_smbus_arp_new_client(adapter, &data))
+			break;
+	} while (!target);
+
+	mutex_unlock(&adapter->arp->lock);
+	kfree(awork);
+}
+
+/**
+ * i2c_smbus_arp_detect - Schedule detection and registration of ARP devices
+ * @adapter: ARP Controller
+ * @target_address: Address for directed ARP commands
+ *
+ * Registers ARP-capable devices attached to @adapter. If @target_address is
+ * supplied, directed Get UDID command will be used. Otherwise, if
+ * @target_address is 0, the general Get UDID command is used until there are no
+ * more responses.
+ *
+ * Returns 0 on success or errno.
+ */
+int i2c_smbus_arp_detect(struct i2c_adapter *adapter, u8 target_address)
+{
+	struct arp_work *awork;
+
+	if (!adapter->arp)
+		return -ENXIO;
+
+	awork = kzalloc_obj(*awork, GFP_KERNEL);
+	if (!awork)
+		return -ENOMEM;
+
+	INIT_WORK(&awork->work, i2c_smbus_arp_work);
+	awork->target = target_address;
+	awork->adapter = adapter;
+
+	queue_work(system_long_wq, &awork->work);
+
+	return 0;
+}
+
+/**
+ * i2c_smbus_arp_probe - Declare adapter as ARP controller
+ * @adapter: ARP Controller
+ *
+ * Declare @adapter as the ARP controller with the Prepare to ARP command, and
+ * then detect all available ARP devices with the general Get UDID command.
+ *
+ * Returns 0 on success or errno.
+ */
+int i2c_smbus_arp_probe(struct i2c_adapter *adapter)
+{
+	int ret;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BLOCK_DATA))
+		return 0;
+
+	adapter->arp = devm_kzalloc(&adapter->dev, sizeof(*adapter->arp), GFP_KERNEL);
+	if (!adapter->arp)
+		return -ENOMEM;
+
+	mutex_init(&adapter->arp->lock);
+	INIT_LIST_HEAD(&adapter->arp->clients);
+
+	/* Broadcast "Prepare to ARP" command. */
+	ret = i2c_smbus_xfer(adapter, I2C_SMBUS_DEFAULT_ADDR, I2C_CLIENT_PEC,
+			     I2C_SMBUS_WRITE, ARP_CMD_PREPARE_TO_ARP,
+			     I2C_SMBUS_BYTE, NULL);
+	if (ret)
+		return 0;
+
+	return i2c_smbus_arp_detect(adapter, 0);
+}
+
+/**
+ * i2c_smbus_arp_remove - Unregister all ARP devices
+ * @adapter: ARP Controller
+ *
+ * Unregister all ARP devices attached to @adapter.
+ */
+void i2c_smbus_arp_remove(struct i2c_adapter *adapter)
+{
+	struct i2c_client *client, *next;
+
+	if (!adapter->arp)
+		return;
+
+	mutex_lock(&adapter->arp->lock);
+
+	list_for_each_entry_safe(client, next, &adapter->arp->clients, detected) {
+		list_del(&client->detected);
+		i2c_unregister_device(client);
+	}
+
+	mutex_unlock(&adapter->arp->lock);
+}
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae7e9c8b65a6..2e61f1be8de6 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -120,19 +120,23 @@ EXPORT_SYMBOL_GPL(i2c_match_id);
 const void *i2c_get_match_data(const struct i2c_client *client)
 {
 	struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
+	const struct smbus_device_id *smbus_match;
 	const struct i2c_device_id *match;
 	const void *data;
 
 	data = device_get_match_data(&client->dev);
-	if (!data) {
-		match = i2c_match_id(driver->id_table, client);
-		if (!match)
-			return NULL;
+	if (data)
+		return data;
 
-		data = (const void *)match->driver_data;
-	}
+	smbus_match = i2c_smbus_match_id(client, driver->smbus_id_table);
+	if (smbus_match)
+		return (const void *)smbus_match->driver_data;
+
+	match = i2c_match_id(driver->id_table, client);
+	if (match)
+		return (const void *)match->driver_data;
 
-	return data;
+	return NULL;
 }
 EXPORT_SYMBOL(i2c_get_match_data);
 
@@ -152,6 +156,10 @@ static int i2c_device_match(struct device *dev, const struct device_driver *drv)
 
 	driver = to_i2c_driver(drv);
 
+	/* SMBus Unique Device Identifier match */
+	if (i2c_smbus_match_id(client, driver->smbus_id_table))
+		return 1;
+
 	/* Finally an I2C match */
 	if (i2c_match_id(driver->id_table, client))
 		return 1;
@@ -172,6 +180,13 @@ static int i2c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
 	if (rc != -ENODEV)
 		return rc;
 
+	if (client->udid)
+		return add_uevent_var(env, "MODALIAS=smbus:v%04xd%04xi%04xsv%04xsd%04xvsi%08x",
+				  client->udid->vendor, client->udid->device,
+				  client->udid->interface,
+				  client->udid->subvendor, client->udid->subdevice,
+				  client->udid->vendor_specific_id);
+
 	return add_uevent_var(env, "MODALIAS=%s%s", I2C_MODULE_PREFIX, client->name);
 }
 
@@ -684,6 +699,13 @@ modalias_show(struct device *dev, struct device_attribute *attr, char *buf)
 	if (len != -ENODEV)
 		return len;
 
+	if (client->udid)
+		return sysfs_emit(buf, "smbus:v%04xd%04xi%04xsv%04xsd%04xvsi%08x\n",
+				  client->udid->vendor, client->udid->device,
+				  client->udid->interface,
+				  client->udid->subvendor, client->udid->subdevice,
+				  client->udid->vendor_specific_id);
+
 	return sprintf(buf, "%s%s\n", I2C_MODULE_PREFIX, client->name);
 }
 static DEVICE_ATTR_RO(modalias);
@@ -822,7 +844,7 @@ static int i2c_check_mux_children(struct device *dev, void *addrp)
 	return result;
 }
 
-static int i2c_check_addr_busy(struct i2c_adapter *adapter, int addr)
+int i2c_check_addr_busy(struct i2c_adapter *adapter, int addr)
 {
 	struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
 	int result = 0;
@@ -973,6 +995,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.platform_data = info->platform_data;
 	client->flags = info->flags;
 	client->addr = info->addr;
+	client->udid = info->udid;
 
 	client->init_irq = info->irq;
 	if (!client->init_irq)
@@ -1508,7 +1531,7 @@ int i2c_handle_smbus_host_notify(struct i2c_adapter *adap, unsigned short addr)
 
 	irq = irq_find_mapping(adap->host_notify_domain, addr);
 	if (irq <= 0)
-		return -ENXIO;
+		return i2c_smbus_arp_detect(adap, addr);
 
 	generic_handle_irq_safe(irq);
 
@@ -1602,6 +1625,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	bus_for_each_drv(&i2c_bus_type, NULL, adap, __process_new_adapter);
 	mutex_unlock(&core_lock);
 
+	/* Detect ARP clients. */
+	res = i2c_smbus_arp_probe(adap);
+	if (res)
+		dev_err(&adap->dev, "ARP device registration failed\n");
+
 	return 0;
 
 out_reg:
@@ -1766,6 +1794,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 		return;
 	}
 
+	i2c_smbus_arp_remove(adap);
 	i2c_acpi_remove_space_handler(adap);
 	/* Tell drivers about this removal */
 	mutex_lock(&core_lock);
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 4797ba88331c..c8f7d8e49621 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -60,6 +60,8 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
 	return 0;
 }
 
+int i2c_check_addr_busy(struct i2c_adapter *adapter, int addr);
+
 #ifdef CONFIG_ACPI
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
 
@@ -106,3 +108,9 @@ static inline int i2c_setup_smbus_alert(struct i2c_adapter *adap)
 	return 0;
 }
 #endif
+
+const struct smbus_device_id *i2c_smbus_match_id(const struct i2c_client *client,
+						 const struct smbus_device_id *id);
+int i2c_smbus_arp_detect(struct i2c_adapter *adapter, u8 target_address);
+int i2c_smbus_arp_probe(struct i2c_adapter *adapter);
+void i2c_smbus_arp_remove(struct i2c_adapter *adapter);
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index dc1bd2ab4c13..c08b35d2858a 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -51,4 +51,71 @@ static inline void i2c_register_spd_write_disable(struct i2c_adapter *adap) { }
 static inline void i2c_register_spd_write_enable(struct i2c_adapter *adap) { }
 #endif
 
+/**
+ * struct i2c_arp_udid - ARP Unique Device Identifier
+ * @capabilities:
+ * @version:
+ * @vendor:
+ * @device:
+ * @interface:
+ * @subvendor:
+ * @subdevice:
+ * @vendor_specific_id:
+ */
+struct i2c_arp_udid {
+	u8 capabilities;
+#define ARP_CAP_PEC_SUPPORTED				BIT(0)
+#define ARP_CAP_ADDRESS_TYPE_MASK			GENMASK(7, 6)
+#define   ARP_CAP_ADDRESS_TYPE_FIXED			0
+#define   ARP_CAP_ADDRESS_TYPE_DYNAMIC_PERSISTENT	1
+#define   ARP_CAP_ADDRESS_TYPE_DYNAMIC_VOLATILE		2
+#define   ARP_CAP_ADDRESS_TYPE_RANDOM_NUMBER		3
+	u8 version;
+	u16 vendor;
+	u16 device;
+	u16 interface;
+	u16 subvendor;
+	u16 subdevice;
+	u32 vendor_specific_id;
+} __packed;
+
+/**
+ * SMBUS_DEVICE - macro used to describe a specific SMBus device
+ * @v: the 16 bit UDID Vendor ID
+ * @d: the 16 bit UDID Device ID
+ *
+ * This macro is used to create a struct smbus_device_id that matches a
+ * specific device. The interface, subvendor and subdevice fields will be set to
+ * SMBUS_ANY_ID.
+ */
+#define SMBUS_DEVICE(v, d) \
+	.vendor = (v), .device = (d), \
+	.interface = SMBUS_ANY_ID, \
+	.subvendor = SMBUS_ANY_ID, .subdevice = SMBUS_ANY_ID, \
+	.vendor_specific_id = SMBUS_ANY_VENDOR_SPECIFIC_ID,
+
+/**
+ * SMBUS_INTERFACE - macro used to describe a specific SMBus interface
+ * @i: the 16 bit UDID interface
+ *
+ * This macro is used to create a struct smbus_device_id that matches a
+ * specific interface. The vendor, device, subvendor and subdevice fields will be
+ * set to SMBUS_ANY_ID.
+ */
+#define SMBUS_INTERFACE(i) \
+	.vendor = SMBUS_ANY_ID, .device = SMBUS_ANY_ID, \
+	.interface = (i), \
+	.subvendor = SMBUS_ANY_ID, .subdevice = SMBUS_ANY_ID, \
+	.vendor_specific_id = SMBUS_ANY_VENDOR_SPECIFIC_ID,
+
+/* The version field in the interface - these are used as the minimum. */
+#define SMBUS_INTERFACE_SMBUS_V2_0	0x4
+#define SMBUS_INTERFACE_SMBUS_V3_0	0x5
+
+/* The interfaces defined in the SMBus specification. */
+#define SMBUS_INTERFACE_OEM	SMBUS_INTERFACE(BIT(4) | SMBUS_INTERFACE_SMBUS_V2_0)
+#define SMBUS_INTERFACE_ASF	SMBUS_INTERFACE(BIT(5) | SMBUS_INTERFACE_SMBUS_V2_0)
+#define SMBUS_INTERFACE_IPMI	SMBUS_INTERFACE(BIT(6) | SMBUS_INTERFACE_SMBUS_V2_0)
+#define SMBUS_INTERFACE_ZONE	SMBUS_INTERFACE(BIT(7) | SMBUS_INTERFACE_SMBUS_V3_0)
+
 #endif /* _LINUX_I2C_SMBUS_H */
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..1f0cd285e711 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -34,6 +34,8 @@ struct i2c_adapter;
 struct i2c_client;
 struct i2c_driver;
 struct i2c_device_identity;
+struct i2c_smbus_arp;
+struct i2c_arp_udid;
 union i2c_smbus_data;
 struct i2c_board_info;
 enum i2c_slave_event;
@@ -242,6 +244,7 @@ enum i2c_driver_flags {
  * @command: Callback for bus-wide signaling (optional)
  * @driver: Device driver model driver
  * @id_table: List of I2C devices supported by this driver
+ * @smbus_id_table: SMBus ARP devices supported by this driver
  * @detect: Callback for device detection
  * @address_list: The I2C addresses to probe (for detect)
  * @clients: List of detected clients we created (for i2c-core use only)
@@ -295,6 +298,7 @@ struct i2c_driver {
 
 	struct device_driver driver;
 	const struct i2c_device_id *id_table;
+	const struct smbus_device_id *smbus_id_table;
 
 	/* Device detection callback for automatic device creation */
 	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
@@ -311,6 +315,7 @@ struct i2c_driver {
  * @addr: Address used on the I2C bus connected to the parent adapter.
  * @name: Indicates the type of the device, usually a chip name that's
  *	generic enough to hide second-sourcing and compatible revisions.
+ * @udid: SMBus ARP Unique Device Identifier
  * @adapter: manages the bus segment hosting this I2C device
  * @dev: Driver model device node for the slave.
  * @init_irq: IRQ that was set at initialization
@@ -343,6 +348,7 @@ struct i2c_client {
 					/* addresses are stored in the	*/
 					/* _LOWER_ 7 bits		*/
 	char name[I2C_NAME_SIZE];
+	struct i2c_arp_udid *udid;	/* Unique Device Identifier	*/
 	struct i2c_adapter *adapter;	/* the adapter we sit on	*/
 	struct device dev;		/* the device structure		*/
 	int init_irq;			/* irq set at initialization	*/
@@ -410,6 +416,7 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
  * @resources: resources associated with the device
  * @num_resources: number of resources in the @resources array
  * @irq: stored in i2c_client.irq
+ * @udid: SMBus ARP Unique Device Identifier
  *
  * I2C doesn't actually support hardware probing, although controllers and
  * devices may be able to use I2C_SMBUS_QUICK to tell whether or not there's
@@ -433,6 +440,7 @@ struct i2c_board_info {
 	const struct resource *resources;
 	unsigned int	num_resources;
 	int		irq;
+	struct i2c_arp_udid *udid;
 };
 
 /**
@@ -755,6 +763,8 @@ struct i2c_adapter {
 	struct mutex userspace_clients_lock;
 	struct list_head userspace_clients;
 
+	struct i2c_smbus_arp *arp;
+
 	struct i2c_bus_recovery_info *bus_recovery_info;
 	const struct i2c_adapter_quirks *quirks;
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 24eb5a88a5c5..9d75cdb81e25 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -480,6 +480,19 @@ struct i2c_device_id {
 	kernel_ulong_t driver_data;	/* Data private to the driver */
 };
 
+#define SMBUS_ANY_ID			0xffff
+#define SMBUS_ANY_VENDOR_SPECIFIC_ID	0xffffffff
+
+struct smbus_device_id {
+	__u16 vendor;
+	__u16 device;
+	__u16 interface;
+	__u16 subvendor;
+	__u16 subdevice;
+	__u32 vendor_specific_id;
+	kernel_ulong_t driver_data;	/* Data private to the driver */
+};
+
 /* pci_epf */
 
 #define PCI_EPF_NAME_SIZE	20
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..cd53628e1470 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -147,6 +147,14 @@ int main(void)
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
+	DEVID(smbus_device_id);
+	DEVID_FIELD(smbus_device_id, vendor);
+	DEVID_FIELD(smbus_device_id, device);
+	DEVID_FIELD(smbus_device_id, interface);
+	DEVID_FIELD(smbus_device_id, subvendor);
+	DEVID_FIELD(smbus_device_id, subdevice);
+	DEVID_FIELD(smbus_device_id, vendor_specific_id);
+
 	DEVID(i3c_device_id);
 	DEVID_FIELD(i3c_device_id, match_flags);
 	DEVID_FIELD(i3c_device_id, dcr);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 4e99393a35f1..66efff6d3623 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -840,6 +840,29 @@ static void do_i2c_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, I2C_MODULE_PREFIX "%s", *name);
 }
 
+/* Looks like: smbus:vNdNiNsvNsdNvsiN*/
+static void do_smbus_entry(struct module *mod, void *symval)
+{
+	char alias[256] = {};
+
+	DEF_FIELD(symval, smbus_device_id, vendor);
+	DEF_FIELD(symval, smbus_device_id, device);
+	DEF_FIELD(symval, smbus_device_id, interface);
+	DEF_FIELD(symval, smbus_device_id, subvendor);
+	DEF_FIELD(symval, smbus_device_id, subdevice);
+	DEF_FIELD(symval, smbus_device_id, vendor_specific_id);
+
+	ADD(alias, "v", vendor != SMBUS_ANY_ID, vendor);
+	ADD(alias, "d", device != SMBUS_ANY_ID, device);
+	ADD(alias, "i", interface != SMBUS_ANY_ID, interface);
+	ADD(alias, "sv", subvendor != SMBUS_ANY_ID, subvendor);
+	ADD(alias, "sd", subdevice != SMBUS_ANY_ID, subdevice);
+	ADD(alias, "vsi", vendor_specific_id != SMBUS_ANY_VENDOR_SPECIFIC_ID,
+	    vendor_specific_id);
+
+	module_alias_printf(mod, true, "smbus:%s", alias);
+}
+
 static void do_i3c_entry(struct module *mod, void *symval)
 {
 	char alias[256] = {};
@@ -1439,6 +1462,7 @@ static const struct devtable devtable[] = {
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
+	{"smbus", SIZE_smbus_device_id, do_smbus_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},
 	{"spi", SIZE_spi_device_id, do_spi_entry},
-- 
2.50.1


