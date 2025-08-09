Return-Path: <linux-i2c+bounces-12176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF3B1F422
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 12:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005DC1C215C6
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 10:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236B7265CA2;
	Sat,  9 Aug 2025 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCTUBPvE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F7227BB9;
	Sat,  9 Aug 2025 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754735026; cv=none; b=IO5myK72zJ91Tjw0fqkMtGvlKkfHhr+T2suDD0wjAK8ONPFD/tAGiebd2HyYkjOds0VMOtObwKJILhS8z/fZJLp6K9Cs7P3+/hTUEYO5djZEnXhmHH61/uw0/3oj1JkF7b2S47pZ4KPYvl4qOLLI97O+Z13GhKLGHJ00cwk5i6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754735026; c=relaxed/simple;
	bh=8/ZW5COEl2OGNtnezvN+3uWjiQJddYFv+5tjDojkzeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZsPDngD7dRoSnWt1bMnXFE9NThLGq0SEP81ka0139nhHpY9X82hFnazfYfkIE6aGPuiDtN7j4+3aOTxSogNw/8B++M+L2KePWBuGPYKEksDMKMO6tq1Az1BDn59oD9qfDPSUO+1kmcVHPSCeaTcMhRQfJI0u9nhWAKCX6ZJv4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCTUBPvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E423C4CEF7;
	Sat,  9 Aug 2025 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754735026;
	bh=8/ZW5COEl2OGNtnezvN+3uWjiQJddYFv+5tjDojkzeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CCTUBPvEaCrXNkhoQE7zMT1HzIdJyEIyiPQgkhQWffiWQ9CvZghKK+u3vcZri059x
	 fPQLgPymkLE4JCXyMJl8P75Q97igeVfTjpIvyDa37KebI1ZoK/EyQoOqPD/YE4fpRO
	 lusfcC3g36L7tjv5TusBIaKy41beZ01+Y+R1DcPNV0osSOO4Nt9o3R0V+ZwQzDibFC
	 sRKdrbQyyExor8sXjfjvGzAPiobpV8SkTP6O8cUzFGwg9NUffLvytIeU6Ogrzd3Xt0
	 WqAG17jGfMVdRpJ1g/iQMByRLP2F3BCvC6t6RUIWU1G9Nww0+IFHQnvppjcWqbILUE
	 ldVKRieB6meEw==
From: Hans de Goede <hansg@kernel.org>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>,
	linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 3/3] i2c: Add Intel USBIO I2C driver
Date: Sat,  9 Aug 2025 12:23:26 +0200
Message-ID: <20250809102326.6032-4-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250809102326.6032-1-hansg@kernel.org>
References: <20250809102326.6032-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>

Add a a driver for the I2C auxbus child device of the Intel USBIO USB
IO-expander used by the MIPI cameras on various new (Meteor Lake and
later) Intel laptops.

Co-developed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
---
 MAINTAINERS                    |   1 +
 drivers/i2c/busses/Kconfig     |  11 ++
 drivers/i2c/busses/Makefile    |   1 +
 drivers/i2c/busses/i2c-usbio.c | 344 +++++++++++++++++++++++++++++++++
 4 files changed, 357 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-usbio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 81db1457e9d1..9e8875e3dabf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12523,6 +12523,7 @@ M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
 M:	Hans de Goede <hansg@kernel.org>
 S:	Maintained
 F:	drivers/gpio/gpio-usbio.c
+F:	drivers/i2c/busses/i2c-usbio.c
 F:	drivers/usb/misc/usbio.c
 F:	include/linux/usb/usbio.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index c8d115b58e44..bf6a624f5ff6 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1358,6 +1358,17 @@ config I2C_LJCA
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-ljca.
 
+config I2C_USBIO
+	tristate "Intel USBIO I2C Adapter support"
+	depends on USB_USBIO
+	default USB_USBIO
+	help
+	  Select this option to enable I2C driver for the INTEL
+	  USBIO driver stack.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c_usbio.
+
 config I2C_CP2615
 	tristate "Silicon Labs CP2615 USB sound card and I2C adapter"
 	depends on USB
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 04db855fdfd6..401a79c9767e 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -135,6 +135,7 @@ obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
 obj-$(CONFIG_I2C_LJCA)		+= i2c-ljca.o
+obj-$(CONFIG_I2C_USBIO)		+= i2c-usbio.o
 obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
 obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o
diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
new file mode 100644
index 000000000000..82c4769852f8
--- /dev/null
+++ b/drivers/i2c/busses/i2c-usbio.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Intel Corporation.
+ * Copyright (c) 2025 Red Hat, Inc.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/types.h>
+#include <linux/usb/usbio.h>
+
+#define I2C_RW_OVERHEAD (sizeof(struct usbio_bulk_packet) + sizeof(struct usbio_i2c_rw))
+
+struct usbio_i2c {
+	u32 speed;
+	struct i2c_adapter adap;
+	struct auxiliary_device *adev;
+	struct usbio_i2c_rw *rwbuf;
+	bool init_supports_ack_flag;
+	u16 txbuf_len;
+	u16 rxbuf_len;
+};
+
+static const struct acpi_device_id usbio_i2c_acpi_hids[] = {
+	{ "INTC1008" }, /* MTL */
+	{ "INTC10B3" }, /* ARL */
+	{ "INTC10B6" }, /* LNL */
+	{ "INTC10E3" }, /* PTL */
+	{ }
+};
+
+static const u32 usbio_i2c_speeds[] = {
+	I2C_MAX_STANDARD_MODE_FREQ,
+	I2C_MAX_FAST_MODE_FREQ,
+	I2C_MAX_FAST_MODE_PLUS_FREQ,
+	I2C_MAX_HIGH_SPEED_MODE_FREQ
+};
+
+static void usbio_i2c_uninit(struct i2c_adapter *adap, struct i2c_msg *msg)
+{
+	struct usbio_i2c *i2c = i2c_get_adapdata(adap);
+	struct usbio_i2c_uninit ubuf;
+
+	ubuf.busid = i2c->adev->id;
+	ubuf.config = msg->addr;
+
+	usbio_bulk_msg(i2c->adev, USBIO_PKTTYPE_I2C, USBIO_I2CCMD_UNINIT, true,
+		       &ubuf, sizeof(ubuf), NULL, 0);
+}
+
+static int usbio_i2c_init(struct i2c_adapter *adap, struct i2c_msg *msg)
+{
+	struct usbio_i2c *i2c = i2c_get_adapdata(adap);
+	struct usbio_i2c_init ibuf;
+	void *reply_buf;
+	u16 reply_len;
+	int ret;
+
+	ibuf.busid = i2c->adev->id;
+	ibuf.config = msg->addr;
+	ibuf.speed = i2c->speed;
+
+	if (i2c->init_supports_ack_flag) {
+		reply_buf = &ibuf;
+		reply_len = sizeof(ibuf);
+	} else {
+		reply_buf = NULL;
+		reply_len = 0;
+	}
+	ret = usbio_bulk_msg(i2c->adev, USBIO_PKTTYPE_I2C, USBIO_I2CCMD_INIT, true,
+			     &ibuf, sizeof(ibuf), reply_buf, reply_len);
+	if (ret != sizeof(ibuf))
+		return (ret < 0) ? ret : -EIO;
+
+	return 0;
+}
+
+static int usbio_i2c_read(struct i2c_adapter *adap, struct i2c_msg *msg)
+{
+	struct usbio_i2c *i2c = i2c_get_adapdata(adap);
+	u16 rxchunk = i2c->rxbuf_len - I2C_RW_OVERHEAD;
+	struct usbio_i2c_rw *rbuf = i2c->rwbuf;
+	int ret;
+
+	rbuf->busid = i2c->adev->id;
+	rbuf->config = msg->addr;
+	rbuf->size = msg->len;
+
+	if (msg->len > rxchunk) {
+		/* Need to split the input buffer */
+		u16 len = 0;
+
+		do {
+			if (msg->len - len < rxchunk)
+				rxchunk = msg->len - len;
+
+			ret = usbio_bulk_msg(i2c->adev, USBIO_PKTTYPE_I2C,
+					     USBIO_I2CCMD_READ, true,
+					     rbuf, len == 0 ? sizeof(*rbuf) : 0,
+					     rbuf, sizeof(*rbuf) + rxchunk);
+			if (ret < 0)
+				return ret;
+
+			memcpy(&msg->buf[len], rbuf->data, rxchunk);
+			len += rxchunk;
+		} while (msg->len > len);
+
+		goto out_log;
+	}
+
+	ret = usbio_bulk_msg(i2c->adev, USBIO_PKTTYPE_I2C, USBIO_I2CCMD_READ, true,
+			     rbuf, sizeof(*rbuf), rbuf, sizeof(*rbuf) + msg->len);
+	if (ret != sizeof(*rbuf) + msg->len)
+		return (ret < 0) ? ret : -EIO;
+
+	memcpy(msg->buf, rbuf->data, msg->len);
+out_log:
+	dev_dbg(adap->dev.parent, "RD[%d]:%*phN\n", msg->len, msg->len, msg->buf);
+	return 0;
+}
+
+static int usbio_i2c_write(struct i2c_adapter *adap, struct i2c_msg *msg)
+{
+	struct usbio_i2c *i2c = i2c_get_adapdata(adap);
+	u16 txchunk = i2c->txbuf_len - I2C_RW_OVERHEAD;
+	struct usbio_i2c_rw *wbuf = i2c->rwbuf;
+	int ret;
+
+	dev_dbg(adap->dev.parent, "WR[%d]:%*phN\n", msg->len, msg->len, msg->buf);
+
+	if (msg->len > txchunk) {
+		/* Need to split the output buffer */
+		u16 len = 0;
+
+		do {
+			wbuf->busid = i2c->adev->id;
+			wbuf->config = msg->addr;
+			wbuf->size = msg->len;
+
+			memcpy(wbuf->data, &msg->buf[len], txchunk);
+			len += txchunk;
+
+			ret = usbio_bulk_msg(i2c->adev, USBIO_PKTTYPE_I2C,
+					     USBIO_I2CCMD_WRITE, msg->len == len,
+					     wbuf, sizeof(*wbuf) + txchunk,
+					     wbuf, sizeof(*wbuf));
+			if (ret < 0)
+				return ret;
+
+			if (msg->len - len < txchunk)
+				txchunk = msg->len - len;
+		} while (msg->len > len);
+
+		return 0;
+	}
+
+	wbuf->busid = i2c->adev->id;
+	wbuf->config = msg->addr;
+	wbuf->size = msg->len;
+	memcpy(wbuf->data, msg->buf, msg->len);
+
+	ret = usbio_bulk_msg(i2c->adev, USBIO_PKTTYPE_I2C, USBIO_I2CCMD_WRITE, true,
+			     wbuf, sizeof(*wbuf) + msg->len, wbuf, sizeof(*wbuf));
+	if (ret != sizeof(*wbuf) || wbuf->size != msg->len)
+		return (ret < 0) ? ret : -EIO;
+
+	return 0;
+}
+
+static int usbio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct usbio_i2c *i2c = i2c_get_adapdata(adap);
+	int ret;
+
+	usbio_acquire(i2c->adev);
+
+	ret = usbio_i2c_init(adap, msgs);
+	if (ret)
+		goto out_release;
+
+	for (int i = 0; i < num; ret = ++i) {
+		if (msgs[i].flags & I2C_M_RD)
+			ret = usbio_i2c_read(adap, &msgs[i]);
+		else
+			ret = usbio_i2c_write(adap, &msgs[i]);
+
+		if (ret)
+			break;
+	}
+
+	usbio_i2c_uninit(adap, msgs);
+
+out_release:
+	usbio_release(i2c->adev);
+	return ret;
+}
+
+static u32 usbio_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_adapter_quirks usbio_i2c_quirks = {
+	.flags = I2C_AQ_NO_REP_START,
+	.max_read_len = SZ_4K,
+	.max_write_len = SZ_4K,
+};
+
+/* Use smaller max_*_len settings for chips which do not support split bulk transfers */
+static const struct i2c_adapter_quirks usbio_i2c_no_split_transfers_quirks = {
+	.flags = I2C_AQ_NO_REP_START,
+	.max_read_len = 63 - I2C_RW_OVERHEAD,
+	.max_write_len = 63 -  I2C_RW_OVERHEAD,
+};
+
+static const struct i2c_algorithm usbio_i2c_algo = {
+	.master_xfer = usbio_i2c_xfer,
+	.functionality = usbio_i2c_func,
+};
+
+static int usbio_i2c_probe(struct auxiliary_device *adev,
+		const struct auxiliary_device_id *adev_id)
+{
+	struct usbio_i2c_bus_desc *i2c_desc;
+	struct device *dev = &adev->dev;
+	u8 dummy_read_buf;
+	struct i2c_msg dummy_read = {
+		.addr = 0x08,
+		.flags = I2C_M_RD,
+		.len = 1,
+		.buf = &dummy_read_buf,
+	};
+	struct usbio_i2c *i2c;
+	u32 max_speed;
+	int ret;
+
+	i2c_desc = dev_get_platdata(dev);
+	if (!i2c_desc)
+		return -EINVAL;
+
+	/* Some USBIO chips have caps set to 0, but all chips can do 400KHz */
+	if (!i2c_desc->caps)
+		max_speed = I2C_MAX_FAST_MODE_FREQ;
+	else
+		max_speed = usbio_i2c_speeds[i2c_desc->caps & USBIO_I2C_BUS_MODE_CAP_MASK];
+
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->adev = adev;
+
+	usbio_acpi_bind(i2c->adev, usbio_i2c_acpi_hids);
+	usbio_get_txrxbuf_len(i2c->adev, &i2c->txbuf_len, &i2c->rxbuf_len);
+
+	i2c->rwbuf = devm_kzalloc(dev, max(i2c->txbuf_len, i2c->rxbuf_len), GFP_KERNEL);
+	if (!i2c->rwbuf)
+		return -ENOMEM;
+
+	i2c->speed = i2c_acpi_find_bus_speed(dev);
+	if (!i2c->speed)
+		i2c->speed = I2C_MAX_STANDARD_MODE_FREQ;
+	else if (i2c->speed > max_speed) {
+		dev_warn(dev, "Invalid speed %u adjusting to bus max %u\n",
+			 i2c->speed, max_speed);
+		i2c->speed = max_speed;
+	}
+
+	i2c->adap.owner = THIS_MODULE;
+	i2c->adap.class = I2C_CLASS_HWMON;
+	i2c->adap.dev.parent = dev;
+	i2c->adap.algo = &usbio_i2c_algo;
+	i2c->adap.quirks = &usbio_i2c_quirks;
+
+	snprintf(i2c->adap.name, sizeof(i2c->adap.name), "%s.%d",
+		 USBIO_I2C_CLIENT, i2c->adev->id);
+
+	device_set_node(&i2c->adap.dev, dev_fwnode(&adev->dev));
+
+	auxiliary_set_drvdata(adev, i2c);
+	i2c_set_adapdata(&i2c->adap, i2c);
+
+	/*
+	 * Test if USBIO_I2CCMD_INIT commands with the USBIO_PKTFLAG_ACK flag
+	 * are supported.
+	 */
+	usbio_acquire(i2c->adev);
+	i2c->init_supports_ack_flag = true;
+	ret = usbio_i2c_init(&i2c->adap, &dummy_read);
+	if (ret) {
+		if (ret != -EPIPE) {
+			usbio_release(i2c->adev);
+			return ret; /* Unexpected error */
+		}
+
+		dev_info(dev, "i2c-init command does not support ack flag\n");
+		i2c->init_supports_ack_flag = false;
+		/* Chips with this quirk also do not support split bulk transfers */
+		i2c->adap.quirks = &usbio_i2c_no_split_transfers_quirks;
+	} else {
+		/* Continue dummy read to not confuse the USBIO chip */
+		usbio_i2c_read(&i2c->adap, &dummy_read);
+	}
+	usbio_i2c_uninit(&i2c->adap, &dummy_read);
+	usbio_release(i2c->adev);
+
+	ret = i2c_add_adapter(&i2c->adap);
+	if (ret)
+		return ret;
+
+	if (has_acpi_companion(&i2c->adap.dev))
+		acpi_dev_clear_dependencies(ACPI_COMPANION(&i2c->adap.dev));
+
+	return 0;
+}
+
+static void usbio_i2c_remove(struct auxiliary_device *adev)
+{
+	struct usbio_i2c *i2c = auxiliary_get_drvdata(adev);
+
+	i2c_del_adapter(&i2c->adap);
+}
+
+static const struct auxiliary_device_id usbio_i2c_id_table[] = {
+	{ "usbio.usbio-i2c" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, usbio_i2c_id_table);
+
+static struct auxiliary_driver usbio_i2c_driver = {
+	.name = USBIO_I2C_CLIENT,
+	.probe = usbio_i2c_probe,
+	.remove = usbio_i2c_remove,
+	.id_table = usbio_i2c_id_table
+};
+module_auxiliary_driver(usbio_i2c_driver);
+
+MODULE_DESCRIPTION("Intel USBIO I2C driver");
+MODULE_AUTHOR("Israel Cepeda <israel.a.cepeda.lopez@intel.com>");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("USBIO");
-- 
2.49.0


