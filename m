Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88465793413
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 05:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236572AbjIFDX6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 23:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235323AbjIFDX5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 23:23:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1B3CE8;
        Tue,  5 Sep 2023 20:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693970632; x=1725506632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5MNk8k9iOt+kM1vRxuTYH14uALFUWlIdyNIBJFSFZhY=;
  b=NFE+Qnz+634/h+wyD253qWjWL/jtfuWF3XtOZJmL59msPURJiUna1HNr
   X0FA2UjDYXXqULlbHphR24piR8X8d22xxlMx0tkE4U2i37BiFepYpD2Lt
   +37ZWrvDPBxfgdyZ7PQ13rxKv8vZl4omo7RoJMBkfySRKZSGhgXRjY7A0
   AvjvaN3M0PpkvVV6o9E+h2bAfBkBBos/aoTuvi/vOFTRpG17qVdOCYygL
   CTtO5VjsL9f0CKulcoTKoUSJLr5vMNDb71faZcyTYHp+nRflQNIWwtOKA
   z7PLZqZY+mcgYMNi8/zGR6qMxJ+y64mFvd9UxBNjGMbdSMOT29+8D0nyA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="443352987"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="443352987"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 20:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="691150526"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="691150526"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga003.jf.intel.com with ESMTP; 05 Sep 2023 20:23:44 -0700
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
Subject: [PATCH v15 3/4] spi: Add support for Intel LJCA USB SPI driver
Date:   Wed,  6 Sep 2023 11:22:59 +0800
Message-Id: <1693970580-18967-4-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1693970580-18967-1-git-send-email-wentong.wu@intel.com>
References: <1693970580-18967-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implements the SPI function of Intel USB-I2C/GPIO/SPI adapter device
named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA SPI
module with specific protocol through interfaces exported by LJCA USB
driver.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/spi/Kconfig    |  11 ++
 drivers/spi/Makefile   |   1 +
 drivers/spi/spi-ljca.c | 297 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 309 insertions(+)
 create mode 100644 drivers/spi/spi-ljca.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 8962b25..ad18864 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -583,6 +583,17 @@ config SPI_FSL_ESPI
 	  From MPC8536, 85xx platform uses the controller, and all P10xx,
 	  P20xx, P30xx,P40xx, P50xx uses this controller.
 
+config SPI_LJCA
+	tristate "Intel La Jolla Cove Adapter SPI support"
+	depends on USB_LJCA
+	default USB_LJCA
+	help
+	  Select this option to enable SPI driver for the Intel
+	  La Jolla Cove Adapter (LJCA) board.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called spi-ljca.
+
 config SPI_MESON_SPICC
 	tristate "Amlogic Meson SPICC controller"
 	depends on COMMON_CLK
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 080c2c1..0847962 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_SPI_INTEL_PCI)		+= spi-intel-pci.o
 obj-$(CONFIG_SPI_INTEL_PLATFORM)	+= spi-intel-platform.o
 obj-$(CONFIG_SPI_LANTIQ_SSC)		+= spi-lantiq-ssc.o
 obj-$(CONFIG_SPI_JCORE)			+= spi-jcore.o
+obj-$(CONFIG_SPI_LJCA)			+= spi-ljca.o
 obj-$(CONFIG_SPI_LM70_LLP)		+= spi-lm70llp.o
 obj-$(CONFIG_SPI_LP8841_RTC)		+= spi-lp8841-rtc.o
 obj-$(CONFIG_SPI_MESON_SPICC)		+= spi-meson-spicc.o
