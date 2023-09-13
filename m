Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4852779DDBB
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 03:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237684AbjIMBks (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Sep 2023 21:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238076AbjIMBks (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Sep 2023 21:40:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FEB115;
        Tue, 12 Sep 2023 18:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694569244; x=1726105244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SLnhAFiRzudPM3HfI41x5TnsCLR43TRIm6isr37GJbs=;
  b=W3P1DrwfUhWgY9t0ZzUMz1kPTvtnxhMiW9gCNgjUOf3nJzoLJ6HKHYVm
   4HH9rL+45PjeDZqmNzMn4pdV/yw+EiyrTaipvkyheR2XF6c4Yt8Ag+/RH
   8HX065JUbug/oXcjioZDQSfBcjNYab9EJrKY4NlT7rngwRMN+49aQb7+D
   Y+5Dee0oL/5c0wjrDBoTDFf09D5M0gTd096IeN1ZtZFclqQQFcnNONtzH
   fBt49UoE+15J/aYxGf4vp3MM1LaHBuuc56UmiZSrbV4PEg9BNsJfx1/F3
   iywyq3vpSLnuJrOAnIIEi8lFU5JOnUAcO6natQQuXTNn/zs79Vl404UfX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442569130"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="442569130"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 18:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="773250262"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="773250262"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga008.jf.intel.com with ESMTP; 12 Sep 2023 18:40:37 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v16 2/4] i2c: Add support for Intel LJCA USB I2C driver
Date:   Wed, 13 Sep 2023 09:40:10 +0800
Message-Id: <1694569212-10080-3-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694569212-10080-1-git-send-email-wentong.wu@intel.com>
References: <1694569212-10080-1-git-send-email-wentong.wu@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implements the I2C function of Intel USB-I2C/GPIO/SPI adapter device
named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA I2C
module with specific protocol through interfaces exported by LJCA
USB driver.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/busses/Kconfig    |  11 ++
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-ljca.c | 342 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 354 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ljca.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 9cfe8fc..7e2c52d 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1264,6 +1264,17 @@ config I2C_DLN2
 	 This driver can also be built as a module.  If so, the module
 	 will be called i2c-dln2.
 
+config I2C_LJCA
+	tristate "I2C functionality of Intel La Jolla Cove Adapter"
+	depends on USB_LJCA
+	default USB_LJCA
+	help
+	  If you say yes to this option, I2C functionality support of Intel
+	  La Jolla Cove Adapter (LJCA) will be included.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-ljca.
+
 config I2C_CP2615
 	tristate "Silicon Labs CP2615 USB sound card and I2C adapter"
 	depends on USB
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index af56fe2..3757b93 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -133,6 +133,7 @@ obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
 # External I2C/SMBus adapter drivers
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
+obj-$(CONFIG_I2C_LJCA)		+= i2c-ljca.o
 obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
 obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o
diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
new file mode 100644
index 0000000..9c544bb
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ljca.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel La Jolla Cove Adapter USB-I2C driver
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ */
+
+#include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/usb/ljca.h>
+
+/* I2C init flags */
+#define LJCA_I2C_INIT_FLAG_MODE			BIT(0)
+#define LJCA_I2C_INIT_FLAG_MODE_POLLING		FIELD_PREP(LJCA_I2C_INIT_FLAG_MODE, 0)
+#define LJCA_I2C_INIT_FLAG_MODE_INTERRUPT	FIELD_PREP(LJCA_I2C_INIT_FLAG_MODE, 1)
+
+#define LJCA_I2C_INIT_FLAG_ADDR_16BIT		BIT(0)
+
+#define LJCA_I2C_INIT_FLAG_FREQ			GENMASK(2, 1)
+#define LJCA_I2C_INIT_FLAG_FREQ_100K		FIELD_PREP(LJCA_I2C_INIT_FLAG_FREQ, 0)
+#define LJCA_I2C_INIT_FLAG_FREQ_400K		FIELD_PREP(LJCA_I2C_INIT_FLAG_FREQ, 1)
+#define LJCA_I2C_INIT_FLAG_FREQ_1M		FIELD_PREP(LJCA_I2C_INIT_FLAG_FREQ, 2)
+
+#define LJCA_I2C_BUF_SIZE			60u
+#define LJCA_I2C_MAX_XFER_SIZE			(LJCA_I2C_BUF_SIZE - sizeof(struct ljca_i2c_rw_packet))
+
+/* I2C commands */
+enum ljca_i2c_cmd {
+	LJCA_I2C_INIT = 1,
+	LJCA_I2C_XFER,
+	LJCA_I2C_START,
+	LJCA_I2C_STOP,
+	LJCA_I2C_READ,
+	LJCA_I2C_WRITE,
+};
+
+enum ljca_xfer_type {
+	LJCA_I2C_WRITE_XFER_TYPE,
+	LJCA_I2C_READ_XFER_TYPE,
+};
+
+/* I2C raw commands: Init/Start/Read/Write/Stop */
+struct ljca_i2c_rw_packet {
+	u8 id;
+	__le16 len;
+	u8 data[];
+} __packed;
+
+struct ljca_i2c_dev {
+	struct ljca_client *ljca;
+	struct ljca_i2c_info *i2c_info;
+	struct i2c_adapter adap;
+
+	u8 obuf[LJCA_I2C_BUF_SIZE];
+	u8 ibuf[LJCA_I2C_BUF_SIZE];
+};
+
+static int ljca_i2c_init(struct ljca_i2c_dev *ljca_i2c, u8 id)
+{
+	struct ljca_i2c_rw_packet *w_packet =
+			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
+	int ret;
+
+	w_packet->id = id;
+	w_packet->len = cpu_to_le16(sizeof(*w_packet->data));
+	w_packet->data[0] = LJCA_I2C_INIT_FLAG_FREQ_400K;
+
+	ret = ljca_transfer(ljca_i2c->ljca, LJCA_I2C_INIT, (u8 *)w_packet,
+			    struct_size(w_packet, data, 1), NULL, 0);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
+			  enum ljca_xfer_type type)
+{
+	struct ljca_i2c_rw_packet *w_packet =
+			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
+	struct ljca_i2c_rw_packet *r_packet =
+			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
+	s16 rp_len;
+	int ret;
+
+	w_packet->id = ljca_i2c->i2c_info->id;
+	w_packet->len = cpu_to_le16(sizeof(*w_packet->data));
+	w_packet->data[0] = (slave_addr << 1) | type;
+
+	ret = ljca_transfer(ljca_i2c->ljca, LJCA_I2C_START, (u8 *)w_packet,
+			    struct_size(w_packet, data, 1), (u8 *)r_packet,
+			    LJCA_I2C_BUF_SIZE);
+	if (ret < 0 || ret < sizeof(*r_packet))
+		return ret < 0 ? ret : -EIO;
+
+	rp_len = le16_to_cpu(r_packet->len);
+	if (rp_len < 0 || r_packet->id != w_packet->id) {
+		dev_dbg(&ljca_i2c->adap.dev,
+			"i2c start failed len: %d id: %d %d\n",
+			rp_len, r_packet->id, w_packet->id);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr)
+{
+	struct ljca_i2c_rw_packet *w_packet =
+			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
+	struct ljca_i2c_rw_packet *r_packet =
+			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
+	s16 rp_len;
+	int ret;
+
+	w_packet->id = ljca_i2c->i2c_info->id;
+	w_packet->len = cpu_to_le16(sizeof(*w_packet->data));
+	w_packet->data[0] = 0;
+
+	ret = ljca_transfer(ljca_i2c->ljca, LJCA_I2C_STOP, (u8 *)w_packet,
+			    struct_size(w_packet, data, 1), (u8 *)r_packet,
+			    LJCA_I2C_BUF_SIZE);
+	if (ret < 0 || ret < sizeof(*r_packet)) {
+		dev_dbg(&ljca_i2c->adap.dev,
+			"i2c stop failed ret: %d id: %d\n",
+			ret, w_packet->id);
+		return;
+	}
+
+	rp_len = le16_to_cpu(r_packet->len);
+	if (rp_len < 0 || r_packet->id != w_packet->id)
+		dev_dbg(&ljca_i2c->adap.dev,
+			"i2c stop failed len: %d id: %d %d\n",
+			rp_len, r_packet->id, w_packet->id);
+}
+
+static int ljca_i2c_pure_read(struct ljca_i2c_dev *ljca_i2c, u8 *data, u8 len)
+{
+	struct ljca_i2c_rw_packet *w_packet =
+			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
+	struct ljca_i2c_rw_packet *r_packet =
+			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
+	s16 rp_len;
+	int ret;
+
+	w_packet->id = ljca_i2c->i2c_info->id;
+	w_packet->len = cpu_to_le16(len);
+	w_packet->data[0] = 0;
+
+	ret = ljca_transfer(ljca_i2c->ljca, LJCA_I2C_READ, (u8 *)w_packet,
+			    struct_size(w_packet, data, 1), (u8 *)r_packet,
+			    LJCA_I2C_BUF_SIZE);
+	if (ret < 0 || ret < sizeof(*r_packet))
+		return ret < 0 ? ret : -EIO;
+
+	rp_len = le16_to_cpu(r_packet->len);
+	if (rp_len != len || r_packet->id != w_packet->id) {
+		dev_dbg(&ljca_i2c->adap.dev,
+			"i2c raw read failed len: %d id: %d %d\n",
+			rp_len, r_packet->id, w_packet->id);
+		return -EIO;
+	}
+
+	memcpy(data, r_packet->data, len);
+
+	return 0;
+}
+
+static int ljca_i2c_read(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr, u8 *data,
+			 u8 len)
+{
+	int ret;
+
+	ret = ljca_i2c_start(ljca_i2c, slave_addr, LJCA_I2C_READ_XFER_TYPE);
+	if (!ret)
+		ret = ljca_i2c_pure_read(ljca_i2c, data, len);
+
+	ljca_i2c_stop(ljca_i2c, slave_addr);
+
+	return ret;
+}
+
+static int ljca_i2c_pure_write(struct ljca_i2c_dev *ljca_i2c, u8 *data, u8 len)
+{
+	struct ljca_i2c_rw_packet *w_packet =
+			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
+	struct ljca_i2c_rw_packet *r_packet =
+			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
+	s16 rplen;
+	int ret;
+
+	w_packet->id = ljca_i2c->i2c_info->id;
+	w_packet->len = cpu_to_le16(len);
+	memcpy(w_packet->data, data, len);
+
+	ret = ljca_transfer(ljca_i2c->ljca, LJCA_I2C_WRITE, (u8 *)w_packet,
+			    struct_size(w_packet, data, len), (u8 *)r_packet,
+			    LJCA_I2C_BUF_SIZE);
+	if (ret < 0 || ret < sizeof(*r_packet))
+		return ret < 0 ? ret : -EIO;
+
+	rplen = le16_to_cpu(r_packet->len);
+	if (rplen != len || r_packet->id != w_packet->id) {
+		dev_dbg(&ljca_i2c->adap.dev,
+			"i2c write failed len: %d id: %d/%d\n",
+			rplen, r_packet->id, w_packet->id);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int ljca_i2c_write(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
+			  u8 *data, u8 len)
+{
+	int ret;
+
+	ret = ljca_i2c_start(ljca_i2c, slave_addr, LJCA_I2C_WRITE_XFER_TYPE);
+	if (!ret)
+		ret = ljca_i2c_pure_write(ljca_i2c, data, len);
+
+	ljca_i2c_stop(ljca_i2c, slave_addr);
+
+	return ret;
+}
+
+static int ljca_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msg,
+			 int num)
+{
+	struct ljca_i2c_dev *ljca_i2c;
+	struct i2c_msg *cur_msg;
+	int i, ret;
+
+	ljca_i2c = i2c_get_adapdata(adapter);
+	if (!ljca_i2c)
+		return -EINVAL;
+
+	for (i = 0; i < num; i++) {
+		cur_msg = &msg[i];
+		if (cur_msg->flags & I2C_M_RD)
+			ret = ljca_i2c_read(ljca_i2c, cur_msg->addr,
+					    cur_msg->buf, cur_msg->len);
+		else
+			ret = ljca_i2c_write(ljca_i2c, cur_msg->addr,
+					     cur_msg->buf, cur_msg->len);
+
+		if (ret)
+			return ret;
+	}
+
+	return num;
+}
+
+static u32 ljca_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C;
+}
+
+static const struct i2c_adapter_quirks ljca_i2c_quirks = {
+	.max_read_len = LJCA_I2C_MAX_XFER_SIZE,
+	.max_write_len = LJCA_I2C_MAX_XFER_SIZE,
+};
+
+static const struct i2c_algorithm ljca_i2c_algo = {
+	.master_xfer = ljca_i2c_xfer,
+	.functionality = ljca_i2c_func,
+};
+
+static int ljca_i2c_probe(struct auxiliary_device *auxdev,
+			  const struct auxiliary_device_id *aux_dev_id)
+{
+	struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
+	struct ljca_i2c_dev *ljca_i2c;
+	int ret;
+
+	ljca_i2c = devm_kzalloc(&auxdev->dev, sizeof(*ljca_i2c), GFP_KERNEL);
+	if (!ljca_i2c)
+		return -ENOMEM;
+
+	ljca_i2c->ljca = ljca;
+	ljca_i2c->i2c_info = dev_get_platdata(&auxdev->dev);
+
+	ljca_i2c->adap.owner = THIS_MODULE;
+	ljca_i2c->adap.class = I2C_CLASS_HWMON;
+	ljca_i2c->adap.algo = &ljca_i2c_algo;
+	ljca_i2c->adap.quirks = &ljca_i2c_quirks;
+	ljca_i2c->adap.dev.parent = &auxdev->dev;
+
+	snprintf(ljca_i2c->adap.name, sizeof(ljca_i2c->adap.name), "%s-%s-%d",
+		 dev_name(&auxdev->dev), dev_name(auxdev->dev.parent),
+		 ljca_i2c->i2c_info->id);
+
+	device_set_node(&ljca_i2c->adap.dev, dev_fwnode(&auxdev->dev));
+
+	i2c_set_adapdata(&ljca_i2c->adap, ljca_i2c);
+	auxiliary_set_drvdata(auxdev, ljca_i2c);
+
+	ret = ljca_i2c_init(ljca_i2c, ljca_i2c->i2c_info->id);
+	if (ret)
+		return dev_err_probe(&auxdev->dev, -EIO,
+				     "i2c init failed id: %d\n",
+				     ljca_i2c->i2c_info->id);
+
+	ret = devm_i2c_add_adapter(&auxdev->dev, &ljca_i2c->adap);
+	if (ret)
+		return ret;
+
+	if (has_acpi_companion(&ljca_i2c->adap.dev))
+		acpi_dev_clear_dependencies(ACPI_COMPANION(&ljca_i2c->adap.dev));
+
+	return 0;
+}
+
+static void ljca_i2c_remove(struct auxiliary_device *auxdev)
+{
+	struct ljca_i2c_dev *ljca_i2c = auxiliary_get_drvdata(auxdev);
+
+	i2c_del_adapter(&ljca_i2c->adap);
+}
+
+static const struct auxiliary_device_id ljca_i2c_id_table[] = {
+	{ "usb_ljca.ljca-i2c", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, ljca_i2c_id_table);
+
+static struct auxiliary_driver ljca_i2c_driver = {
+	.probe = ljca_i2c_probe,
+	.remove = ljca_i2c_remove,
+	.id_table = ljca_i2c_id_table,
+};
+module_auxiliary_driver(ljca_i2c_driver);
+
+MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
+MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
+MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-I2C driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(LJCA);
-- 
2.7.4

