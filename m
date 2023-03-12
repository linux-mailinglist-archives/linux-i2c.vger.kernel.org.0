Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4106B6A6D
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 20:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjCLTEs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 15:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbjCLTEr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 15:04:47 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABACB252B2;
        Sun, 12 Mar 2023 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678647882; x=1710183882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=doRvI1j89pdAZFDmKI2UbyhJrHyLX7ONFoYDizIY3YQ=;
  b=K92UQ2CSR7pdo5jKt+/O/SeTwSLz4SiPsuHWIOQyH0jr3F+IkC/pG5Hw
   zKtaHzOFDvuRZEm3fjI4H+XxZWuETr87cSOSGIl2fqayXCOAHzj3EXRmD
   FUF7LYkZN1OVzvJKiw9aSWp/4c0IqrpIU1DOaOo7eRU8b71ociIQrePgf
   7qnDfzY1j3fDUL6Y50kS5BoN14DP+INDoMeV9uCckWZIsqVFdlGnelkKQ
   MU/+S1SCUxagi6ZNwCsyaXMJ38ijeaHTurWV6cEo0GSvqtzPxg5vdpZ8B
   dLZPBxXJpBeF25EW7dhSIF97QXzrYP4S01oEx6/3KKdvqxHpGiBO0OdYx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="338568315"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="338568315"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 12:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655749330"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="655749330"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga006.jf.intel.com with ESMTP; 12 Mar 2023 12:04:36 -0700
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
Subject: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Date:   Mon, 13 Mar 2023 03:04:31 +0800
Message-Id: <20230312190435.3568212-2-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312190435.3568212-1-xiang.ye@intel.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_FILL_THIS_FORM_SHORT autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
device named "La Jolla Cove Adapter" (LJCA).

The communication between the various LJCA module drivers and the
hardware will be muxed/demuxed by this driver. The sub-module of
LJCA can use ljca_transfer() to issue a transfer between host
and hardware.

Each sub-module of LJCA device is identified by type field within
the LJCA message header.

The minimum code in ASL that covers this board is
Scope (\_SB.PCI0.DWC3.RHUB.HS01)
    {
        Device (GPIO)
        {
            Name (_ADR, Zero)
            Name (_STA, 0x0F)
        }

        Device (I2C)
        {
            Name (_ADR, One)
            Name (_STA, 0x0F)
        }

        Device (SPI)
        {
            Name (_ADR, 0x02)
            Name (_STA, 0x0F)
        }
    }

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/misc/Kconfig  |  13 +
 drivers/usb/misc/Makefile |   1 +
 drivers/usb/misc/ljca.c   | 998 ++++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h  |  95 ++++
 4 files changed, 1107 insertions(+)
 create mode 100644 drivers/usb/misc/ljca.c
 create mode 100644 include/linux/usb/ljca.h

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index a5f7652db7da..59ec120c26d4 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -273,6 +273,19 @@ config USB_LINK_LAYER_TEST
 	  Layer Test Device. Say Y only when you want to conduct USB Super Speed
 	  Link Layer Test for host controllers.
 
+config USB_LJCA
+	tristate "Intel La Jolla Cove Adapter support"
+	select MFD_CORE
+	depends on USB
+	help
+	  This adds support for Intel La Jolla Cove USB-I2C/SPI/GPIO
+	  Master Adapter (LJCA). Additional drivers such as I2C_LJCA,
+	  GPIO_LJCA and SPI_LJCA must be enabled in order to use the
+	  functionality of the device.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called ljca.
+
 config USB_CHAOSKEY
 	tristate "ChaosKey random number generator driver support"
 	depends on HW_RANDOM
diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
index 93581baec3a8..6f6adfbe17e0 100644
--- a/drivers/usb/misc/Makefile
+++ b/drivers/usb/misc/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_USB_HUB_USB251XB)		+= usb251xb.o
 obj-$(CONFIG_USB_HSIC_USB3503)		+= usb3503.o
 obj-$(CONFIG_USB_HSIC_USB4604)		+= usb4604.o
 obj-$(CONFIG_USB_CHAOSKEY)		+= chaoskey.o
+obj-$(CONFIG_USB_LJCA)			+= ljca.o
 
 obj-$(CONFIG_USB_SISUSBVGA)		+= sisusbvga/
 obj-$(CONFIG_USB_LINK_LAYER_TEST)	+= lvstest.o
