Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B206C6E95
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 18:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbjCWRVU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 13:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjCWRVT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 13:21:19 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417422798D;
        Thu, 23 Mar 2023 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592076; x=1711128076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8PJQkWjd6bysvWhi0/7qCf/gddQZxemPfecDuH+awF0=;
  b=FKZfV8hsHOktrvqYnrsVmDFsLAGkD15PZFHxQGyeHXkdhrcdAC+iUfLu
   7Zp1pG5Qts8zgEYfPuL5iIitZqtJ7vA7PU8j8dp7vvK3IqigwDsbUfk39
   o+ZAbNBIs/k02OmwPLAnD7Ta+axEgCB9d2NFF77c2rTz9eTMom3uekq3y
   /mefdE0ifdG2ilAv2Qq7ppsTSdqTVni1WwqHqKDyH9oLarqgT5jtYJCDT
   JoOdskJAX9o/v8eQjuCIkQ34khjsVg/BYdqBFHlbfyKKBsRuEAz+qY89C
   pwVh21g2mabjAgh2uHJwCOvVuZP+//XQ6ABNtIJlMs7OToIYVTdsASGNf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="425840183"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="425840183"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712748282"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="712748282"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 10:21:09 -0700
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
Subject: [PATCH v6 1/6] usb: Add support for Intel LJCA device
Date:   Fri, 24 Mar 2023 01:21:08 +0800
Message-Id: <20230323172113.1231050-2-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323172113.1231050-1-xiang.ye@intel.com>
References: <20230323172113.1231050-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_FILL_THIS_FORM_SHORT autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
device named "La Jolla Cove Adapter" (LJCA).

The communication between the various LJCA module drivers and the
hardware will be muxed/demuxed by this driver. Three modules (
I2C, GPIO, and SPI) are supported currently.

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
---
 drivers/usb/misc/Kconfig  |  13 +
 drivers/usb/misc/Makefile |   1 +
 drivers/usb/misc/ljca.c   | 965 ++++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h  |  29 ++
 4 files changed, 1008 insertions(+)
 create mode 100644 drivers/usb/misc/ljca.c
 create mode 100644 include/linux/usb/ljca.h

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index a5f7652db7da..74ee39d02e69 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -273,6 +273,19 @@ config USB_LINK_LAYER_TEST
 	  Layer Test Device. Say Y only when you want to conduct USB Super Speed
 	  Link Layer Test for host controllers.
 