diff --git a/drivers/spi/spi-ljca.c b/drivers/spi/spi-ljca.c
new file mode 100644
index 0000000..6a9ca39
--- /dev/null
+++ b/drivers/spi/spi-ljca.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel La Jolla Cove Adapter USB-SPI driver
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+#include <linux/usb/ljca.h>
+
+#define LJCA_SPI_BUS_MAX_HZ		48000000
+
+#define LJCA_SPI_BUF_SIZE		60u
+#define LJCA_SPI_MAX_XFER_SIZE		\
+	(LJCA_SPI_BUF_SIZE - sizeof(struct ljca_spi_xfer_packet))
+
+#define LJCA_SPI_CLK_MODE_POLARITY	BIT(0)
+#define LJCA_SPI_CLK_MODE_PHASE		BIT(1)
+
+#define LJCA_SPI_XFER_INDICATOR_ID	GENMASK(5, 0)
+#define LJCA_SPI_XFER_INDICATOR_CMPL	BIT(6)
+#define LJCA_SPI_XFER_INDICATOR_INDEX	BIT(7)
+
+/* SPI commands */
+enum ljca_spi_cmd {
+	LJCA_SPI_INIT = 1,
+	LJCA_SPI_READ,
+	LJCA_SPI_WRITE,
+	LJCA_SPI_WRITEREAD,
+	LJCA_SPI_DEINIT,
+};
+
+enum {
+	LJCA_SPI_BUS_SPEED_24M,
+	LJCA_SPI_BUS_SPEED_12M,
+	LJCA_SPI_BUS_SPEED_8M,
+	LJCA_SPI_BUS_SPEED_6M,
+	LJCA_SPI_BUS_SPEED_4_8M, /*4.8MHz*/
+	LJCA_SPI_BUS_SPEED_MIN = LJCA_SPI_BUS_SPEED_4_8M,
+};
+
+enum {
+	LJCA_SPI_CLOCK_LOW_POLARITY,
+	LJCA_SPI_CLOCK_HIGH_POLARITY,
+};
+
+enum {
+	LJCA_SPI_CLOCK_FIRST_PHASE,
+	LJCA_SPI_CLOCK_SECOND_PHASE,
+};
+
+struct ljca_spi_init_packet {
+	u8 index;
+	u8 speed;
+	u8 mode;
+} __packed;
+
+struct ljca_spi_xfer_packet {
+	u8 indicator;
+	u8 len;
+	u8 data[];
+} __packed;
+
+struct ljca_spi_dev {
+	struct ljca_client *ljca;
+	struct spi_controller *controller;
+	struct ljca_spi_info *spi_info;
+	u8 speed;
+	u8 mode;
+
+	u8 obuf[LJCA_SPI_BUF_SIZE];
+	u8 ibuf[LJCA_SPI_BUF_SIZE];
+};
+
+static int ljca_spi_read_write(struct ljca_spi_dev *ljca_spi, const u8 *w_data,
+			       u8 *r_data, int len, int id, int complete,
+			       int cmd)
+{
+	struct ljca_spi_xfer_packet *w_packet =
+			(struct ljca_spi_xfer_packet *)ljca_spi->obuf;
+	struct ljca_spi_xfer_packet *r_packet =
+			(struct ljca_spi_xfer_packet *)ljca_spi->ibuf;
+	int ret;
+
+	w_packet->indicator = FIELD_PREP(LJCA_SPI_XFER_INDICATOR_ID, id) |
+			      FIELD_PREP(LJCA_SPI_XFER_INDICATOR_CMPL, complete) |
+			      FIELD_PREP(LJCA_SPI_XFER_INDICATOR_INDEX,
+					 ljca_spi->spi_info->id);
+
+	if (cmd == LJCA_SPI_READ) {
+		w_packet->len = sizeof(u16);
+		*(__le16 *)&w_packet->data[0] = cpu_to_le16(len);
+	} else {
+		w_packet->len = len;
+		memcpy(w_packet->data, w_data, len);
+	}
+
+	ret = ljca_transfer(ljca_spi->ljca, cmd, w_packet,
+			    struct_size(w_packet, data, w_packet->len),
+			    r_packet, LJCA_SPI_BUF_SIZE);
+	if (ret < 0)
+		return ret;
+	else if (ret < sizeof(*r_packet) || r_packet->len <= 0)
+		return -EIO;
+
+	if (r_data)
+		memcpy(r_data, r_packet->data, r_packet->len);
+
+	return 0;
+}
+
+static int ljca_spi_init(struct ljca_spi_dev *ljca_spi, u8 div, u8 mode)
+{
+	struct ljca_spi_init_packet w_packet = {};
+	int ret;
+
+	if (ljca_spi->mode == mode && ljca_spi->speed == div)
+		return 0;
+
+	w_packet.index = ljca_spi->spi_info->id;
+	w_packet.speed = div;
+	w_packet.mode = FIELD_PREP(LJCA_SPI_CLK_MODE_POLARITY,
+				   (mode & SPI_CPOL) ? LJCA_SPI_CLOCK_HIGH_POLARITY :
+						       LJCA_SPI_CLOCK_LOW_POLARITY) |
+			FIELD_PREP(LJCA_SPI_CLK_MODE_PHASE,
+				   (mode & SPI_CPHA) ? LJCA_SPI_CLOCK_SECOND_PHASE :
+						       LJCA_SPI_CLOCK_FIRST_PHASE);
+
+	ret = ljca_transfer(ljca_spi->ljca, LJCA_SPI_INIT, &w_packet,
+			    sizeof(w_packet), NULL, 0);
+	if (ret < 0)
+		return ret;
+
+	ljca_spi->mode = mode;
+	ljca_spi->speed = div;
+
+	return 0;
+}
+
+static int ljca_spi_deinit(struct ljca_spi_dev *ljca_spi)
+{
+	struct ljca_spi_init_packet w_packet = {};
+	int ret;
+
+	w_packet.index = ljca_spi->spi_info->id;
+
+	ret = ljca_transfer(ljca_spi->ljca, LJCA_SPI_DEINIT, &w_packet,
+			    sizeof(w_packet), NULL, 0);
+
+	return ret < 0 ? ret : 0;
+}
+
+static inline int ljca_spi_transfer(struct ljca_spi_dev *ljca_spi,
+				    const u8 *tx_data, u8 *rx_data, u16 len)
+{
+	int complete, cur_len;
+	int remaining = len;
+	int cmd, ret, i;
+	int offset = 0;
+
+	if (tx_data && rx_data)
+		cmd = LJCA_SPI_WRITEREAD;
+	else if (tx_data)
+		cmd = LJCA_SPI_WRITE;
+	else if (rx_data)
+		cmd = LJCA_SPI_READ;
+	else
+		return -EINVAL;
+
+	for (i = 0; remaining > 0; i++) {
+		cur_len = min_t(unsigned int, remaining, LJCA_SPI_MAX_XFER_SIZE);
+		complete = (cur_len == remaining);
+
+		ret = ljca_spi_read_write(ljca_spi,
+					  tx_data ? tx_data + offset : NULL,
+					  rx_data ? rx_data + offset : NULL,
+					  cur_len, i, complete, cmd);
+		if (ret)
+			return ret;
+
+		offset += cur_len;
+		remaining -= cur_len;
+	}
+
+	return 0;
+}
+
+static int ljca_spi_transfer_one(struct spi_controller *controller,
+				 struct spi_device *spi,
+				 struct spi_transfer *xfer)
+{
+	u8 div = DIV_ROUND_UP(controller->max_speed_hz, xfer->speed_hz) / 2 - 1;
+	struct ljca_spi_dev *ljca_spi = spi_controller_get_devdata(controller);
+	int ret;
+
+	div = min_t(u8, LJCA_SPI_BUS_SPEED_MIN, div);
+
+	ret = ljca_spi_init(ljca_spi, div, spi->mode);
+	if (ret) {
+		dev_err(&ljca_spi->ljca->auxdev.dev,
+			"cannot initialize transfer ret %d\n", ret);
+		return ret;
+	}
+
+	ret = ljca_spi_transfer(ljca_spi, xfer->tx_buf, xfer->rx_buf, xfer->len);
+	if (ret)
+		dev_err(&ljca_spi->ljca->auxdev.dev,
+			"transfer failed len: %d\n", xfer->len);
+
+	return ret;
+}
+
+static int ljca_spi_probe(struct auxiliary_device *auxdev,
+			  const struct auxiliary_device_id *aux_dev_id)
+{
+	struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
+	struct spi_controller *controller;
+	struct ljca_spi_dev *ljca_spi;
+	int ret;
+
+	controller = devm_spi_alloc_master(&auxdev->dev, sizeof(*ljca_spi));
+	if (!controller)
+		return -ENOMEM;
+
+	ljca_spi = spi_controller_get_devdata(controller);
+	ljca_spi->ljca = ljca;
+	ljca_spi->spi_info = dev_get_platdata(&auxdev->dev);
+	ljca_spi->controller = controller;
+
+	controller->bus_num = -1;
+	controller->mode_bits = SPI_CPHA | SPI_CPOL;
+	controller->transfer_one = ljca_spi_transfer_one;
+	controller->auto_runtime_pm = false;
+	controller->max_speed_hz = LJCA_SPI_BUS_MAX_HZ;
+
+	device_set_node(&ljca_spi->controller->dev, dev_fwnode(&auxdev->dev));
+	auxiliary_set_drvdata(auxdev, controller);
+
+	ret = spi_register_controller(controller);
+	if (ret)
+		dev_err(&auxdev->dev, "Failed to register controller\n");
+
+	return ret;
+}
+
+static void ljca_spi_dev_remove(struct auxiliary_device *auxdev)
+{
+	struct spi_controller *controller = auxiliary_get_drvdata(auxdev);
+	struct ljca_spi_dev *ljca_spi = spi_controller_get_devdata(controller);
+
+	spi_unregister_controller(controller);
+	ljca_spi_deinit(ljca_spi);
+}
+
+static int ljca_spi_dev_suspend(struct device *dev)
+{
+	struct spi_controller *controller = dev_get_drvdata(dev);
+
+	return spi_controller_suspend(controller);
+}
+
+static int ljca_spi_dev_resume(struct device *dev)
+{
+	struct spi_controller *controller = dev_get_drvdata(dev);
+
+	return spi_controller_resume(controller);
+}
+
+static const struct dev_pm_ops ljca_spi_pm = {
+	SYSTEM_SLEEP_PM_OPS(ljca_spi_dev_suspend, ljca_spi_dev_resume)
+};
+
+static const struct auxiliary_device_id ljca_spi_id_table[] = {
+	{ "usb_ljca.ljca-spi", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, ljca_spi_id_table);
+
+static struct auxiliary_driver ljca_spi_driver = {
+	.driver.pm	= &ljca_spi_pm,
+	.probe		= ljca_spi_probe,
+	.remove		= ljca_spi_dev_remove,
+	.id_table	= ljca_spi_id_table,
+};
+module_auxiliary_driver(ljca_spi_driver);
+
+MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
+MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
+MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-SPI driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(LJCA);
-- 
2.7.4

