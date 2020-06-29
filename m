Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4EFB20DA11
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 22:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733017AbgF2Txc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 15:53:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:43736 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731030AbgF2Tx2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Jun 2020 15:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=lqZUmstMNT4gD0
        Zj6S7k7KsrZLOZpCrTBlqmktbSzV8=; b=ysZs96y3hbmYSbSQ5UjhZisV0auIGX
        vJl8aQN1qhW/MXJzjyaNrzvIL/QuGaOXphq7OYzVWVq1kuh2wyBv91Op0aMr+34v
        nxA+pUZnt9GYBHekOD5oaec/4iIY7LOgQkEJy0BGHEEI1e9J+cGnIOTXNOnTqgvb
        L34iZ5Jfkr5QA=
Received: (qmail 2142431 invoked from network); 29 Jun 2020 20:53:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2020 20:53:25 +0200
X-UD-Smtp-Session: l3s3148p1@sBDUkj2pYrQgAwDPXwOPAD5GWjq5uCZs
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC 1/1] i2c: add slave testunit driver
Date:   Mon, 29 Jun 2020 20:53:18 +0200
Message-Id: <20200629185318.23381-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200629185318.23381-1-wsa+renesas@sang-engineering.com>
References: <20200629185318.23381-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Here is a I2C slave backend driver which allows to test some uncommon
functionalities of the I2C and SMBus world. Usually, you need specific
devices to test e.g. SMBus Host Notify and such. With this driver you
just need the slave interface of your host controller.

This initial version has testcases for multi-master and SMBus Host
Notify. Already planned but not yet implemented are SMBus Alert and
messages with I2C_M_RECV_LEN.

Please read the documentation for further details.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/slave-testunit-backend.rst |  48 ++++++
 drivers/i2c/Kconfig                          |   8 +
 drivers/i2c/Makefile                         |   1 +
 drivers/i2c/i2c-slave-testunit.c             | 146 +++++++++++++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 Documentation/i2c/slave-testunit-backend.rst
 create mode 100644 drivers/i2c/i2c-slave-testunit.c

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
new file mode 100644
index 000000000000..f4f79db0917a
--- /dev/null
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -0,0 +1,48 @@
+================================
+Linux I2C slave testunit backend
+================================
+
+by Wolfram Sang <wsa@sang-engineering.com> in 2020
+
+This backend can be used to trigger test cases for I2C bus masters which
+require a remote device with certain capabilities (and which are usually not so
+easy to obtain). Examples include multi-master testing, and SMBus Host Notify
+testing. For tests marked with '*', your I2C controller must be able to switch
+between master and slave mode because it needs to send data.
+
+Instantiating the device is regular. Example for bus 0, address 0x30:
+
+# echo "slave-testunit 0x1030" > /sys/bus/i2c/devices/i2c-0/new_device
+
+After that, you will have a write-only device listening. Reads will only return
+0xff. The device consists of 4 8-bit registers and all must be written to start
+a testcase, i.e. you must always write 4 bytes to the device. The registers are:
+
+0x00 CMD   - which test to trigger
+0x01 DATAL - configuration byte 1 for the test
+0x02 DATAH - configuration byte 2 for the test
+0x03 DELAY - delay in n * 100ms until test is started
+
+Commands
+--------
+
+0x00 READ_BYTES*
+   DATAL - address to read data from
+   DATAH - number of bytes to read
+
+This is useful to test if your bus master driver is handling multi-master
+correctly. You can trigger the testunit to read bytes from another device on
+the bus. If the bus master under test also wants to access the bus, it will be
+busy. Example to read 128 bytes from device 0x50 after 500ms of delay:
+
+# i2cset -y 1 0x30 0x00 0x50 0x80 0x05 i
+
+0x01 SMBUS_HOST_NOTIFY*
+   DATAL - low byte of the status word to send
+   DATAH - high byte of the status word to send
+
+This test will send an SMBUS_HOST_NOTIFY message to the host. Note that the
+status word is currently ignored in the Linux Kernel. Example to send a
+notification after 100ms:
+
+# i2cset -y 1 0x30 0x01 0x42 0x42 0x01 i
diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index bae1dc08ec9a..2b550b5168e5 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -126,6 +126,14 @@ config I2C_SLAVE_EEPROM
 	  This backend makes Linux behave like an I2C EEPROM. Please read
 	  Documentation/i2c/slave-eeprom-backend.rst for further details.
 
+config I2C_SLAVE_TESTUNIT
+	tristate "I2C eeprom testunit driver"
+	help
+	  This backend can be used to trigger test cases for I2C bus masters
+	  which require a remote device with certain capabilities, e.g.
+	  multi-master, SMBus Host Notify, etc. Please read
+	  Documentation/i2c/slave-testunit-backend.rst for further details.
+
 endif
 
 config I2C_DEBUG_CORE
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index bed6ba63c983..c1d493dc9bac 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -16,5 +16,6 @@ obj-$(CONFIG_I2C_MUX)		+= i2c-mux.o
 obj-y				+= algos/ busses/ muxes/
 obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
 obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
