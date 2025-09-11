Return-Path: <linux-i2c+bounces-12869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C11BB53377
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73FABA05FF9
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1B0327A03;
	Thu, 11 Sep 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4XmgyRp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357B324B3C;
	Thu, 11 Sep 2025 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596726; cv=none; b=T4BHWD1N2Mjhq8Xx31h6rkMPkJQfO2c73F1zv4lTeR1WHQYVFa0/RUa6a3IVCITiVTcN3a/SSBGU4TOgn4iNbpGDocLf2CZ0Dc1pDgQVpP/6DcXYVPqLiD8xODiw9ZcBpk5Bz/E/uA4Sbxp3v8e7fBMA3USnbW53jWcFxhL3Wks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596726; c=relaxed/simple;
	bh=p5GsD8/ryXh4GpqXsNZjyQzvsF9ioHS91mKflQG8NyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iw+cTYhOKazyasTLCdrpCE4234butOJ4wUuNiZuIwd6apHujM/nXs1ETZe1Uyt97d4EAVxvBXx2DlXLHO1svMRyS3YuAvajFm2wcQ12LAV4/bz1IB1/ksfuXB/ucGmtW3ryFQ8D6UNlf1oQ9B6IH2qLH5mn61KQbopJGKglrqwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4XmgyRp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0EEC4CEF7;
	Thu, 11 Sep 2025 13:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757596725;
	bh=p5GsD8/ryXh4GpqXsNZjyQzvsF9ioHS91mKflQG8NyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T4XmgyRpLyt1/YyP4+RK5M7z9BmpN6XUXRfDO/YAhob7C26Kcgx2uVqfx4XFfTtVs
	 +vXtyaGs/gFJU73P4jKWc+HVC9XJl/9Jadh3btapNo9dXeNhTa6mmhh8fZejCZ27v3
	 YlbTHKxt/PmbiSybN4+0IMQtpLTpf0/wOLSk5g8WwhyrNGk5xALw5ASauibDVdt06p
	 EC99M+J1tH6Ru5vGvDejDMNCqvdQjCq3pWL00QMKdy6oehEqSz+n3mHkxaRKFyKPWQ
	 PvmHEI0tRAv2BLvDKv+IOk2GPeDKZJeg6hFkveNE1BbmY0d6VoaH/jnOXcN/Ke6gfp
	 +S3muCTUvEJLQ==
From: Hans de Goede <hansg@kernel.org>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Richard Hughes <rhughes@redhat.com>,
	linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 3/3] i2c: Add Intel USBIO I2C driver
Date: Thu, 11 Sep 2025 15:18:32 +0200
Message-ID: <20250911131832.59335-4-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911131832.59335-1-hansg@kernel.org>
References: <20250911131832.59335-1-hansg@kernel.org>
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
Changes in v5:
- Drop some unnecessary dev_dbg() messages
- Add I2C_AQ_NO_ZERO_LEN to the adapter quirks

Changes in v2:
- Use new quirks mechanism to treat various revisions differently
- Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
- Some small style fixes from Sakari's review
---
 MAINTAINERS                    |   1 +
 drivers/i2c/busses/Kconfig     |  11 ++
 drivers/i2c/busses/Makefile    |   1 +
 drivers/i2c/busses/i2c-usbio.c | 320 +++++++++++++++++++++++++++++++++
 4 files changed, 333 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-usbio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ae10b698d6db..746a1651f78d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12706,6 +12706,7 @@ M:	Hans de Goede <hansg@kernel.org>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
 S:	Maintained
 F:	drivers/gpio/gpio-usbio.c
