Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99CFD6A2A34
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Feb 2023 15:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjBYOBl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Feb 2023 09:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjBYOBh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Feb 2023 09:01:37 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB3519694;
        Sat, 25 Feb 2023 06:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677333694; x=1708869694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XYCKQomzHJLt77hYo1H+I17PK6w9Wi7POUWs24RDSXI=;
  b=O3lTAlDV6E4up9plG5Ef+hK564fUItTC1YTGNIAl/NBHa805U+RZvuUf
   qJHZQRnTWk96ApSRTJyz8jZeAI7uVLGc0nF0b/RKnddXyaeDR1dvwgYdI
   pmiTPk1/hiUG7cmiunKtM1W5iijm56Xt+KuOG/1jSX20LmEqEFC8HQGWa
   ZPS95L9YRkMJbrjojcjzdm3BwSjZv8N6xE0bzIwMaojkLi1EckDX5Ba4g
   WU+xLA2cf/WoPog3ZNn2Tp8IhL6QyqscZzWXNJteScAH8I+NJnhKiPnHm
   Me+cBWLBHqysJ//0iKPHK2lTJDdLzA789ttX/7Z+k3y0SVvM5LbTqbvx7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="314053423"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="314053423"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 06:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="918740176"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="918740176"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by fmsmga006.fm.intel.com with ESMTP; 25 Feb 2023 06:01:29 -0800
From:   Ye Xiang <xiang.ye@intel.com>
To:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v2 3/5] i2c: Add support for Intel LJCA USB I2C driver
Date:   Sat, 25 Feb 2023 22:01:16 +0800
Message-Id: <20230225140118.2037220-4-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225140118.2037220-1-xiang.ye@intel.com>
References: <20230225140118.2037220-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
---
 drivers/i2c/busses/Kconfig    |  11 ++
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-ljca.c | 357 ++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ljca.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a7bfddf08fa7..f94e2ed32563 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1243,6 +1243,17 @@ config I2C_DLN2
 	 This driver can also be built as a module.  If so, the module
 	 will be called i2c-dln2.
 
+config I2C_LJCA
+	tristate "I2C functionality of Intel La Jolla Cove Adapter"
+	depends on MFD_LJCA
+	default MFD_LJCA
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
index e73cdb1d2b5a..66a1fe79d0f6 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -131,6 +131,7 @@ obj-$(CONFIG_I2C_RCAR)		+= i2c-rcar.o
 # External I2C/SMBus adapter drivers
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
+obj-$(CONFIG_I2C_LJCA) 		+= i2c-ljca.o
 obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
 obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o
diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
new file mode 100644
index 000000000000..3250297c15b8
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ljca.c
@@ -0,0 +1,357 @@
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
+#include <linux/mfd/ljca.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
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
+	ret = devm_i2c_add_adapter(&pdev->dev, &ljca_i2c->adap);
+	if (ret)
+		return ret;
+
+	return 0;
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