+obj-$(CONFIG_I2C_SLAVE_TESTUNIT)	+= i2c-slave-testunit.o
 
 ccflags-$(CONFIG_I2C_DEBUG_CORE) := -DDEBUG
diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
new file mode 100644
index 000000000000..ba82712eac5f
--- /dev/null
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * I2C slave mode testunit
+ *
+ * Copyright (C) 2020 by Wolfram Sang, Sang Engineering <wsa@sang-engineering.com>
+ * Copyright (C) 2020 by Renesas Electronics Corporation
+ */
+
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h> // FIXME: own workqueue?
+
+enum testunit_cmds {
+	TU_CMD_READ_BYTES,
+	TU_CMD_HOST_NOTIFY,
+};
+
+enum testunit_regs {
+	TU_REG_CMD,
+	TU_REG_DATAL,
+	TU_REG_DATAH,
+	TU_REG_DELAY,
+	TU_NUM_REGS
+};
+
+struct testunit_data {
+	u8 regs[TU_NUM_REGS];	//FIXME: add locking
+	u8 reg_idx;
+	struct i2c_client *client;
+	struct delayed_work worker;
+	struct i2c_msg msg;
+	u8 msgbuf[256];
+};
+
+static void i2c_slave_testunit_work(struct work_struct *work)
+{
+	struct testunit_data *tu = container_of(work, struct testunit_data, worker.work);
+	int ret;
+
+	switch (tu->regs[TU_REG_CMD]) {
+
+	case TU_CMD_READ_BYTES:
+		tu->msg.addr = tu->regs[TU_REG_DATAL];
+		tu->msg.flags = I2C_M_RD;
+		tu->msg.len = tu->regs[TU_REG_DATAH];
+		break;
+
+	case TU_CMD_HOST_NOTIFY:
+		tu->msg.addr = 0x08;
+		tu->msg.flags = 0;
+		tu->msg.len = 3;
+		tu->msgbuf[0] = tu->client->addr;
+		tu->msgbuf[1] = tu->regs[TU_REG_DATAL];
+		tu->msgbuf[2] = tu->regs[TU_REG_DATAH];
+		break;
+	}
+
+	ret = i2c_transfer(tu->client->adapter, &tu->msg, 1);
+	if (ret != 1)
+		dev_err(&tu->client->dev, "CMD%02X failed (%d)\n", tu->regs[TU_REG_CMD], ret);
+}
+
+static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
+				     enum i2c_slave_event event, u8 *val)
+{
+	struct testunit_data *tu = i2c_get_clientdata(client);
+	int ret = 0;
+
+	switch (event) {
+	case I2C_SLAVE_WRITE_REQUESTED:
+		break;
+
+	case I2C_SLAVE_WRITE_RECEIVED:
+		if (tu->reg_idx < TU_NUM_REGS)
+			tu->regs[tu->reg_idx] = *val;
+		else
+			ret = -EMSGSIZE;
+
+		if (tu->reg_idx <= TU_NUM_REGS)
+			tu->reg_idx++;
+
+		break;
+
+	case I2C_SLAVE_STOP:
+		if (tu->reg_idx == TU_NUM_REGS)
+			queue_delayed_work(system_long_wq, &tu->worker,
+					   msecs_to_jiffies(100 * tu->regs[TU_REG_DELAY]));
+		tu->reg_idx = 0;
+		break;
+
+	case I2C_SLAVE_READ_REQUESTED:
+	case I2C_SLAVE_READ_PROCESSED:
+		*val = 0xff;
+		break;
+	}
+
+	return ret;
+}
+
+static int i2c_slave_testunit_probe(struct i2c_client *client)
+{
+	struct testunit_data *tu;
+
+	tu = devm_kzalloc(&client->dev, sizeof(struct testunit_data), GFP_KERNEL);
+	if (!tu)
+		return -ENOMEM;
+
+	tu->msg.buf = tu->msgbuf;
+	tu->client = client;
+	i2c_set_clientdata(client, tu);
+	INIT_DELAYED_WORK(&tu->worker, i2c_slave_testunit_work);
+
+	return i2c_slave_register(client, i2c_slave_testunit_slave_cb);
+};
+
+static int i2c_slave_testunit_remove(struct i2c_client *client)
+{
+	struct testunit_data *tu = i2c_get_clientdata(client);
+
+	cancel_delayed_work_sync(&tu->worker);
+	i2c_slave_unregister(client);
+	return 0;
+}
+
+static const struct i2c_device_id i2c_slave_testunit_id[] = {
+	{ "slave-testunit", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, i2c_slave_testunit_id);
+
+static struct i2c_driver i2c_slave_testunit_driver = {
+	.driver = {
+		.name = "i2c-slave-testunit",
+	},
+	.probe_new = i2c_slave_testunit_probe,
+	.remove = i2c_slave_testunit_remove,
+	.id_table = i2c_slave_testunit_id,
+};
+module_i2c_driver(i2c_slave_testunit_driver);
+
+MODULE_AUTHOR("Wolfram Sang <wsa@sang-engineering.com>");
+MODULE_DESCRIPTION("I2C slave mode test unit");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1

