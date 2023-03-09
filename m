Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2B4B6B1C10
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 08:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjCIHLs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 02:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjCIHLo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 02:11:44 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C25AC0811;
        Wed,  8 Mar 2023 23:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678345903; x=1709881903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RY2ff2EBYtqY2DG5EshiMQxNiqYz2FMmoH5xcHk6vMg=;
  b=RyEIRo4RxWgpmxoK22h+o9GsLzWCgYnxVSItYbHMzI9oZUyqChNtQov8
   E4kmmQhZDCcBMVLsf3JLAof663PCyqsFzxgYvjN6ATC+mnzP6+CArfDQM
   wG80XgmyfnZ2H0h8oUyQMlwokY3u+0ZDikqIi3Fk9qO8VRqkxzx+VI+eR
   ho2uxJ/OfP26jyyAITV5X+VEQL67rsH85mTPfrBtam/xFiyEJQDglYrGD
   aA+8Kxr9ZeWbjOvX6dR9VUgTpROSOu5Mey4uyWQBfPpHhBhq+XqfPi7nS
   fGow/m/TQeLpy3Tq0yPy+aWChV40tKyhK5MDin6uxB0SyTecKP/SnRAXP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316767812"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316767812"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="923126472"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="923126472"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 23:11:36 -0800
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
Subject: [PATCH v4 4/5] spi: Add support for Intel LJCA USB SPI driver
Date:   Thu,  9 Mar 2023 15:10:59 +0800
Message-Id: <20230309071100.2856899-5-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309071100.2856899-1-xiang.ye@intel.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
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

This patch implements the SPI function of Intel USB-I2C/GPIO/SPI adapter
device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
SPI module with specific protocol through interfaces exported by LJCA USB
driver.

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/spi/Kconfig    |  11 ++
 drivers/spi/Makefile   |   1 +
 drivers/spi/spi-ljca.c | 291 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 303 insertions(+)
 create mode 100644 drivers/spi/spi-ljca.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 47bbba04fe3a..024652e43e4c 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -404,6 +404,17 @@ config SPI_HISI_SFC_V3XX
 	  This enables support for HiSilicon v3xx SPI NOR flash controller
 	  found in hi16xx chipsets.
 
+config SPI_LJCA
+	tristate "Intel La Jolla Cove Adapter SPI support"
+	depends on MFD_LJCA
+	default MFD_LJCA
+	help
+	  Select this option to enable SPI driver for the Intel
+	  La Jolla Cove Adapter (LJCA) board.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called spi-ljca.
+
 config SPI_NXP_FLEXSPI
 	tristate "NXP Flex SPI controller"
 	depends on ARCH_LAYERSCAPE || HAS_IOMEM
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index d87cf75bee6a..0d0cc1b0fb9b 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_SPI_INTEL_PCI)		+= spi-intel-pci.o
 obj-$(CONFIG_SPI_INTEL_PLATFORM)	+= spi-intel-platform.o
 obj-$(CONFIG_SPI_LANTIQ_SSC)		+= spi-lantiq-ssc.o
 obj-$(CONFIG_SPI_JCORE)			+= spi-jcore.o
+obj-$(CONFIG_SPI_LJCA) 			+= spi-ljca.o
 obj-$(CONFIG_SPI_LM70_LLP)		+= spi-lm70llp.o
 obj-$(CONFIG_SPI_LP8841_RTC)		+= spi-lp8841-rtc.o
 obj-$(CONFIG_SPI_MESON_SPICC)		+= spi-meson-spicc.o