diff --git a/drivers/usb/misc/ljca.c b/drivers/usb/misc/ljca.c
new file mode 100644
index 000000000000..ab98deaf0074
--- /dev/null
+++ b/drivers/usb/misc/ljca.c
@@ -0,0 +1,998 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel La Jolla Cove Adapter USB driver
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/usb.h>
+#include <linux/usb/ljca.h>
+
+enum ljca_acpi_match_adr {
+	LJCA_ACPI_MATCH_GPIO,
+	LJCA_ACPI_MATCH_I2C1,
+	LJCA_ACPI_MATCH_I2C2,
+	LJCA_ACPI_MATCH_SPI1,
+	LJCA_ACPI_MATCH_SPI2,
+};
+
+static struct mfd_cell_acpi_match ljca_acpi_match_gpio = {
+	.adr = LJCA_ACPI_MATCH_GPIO,
+};
+
+static struct mfd_cell_acpi_match ljca_acpi_match_i2cs[] = {
+	{
+		.adr = LJCA_ACPI_MATCH_I2C1,
+	},
+	{
+		.adr = LJCA_ACPI_MATCH_I2C2,
+	},
+};
+
+static struct mfd_cell_acpi_match ljca_acpi_match_spis[] = {
+	{
+		.adr = LJCA_ACPI_MATCH_SPI1,
+	},
+	{
+		.adr = LJCA_ACPI_MATCH_SPI2,
+	},
+};
+
+struct ljca_msg {
+	u8 type;
+	u8 cmd;
+	u8 flags;
+	u8 len;
+	u8 data[];
+} __packed;
+
+struct fw_version {
+	u8 major;
+	u8 minor;
+	__le16 patch;
+	__le16 build;
+} __packed;
+
+/**
+ * enum ljca_stub_type - Stub type supported by LJCA.
+ * @LJCA_MNG_STUB: Provides Management messages.
+ * @LJCA_DIAG_STUB: provides Diagnose messages.
+ * @LJCA_GPIO_STUB: provides GPIO functionality.
+ * @LJCA_I2C_STUB: provides I2C functionality.
+ * @LJCA_SPI_STUB: provides SPI functionality.
+ */
+enum ljca_stub_type {
+	LJCA_MNG_STUB = 1,
+	LJCA_DIAG_STUB,
+	LJCA_GPIO_STUB,
+	LJCA_I2C_STUB,
+	LJCA_SPI_STUB,
+};
+
+/* command Flags */
+#define LJCA_ACK_FLAG	BIT(0)
+#define LJCA_RESP_FLAG	BIT(1)
+#define LJCA_CMPL_FLAG	BIT(2)
+
+/* MNG stub commands */
+enum ljca_mng_cmd {
+	LJCA_MNG_GET_VERSION = 1,
+	LJCA_MNG_RESET_NOTIFY,
+	LJCA_MNG_RESET,
+	LJCA_MNG_ENUM_GPIO,
+	LJCA_MNG_ENUM_I2C,
+	LJCA_MNG_POWER_STATE_CHANGE,
+	LJCA_MNG_SET_DFU_MODE,
+	LJCA_MNG_ENUM_SPI,
+};
+
+/* DIAG commands */
+enum ljca_diag_cmd {
+	LJCA_DIAG_GET_STATE = 1,
+	LJCA_DIAG_GET_STATISTIC,
+	LJCA_DIAG_SET_TRACE_LEVEL,
+	LJCA_DIAG_SET_ECHO_MODE,
+	LJCA_DIAG_GET_FW_LOG,
+	LJCA_DIAG_GET_FW_COREDUMP,
+	LJCA_DIAG_TRIGGER_WDT,
+	LJCA_DIAG_TRIGGER_FAULT,
+	LJCA_DIAG_FEED_WDT,
+	LJCA_DIAG_GET_SECURE_STATE,
+};
+
+struct ljca_i2c_ctr_info {
+	u8 id;
+	u8 capacity;
+	u8 intr_pin;
+} __packed;
+
+struct ljca_i2c_descriptor {
+	u8 num;
+	struct ljca_i2c_ctr_info info[];
+} __packed;
+
+struct ljca_spi_ctr_info {
+	u8 id;
+	u8 capacity;
+} __packed;
+
+struct ljca_spi_descriptor {
+	u8 num;
+	struct ljca_spi_ctr_info info[];
+} __packed;
+
+struct ljca_bank_descriptor {
+	u8 bank_id;
+	u8 pin_num;
+
+	/* 1 bit for each gpio, 1 means valid */
+	u32 valid_pins;
+} __packed;
+
+struct ljca_gpio_descriptor {
+	u8 pins_per_bank;
+	u8 bank_num;
+	struct ljca_bank_descriptor bank_desc[];
+} __packed;
+
+#define LJCA_MAX_PACKET_SIZE	64
+#define LJCA_MAX_PAYLOAD_SIZE (LJCA_MAX_PACKET_SIZE - sizeof(struct ljca_msg))
+#define LJCA_USB_WRITE_TIMEOUT_MS	200
+#define LJCA_USB_WRITE_ACK_TIMEOUT_MS	500
+#define LJCA_USB_ENUM_STUB_TIMEOUT_MS	20
+
+struct ljca_event_cb_entry {
+	ljca_event_cb_t notify;
+	void *context;
+};
+
+struct ljca_dev {
+	struct usb_device *udev;
+	struct usb_interface *intf;
+	u8 in_ep; /* the address of the bulk in endpoint */
+	u8 out_ep; /* the address of the bulk out endpoint */
+
+	/* the urb/buffer for read */
+	struct urb *in_urb;
+	unsigned char *ibuf;
+	size_t ibuf_len;
+
+	bool started;
+	struct list_head stubs_list;
+
+	/* to wait for an ongoing write ack */
+	wait_queue_head_t ack_wq;
+
+	struct mfd_cell *cells;
+	int cell_count;
+	/* mutex to protect package transfer with LJCA device */
+	struct mutex mutex;
+};
+
+struct ljca {
+	u8 type;
+	struct ljca_dev *dev;
+};
+
+struct ljca_stub_packet {
+	unsigned int *ibuf_len;
+	u8 *ibuf;
+};
+
+struct ljca_stub {
+	struct list_head list;
+	struct usb_interface *intf;
+	struct ljca_stub_packet ipacket;
+	u8 type;
+
+	/* for identify ack */
+	bool acked;
+	int cur_cmd;
+
+	struct ljca_event_cb_entry event_entry;
+	/* lock to protect event_entry */
+	spinlock_t event_cb_lock;
+
+	struct ljca ljca;
+	unsigned long priv[];
+};
+
+static inline void *ljca_priv(struct ljca_stub *stub)
+{
+	return stub->priv;
+}
+
+static bool ljca_validate(struct ljca_msg *header, u32 data_len)
+{
+	return header->len + sizeof(*header) == data_len;
+}
+
+static struct ljca_stub *ljca_stub_alloc(struct ljca_dev *dev, u8 type, int priv_size)
+{
+	struct ljca_stub *stub;
+
+	stub = kzalloc(struct_size(stub, priv, priv_size), GFP_KERNEL);
+	if (!stub)
+		return ERR_PTR(-ENOMEM);
+
+	stub->type = type;
+	stub->intf = dev->intf;
+	stub->ljca.dev = dev;
+	stub->ljca.type = stub->type;
+	spin_lock_init(&stub->event_cb_lock);
+	list_add_tail(&stub->list, &dev->stubs_list);
+	return stub;
+}
+
+static struct ljca_stub *ljca_stub_find(struct ljca_dev *dev, u8 type)
+{
+	struct ljca_stub *stub;
+
+	list_for_each_entry(stub, &dev->stubs_list, list) {
+		if (stub->type == type)
+			return stub;
+	}
+
+	dev_err(&dev->intf->dev, "USB stub not found, type:%d\n", type);
+
+	return ERR_PTR(-ENODEV);
+}
+
+static void ljca_stub_notify(struct ljca_stub *stub, u8 cmd, const void *evt_data, int len)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&stub->event_cb_lock, flags);
+	if (stub->event_entry.notify && stub->event_entry.context)
+		stub->event_entry.notify(stub->event_entry.context, cmd, evt_data, len);
+	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
+}
+
+static int ljca_parse(struct ljca_dev *dev, struct ljca_msg *header)
+{
+	struct ljca_stub *stub;
+
+	stub = ljca_stub_find(dev, header->type);
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	if (!(header->flags & LJCA_ACK_FLAG)) {
+		ljca_stub_notify(stub, header->cmd, header->data, header->len);
+		return 0;
+	}
+
+	if (stub->cur_cmd != header->cmd) {
+		dev_err(&dev->intf->dev, "header and stub current command mismatch (%x vs %x)\n",
+			header->cmd, stub->cur_cmd);
+		return -EINVAL;
+	}
+
+	if (stub->ipacket.ibuf && stub->ipacket.ibuf_len) {
+		unsigned int newlen;
+
+		newlen = min_t(unsigned int, header->len, *stub->ipacket.ibuf_len);
+
+		*stub->ipacket.ibuf_len = newlen;
+		memcpy(stub->ipacket.ibuf, header->data, newlen);
+	}
+
+	stub->acked = true;
+	wake_up(&dev->ack_wq);
+
+	return 0;
+}
+
+static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, unsigned int obuf_len,
+			   void *ibuf, unsigned int *ibuf_len, bool wait_ack, unsigned long timeout)
+{
+	struct ljca_dev *dev = usb_get_intfdata(stub->intf);
+	u8 flags = LJCA_CMPL_FLAG;
+	struct ljca_msg *header;
+	unsigned int msg_len = sizeof(*header) + obuf_len;
+	int actual;
+	int ret;
+
+	if (msg_len > LJCA_MAX_PACKET_SIZE)
+		return -EINVAL;
+
+	if (wait_ack)
+		flags |= LJCA_ACK_FLAG;
+
+	header = kmalloc(msg_len, GFP_KERNEL);
+	if (!header)
+		return -ENOMEM;
+
+	header->type = stub->type;
+	header->cmd = cmd;
+	header->flags = flags;
+	header->len = obuf_len;
+
+	if (obuf)
+		memcpy(header->data, obuf, obuf_len);
+
+	dev_dbg(&dev->intf->dev, "send: type:%d cmd:%d flags:%d len:%d\n", header->type,
+		header->cmd, header->flags, header->len);
+
+	usb_autopm_get_interface(dev->intf);
+	if (!dev->started) {
+		kfree(header);
+		ret = -ENODEV;
+		goto error_put;
+	}
+
+	mutex_lock(&dev->mutex);
+	stub->cur_cmd = cmd;
+	stub->ipacket.ibuf = ibuf;
+	stub->ipacket.ibuf_len = ibuf_len;
+	stub->acked = false;
+	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, dev->out_ep), header, msg_len,
+			   &actual, LJCA_USB_WRITE_TIMEOUT_MS);
+	kfree(header);
+	if (ret) {
+		dev_err(&dev->intf->dev, "bridge write failed ret:%d\n", ret);
+		goto error_unlock;
+	}
+
+	if (actual != msg_len) {
+		dev_err(&dev->intf->dev, "bridge write length mismatch (%d vs %d)\n", msg_len,
+			actual);
+		ret = -EINVAL;
+		goto error_unlock;
+	}
+
+	if (wait_ack) {
+		ret = wait_event_timeout(dev->ack_wq, stub->acked, msecs_to_jiffies(timeout));
+		if (!ret) {
+			dev_err(&dev->intf->dev, "acked wait timeout\n");
+			ret = -ETIMEDOUT;
+			goto error_unlock;
+		}
+	}
+
+	stub->ipacket.ibuf = NULL;
+	stub->ipacket.ibuf_len = NULL;
+	ret = 0;
+error_unlock:
+	mutex_unlock(&dev->mutex);
+error_put:
+	usb_autopm_put_interface(dev->intf);
+
+	return ret;
+}
+
+static int ljca_transfer_internal(struct ljca *ljca, u8 cmd, const void *obuf,
+				  unsigned int obuf_len, void *ibuf, unsigned int *ibuf_len,
+				  bool wait_ack)
+{
+	struct ljca_stub *stub;
+
+	stub = ljca_stub_find(ljca->dev, ljca->type);
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	return ljca_stub_write(stub, cmd, obuf, obuf_len, ibuf, ibuf_len, wait_ack,
+			       LJCA_USB_WRITE_ACK_TIMEOUT_MS);
+}
+
+int ljca_transfer(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len, void *ibuf,
+		  unsigned int *ibuf_len)
+{
+	return ljca_transfer_internal(ljca, cmd, obuf, obuf_len, ibuf, ibuf_len, true);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_transfer, LJCA);
+
+int ljca_transfer_noack(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len)
+{
+	return ljca_transfer_internal(ljca, cmd, obuf, obuf_len, NULL, NULL, false);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_transfer_noack, LJCA);
+
+int ljca_register_event_cb(struct ljca *ljca, ljca_event_cb_t event_cb, void *context)
+{
+	struct ljca_stub *stub;
+	unsigned long flags;
+
+	stub = ljca_stub_find(ljca->dev, ljca->type);
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	spin_lock_irqsave(&stub->event_cb_lock, flags);
+	stub->event_entry.notify = event_cb;
+	stub->event_entry.context = context;
+	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ljca_register_event_cb, LJCA);
+
+void ljca_unregister_event_cb(struct ljca *ljca)
+{
+	struct ljca_stub *stub;
+	unsigned long flags;
+
+	stub = ljca_stub_find(ljca->dev, ljca->type);
+	if (IS_ERR(stub))
+		return;
+
+	spin_lock_irqsave(&stub->event_cb_lock, flags);
+	stub->event_entry.notify = NULL;
+	stub->event_entry.context = NULL;
+	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_unregister_event_cb, LJCA);
+
+static void ljca_stub_cleanup(struct ljca_dev *dev)
+{
+	struct ljca_stub *stub, *next;
+
+	list_for_each_entry_safe(stub, next, &dev->stubs_list, list) {
+		list_del_init(&stub->list);
+		kfree(stub);
+	}
+}
+
+static void ljca_read_complete(struct urb *urb)
+{
+	struct ljca_msg *header = urb->transfer_buffer;
+	struct ljca_dev *dev = urb->context;
+	int len = urb->actual_length;
+	int ret;
+
+	WARN_ON_ONCE(!dev);
+	WARN_ON_ONCE(!header);
+
+	if (urb->status) {
+		/* sync/async unlink faults aren't errors */
+		if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
+		    urb->status == -ESHUTDOWN)
+			return;
+
+		dev_err(&dev->intf->dev, "read bulk urb transfer failed: %d\n", urb->status);
+		goto resubmit;
+	}
+
+	dev_dbg(&dev->intf->dev, "receive: type:%d cmd:%d flags:%d len:%d\n", header->type,
+		header->cmd, header->flags, header->len);
+
+	if (!ljca_validate(header, len)) {
+		dev_err(&dev->intf->dev, "data not correct header->len:%d payload_len:%d\n ",
+			header->len, len);
+		goto resubmit;
+	}
+
+	ret = ljca_parse(dev, header);
+	if (ret)
+		dev_err(&dev->intf->dev, "failed to parse data: ret:%d type:%d len:%d\n", ret,
+			header->type, header->len);
+
+resubmit:
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret)
+		dev_err(&dev->intf->dev, "failed submitting read urb, error %d\n", ret);
+}
+
+static int ljca_start(struct ljca_dev *dev)
+{
+	int ret;
+
+	usb_fill_bulk_urb(dev->in_urb, dev->udev, usb_rcvbulkpipe(dev->udev, dev->in_ep), dev->ibuf,
+			  dev->ibuf_len, ljca_read_complete, dev);
+
+	ret = usb_submit_urb(dev->in_urb, GFP_KERNEL);
+	if (ret) {
+		dev_err(&dev->intf->dev, "failed submitting read urb, error %d\n", ret);
+		return ret;
+	}
+
+	dev->started = true;
+
+	return 0;
+}
+
+struct ljca_mng_priv {
+	u32 reset_id;
+};
+
+static int ljca_mng_reset_handshake(struct ljca_stub *stub)
+{
+	struct ljca_mng_priv *priv;
+	__le32 reset_id;
+	__le32 reset_id_ret = 0;
+	unsigned int ilen = sizeof(__le32);
+	int ret;
+
+	priv = ljca_priv(stub);
+	reset_id = cpu_to_le32(priv->reset_id++);
+	ret = ljca_stub_write(stub, LJCA_MNG_RESET_NOTIFY, &reset_id, sizeof(reset_id),
+			      &reset_id_ret, &ilen, true, LJCA_USB_WRITE_ACK_TIMEOUT_MS);
+	if (ret)
+		return ret;
+
+	if (ilen != sizeof(reset_id_ret) || reset_id_ret != reset_id) {
+		dev_err(&stub->intf->dev, "mng reset notify failed reset_id:%u/%u\n",
+			le32_to_cpu(reset_id_ret), le32_to_cpu(reset_id));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ljca_add_mfd_cell(struct ljca_dev *dev, struct mfd_cell *cell)
+{
+	struct mfd_cell *new_cells;
+
+	new_cells = krealloc_array(dev->cells, dev->cell_count + 1, sizeof(*new_cells), GFP_KERNEL);
+	if (!new_cells)
+		return -ENOMEM;
+
+	memcpy(&new_cells[dev->cell_count], cell, sizeof(*cell));
+	dev->cells = new_cells;
+	dev->cell_count++;
+
+	return 0;
+}
+
+static int ljca_gpio_stub_init(struct ljca_dev *dev, struct ljca_gpio_descriptor *desc)
+{
+	u32 valid_pin[LJCA_MAX_GPIO_NUM / BITS_PER_TYPE(u32)];
+	struct ljca_gpio_info *gpio_info;
+	struct mfd_cell cell = {};
+	struct ljca_stub *stub;
+	int gpio_num;
+	int i;
+
+	gpio_num = desc->pins_per_bank * desc->bank_num;
+	if (gpio_num > LJCA_MAX_GPIO_NUM)
+		return -EINVAL;
+
+	stub = ljca_stub_alloc(dev, LJCA_GPIO_STUB, sizeof(*gpio_info));
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	gpio_info = ljca_priv(stub);
+	gpio_info->ljca = &stub->ljca;
+	gpio_info->num = gpio_num;
+
+	for (i = 0; i < desc->bank_num; i++)
+		valid_pin[i] = desc->bank_desc[i].valid_pins;
+
+	bitmap_from_arr32(gpio_info->valid_pin_map, valid_pin, gpio_num);
+
+	cell.name = "ljca-gpio";
+	cell.platform_data = gpio_info;
+	cell.pdata_size = sizeof(*gpio_info);
+	cell.acpi_match = &ljca_acpi_match_gpio;
+
+	return ljca_add_mfd_cell(dev, &cell);
+}
+
+static int ljca_mng_enum_gpio(struct ljca_stub *stub)
+{
+	struct ljca_dev *dev = usb_get_intfdata(stub->intf);
+	char buf[LJCA_MAX_PAYLOAD_SIZE];
+	struct ljca_gpio_descriptor *desc;
+	unsigned int len = LJCA_MAX_PAYLOAD_SIZE;
+	int ret;
+
+	ret = ljca_stub_write(stub, LJCA_MNG_ENUM_GPIO, NULL, 0, buf, &len, true,
+			      LJCA_USB_ENUM_STUB_TIMEOUT_MS);
+	if (ret)
+		return ret;
+
+	desc = (struct ljca_gpio_descriptor *)buf;
+	if (len != struct_size(desc, bank_desc, desc->bank_num)) {
+		dev_err(&stub->intf->dev, "GPIO enumeration failed, len:%u bank_num:%u\n", len,
+			desc->bank_num);
+		return -EINVAL;
+	}
+
+	return ljca_gpio_stub_init(dev, desc);
+}
+
+static int ljca_i2c_stub_init(struct ljca_dev *dev, struct ljca_i2c_descriptor *desc)
+{
+	struct ljca_i2c_info *i2c_info;
+	struct ljca_stub *stub;
+	int ret;
+	int i;
+
+	stub = ljca_stub_alloc(dev, LJCA_I2C_STUB, size_mul(desc->num, sizeof(*i2c_info)));
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	i2c_info = ljca_priv(stub);
+
+	for (i = 0; i < desc->num; i++) {
+		struct mfd_cell cell = {};
+
+		i2c_info[i].ljca = &stub->ljca;
+		i2c_info[i].id = desc->info[i].id;
+		i2c_info[i].capacity = desc->info[i].capacity;
+		i2c_info[i].intr_pin = desc->info[i].intr_pin;
+
+		cell.name = "ljca-i2c";
+		cell.platform_data = &i2c_info[i];
+		cell.pdata_size = sizeof(i2c_info[i]);
+
+		if (i < ARRAY_SIZE(ljca_acpi_match_i2cs))
+			cell.acpi_match = &ljca_acpi_match_i2cs[i];
+
+		ret = ljca_add_mfd_cell(dev, &cell);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ljca_mng_enum_i2c(struct ljca_stub *stub)
+{
+	struct ljca_dev *dev = usb_get_intfdata(stub->intf);
+	char buf[LJCA_MAX_PAYLOAD_SIZE];
+	struct ljca_i2c_descriptor *desc;
+	unsigned int len = LJCA_MAX_PAYLOAD_SIZE;
+	int ret;
+
+	ret = ljca_stub_write(stub, LJCA_MNG_ENUM_I2C, NULL, 0, buf, &len, true,
+			      LJCA_USB_ENUM_STUB_TIMEOUT_MS);
+	if (ret) {
+		dev_err(&stub->intf->dev, "I2C enumeration failed, ret:%d len:%u\n", ret, len);
+		return ret;
+	}
+
+	desc = (struct ljca_i2c_descriptor *)buf;
+	return ljca_i2c_stub_init(dev, desc);
+}
+
+static int ljca_spi_stub_init(struct ljca_dev *dev, struct ljca_spi_descriptor *desc)
+{
+	struct ljca_spi_info *spi_info;
+	struct ljca_stub *stub;
+	int i;
+	int ret;
+
+	stub = ljca_stub_alloc(dev, LJCA_SPI_STUB, size_mul(desc->num, sizeof(*spi_info)));
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	spi_info = ljca_priv(stub);
+	for (i = 0; i < desc->num; i++) {
+		struct mfd_cell cell = {};
+
+		spi_info[i].ljca = &stub->ljca;
+		spi_info[i].id = desc->info[i].id;
+		spi_info[i].capacity = desc->info[i].capacity;
+
+		cell.name = "ljca-spi";
+		cell.platform_data = &spi_info[i];
+		cell.pdata_size = sizeof(spi_info[i]);
+		if (i < ARRAY_SIZE(ljca_acpi_match_spis))
+			cell.acpi_match = &ljca_acpi_match_spis[i];
+
+		ret = ljca_add_mfd_cell(dev, &cell);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ljca_mng_enum_spi(struct ljca_stub *stub)
+{
+	struct ljca_dev *dev = usb_get_intfdata(stub->intf);
+	char buf[LJCA_MAX_PAYLOAD_SIZE];
+	struct ljca_spi_descriptor *desc;
+	unsigned int len = LJCA_MAX_PAYLOAD_SIZE;
+	int ret;
+
+	ret = ljca_stub_write(stub, LJCA_MNG_ENUM_SPI, NULL, 0, buf, &len, true,
+			      LJCA_USB_ENUM_STUB_TIMEOUT_MS);
+	if (ret) {
+		dev_err(&stub->intf->dev, "SPI enumeration failed, ret:%d len:%d\n", ret, len);
+		return ret;
+	}
+
+	desc = (struct ljca_spi_descriptor *)buf;
+	return ljca_spi_stub_init(dev, desc);
+}
+
+static int ljca_mng_get_version(struct ljca_stub *stub, char *buf)
+{
+	struct fw_version version = {};
+	unsigned int len = sizeof(version);
+	int ret;
+
+	ret = ljca_stub_write(stub, LJCA_MNG_GET_VERSION, NULL, 0, &version, &len, true,
+			      LJCA_USB_WRITE_ACK_TIMEOUT_MS);
+	if (ret)
+		return ret;
+
+	if (len != sizeof(version)) {
+		dev_err(&stub->intf->dev, "get version failed, len:%d\n", len);
+		return -EINVAL;
+	}
+
+	return sysfs_emit(buf, "%d.%d.%d.%d\n", version.major, version.minor,
+			  le16_to_cpu(version.patch), le16_to_cpu(version.build));
+}
+
+static inline int ljca_mng_set_dfu_mode(struct ljca_stub *stub)
+{
+	return ljca_stub_write(stub, LJCA_MNG_SET_DFU_MODE, NULL, 0, NULL, NULL, true,
+			       LJCA_USB_WRITE_ACK_TIMEOUT_MS);
+}
+
+static int ljca_mng_link(struct ljca_dev *dev, struct ljca_stub *stub)
+{
+	int ret;
+
+	ret = ljca_mng_reset_handshake(stub);
+	if (ret)
+		return ret;
+
+	/* try to enum all the stubs */
+	ljca_mng_enum_gpio(stub);
+	ljca_mng_enum_i2c(stub);
+	ljca_mng_enum_spi(stub);
+
+	return 0;
+}
+
+static int ljca_mng_init(struct ljca_dev *dev)
+{
+	struct ljca_stub *stub;
+	struct ljca_mng_priv *priv;
+	int ret;
+
+	stub = ljca_stub_alloc(dev, LJCA_MNG_STUB, sizeof(*priv));
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	priv = ljca_priv(stub);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reset_id = 0;
+
+	ret = ljca_mng_link(dev, stub);
+	if (ret)
+		dev_err(&dev->intf->dev, "mng stub link failed, ret:%d\n", ret);
+
+	return ret;
+}
+
+static inline int ljca_diag_set_trace_level(struct ljca_stub *stub, u8 level)
+{
+	return ljca_stub_write(stub, LJCA_DIAG_SET_TRACE_LEVEL, &level, sizeof(level), NULL, NULL,
+			       true, LJCA_USB_WRITE_ACK_TIMEOUT_MS);
+}
+
+static int ljca_diag_init(struct ljca_dev *dev)
+{
+	struct ljca_stub *stub;
+
+	stub = ljca_stub_alloc(dev, LJCA_DIAG_STUB, 0);
+
+	return PTR_ERR_OR_ZERO(stub);
+}
+
+static void ljca_delete(struct ljca_dev *dev)
+{
+	mutex_destroy(&dev->mutex);
+	usb_free_urb(dev->in_urb);
+	usb_put_intf(dev->intf);
+	usb_put_dev(dev->udev);
+	kfree(dev->ibuf);
+	kfree(dev->cells);
+	kfree(dev);
+}
+
+static int ljca_init(struct ljca_dev *dev)
+{
+	mutex_init(&dev->mutex);
+	init_waitqueue_head(&dev->ack_wq);
+	INIT_LIST_HEAD(&dev->stubs_list);
+
+	return 0;
+}
+
+static void ljca_stop(struct ljca_dev *dev)
+{
+	dev->started = false;
+	usb_kill_urb(dev->in_urb);
+}
+
+static ssize_t ljca_enable_dfu_store(struct device *dev, struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
+	struct ljca_stub *mng_stub = ljca_stub_find(ljca_dev, LJCA_MNG_STUB);
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		ret = ljca_mng_set_dfu_mode(mng_stub);
+		if (ret)
+			return ret;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_WO(ljca_enable_dfu);
+
+static ssize_t ljca_trace_level_store(struct device *dev, struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
+	struct ljca_stub *diag_stub = ljca_stub_find(ljca_dev, LJCA_DIAG_STUB);
+	u8 level;
+	int ret;
+
+	if (kstrtou8(buf, 0, &level))
+		return -EINVAL;
+
+	ret = ljca_diag_set_trace_level(diag_stub, level);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_WO(ljca_trace_level);
+
+static ssize_t ljca_version_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
+	struct ljca_stub *stub = ljca_stub_find(ljca_dev, LJCA_MNG_STUB);
+
+	return ljca_mng_get_version(stub, buf);
+}
+static DEVICE_ATTR_RO(ljca_version);
+
+static struct attribute *ljca_attrs[] = {
+	&dev_attr_ljca_version.attr,
+	&dev_attr_ljca_enable_dfu.attr,
+	&dev_attr_ljca_trace_level.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(ljca);
+
+static int ljca_probe(struct usb_interface *intf, const struct usb_device_id *id)
+{
+	struct ljca_dev *dev;
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+	int ret;
+
+	/* allocate memory for our device state and initialize it */
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	ljca_init(dev);
+	dev->udev = usb_get_dev(interface_to_usbdev(intf));
+	dev->intf = usb_get_intf(intf);
+
+	/* set up the endpoint information use only the first bulk-in and bulk-out endpoints */
+	ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
+	if (ret) {
+		dev_err(&intf->dev, "could not find both bulk-in and bulk-out endpoints\n");
+		goto error;
+	}
+
+	dev->ibuf_len = usb_endpoint_maxp(bulk_in);
+	dev->in_ep = bulk_in->bEndpointAddress;
+	dev->ibuf = kzalloc(dev->ibuf_len, GFP_KERNEL);
+	if (!dev->ibuf) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	dev->in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!dev->in_urb) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	dev->out_ep = bulk_out->bEndpointAddress;
+	/* save our data pointer in this intf device */
+	usb_set_intfdata(intf, dev);
+	ret = ljca_start(dev);
+	if (ret) {
+		dev_err(&intf->dev, "bridge read start failed ret %d\n", ret);
+		goto error;
+	}
+
+	ret = ljca_mng_init(dev);
+	if (ret) {
+		dev_err(&intf->dev, "register mng stub failed ret %d\n", ret);
+		goto error_stop;
+	}
+
+	ret = ljca_diag_init(dev);
+	if (ret) {
+		dev_err(&intf->dev, "register diag stub failed ret %d\n", ret);
+		goto error_stop;
+	}
+
+	ret = mfd_add_hotplug_devices(&intf->dev, dev->cells, dev->cell_count);
+	if (ret) {
+		dev_err(&intf->dev, "failed to add mfd devices\n");
+		goto error_stop;
+	}
+
+	usb_enable_autosuspend(dev->udev);
+	return 0;
+error_stop:
+	ljca_stop(dev);
+error:
+	dev_err(&intf->dev, "LJCA USB device init failed\n");
+	/* this frees allocated memory */
+	ljca_stub_cleanup(dev);
+	ljca_delete(dev);
+
+	return ret;
+}
+
+static void ljca_disconnect(struct usb_interface *intf)
+{
+	struct ljca_dev *dev = usb_get_intfdata(intf);
+
+	ljca_stop(dev);
+	mfd_remove_devices(&intf->dev);
+	ljca_stub_cleanup(dev);
+	ljca_delete(dev);
+}
+
+static int ljca_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct ljca_dev *dev = usb_get_intfdata(intf);
+
+	ljca_stop(dev);
+	return 0;
+}
+
+static int ljca_resume(struct usb_interface *intf)
+{
+	struct ljca_dev *dev = usb_get_intfdata(intf);
+
+	return ljca_start(dev);
+}
+
+static const struct usb_device_id ljca_table[] = {
+	{USB_DEVICE(0x8086, 0x0b63)},
+	{}
+};
+MODULE_DEVICE_TABLE(usb, ljca_table);
+
+static struct usb_driver ljca_driver = {
+	.name = "ljca",
+	.probe = ljca_probe,
+	.disconnect = ljca_disconnect,
+	.suspend = ljca_suspend,
+	.resume = ljca_resume,
+	.id_table = ljca_table,
+	.dev_groups = ljca_groups,
+	.supports_autosuspend = 1,
+};
+module_usb_driver(ljca_driver);
+
+MODULE_AUTHOR("Ye Xiang <xiang.ye@intel.com>");
+MODULE_AUTHOR("Wang Zhifeng <zhifeng.wang@intel.com>");
+MODULE_AUTHOR("Zhang Lixu <lixu.zhang@intel.com>");
+MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/usb/ljca.h b/include/linux/usb/ljca.h
new file mode 100644
index 000000000000..9ae3ea242294
--- /dev/null
+++ b/include/linux/usb/ljca.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _LINUX_USB_LJCA_H_
+#define _LINUX_USB_LJCA_H_
+
+#include <linux/types.h>
+
+struct ljca;
+
+#define LJCA_MAX_GPIO_NUM 64
+struct ljca_gpio_info {
+	struct ljca *ljca;
+	unsigned int num;
+	DECLARE_BITMAP(valid_pin_map, LJCA_MAX_GPIO_NUM);
+};
+
+struct ljca_i2c_info {
+	struct ljca *ljca;
+	u8 id;
+	u8 capacity;
+	u8 intr_pin;
+};
+
+struct ljca_spi_info {
+	struct ljca *ljca;
+	u8 id;
+	u8 capacity;
+};
+
+/**
+ * typedef ljca_event_cb_t - event callback function signature
+ *
+ * @context: the execution context of who registered this callback
+ * @cmd: the command from device for this event
+ * @evt_data: the event data payload
+ * @len: the event data payload length
+ *
+ * The callback function is called in interrupt context and the data payload is
+ * only valid during the call. If the user needs later access of the data, it
+ * must copy it.
+ */
+typedef void (*ljca_event_cb_t)(void *context, u8 cmd, const void *evt_data, int len);
+
+/**
+ * ljca_register_event_cb - register a callback function to receive events
+ *
+ * @ljca: ljca device handle
+ * @event_cb: callback function
+ * @context: execution context of event callback
+ *
+ * Return: 0 in case of success, negative value in case of error
+ */
+int ljca_register_event_cb(struct ljca *ljca, ljca_event_cb_t event_cb, void *context);
+
+/**
+ * ljca_unregister_event_cb - unregister the callback function for an event
+ *
+ * @ljca: ljca device handle
+ */
+void ljca_unregister_event_cb(struct ljca *ljca);
+
+/**
+ * ljca_transfer - issue a LJCA command and wait for a response and the
+ * associated data
+ *
+ * @ljca: ljca device handle
+ * @cmd: the command to be sent to the device
+ * @obuf: the buffer to be sent to the device; it can be NULL if the user
+ *	doesn't need to transmit data with this command
+ * @obuf_len: the size of the buffer to be sent to the device; it should
+ *	be 0 when obuf is NULL
+ * @ibuf: any data associated with the response will be copied here; it can be
+ *	NULL if the user doesn't need the response data
+ * @ibuf_len: must be initialized to the input buffer size; it will be modified
+ *	to indicate the actual data transferred; it shouldn't be NULL as well
+ *	when ibuf isn't NULL
+ *
+ * Return: 0 for success, negative value for errors
+ */
+int ljca_transfer(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len,
+		  void *ibuf, unsigned int *ibuf_len);
+
+/**
+ * ljca_transfer_noack - issue a LJCA command without a response
+ *
+ * @ljca: ljca device handle
+ * @cmd: the command to be sent to the device
+ * @obuf: the buffer to be sent to the device; it can be NULL if the user
+ *	doesn't need to transmit data with this command
+ * @obuf_len: the size of the buffer to be sent to the device
+ *
+ * Return: 0 for success, negative value for errors
+ */
+int ljca_transfer_noack(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len);
+
+#endif
-- 
2.34.1

