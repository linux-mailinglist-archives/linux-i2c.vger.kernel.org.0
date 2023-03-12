Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6016B6A76
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 20:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjCLTF3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 15:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjCLTF1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 15:05:27 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3312B26CEC;
        Sun, 12 Mar 2023 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678647907; x=1710183907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nGjcU+2sCrq3eC6pvyJE9aauJeQX9Q2FSNIfGsLTH+Q=;
  b=Bx1FkkZlt2O+GT9GMXTLUZrjKgvhrBjMBX1nGRhCDVm5F43dyql/PFWy
   wQ5S8PTumvkEDQSXgr4HJWtXFc+t8qyVtHQQK6ILD7xUn5yLKshFmo7oR
   8jBtugpmZ/qmQmpBGxqvPF0CExikzFBV8NEJss3LyXV/izcmfraBSazcH
   XIspNlkTfqAkcn+uXqIH2cJcJXIMxumQTAgicmjNh8DRCxhZ+P4Up9RC1
   MG38N0+DHHo8Niehbi7ehbstq/6dU8AboHPzzN5+PfF1NLMvMdbfYzRGZ
   8gRd510PLL+Oj+kUmL+vwm2ELMiYRc+V4LO7bVjYRmHdXG20PYXI0SZ6R
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="338568355"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="338568355"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 12:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655749352"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="655749352"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga006.jf.intel.com with ESMTP; 12 Mar 2023 12:05:01 -0700
From:   Ye Xiang <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v5 3/5] i2c: Add support for Intel LJCA USB I2C driver
Date:   Mon, 13 Mar 2023 03:04:33 +0800
Message-Id: <20230312190435.3568212-4-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312190435.3568212-1-xiang.ye@intel.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch implements the I2C function of Intel USB-I2C/GPIO/SPI adapter
device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
I2c module with specific protocol through interfaces exported by LJCA USB
driver.

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/i2c/busses/Kconfig    |  11 ++
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-ljca.c | 355 ++++++++++++++++++++++++++++++++++
 3 files changed, 367 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ljca.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 25eb4e8fd22f..37fed62797a9 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1261,6 +1261,17 @@ config I2C_DLN2
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
index af56fe2c75c0..4af5b06ef288 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -133,6 +133,7 @@ obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
 # External I2C/SMBus adapter drivers
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
+obj-$(CONFIG_I2C_LJCA) 		+= i2c-ljca.o
 obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
 obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o
diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
new file mode 100644
index 000000000000..01c2ad9fa228
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ljca.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel La Jolla Cove Adapter USB-I2C driver
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/usb/ljca.h>
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
+	LJCA_I2C_READ_XFER_TYPE,
+	LJCA_I2C_WRITE_XFER_TYPE,
+};
+
+/* I2C r/w Flags */
+#define LJCA_I2C_SLAVE_TRANSFER_WRITE	(0)
+#define LJCA_I2C_SLAVE_TRANSFER_READ	(1)
+
+/* I2C init flags */
+#define LJCA_I2C_INIT_FLAG_MODE			BIT(0)
+#define LJCA_I2C_INIT_FLAG_MODE_POLLING		FIELD_PREP(LJCA_I2C_INIT_FLAG_MODE, 0)
+#define LJCA_I2C_INIT_FLAG_MODE_INTERRUPT	FIELD_PREP(LJCA_I2C_INIT_FLAG_MODE, 1)
+
+#define LJCA_I2C_INIT_FLAG_ADDR_16BIT	BIT(0)
+
+#define LJCA_I2C_INIT_FLAG_FREQ		GENMASK(2, 1)
+#define LJCA_I2C_INIT_FLAG_FREQ_100K	FIELD_PREP(LJCA_I2C_INIT_FLAG_FREQ, 0)
+#define LJCA_I2C_INIT_FLAG_FREQ_400K	FIELD_PREP(LJCA_I2C_INIT_FLAG_FREQ, 1)
+#define LJCA_I2C_INIT_FLAG_FREQ_1M	FIELD_PREP(LJCA_I2C_INIT_FLAG_FREQ, 2)
+
+/* I2C Transfer */
+struct i2c_xfer {
+	u8 id;
+	u8 slave;
+	u16 flag; /* speed, 8/16bit addr, addr increase, etc */
+	u16 addr;
+	u16 len;
+	u8 data[];
+} __packed;
+
+/* I2C raw commands: Init/Start/Read/Write/Stop */
+struct i2c_rw_packet {
+	u8 id;
+	__le16 len;
+	u8 data[];
+} __packed;
+
+#define LJCA_I2C_BUF_SIZE	60
+#define LJCA_I2C_MAX_XFER_SIZE	(LJCA_I2C_BUF_SIZE - sizeof(struct i2c_rw_packet))
+
+struct ljca_i2c_dev {
+	struct platform_device *pdev;
+	struct ljca_i2c_info *i2c_info;
+	struct i2c_adapter adap;
+
+	u8 obuf[LJCA_I2C_BUF_SIZE];
+	u8 ibuf[LJCA_I2C_BUF_SIZE];
+};
+
+static u8 ljca_i2c_format_slave_addr(u8 slave_addr, u8 type)
+{
+	return (slave_addr << 1) | (type == LJCA_I2C_READ_XFER_TYPE) ?
+		       LJCA_I2C_SLAVE_TRANSFER_READ :
+		       LJCA_I2C_SLAVE_TRANSFER_WRITE;
+}
+
+static int ljca_i2c_init(struct ljca_i2c_dev *ljca_i2c, u8 id)
+{
+	struct i2c_rw_packet *w_packet = (struct i2c_rw_packet *)ljca_i2c->obuf;
+
+	memset(w_packet, 0, sizeof(*w_packet));
+	w_packet->id = id;
+	w_packet->data[0] = LJCA_I2C_INIT_FLAG_FREQ_400K;
+	w_packet->len = cpu_to_le16(sizeof(*w_packet->data));
+
+	return ljca_transfer(ljca_i2c->i2c_info->ljca, LJCA_I2C_INIT, w_packet,
+			     struct_size(w_packet, data, 1), NULL, NULL);
+}
+
+static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr, enum ljca_xfer_type type)
+{
+	struct i2c_rw_packet *w_packet = (struct i2c_rw_packet *)ljca_i2c->obuf;
+	struct i2c_rw_packet *r_packet = (struct i2c_rw_packet *)ljca_i2c->ibuf;
+	unsigned int ibuf_len = LJCA_I2C_BUF_SIZE;
+	int ret;
+	s16 rp_len;
+
+	memset(w_packet, 0, sizeof(*w_packet));
+	w_packet->id = ljca_i2c->i2c_info->id;
+	w_packet->data[0] = ljca_i2c_format_slave_addr(slave_addr, type);
+	w_packet->len = cpu_to_le16(sizeof(*w_packet->data));
+
+	ret = ljca_transfer(ljca_i2c->i2c_info->ljca, LJCA_I2C_START, w_packet,
+			    struct_size(w_packet, data, 1), r_packet, &ibuf_len);
+	if (ret)
+		return ret;
+
+	if (ibuf_len < sizeof(*r_packet))
+		return -EIO;
+
+	rp_len = le16_to_cpu(r_packet->len);
+	if (rp_len < 0 || r_packet->id != w_packet->id) {
+		dev_err(&ljca_i2c->adap.dev, "i2c start failed len:%d id:%d %d\n", rp_len,
+			r_packet->id, w_packet->id);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr)
+{
+	struct i2c_rw_packet *w_packet = (struct i2c_rw_packet *)ljca_i2c->obuf;
+	struct i2c_rw_packet *r_packet = (struct i2c_rw_packet *)ljca_i2c->ibuf;
+	unsigned int ibuf_len = LJCA_I2C_BUF_SIZE;
+	int ret;
+	s16 rp_len;
+
+	memset(w_packet, 0, sizeof(*w_packet));
+	w_packet->id = ljca_i2c->i2c_info->id;
+	w_packet->data[0] = 0;
+	w_packet->len = cpu_to_le16(sizeof(*w_packet->data));
+
+	ret = ljca_transfer(ljca_i2c->i2c_info->ljca, LJCA_I2C_STOP, w_packet,
+			    struct_size(w_packet, data, 1), r_packet, &ibuf_len);
+	if (ret)
+		return ret;
+
+	if (ibuf_len < sizeof(*r_packet))
+		return -EIO;
+
+	rp_len = le16_to_cpu(r_packet->len);
+	if (rp_len < 0 || r_packet->id != w_packet->id) {
+		dev_err(&ljca_i2c->adap.dev, "i2c stop failed len:%d id:%d %d\n", rp_len,
+			r_packet->id, w_packet->id);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int ljca_i2c_pure_read(struct ljca_i2c_dev *ljca_i2c, u8 *data, u8 len)
+{
+	struct i2c_rw_packet *w_packet = (struct i2c_rw_packet *)ljca_i2c->obuf;
+	struct i2c_rw_packet *r_packet = (struct i2c_rw_packet *)ljca_i2c->ibuf;
+	unsigned int ibuf_len = LJCA_I2C_BUF_SIZE;
+	int ret;
+	s16 rp_len;
+
+	if (len > LJCA_I2C_MAX_XFER_SIZE)
+		return -EINVAL;
+
+	memset(w_packet, 0, sizeof(*w_packet));
+	w_packet->id = ljca_i2c->i2c_info->id;
+	w_packet->len = cpu_to_le16(len);
+	w_packet->data[0] = 0;
+
+	ret = ljca_transfer(ljca_i2c->i2c_info->ljca, LJCA_I2C_READ, w_packet,
+			    struct_size(w_packet, data, 1), r_packet, &ibuf_len);
+	if (ret)
+		return ret;
+
+	if (ibuf_len < sizeof(*r_packet))
+		return -EIO;
+
+	rp_len = le16_to_cpu(r_packet->len);
+	if (rp_len != len || r_packet->id != w_packet->id) {
+		dev_err(&ljca_i2c->adap.dev, "i2c raw read failed len:%d id:%d %d\n", rp_len,
+			r_packet->id, w_packet->id);
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
+	if (ret)
+		goto out_stop;
+
+	ret = ljca_i2c_pure_read(ljca_i2c, data, len);
+
+out_stop:
+	ljca_i2c_stop(ljca_i2c, slave_addr);
+
+	return ret;
+}
+
+static int ljca_i2c_pure_write(struct ljca_i2c_dev *ljca_i2c, u8 *data, u8 len)
+{
+	struct i2c_rw_packet *w_packet = (struct i2c_rw_packet *)ljca_i2c->obuf;
+	struct i2c_rw_packet *r_packet = (struct i2c_rw_packet *)ljca_i2c->ibuf;
+	unsigned int ibuf_len = LJCA_I2C_BUF_SIZE;
+	s16 rplen;
+	int ret;
+
+	if (len > LJCA_I2C_MAX_XFER_SIZE)
+		return -EINVAL;
+
+	memset(w_packet, 0, sizeof(*w_packet));
+	w_packet->id = ljca_i2c->i2c_info->id;
+	w_packet->len = cpu_to_le16(len);
+	memcpy(w_packet->data, data, len);
+
+	ret = ljca_transfer(ljca_i2c->i2c_info->ljca, LJCA_I2C_WRITE, w_packet,
+			    struct_size(w_packet, data, len), r_packet, &ibuf_len);
+	if (ret)
+		return ret;
+
+	if (ibuf_len < sizeof(*r_packet))
+		return -EIO;
+
+	rplen = le16_to_cpu(r_packet->len);
+	if (rplen != len || r_packet->id != w_packet->id) {
+		dev_err(&ljca_i2c->adap.dev, "i2c write failed len:%d id:%d/%d\n", rplen,
+			r_packet->id, w_packet->id);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int ljca_i2c_write(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr, u8 *data, u8 len)
+{
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	ret = ljca_i2c_start(ljca_i2c, slave_addr, LJCA_I2C_WRITE_XFER_TYPE);
+	if (ret)
+		goto out_stop;
+
+	ret = ljca_i2c_pure_write(ljca_i2c, data, len);
+
+out_stop:
+	ljca_i2c_stop(ljca_i2c, slave_addr);
+
+	return ret;
+}
+
+static int ljca_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msg, int num)
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
+			ret = ljca_i2c_read(ljca_i2c, cur_msg->addr, cur_msg->buf, cur_msg->len);
+		else
+			ret = ljca_i2c_write(ljca_i2c, cur_msg->addr, cur_msg->buf, cur_msg->len);
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
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
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
+static int ljca_i2c_probe(struct platform_device *pdev)
+{
+	struct ljca_i2c_dev *ljca_i2c;
+	int ret;
+
+	ljca_i2c = devm_kzalloc(&pdev->dev, sizeof(*ljca_i2c), GFP_KERNEL);
+	if (!ljca_i2c)
+		return -ENOMEM;
+
+	ljca_i2c->pdev = pdev;
+	ljca_i2c->i2c_info = dev_get_platdata(&pdev->dev);
+	ljca_i2c->adap.owner = THIS_MODULE;
+	ljca_i2c->adap.class = I2C_CLASS_HWMON;
+	ljca_i2c->adap.algo = &ljca_i2c_algo;
+	ljca_i2c->adap.quirks = &ljca_i2c_quirks;
+	ljca_i2c->adap.dev.parent = &pdev->dev;
+	device_set_node(&ljca_i2c->adap.dev, dev_fwnode(&pdev->dev));
+	i2c_set_adapdata(&ljca_i2c->adap, ljca_i2c);
+	snprintf(ljca_i2c->adap.name, sizeof(ljca_i2c->adap.name), "%s-%s-%d",
+		 dev_name(&pdev->dev), dev_name(pdev->dev.parent),
+		 ljca_i2c->i2c_info->id);
+
+	platform_set_drvdata(pdev, ljca_i2c);
+
+	ret = ljca_i2c_init(ljca_i2c, ljca_i2c->i2c_info->id);
+	if (ret) {
+		dev_err(&pdev->dev, "i2c init failed id:%d\n", ljca_i2c->i2c_info->id);
+		return -EIO;
+	}
+
+	return devm_i2c_add_adapter(&pdev->dev, &ljca_i2c->adap);
+}
+
+#define LJCA_I2C_DRV_NAME "ljca-i2c"
+static const struct platform_device_id ljca_i2c_id[] = {
+	{ LJCA_I2C_DRV_NAME, 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, ljca_i2c_id);
+
+static struct platform_driver ljca_i2c_driver = {
+	.driver.name = LJCA_I2C_DRV_NAME,
+	.probe = ljca_i2c_probe,
+};
+
+module_platform_driver(ljca_i2c_driver);
+
+MODULE_AUTHOR("Ye Xiang <xiang.ye@intel.com>");
+MODULE_AUTHOR("Wang Zhifeng <zhifeng.wang@intel.com>");
+MODULE_AUTHOR("Zhang Lixu <lixu.zhang@intel.com>");
+MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-I2C driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(LJCA);
-- 
2.34.1