diff --git a/drivers/spi/spi-ljca.c b/drivers/spi/spi-ljca.c
new file mode 100644
index 000000000000..74815f752867
--- /dev/null
+++ b/drivers/spi/spi-ljca.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel La Jolla Cove Adapter USB-SPI driver
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/mfd/ljca.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi.h>
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
+#define LJCA_SPI_BUS_MAX_HZ 48000000
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
+#define LJCA_SPI_BUF_SIZE	60
+#define LJCA_SPI_MAX_XFER_SIZE	(LJCA_SPI_BUF_SIZE - sizeof(struct spi_xfer_packet))
+
+#define LJCA_SPI_CLK_MODE_POLARITY	BIT(0)
+#define LJCA_SPI_CLK_MODE_PHASE		BIT(1)
+
+struct spi_init_packet {
+	u8 index;
+	u8 speed;
+	u8 mode;
+} __packed;
+
+#define LJCA_SPI_XFER_INDICATOR_ID	GENMASK(5, 0)
+#define LJCA_SPI_XFER_INDICATOR_CMPL	BIT(6)
+#define LJCA_SPI_XFER_INDICATOR_INDEX	BIT(7)
+
+struct spi_xfer_packet {
+	u8 indicator;
+	s8 len;
+	u8 data[];
+} __packed;
+
+struct ljca_spi_dev {
+	struct platform_device *pdev;
+	struct spi_controller *controller;
+	struct ljca_spi_info *spi_info;
+	u8 speed;
+	u8 mode;
+
+	u8 obuf[LJCA_SPI_BUF_SIZE];
+	u8 ibuf[LJCA_SPI_BUF_SIZE];
+};
+
+static int ljca_spi_read_write(struct ljca_spi_dev *ljca_spi, const u8 *w_data, u8 *r_data, int len,
+			       int id, int complete, int cmd)
+{
+	struct spi_xfer_packet *w_packet = (struct spi_xfer_packet *)ljca_spi->obuf;
+	struct spi_xfer_packet *r_packet = (struct spi_xfer_packet *)ljca_spi->ibuf;
+	unsigned int ibuf_len = LJCA_SPI_BUF_SIZE;
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
+	ret = ljca_transfer(ljca_spi->spi_info->ljca, cmd, w_packet,
+			    struct_size(w_packet, data, w_packet->len), r_packet, &ibuf_len);
+	if (ret)
+		return ret;
+
+	if (ibuf_len < sizeof(*r_packet) || r_packet->len <= 0)
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
+	struct spi_init_packet w_packet = {};
+	int ret;
+
+	if (ljca_spi->mode == mode && ljca_spi->speed == div)
+		return 0;
+
+	w_packet.mode = FIELD_PREP(LJCA_SPI_CLK_MODE_POLARITY,
+				   (mode & SPI_CPOL) ? LJCA_SPI_CLOCK_HIGH_POLARITY :
+						       LJCA_SPI_CLOCK_LOW_POLARITY) |
+			FIELD_PREP(LJCA_SPI_CLK_MODE_PHASE,
+				   (mode & SPI_CPHA) ? LJCA_SPI_CLOCK_SECOND_PHASE :
+						       LJCA_SPI_CLOCK_FIRST_PHASE);
+
+	w_packet.index = ljca_spi->spi_info->id;
+	w_packet.speed = div;
+	ret = ljca_transfer(ljca_spi->spi_info->ljca, LJCA_SPI_INIT, &w_packet,
+			    sizeof(w_packet), NULL, NULL);
+	if (ret)
+		return ret;
+
+	ljca_spi->mode = mode;
+	ljca_spi->speed = div;
+	return 0;
+}
+
+static int ljca_spi_deinit(struct ljca_spi_dev *ljca_spi)
+{
+	struct spi_init_packet w_packet = {};
+
+	w_packet.index = ljca_spi->spi_info->id;
+	return ljca_transfer(ljca_spi->spi_info->ljca, LJCA_SPI_DEINIT, &w_packet, sizeof(w_packet),
+			     NULL, NULL);
+}
+
+static inline int ljca_spi_transfer(struct ljca_spi_dev *ljca_spi, const u8 *tx_data, u8 *rx_data,
+				    u16 len)
+{
+	int remaining = len;
+	int offset = 0;
+	int cur_len;
+	int complete;
+	int i;
+	int cmd;
+	int ret;
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
+static int ljca_spi_transfer_one(struct spi_controller *controller, struct spi_device *spi,
+				 struct spi_transfer *xfer)
+{
+	struct ljca_spi_dev *ljca_spi = spi_controller_get_devdata(controller);
+	int ret;
+	u8 div;
+
+	div = min_t(u8, LJCA_SPI_BUS_SPEED_MIN,
+		    DIV_ROUND_UP(controller->max_speed_hz, xfer->speed_hz) / 2 - 1);
+	ret = ljca_spi_init(ljca_spi, div, spi->mode);
+	if (ret) {
+		dev_err(&ljca_spi->pdev->dev, "cannot initialize transfer ret %d\n", ret);
+		return ret;
+	}
+
+	ret = ljca_spi_transfer(ljca_spi, xfer->tx_buf, xfer->rx_buf, xfer->len);
+	if (ret)
+		dev_err(&ljca_spi->pdev->dev, "ljca spi transfer failed!\n");
+
+	return ret;
+}
+
+static int ljca_spi_probe(struct platform_device *pdev)
+{
+	struct spi_controller *controller;
+	struct ljca_spi_dev *ljca_spi;
+	int ret;
+
+	controller = devm_spi_alloc_master(&pdev->dev, sizeof(*ljca_spi));
+	if (!controller)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, controller);
+	ljca_spi = spi_controller_get_devdata(controller);
+
+	ljca_spi->spi_info = dev_get_platdata(&pdev->dev);
+	ljca_spi->controller = controller;
+	ljca_spi->pdev = pdev;
+	device_set_node(&ljca_spi->controller->dev, dev_fwnode(&pdev->dev));
+
+	controller->bus_num = -1;
+	controller->mode_bits = SPI_CPHA | SPI_CPOL;
+	controller->transfer_one = ljca_spi_transfer_one;
+	controller->auto_runtime_pm = false;
+	controller->max_speed_hz = LJCA_SPI_BUS_MAX_HZ;
+
+	ret = spi_register_controller(controller);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to register controller\n");
+
+	return ret;
+}
+
+static int ljca_spi_dev_remove(struct platform_device *pdev)
+{
+	struct spi_controller *controller = platform_get_drvdata(pdev);
+	struct ljca_spi_dev *ljca_spi = spi_controller_get_devdata(controller);
+
+	spi_unregister_controller(controller);
+	ljca_spi_deinit(ljca_spi);
+	return 0;
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
+#define LJCA_SPI_DRV_NAME "ljca-spi"
+static const struct platform_device_id ljca_spi_id[] = {
+	{ LJCA_SPI_DRV_NAME, 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, ljca_spi_id);
+
+static struct platform_driver spi_ljca_driver = {
+	.driver = {
+		.name	= LJCA_SPI_DRV_NAME,
+		.pm	= &ljca_spi_pm,
+	},
+	.probe		= ljca_spi_probe,
+	.remove		= ljca_spi_dev_remove,
+};
+
+module_platform_driver(spi_ljca_driver);
+
+MODULE_AUTHOR("Ye Xiang <xiang.ye@intel.com>");
+MODULE_AUTHOR("Wang Zhifeng <zhifeng.wang@intel.com>");
+MODULE_AUTHOR("Zhang Lixu <lixu.zhang@intel.com>");
+MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-SPI driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(LJCA);
-- 
2.34.1

