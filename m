Return-Path: <linux-i2c+bounces-15107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73704D19482
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AEDB30124F6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF7B3933FE;
	Tue, 13 Jan 2026 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etmHOyTL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A4D392B8E;
	Tue, 13 Jan 2026 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313082; cv=none; b=leoao3si8NH5BiHBw6H//HjHzkC2f9zGpZMMaL7NfiYl2CmWCZjQkCU03ELMvnnZLxMYydoTpxqkrVmAeIsDiwiLogqqHcst6yg128Ldxx7462boXjXID9a8pQ4BP2xcrVyWy8mPb4DRdSXdfpZHXXUA5iFdAKmGxuxZyt4uTtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313082; c=relaxed/simple;
	bh=xNWCmW31pGZmF7lTIVjzCHLl1hqt60gUK/dvIqhGBIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e6bhVVS3qkNlS7SsdyOQpf3n4Tft1Ulwaj8XHFtdqvg0WKggxUSRYz2sbwXtScIDqm0CaxH1xjzZmzeieP+m9PCnBJRncZAxFKAcnufAV+Pzl/Y2fk8WL5CdKbfwo6FvhxGL+a/1OU47djpPUazFGT0tUbqBtwdKZ3zvRJ95WAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etmHOyTL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768313081; x=1799849081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xNWCmW31pGZmF7lTIVjzCHLl1hqt60gUK/dvIqhGBIo=;
  b=etmHOyTLkTRW3SegiW6WvSvp1reZNZr1PsxK0Bd3mjQhtPuFHTwzOQuo
   PVeahL9cVFiKrI/Z69XOAuHsiPb1J4X5jENqrTp6d6fv9Ewx9J9hBsuK5
   gODCcYQvljfJCymIbNz1qB2kSp0PMVHNW3TxNULvE3Y53VPZoqXUqpLIo
   jKcikjikWzM9GbnMxJoux4U1OreLKhnMIPvQ5ZUCbOxsUpcc69P2Gjh+b
   yWWNRNfF93/31HlwhZ08Ck1Q0DTbE7LxI1Jj8RCHdY1STi8mMUIReR7L9
   wO2776rKIWBU6gcw36ckEHsaKVvR3VCGEyVXtLXCKV5rStmcv3T5r2Tft
   A==;
X-CSE-ConnectionGUID: QUPCQIFjQseBGkPh3d5sqw==
X-CSE-MsgGUID: GRIevTNtSWqq87F0VlJf/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95072092"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95072092"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:04:40 -0800
X-CSE-ConnectionGUID: wBZGTHqzTn2HdDePCI1msg==
X-CSE-MsgGUID: kWwRVr1yTtmk4eTNgwtbHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204667405"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 06:04:39 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] i2c: Add SMBus ARP target mode test driver
Date: Tue, 13 Jan 2026 15:04:30 +0100
Message-ID: <20260113140430.207990-5-heikki.krogerus@linux.intel.com>
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

Backend that the hosts can enumerate by using the SMBus
Address Resolution Protocol.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/Kconfig          |   6 ++
 drivers/i2c/Makefile         |   1 +
 drivers/i2c/i2c-target-arp.c | 201 +++++++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)
 create mode 100644 drivers/i2c/i2c-target-arp.c

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index c232054fddd6..4b97a66fc698 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -134,6 +134,12 @@ config I2C_SLAVE_TESTUNIT
 	  multi-master, SMBus Host Notify, etc. Please read
 	  Documentation/i2c/slave-testunit-backend.rst for further details.
 
+config I2C_TARGET_ARP
+	tristate "SMBus ARP target mode test driver"
+	help
+	  This backend makes Linux respond to SMBus Address Resolution Protocol
+	  commands.
+
 endif
 
 config I2C_DEBUG_CORE
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 4fdb37b94aa4..3ea292dab065 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -19,5 +19,6 @@ obj-y				+= algos/ busses/ muxes/
 obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
 obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
 obj-$(CONFIG_I2C_SLAVE_TESTUNIT)	+= i2c-slave-testunit.o
+obj-$(CONFIG_I2C_TARGET_ARP)	+= i2c-target-arp.o
 
 ccflags-$(CONFIG_I2C_DEBUG_CORE) := -DDEBUG