+config USB_LJCA
+	tristate "Intel La Jolla Cove Adapter support"
+	select AUXILIARY_BUS
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
index 000000000000..3e4f85f453dd
--- /dev/null
+++ b/drivers/usb/misc/ljca.c
@@ -0,0 +1,965 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel La Jolla Cove Adapter USB driver
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ */
+
+#include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/dev_printk.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
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
+	LJCA_ACPI_MATCH_MAX,
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
+	/* mutex to protect all fields in this structure */
+	struct mutex mutex;
+	bool started;
+	struct list_head stubs_list;
+
+	/* to wait for an ongoing write ack */
+	wait_queue_head_t ack_wq;
+
+	struct auxiliary_device auxdevs[LJCA_ACPI_MATCH_MAX];
+	int auxdev_count;
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
+	stub->intf = usb_get_intf(dev->intf);
+	stub->ljca.dev = dev;
+	stub->ljca.type = stub->type;
+	spin_lock_init(&stub->event_cb_lock);
+	list_add_tail(&stub->list, &dev->stubs_list);
+
+	return stub;
+}
+
+static void ljca_stub_destroy(struct ljca_stub *stub)
+{
+	usb_put_intf(stub->intf);
+	list_del_init(&stub->list);
+	kfree(stub);
+}
+
+static void ljca_stub_cleanup(struct ljca_dev *dev)
+{
+	struct ljca_stub *stub, *next;
+
+	list_for_each_entry_safe(stub, next, &dev->stubs_list, list) {
+		ljca_stub_destroy(stub);
+	}
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
+	ret = usb_bulk_msg(interface_to_usbdev(dev->intf),
+			   usb_sndbulkpipe(interface_to_usbdev(dev->intf), dev->out_ep), header,
+			   msg_len, &actual, LJCA_USB_WRITE_TIMEOUT_MS);
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
+	ret = 0;
+error_unlock:
+	stub->ipacket.ibuf = NULL;
+	stub->ipacket.ibuf_len = NULL;
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
+	usb_fill_bulk_urb(dev->in_urb, interface_to_usbdev(dev->intf),
+			  usb_rcvbulkpipe(interface_to_usbdev(dev->intf), dev->in_ep), dev->ibuf,
+			  dev->ibuf_len, ljca_read_complete, dev);
+
+	ret = usb_submit_urb(dev->in_urb, GFP_KERNEL);
+	if (ret) {
+		dev_err(&dev->intf->dev, "failed submitting read urb, error %d\n", ret);
+		return ret;
+	}
+
+	mutex_lock(&dev->mutex);
+	dev->started = true;
+	mutex_unlock(&dev->mutex);
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
+static void ljca_aux_release(struct device *dev) {}
+
+static int ljca_add_aux_dev(struct ljca_dev *dev, char *name, unsigned int id, unsigned int adr,
+			    void *data)
+{
+	struct auxiliary_device *auxdev;
+	struct acpi_device *parent;
+	struct acpi_device *adev = NULL;
+	int ret;
+
+	if (dev->auxdev_count >= ARRAY_SIZE(dev->auxdevs))
+		return -EINVAL;
+
+	auxdev = &dev->auxdevs[dev->auxdev_count];
+	auxdev->name = name;
+	auxdev->id = id;
+	auxdev->dev.platform_data = data;
+	auxdev->dev.parent = &dev->intf->dev;
+	auxdev->dev.release = ljca_aux_release;
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret)
+		return ret;
+
+	/* new auxiliary device bind to acpi device */
+	parent = ACPI_COMPANION(&dev->intf->dev);
+	adev = acpi_find_child_device(parent, adr, false);
+	ACPI_COMPANION_SET(&auxdev->dev, adev ?: parent);
+
+	ret = auxiliary_device_add(auxdev);
+	if (ret) {
+		dev_err(&dev->intf->dev, "failed to add auxiliary dev %s.%d\n", name, id);
+		auxiliary_device_uninit(auxdev);
+		return ret;
+	}
+
+	dev->auxdev_count++;
+
+	return 0;
+}
+
+static void ljca_cleanup_aux_dev(struct ljca_dev *dev)
+{
+	int i;
+
+	for (i = 0; i < dev->auxdev_count; i++) {
+		auxiliary_device_delete(&dev->auxdevs[i]);
+		auxiliary_device_uninit(&dev->auxdevs[i]);
+	}
+}
+
+static int ljca_gpio_stub_init(struct ljca_dev *dev, struct ljca_gpio_descriptor *desc)
+{
+	u32 valid_pin[LJCA_MAX_GPIO_NUM / BITS_PER_TYPE(u32)];
+	struct ljca_gpio_info *gpio_info;
+	struct ljca_stub *stub;
+	int gpio_num;
+	int i;
+	int ret;
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
+	ret = ljca_add_aux_dev(dev, "ljca-gpio", 0, LJCA_ACPI_MATCH_GPIO, gpio_info);
+	if (ret)
+		ljca_stub_destroy(stub);
+
+	return ret;
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
+		i2c_info[i].ljca = &stub->ljca;
+		i2c_info[i].id = desc->info[i].id;
+		i2c_info[i].capacity = desc->info[i].capacity;
+		i2c_info[i].intr_pin = desc->info[i].intr_pin;
+
+		ret = ljca_add_aux_dev(dev, "ljca-i2c", i, LJCA_ACPI_MATCH_I2C1 + i,
+				       &i2c_info[i]);
+		if (ret) {
+			ljca_stub_destroy(stub);
+			return ret;
+		}
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
+		spi_info[i].ljca = &stub->ljca;
+		spi_info[i].id = desc->info[i].id;
+		spi_info[i].capacity = desc->info[i].capacity;
+
+		ret = ljca_add_aux_dev(dev, "ljca-spi", i, LJCA_ACPI_MATCH_SPI1 + i,
+				       &spi_info[i]);
+		if (ret) {
+			ljca_stub_destroy(stub);
+			return ret;
+		}
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
+	ret = ljca_mng_enum_gpio(stub);
+	if (ret)
+		dev_warn(&dev->intf->dev, "GPIO function does not support yet\n");
+
+	ret = ljca_mng_enum_i2c(stub);
+	if (ret)
+		dev_warn(&dev->intf->dev, "I2C function does not support yet\n");
+
+	ret = ljca_mng_enum_spi(stub);
+	if (ret)
+		dev_warn(&dev->intf->dev, "SPI function does not support yet\n");
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
+	mutex_lock(&dev->mutex);
+	dev->started = false;
+	mutex_unlock(&dev->mutex);
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
+	dev = devm_kzalloc(&intf->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	ljca_init(dev);
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
+	dev->ibuf = devm_kzalloc(&intf->dev, dev->ibuf_len, GFP_KERNEL);
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
+	usb_enable_autosuspend(interface_to_usbdev(dev->intf));
+	return 0;
+error_stop:
+	ljca_stop(dev);
+	ljca_cleanup_aux_dev(dev);
+	ljca_stub_cleanup(dev);
+error:
+	dev_err(&intf->dev, "LJCA USB device init failed\n");
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
+	ljca_cleanup_aux_dev(dev);
+	ljca_stub_cleanup(dev);
+	ljca_delete(dev);
+}
+
+static int ljca_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct ljca_dev *dev = usb_get_intfdata(intf);
+
+	ljca_stop(dev);
+
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
index 000000000000..057f18c5b17a
--- /dev/null
+++ b/include/linux/usb/ljca.h
@@ -0,0 +1,29 @@
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
+#endif
-- 
2.34.1

