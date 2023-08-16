Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B09C77ED26
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 00:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346937AbjHPWcZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 18:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346951AbjHPWcY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 18:32:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9519125;
        Wed, 16 Aug 2023 15:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692225141; x=1723761141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XsNC4sO9s6VUUF9K9CvmvdqPBf6MqmfhUlSVzFgbFFQ=;
  b=UNP5OjQhi1kwL5q2wiBBoGeQYJLxwZ3Q6dBf2OQR5DA3KUg/Er3pOXH9
   OjcR8x8R0hgHcGvczKLMyfHjUjJXpNbpezRW8UYcC6i8HQS2cipCW9Q8v
   fPQkEpsUNwINMBt+eDo9w5lqYuMVf1HiewOgGWyglhTD2lR2YjaimXPxc
   DwXCfd72d+iTvwq6pDv4SkvGG1v/TJCKCLSL4tUvciIbKyE+ixwl3EjX5
   ZtHLpu3zf9i5aB7/8VXDv2VirWgBUj1xx7RtDGAnI+OV1cjn4cTlFZVMm
   AIBg7nelxyydC689MlQqX2JLBpvAFXxC6lp8A6HX1yWKJHbG+RKGXfrYF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376391946"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="376391946"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 15:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877974842"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2023 15:32:19 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, srinivas.pandruvada@intel.com,
        linux-drivers-review@eclists.intel.com
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v9 1/4] usb: Add support for Intel LJCA device
Date:   Thu, 17 Aug 2023 06:31:48 +0800
Message-Id: <1692225111-19216-2-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1692225111-19216-1-git-send-email-wentong.wu@intel.com>
References: <1692225111-19216-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device
named "La Jolla Cove Adapter" (LJCA).

The communication between the various LJCA module drivers and the
hardware will be muxed/demuxed by this driver. Three modules (
I2C, GPIO, and SPI) are supported currently.

Each sub-module of LJCA device is identified by type field within
the LJCA message header.

The sub-modules of LJCA can use ljca_transfer() to issue a transfer
between host and hardware. And ljca_register_event_cb is exported
to LJCA sub-module drivers for hardware event subscription.

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

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/misc/Kconfig    |  14 +
 drivers/usb/misc/Makefile   |   1 +
 drivers/usb/misc/usb-ljca.c | 817 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h    | 113 ++++++
 4 files changed, 945 insertions(+)
 create mode 100644 drivers/usb/misc/usb-ljca.c
 create mode 100644 include/linux/usb/ljca.h

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 99b15b7..999193e 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -165,6 +165,20 @@ config APPLE_MFI_FASTCHARGE
 
 	  It is safe to say M here.
 
+config USB_LJCA
+	tristate "Intel La Jolla Cove Adapter support"
+	select AUXILIARY_BUS
+	depends on USB
+	depends on ACPI || COMPILE_TEST
+	help
+	  This adds support for Intel La Jolla Cove USB-I2C/SPI/GPIO
+	  Master Adapter (LJCA). Additional drivers such as I2C_LJCA,
+	  GPIO_LJCA and SPI_LJCA must be enabled in order to use the
+	  functionality of the device.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called usb-ljca.
+
 source "drivers/usb/misc/sisusbvga/Kconfig"
 
 config USB_LD
diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
index 1992cc2..0bc732bc 100644
--- a/drivers/usb/misc/Makefile
+++ b/drivers/usb/misc/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_USB_EMI26)			+= emi26.o
 obj-$(CONFIG_USB_EMI62)			+= emi62.o
 obj-$(CONFIG_USB_EZUSB_FX2)		+= ezusb.o
 obj-$(CONFIG_APPLE_MFI_FASTCHARGE)	+= apple-mfi-fastcharge.o
+obj-$(CONFIG_USB_LJCA)			+= usb-ljca.o
 obj-$(CONFIG_USB_IDMOUSE)		+= idmouse.o
 obj-$(CONFIG_USB_IOWARRIOR)		+= iowarrior.o
 obj-$(CONFIG_USB_ISIGHTFW)		+= isight_firmware.o
diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
new file mode 100644
index 0000000..8e024a3
--- /dev/null
+++ b/drivers/usb/misc/usb-ljca.c
@@ -0,0 +1,817 @@
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
+/* command flags */
+#define LJCA_ACK_FLAG			BIT(0)
+#define LJCA_RESP_FLAG			BIT(1)
+#define LJCA_CMPL_FLAG			BIT(2)
+
+#define LJCA_MAX_PACKET_SIZE		64u
+#define LJCA_MAX_PAYLOAD_SIZE		\
+		(LJCA_MAX_PACKET_SIZE - sizeof(struct ljca_msg))
+
+#define LJCA_WRITE_TIMEOUT_MS		200
+#define LJCA_WRITE_ACK_TIMEOUT_MS	500
+#define LJCA_ENUM_CLIENT_TIMEOUT_MS	20
+
+/* ljca client type */
+enum ljca_client_type {
+	LJCA_CLIENT_MNG = 1,
+	LJCA_CLIENT_GPIO = 3,
+	LJCA_CLIENT_I2C = 4,
+	LJCA_CLIENT_SPI = 5,
+};
+
+/* MNG client commands */
+enum ljca_mng_cmd {
+	LJCA_MNG_RESET = 2,
+	LJCA_MNG_ENUM_GPIO = 4,
+	LJCA_MNG_ENUM_I2C = 5,
+	LJCA_MNG_ENUM_SPI = 8,
+};
+
+/* ljca client acpi _ADR */
+enum ljca_client_acpi_adr {
+	LJCA_GPIO_ACPI_ADR,
+	LJCA_I2C1_ACPI_ADR,
+	LJCA_I2C2_ACPI_ADR,
+	LJCA_SPI1_ACPI_ADR,
+	LJCA_SPI2_ACPI_ADR,
+	LJCA_CLIENT_ACPI_ADR_MAX,
+};
+
+/* ljca cmd message structure */
+struct ljca_msg {
+	u8 type;
+	u8 cmd;
+	u8 flags;
+	u8 len;
+	u8 data[];
+} __packed;
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
+struct ljca_adapter {
+	struct usb_interface *intf;
+	struct usb_device *usb_dev;
+	struct device *dev;
+
+	unsigned int rx_pipe;
+	unsigned int tx_pipe;
+
+	/* urb for recv */
+	struct urb *rx_urb;
+	/* buffer for recv */
+	void *rx_buf;
+	unsigned int rx_len;
+
+	/* external buffer for recv */
+	void *ex_buf;
+	unsigned int ex_buf_len;
+	/* actual data length copied to external buffer */
+	unsigned int actual_length;
+
+	/* buffer for send */
+	void *tx_buf;
+	unsigned int tx_buf_len;
+
+	/* lock to protect tx_buf and ex_buf */
+	spinlock_t lock;
+
+	struct completion cmd_completion;
+
+	/* mutex to protect command download */
+	struct mutex mutex;
+
+	/* client device list */
+	struct list_head client_list;
+
+	/* used to reset firmware */
+	u32 reset_id;
+};
+
+static void ljca_handle_event(struct ljca_adapter *adap,
+			      struct ljca_msg *header)
+{
+	struct ljca_client *client;
+
+	list_for_each_entry(client, &adap->client_list, link) {
+		/*
+		 * FIXME: currently only GPIO register event callback.
+		 * firmware message structure should include id when
+		 * multiple same type clients register event callback.
+		 */
+		if (client->type == header->type) {
+			unsigned long flags;
+
+			spin_lock_irqsave(&client->event_cb_lock, flags);
+			client->event_cb(client->context, header->cmd,
+					 header->data, header->len);
+			spin_unlock_irqrestore(&client->event_cb_lock, flags);
+
+			break;
+		}
+	}
+}
+
+/* process command ack */
+static void ljca_handle_cmd_ack(struct ljca_adapter *adap,
+				struct ljca_msg *header)
+{
+	struct ljca_msg *tx_header = adap->tx_buf;
+	unsigned int actual_len = 0;
+	unsigned int ibuf_len;
+	unsigned long flags;
+	void *ibuf;
+
+	spin_lock_irqsave(&adap->lock, flags);
+
+	if (tx_header->type != header->type || tx_header->cmd != header->cmd) {
+		spin_unlock_irqrestore(&adap->lock, flags);
+
+		return;
+	}
+
+	ibuf_len = adap->ex_buf_len;
+	ibuf = adap->ex_buf;
+
+	if (ibuf && ibuf_len) {
+		actual_len = min_t(unsigned int, header->len, ibuf_len);
+
+		/* copy received data to external buffer */
+		memcpy(ibuf, header->data, actual_len);
+	}
+	/* update copied data length */
+	adap->actual_length = actual_len;
+
+	spin_unlock_irqrestore(&adap->lock, flags);
+
+	complete(&adap->cmd_completion);
+}
+
+static void ljca_recv(struct urb *urb)
+{
+	struct ljca_msg *header = urb->transfer_buffer;
+	struct ljca_adapter *adap = urb->context;
+	int ret;
+
+	if (urb->status) {
+		/* sync/async unlink faults aren't errors */
+		if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
+		    urb->status == -ESHUTDOWN)
+			return;
+
+		dev_err(adap->dev, "recv urb error: %d\n", urb->status);
+		goto resubmit;
+	}
+
+	if (header->len + sizeof(*header) != urb->actual_length)
+		goto resubmit;
+
+	if (header->flags & LJCA_ACK_FLAG)
+		ljca_handle_cmd_ack(adap, header);
+	else
+		ljca_handle_event(adap, header);
+
+resubmit:
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret)
+		dev_err(adap->dev, "resubmit recv urb error %d\n", ret);
+}
+
+static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
+		     const void *obuf, unsigned int obuf_len, void *ibuf,
+		     unsigned int ibuf_len, bool ack, unsigned long timeout)
+{
+	unsigned int msg_len = sizeof(struct ljca_msg) + obuf_len;
+	struct ljca_msg *header = adap->tx_buf;
+	unsigned long flags;
+	unsigned int actual;
+	int ret = 0;
+
+	if (msg_len > adap->tx_buf_len)
+		return -EINVAL;
+
+	mutex_lock(&adap->mutex);
+
+	spin_lock_irqsave(&adap->lock, flags);
+
+	header->type = type;
+	header->cmd = cmd;
+	header->len = obuf_len;
+	if (obuf)
+		memcpy(header->data, obuf, obuf_len);
+
+	header->flags = LJCA_CMPL_FLAG | (ack ? LJCA_ACK_FLAG : 0);
+
+	adap->ex_buf = ibuf;
+	adap->ex_buf_len = ibuf_len;
+	adap->actual_length = 0;
+
+	spin_unlock_irqrestore(&adap->lock, flags);
+
+	reinit_completion(&adap->cmd_completion);
+
+	usb_autopm_get_interface(adap->intf);
+
+	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
+			   msg_len, &actual, LJCA_WRITE_TIMEOUT_MS);
+	if (!ret && ack) {
+		ret = wait_for_completion_timeout(&adap->cmd_completion,
+						  timeout);
+		if (ret < 0) {
+			goto out;
+		} if (!ret) {
+			ret = -ETIMEDOUT;
+			goto out;
+		}
+	}
+	ret = adap->actual_length;
+
+out:
+	spin_lock_irqsave(&adap->lock, flags);
+	adap->ex_buf = NULL;
+	adap->ex_buf_len = 0;
+
+	memset(header, 0, sizeof(*header));
+	spin_unlock_irqrestore(&adap->lock, flags);
+
+	usb_autopm_put_interface(adap->intf);
+
+	mutex_unlock(&adap->mutex);
+
+	return ret;
+}
+
+int ljca_transfer(struct ljca_client *client, u8 cmd, const void *obuf,
+		  unsigned int obuf_len, void *ibuf, unsigned int ibuf_len)
+{
+	return ljca_send(client->adapter, client->type, cmd,
+			 obuf, obuf_len, ibuf, ibuf_len, true,
+			 LJCA_WRITE_ACK_TIMEOUT_MS);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_transfer, LJCA);
+
+int ljca_transfer_noack(struct ljca_client *client, u8 cmd, const void *obuf,
+			unsigned int obuf_len)
+{
+	return ljca_send(client->adapter, client->type, cmd, obuf,
+			 obuf_len, NULL, 0, false, LJCA_WRITE_ACK_TIMEOUT_MS);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_transfer_noack, LJCA);
+
+int ljca_register_event_cb(struct ljca_client *client, ljca_event_cb_t event_cb,
+			   void *context)
+{
+	unsigned long flags;
+
+	if (!event_cb)
+		return -EINVAL;
+
+	spin_lock_irqsave(&client->event_cb_lock, flags);
+
+	if (client->event_cb) {
+		spin_unlock_irqrestore(&client->event_cb_lock, flags);
+		return -EALREADY;
+	}
+
+	client->event_cb = event_cb;
+	client->context = context;
+
+	spin_unlock_irqrestore(&client->event_cb_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ljca_register_event_cb, LJCA);
+
+void ljca_unregister_event_cb(struct ljca_client *client)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&client->event_cb_lock, flags);
+
+	client->event_cb = NULL;
+	client->context = NULL;
+
+	spin_unlock_irqrestore(&client->event_cb_lock, flags);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_unregister_event_cb, LJCA);
+
+#ifdef CONFIG_ACPI
+struct match_ids_walk_data {
+	const struct acpi_device_id *ids;
+	struct acpi_device *adev;
+};
+
+static const struct acpi_device_id gpio_hids[] = {
+	{ "INTC1074" },
+	{ "INTC1096" },
+	{ "INTC100B" },
+	{ "INTC10D1" },
+	{},
+};
+
+static const struct acpi_device_id i2c_hids[] = {
+	{ "INTC1075" },
+	{ "INTC1097" },
+	{ "INTC100C" },
+	{ "INTC10D2" },
+	{},
+};
+
+static const struct acpi_device_id spi_hids[] = {
+	{ "INTC1091" },
+	{ "INTC1098" },
+	{ "INTC100D" },
+	{ "INTC10D3" },
+	{},
+};
+
+static int match_device_ids(struct acpi_device *adev, void *data)
+{
+	struct match_ids_walk_data *wd = data;
+
+	if (!acpi_match_device_ids(adev, wd->ids)) {
+		wd->adev = adev;
+		return 1;
+	}
+
+	return 0;
+}
+
+/* bind auxiliary device to acpi device */
+static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
+				  struct auxiliary_device *auxdev,
+				  u64 adr)
+{
+	struct match_ids_walk_data wd = { 0 };
+	struct acpi_device *parent, *adev;
+	struct device *dev = adap->dev;
+
+	parent = ACPI_COMPANION(dev);
+	if (!parent)
+		return;
+
+	/*
+	 * get auxdev ACPI handle from the ACPI device directly
+	 * under the parent that matches _ADR.
+	 */
+	adev = acpi_find_child_device(parent, adr, false);
+	if (adev) {
+		ACPI_COMPANION_SET(&auxdev->dev, adev);
+		return;
+	}
+
+	/*
+	 * _ADR is a grey area in the ACPI specification, some
+	 * platforms use _HID to distinguish children devices.
+	 */
+	switch (adr) {
+	case LJCA_GPIO_ACPI_ADR:
+		wd.ids = gpio_hids;
+		break;
+	case LJCA_I2C1_ACPI_ADR:
+	case LJCA_I2C2_ACPI_ADR:
+		wd.ids = i2c_hids;
+		break;
+	case LJCA_SPI1_ACPI_ADR:
+	case LJCA_SPI2_ACPI_ADR:
+		wd.ids = spi_hids;
+		break;
+	default:
+		dev_warn(dev, "unsupported _ADR\n");
+		return;
+	}
+
+	acpi_dev_for_each_child(parent, match_device_ids, &wd);
+	if (wd.adev) {
+		ACPI_COMPANION_SET(&auxdev->dev, wd.adev);
+		return;
+	}
+
+	parent = ACPI_COMPANION(dev->parent->parent);
+	if (!parent)
+		return;
+
+	acpi_dev_for_each_child(parent, match_device_ids, &wd);
+	if (wd.adev)
+		ACPI_COMPANION_SET(&auxdev->dev, wd.adev);
+}
+#else
+static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
+				  struct auxiliary_device *auxdev,
+				  u64 adr)
+{
+}
+#endif
+
+static void ljca_auxdev_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	kfree(auxdev->dev.platform_data);
+}
+
+static int ljca_new_client_device(struct ljca_adapter *adap, u8 type, u8 id,
+				  char *name, void *data, u64 adr)
+{
+	struct auxiliary_device *auxdev;
+	struct ljca_client *client;
+	int ret;
+
+	client = kzalloc(sizeof *client, GFP_KERNEL);
+	if (!client)
+		return -ENOMEM;
+
+	client->type = type;
+	client->id = id;
+	client->adapter = adap;
+	spin_lock_init(&client->event_cb_lock);
+
+	auxdev = &client->auxdev;
+	auxdev->name = name;
+	auxdev->id = id;
+
+	auxdev->dev.parent = adap->dev;
+	auxdev->dev.platform_data = data;
+	auxdev->dev.release = ljca_auxdev_release;
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret)
+		goto err_free;
+
+	ljca_auxdev_acpi_bind(adap, auxdev, adr);
+
+	ret = auxiliary_device_add(auxdev);
+	if (ret)
+		goto err_uninit;
+
+	list_add_tail(&client->link, &adap->client_list);
+
+	return 0;
+
+err_uninit:
+	auxiliary_device_uninit(auxdev);
+
+err_free:
+	kfree(client);
+
+	return ret;
+}
+
+static int ljca_enumerate_gpio(struct ljca_adapter *adap)
+{
+	u32 valid_pin[LJCA_MAX_GPIO_NUM / BITS_PER_TYPE(u32)];
+	struct ljca_gpio_descriptor *desc;
+	struct ljca_gpio_info *gpio_info;
+	u8 buf[LJCA_MAX_PAYLOAD_SIZE];
+	int ret, gpio_num;
+	unsigned int i;
+
+	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_GPIO, NULL, 0, buf,
+			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
+	if (ret < 0)
+		return ret;
+
+	/* check firmware response */
+	desc = (struct ljca_gpio_descriptor *)buf;
+	if (ret != struct_size(desc, bank_desc, desc->bank_num))
+		return -EINVAL;
+
+	gpio_num = desc->pins_per_bank * desc->bank_num;
+	if (gpio_num > LJCA_MAX_GPIO_NUM)
+		return -EINVAL;
+
+	/* construct platform data */
+	gpio_info = kzalloc(sizeof *gpio_info, GFP_KERNEL);
+	if (!gpio_info)
+		return -ENOMEM;
+	gpio_info->num = gpio_num;
+
+	for (i = 0; i < desc->bank_num; i++)
+		valid_pin[i] = desc->bank_desc[i].valid_pins;
+	bitmap_from_arr32(gpio_info->valid_pin_map, valid_pin, gpio_num);
+
+	ret = ljca_new_client_device(adap, LJCA_CLIENT_GPIO, 0, "ljca-gpio",
+				     gpio_info, LJCA_GPIO_ACPI_ADR);
+	if (ret)
+		kfree(gpio_info);
+
+	return ret;
+}
+
+static int ljca_enumerate_i2c(struct ljca_adapter *adap)
+{
+	struct ljca_i2c_descriptor *desc;
+	struct ljca_i2c_info *i2c_info;
+	u8 buf[LJCA_MAX_PAYLOAD_SIZE];
+	unsigned int i;
+	int ret;
+
+	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_I2C, NULL, 0, buf,
+			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
+	if (ret < 0)
+		return ret;
+
+	/* check firmware response */
+	desc = (struct ljca_i2c_descriptor *)buf;
+	if (ret != struct_size(desc, info, desc->num))
+		return -EINVAL;
+
+	for (i = 0; i < desc->num; i++) {
+		/* construct platform data */
+		i2c_info = kzalloc(sizeof *i2c_info, GFP_KERNEL);
+		if (!i2c_info)
+			return -ENOMEM;
+
+		i2c_info->id = desc->info[i].id;
+		i2c_info->capacity = desc->info[i].capacity;
+		i2c_info->intr_pin = desc->info[i].intr_pin;
+
+		ret = ljca_new_client_device(adap, LJCA_CLIENT_I2C, i,
+					     "ljca-i2c", i2c_info,
+					     LJCA_I2C1_ACPI_ADR + i);
+		if (ret) {
+			kfree(i2c_info);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ljca_enumerate_spi(struct ljca_adapter *adap)
+{
+	struct ljca_spi_descriptor *desc;
+	struct ljca_spi_info *spi_info;
+	u8 buf[LJCA_MAX_PAYLOAD_SIZE];
+	unsigned int i;
+	int ret;
+
+	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0, buf,
+			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
+	if (ret < 0)
+		return ret;
+
+	desc = (struct ljca_spi_descriptor *)buf;
+	for (i = 0; i < desc->num; i++) {
+		/* construct platform data */
+		spi_info = kzalloc(sizeof *spi_info, GFP_KERNEL);
+		if (!spi_info)
+			return -ENOMEM;
+
+		spi_info->id = desc->info[i].id;
+		spi_info->capacity = desc->info[i].capacity;
+
+		ret = ljca_new_client_device(adap, LJCA_CLIENT_SPI, i,
+					     "ljca-spi", spi_info,
+					     LJCA_SPI1_ACPI_ADR + i);
+		if (ret) {
+			kfree(spi_info);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ljca_reset_handshake(struct ljca_adapter *adap)
+{
+	__le32 reset_id = cpu_to_le32(adap->reset_id);
+	__le32 reset_id_ret = 0;
+	int ret;
+
+	adap->reset_id += 1;
+
+	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_RESET, &reset_id,
+			sizeof(__le32), &reset_id_ret, sizeof(__le32), true,
+			LJCA_WRITE_ACK_TIMEOUT_MS);
+	if (ret < 0)
+		return ret;
+
+	if (reset_id_ret != reset_id)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ljca_enumerate_clients(struct ljca_adapter *adap)
+{
+	int ret;
+
+	ret = ljca_reset_handshake(adap);
+	if (ret)
+		return ret;
+
+	ret = ljca_enumerate_gpio(adap);
+	if (ret)
+		dev_warn(adap->dev, "enumerate GPIO error\n");
+
+	ret = ljca_enumerate_i2c(adap);
+	if (ret)
+		dev_warn(adap->dev, "enumerate I2C error\n");
+
+	ret = ljca_enumerate_spi(adap);
+	if (ret)
+		dev_warn(adap->dev, "enumerate SPI error\n");
+
+	return 0;
+}
+
+static int ljca_probe(struct usb_interface *interface,
+		      const struct usb_device_id *id)
+{
+	struct usb_device *usb_dev = interface_to_usbdev(interface);
+	struct usb_host_interface *alt = interface->cur_altsetting;
+	struct usb_endpoint_descriptor *ep_in, *ep_out;
+	struct device *dev = &interface->dev;
+	struct ljca_adapter *adap;
+	int ret;
+
+	adap = devm_kzalloc(dev, sizeof(*adap), GFP_KERNEL);
+	if (!adap)
+		return -ENOMEM;
+
+	/* separate tx buffer allocation for alignment */
+	adap->tx_buf = devm_kzalloc(dev, LJCA_MAX_PACKET_SIZE, GFP_KERNEL);
+	if (!adap->tx_buf)
+		return -ENOMEM;
+	adap->tx_buf_len = LJCA_MAX_PACKET_SIZE;
+
+	mutex_init(&adap->mutex);
+	spin_lock_init(&adap->lock);
+	init_completion(&adap->cmd_completion);
+	INIT_LIST_HEAD(&adap->client_list);
+
+	adap->intf = usb_get_intf(interface);
+	adap->usb_dev = usb_dev;
+	adap->dev = dev;
+
+	/*
+	 * find the first bulk in and out endpoints.
+	 * ignore any others.
+	 */
+	ret = usb_find_common_endpoints(alt, &ep_in, &ep_out, NULL, NULL);
+	if (ret) {
+		dev_err(dev, "bulk endpoints not found\n");
+		goto err;
+	}
+	adap->rx_pipe = usb_rcvbulkpipe(usb_dev, usb_endpoint_num(ep_in));
+	adap->tx_pipe = usb_sndbulkpipe(usb_dev, usb_endpoint_num(ep_out));
+
+	/* setup rx buffer */
+	adap->rx_len = usb_endpoint_maxp(ep_in);
+	adap->rx_buf = devm_kzalloc(dev, adap->rx_len, GFP_KERNEL);
+	if (!adap->rx_buf) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	/* alloc rx urb */
+	adap->rx_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!adap->rx_urb) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	usb_fill_bulk_urb(adap->rx_urb, usb_dev, adap->rx_pipe,
+			  adap->rx_buf, adap->rx_len, ljca_recv, adap);
+
+	usb_set_intfdata(interface, adap);
+
+	/* submit rx urb before enumerate clients */
+	ret = usb_submit_urb(adap->rx_urb, GFP_KERNEL);
+	if (ret) {
+		dev_err(dev, "submit rx urb failed: %d\n", ret);
+		goto err_free;
+	}
+
+	ret = ljca_enumerate_clients(adap);
+	if (ret)
+		goto err_kill;
+
+	usb_enable_autosuspend(usb_dev);
+
+	return 0;
+
+err_kill:
+	usb_kill_urb(adap->rx_urb);
+
+err_free:
+	usb_free_urb(adap->rx_urb);
+
+err:
+	usb_put_intf(adap->intf);
+	mutex_destroy(&adap->mutex);
+
+	return ret;
+}
+
+static void ljca_disconnect(struct usb_interface *interface)
+{
+	struct ljca_adapter *adap = usb_get_intfdata(interface);
+	struct ljca_client *client, *next;
+
+	usb_kill_urb(adap->rx_urb);
+
+	list_for_each_entry_safe(client, next, &adap->client_list, link) {
+		auxiliary_device_delete(&client->auxdev);
+		auxiliary_device_uninit(&client->auxdev);
+
+		list_del_init(&client->link);
+		kfree(client);
+	}
+
+	usb_free_urb(adap->rx_urb);
+
+	usb_put_intf(adap->intf);
+
+	mutex_destroy(&adap->mutex);
+}
+
+static int ljca_suspend(struct usb_interface *interface, pm_message_t message)
+{
+	struct ljca_adapter *adap = usb_get_intfdata(interface);
+
+	usb_kill_urb(adap->rx_urb);
+
+	return 0;
+}
+
+static int ljca_resume(struct usb_interface *interface)
+{
+	struct ljca_adapter *adap = usb_get_intfdata(interface);
+
+	return usb_submit_urb(adap->rx_urb, GFP_KERNEL);
+}
+
+static const struct usb_device_id ljca_table[] = {
+	{ USB_DEVICE(0x8086, 0x0b63) },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(usb, ljca_table);
+
+static struct usb_driver ljca_driver = {
+	.name = "ljca",
+	.id_table = ljca_table,
+	.probe = ljca_probe,
+	.disconnect = ljca_disconnect,
+	.suspend = ljca_suspend,
+	.resume = ljca_resume,
+	.supports_autosuspend = 1,
+};
+module_usb_driver(ljca_driver);
+
+MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
+MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
+MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/usb/ljca.h b/include/linux/usb/ljca.h
new file mode 100644
index 0000000..6eadd43
--- /dev/null
+++ b/include/linux/usb/ljca.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, Intel Corporation. All rights reserved.
+ */
+#ifndef _LINUX_USB_LJCA_H_
+#define _LINUX_USB_LJCA_H_
+
+#include <linux/auxiliary_bus.h>
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define LJCA_MAX_GPIO_NUM 64
+
+#define auxiliary_dev_to_ljca_client(auxiliary_dev)			\
+		container_of(auxiliary_dev, struct ljca_client, auxdev)
+
+struct ljca_adapter;
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
+struct ljca_client {
+	u8 type;
+	u8 id;
+	struct list_head link;
+	struct auxiliary_device auxdev;
+	struct ljca_adapter *adapter;
+
+	void *context;
+	ljca_event_cb_t event_cb;
+	/* lock to protect event_cb */
+	spinlock_t event_cb_lock;
+};
+
+struct ljca_gpio_info {
+	unsigned int num;
+	DECLARE_BITMAP(valid_pin_map, LJCA_MAX_GPIO_NUM);
+};
+
+struct ljca_i2c_info {
+	u8 id;
+	u8 capacity;
+	u8 intr_pin;
+};
+
+struct ljca_spi_info {
+	u8 id;
+	u8 capacity;
+};
+
+/**
+ * ljca_register_event_cb - register a callback function to receive events
+ *
+ * @client: ljca client device
+ * @event_cb: callback function
+ * @context: execution context of event callback
+ *
+ * Return: 0 in case of success, negative value in case of error
+ */
+int ljca_register_event_cb(struct ljca_client *client, ljca_event_cb_t event_cb, void *context);
+
+/**
+ * ljca_unregister_event_cb - unregister the callback function for an event
+ *
+ * @client: ljca client device
+ */
+void ljca_unregister_event_cb(struct ljca_client *client);
+
+/**
+ * ljca_transfer - issue a LJCA command and wait for a response
+ *
+ * @client: ljca client device
+ * @cmd: the command to be sent to the device
+ * @obuf: the buffer to be sent to the device; it can be NULL if the user
+ *	doesn't need to transmit data with this command
+ * @obuf_len: the size of the buffer to be sent to the device; it should
+ *	be 0 when obuf is NULL
+ * @ibuf: any data associated with the response will be copied here; it can be
+ *	NULL if the user doesn't need the response data
+ * @ibuf_len: must be initialized to the input buffer size
+ *
+ * Return: the actual length data transferred for success, negative value for errors
+ */
+int ljca_transfer(struct ljca_client *client, u8 cmd, const void *obuf,
+		  unsigned int obuf_len, void *ibuf, unsigned int ibuf_len);
+
+/**
+ * ljca_transfer_noack - issue a LJCA command without a response
+ *
+ * @client: ljca client device
+ * @cmd: the command to be sent to the device
+ * @obuf: the buffer to be sent to the device; it can be NULL if the user
+ *	doesn't need to transmit data with this command
+ * @obuf_len: the size of the buffer to be sent to the device
+ *
+ * Return: 0 for success, negative value for errors
+ */
+int ljca_transfer_noack(struct ljca_client *client, u8 cmd, const void *obuf,
+			unsigned int obuf_len);
+
+#endif
-- 
2.7.4