+F:	drivers/i2c/busses/i2c-usbio.c
 F:	drivers/usb/misc/usbio.c
 F:	include/linux/usb/usbio.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 070d014fdc5d..06b1b702fd7a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1357,6 +1357,17 @@ config I2C_LJCA
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
index 000000000000..3d5f3ac89129
--- /dev/null
+++ b/drivers/i2c/busses/i2c-usbio.c
@@ -0,0 +1,320 @@
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
+	struct i2c_adapter adap;
+	struct auxiliary_device *adev;
+	struct usbio_i2c_rw *rwbuf;
+	unsigned long quirks;
+	u32 speed;
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
+	ubuf.config = cpu_to_le16(msg->addr);
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
+	ibuf.config = cpu_to_le16(msg->addr);
+	ibuf.speed = cpu_to_le32(i2c->speed);
+
+	if (i2c->quirks & USBIO_QUIRK_I2C_NO_INIT_ACK) {
+		reply_buf = NULL;
+		reply_len = 0;
+	} else {
+		reply_buf = &ibuf;
+		reply_len = sizeof(ibuf);
+	}
+
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
+	rbuf->config = cpu_to_le16(msg->addr);
+	rbuf->size = cpu_to_le16(msg->len);
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
+		return 0;
+	}
+
+	ret = usbio_bulk_msg(i2c->adev, USBIO_PKTTYPE_I2C, USBIO_I2CCMD_READ, true,
+			     rbuf, sizeof(*rbuf), rbuf, sizeof(*rbuf) + msg->len);
+	if (ret != sizeof(*rbuf) + msg->len)
+		return (ret < 0) ? ret : -EIO;
+
+	memcpy(msg->buf, rbuf->data, msg->len);
+
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
+	if (msg->len > txchunk) {
+		/* Need to split the output buffer */
+		u16 len = 0;
+
+		do {
+			wbuf->busid = i2c->adev->id;
+			wbuf->config = cpu_to_le16(msg->addr);
+
+			if (i2c->quirks & USBIO_QUIRK_I2C_USE_CHUNK_LEN)
+				wbuf->size = cpu_to_le16(txchunk);
+			else
+				wbuf->size = cpu_to_le16(msg->len);
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
+	wbuf->config = cpu_to_le16(msg->addr);
+	wbuf->size = cpu_to_le16(msg->len);
+	memcpy(wbuf->data, msg->buf, msg->len);
+
+	ret = usbio_bulk_msg(i2c->adev, USBIO_PKTTYPE_I2C, USBIO_I2CCMD_WRITE, true,
+			     wbuf, sizeof(*wbuf) + msg->len, wbuf, sizeof(*wbuf));
+	if (ret != sizeof(*wbuf) || le16_to_cpu(wbuf->size) != msg->len)
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
+
+	return ret;
+}
+
+static u32 usbio_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_adapter_quirks usbio_i2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN | I2C_AQ_NO_REP_START,
+	.max_read_len = SZ_4K,
+	.max_write_len = SZ_4K,
+};
+
+static const struct i2c_adapter_quirks usbio_i2c_quirks_max_rw_len52 = {
+	.flags = I2C_AQ_NO_ZERO_LEN | I2C_AQ_NO_REP_START,
+	.max_read_len = 52,
+	.max_write_len = 52,
+};
+
+static const struct i2c_algorithm usbio_i2c_algo = {
+	.master_xfer = usbio_i2c_xfer,
+	.functionality = usbio_i2c_func,
+};
+
+static int usbio_i2c_probe(struct auxiliary_device *adev,
+			   const struct auxiliary_device_id *adev_id)
+{
+	struct usbio_i2c_bus_desc *i2c_desc;
+	struct device *dev = &adev->dev;
+	struct usbio_i2c *i2c;
+	u32 max_speed;
+	int ret;
+
+	i2c_desc = dev_get_platdata(dev);
+	if (!i2c_desc)
+		return -EINVAL;
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
+	i2c->quirks = usbio_get_quirks(i2c->adev);
+
+	max_speed = usbio_i2c_speeds[i2c_desc->caps & USBIO_I2C_BUS_MODE_CAP_MASK];
+	if (max_speed < I2C_MAX_FAST_MODE_FREQ &&
+	    (i2c->quirks & USBIO_QUIRK_I2C_ALLOW_400KHZ))
+		max_speed = I2C_MAX_FAST_MODE_FREQ;
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
+
+	if (i2c->quirks & USBIO_QUIRK_I2C_MAX_RW_LEN_52)
+		i2c->adap.quirks = &usbio_i2c_quirks_max_rw_len52;
+	else
+		i2c->adap.quirks = &usbio_i2c_quirks;
+
+	snprintf(i2c->adap.name, sizeof(i2c->adap.name), "%s.%d",
+		 USBIO_I2C_CLIENT, i2c->adev->id);
+
+	device_set_node(&i2c->adap.dev, dev_fwnode(&adev->dev));
+
+	auxiliary_set_drvdata(adev, i2c);
+	i2c_set_adapdata(&i2c->adap, i2c);
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
2.51.0