diff --git a/drivers/i2c/i2c-target-arp.c b/drivers/i2c/i2c-target-arp.c
new file mode 100644
index 000000000000..458749e4681e
--- /dev/null
+++ b/drivers/i2c/i2c-target-arp.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SMBus Address Resolution Protocol target mode test driver
+ *
+ * Copyright (C) 2026 Intel Corporation
+ */
+#include <linux/bits.h>
+#include <linux/device/devres.h>
+#include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+#define ARP_ADDRESS_VALID	BIT(0)
+#define ARP_ADDRESS_RESOLVED	BIT(1)
+
+#define I2C_SMBUS_HOST		0x08
+#define I2C_SMBUS_DEFAULT_ADDR	0x61
+
+#define ARP_CMD_PREPARE_TO_ARP	0x01
+#define ARP_CMD_RESET_DEVICE	0x02
+#define ARP_CMD_GET_UDID	0x03
+#define ARP_CMD_ASSIGN_ADDRESS	0x04
+
+struct get_udid_data {
+	struct i2c_arp_udid	udid;
+	u8			target_addr;
+} __packed;
+
+struct arp_target {
+	struct i2c_client target;
+	struct i2c_client *client;
+
+	int read_count;
+	int write_count;
+	unsigned char buf[24];
+
+	struct get_udid_data data;
+	unsigned char flag;
+};
+
+static u8 i2c_arp_pec(struct arp_target *arp, bool read)
+{
+	u8 addr = I2C_SMBUS_DEFAULT_ADDR << 1;
+	u8 len = sizeof(arp->data);
+	u8 pec = 0;
+
+	pec = i2c_smbus_pec(pec, &addr, 1);
+	pec = i2c_smbus_pec(pec, arp->buf, arp->write_count);
+
+	if (read) {
+		addr |= 1;
+		pec = i2c_smbus_pec(pec, &addr, 1);
+		pec = i2c_smbus_pec(pec, &len, 1);
+		pec = i2c_smbus_pec(pec, (void *)&arp->data, len);
+	}
+
+	return pec;
+}
+
+static int i2c_target_arp_cb(struct i2c_client *target, enum i2c_slave_event event, u8 *val)
+{
+	struct arp_target *arp = container_of(target, struct arp_target, target);
+
+	switch (event) {
+	case I2C_SLAVE_READ_PROCESSED:
+		if (arp->flag)
+			break;
+
+		if (arp->read_count == sizeof(arp->data))
+			*val = i2c_arp_pec(arp, 1);
+		else
+			*val = ((u8 *)&arp->data)[arp->read_count];
+
+		arp->read_count++;
+		break;
+	case I2C_SLAVE_READ_REQUESTED:
+		if (arp->flag)
+			break;
+
+		*val = sizeof(arp->data);
+		break;
+	case I2C_SLAVE_STOP:
+		switch (arp->buf[0]) {
+		case ARP_CMD_PREPARE_TO_ARP:
+			arp->flag = 0;
+			break;
+		case ARP_CMD_ASSIGN_ADDRESS:
+			/* If the UDID matches, this address is for us. */
+			if (!memcmp(&arp->buf[2], &arp->data.udid, sizeof(arp->data.udid)))
+				arp->flag = ARP_ADDRESS_VALID | ARP_ADDRESS_RESOLVED;
+			break;
+		default:
+			break;
+		}
+
+		arp->read_count = 0;
+		arp->write_count = 0;
+		break;
+	case I2C_SLAVE_WRITE_REQUESTED:
+		arp->read_count = 0;
+		arp->write_count = 0;
+		break;
+	case I2C_SLAVE_WRITE_RECEIVED:
+		arp->buf[arp->write_count] = *val;
+		arp->write_count++;
+		break;
+	}
+
+	return 0;
+}
+
+static void i2c_notify_arp_controller(struct i2c_client *client)
+{
+	union i2c_smbus_data data = { };
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WORD_DATA))
+		return;
+
+	ret = i2c_smbus_xfer(client->adapter, I2C_SMBUS_HOST, client->flags,
+			     I2C_SMBUS_WRITE, client->addr,
+			     I2C_SMBUS_WORD_DATA, &data);
+	if (ret)
+		dev_warn(&client->dev, "Failed to Notify ARP Controller (%d)\n", ret);
+}
+
+static int i2c_target_arp_probe(struct i2c_client *client)
+{
+	struct arp_target *arp;
+	int ret;
+
+	arp = devm_kzalloc(&client->dev, sizeof(*arp), GFP_KERNEL);
+	if (!arp)
+		return -ENOMEM;
+
+	arp->client = client;
+	i2c_set_clientdata(client, arp);
+
+	arp->target = *client;
+	arp->target.addr = I2C_SMBUS_DEFAULT_ADDR;
+	arp->target.flags |= I2C_CLIENT_SLAVE;
+
+	/*
+	 * The vendor and device ID are left undefined. Some hosts may not
+	 * support this. If that's the case, supply values for them.
+	 *
+	 * arp->data.udid.vendor = 0xXXXX;
+	 * arp->data.udid.device = 0xXXXX;
+	 *
+	 * The capabilities are also 0. That makes this a fixed address device
+	 * without support for PEC.
+	 */
+	arp->data.udid.version = BIT(3); /* UDID Version 1 */
+	arp->data.udid.interface = SMBUS_INTERFACE_SMBUS_V2_0;
+	arp->data.target_addr = client->addr;
+
+	/*
+	 * NOTE: This target is only for the ARP. After the address has been
+	 * assigned, another target should be registered for the actual device,
+	 * but this test code does _not_ register it.
+	 */
+	ret = i2c_slave_register(&arp->target, i2c_target_arp_cb);
+	if (ret)
+		return ret;
+
+	i2c_notify_arp_controller(client);
+
+	return 0;
+}
+
+static void i2c_target_arp_remove(struct i2c_client *client)
+{
+	struct arp_target *arp;
+
+	if (IS_ERR_OR_NULL(client))
+		return;
+
+	arp = i2c_get_clientdata(client);
+	i2c_slave_unregister(&arp->target);
+}
+
+static const struct i2c_device_id i2c_target_arp_id[] = {
+	{ "target-arp" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, i2c_target_arp_id);
+
+static struct i2c_driver i2c_target_arp_driver = {
+	.driver = {
+		.name = "i2c-target-arp",
+	},
+	.probe = i2c_target_arp_probe,
+	.remove = i2c_target_arp_remove,
+	.id_table = i2c_target_arp_id,
+};
+module_i2c_driver(i2c_target_arp_driver);
+
+MODULE_DESCRIPTION("SMBus ARP target mode test driver");
+MODULE_LICENSE("GPL");
-- 
2.50.1


