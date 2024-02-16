Return-Path: <linux-i2c+bounces-1839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7396985803F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 16:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39B62B21109
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 15:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC5D12F393;
	Fri, 16 Feb 2024 15:10:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.someserver.de (mail.someserver.de [116.202.193.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197C812EBE7;
	Fri, 16 Feb 2024 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.193.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708096226; cv=none; b=RDw8h/5bLGj8X22ijmGGmajLxOPZwj2VFx2jxFgDVCrf2DyQA9rbho+aISYmRM+kzTSx+LSRULzpat92z9vo/POpKT7zxyia+FxFcexSKWV312Ylt05tfwIBOQPTT0qnAhSxogAwItOAS2C0JMS75vWw/v/VeXKxSf9CD3Qv0MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708096226; c=relaxed/simple;
	bh=cby+aF/vuGdlAeSp1DITP+a6iqT5t4vGYIYxLU3BIuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W9MmRVS+he5q+d9raOaHNpnHG41JmAnmoSGNKFfe1bMrllQXXGztk2GfwB0tnpBSf1ts4ffe1ufn/fJ+J+0bnDmV6Ay6KkIxOktifY7UF/Nv/YMz4lVgdIycT8a0wNVZi/9jFYa9lY0YAH35lfOyQnPLPINBhjsSSrWUoWpsCB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christina-quast.de; spf=pass smtp.mailfrom=christina-quast.de; arc=none smtp.client-ip=116.202.193.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christina-quast.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=christina-quast.de
Received: from localhost (112.218.164.109.static.wline.lns.sme.cust.swisscom.ch [109.164.218.112])
	by mail.someserver.de (Postfix) with ESMTPSA id 33DE5A219A;
	Fri, 16 Feb 2024 16:04:00 +0100 (CET)
From: Christina Quast <contact@christina-quast.de>
Date: Fri, 16 Feb 2024 16:03:53 +0100
Subject: [PATCH v5] hid-ft260: Add serial driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-ft260_review5-v5-1-36db44673ac7@christina-quast.de>
X-B4-Tracking: v=1; b=H4sIAFh5z2UC/zXMywrCMBCF4Vcps3ZKLk3auPI9RCSkUzsLU03iB
 Urf3Si4/OCcf4VMiSnDvlkh0ZMzL7HC7BoIs48XQh6rQQnVCSUtTkVZcf5O6WUw9EYE7UZn+w7
 q55Zo4vevdzxVT2m5YpkT+X9FSyUH4bQ0upVOKTugxLDE4kM5hDlxLhw93h8+l3Yk2LYPMvnfa
 qQAAAA=
To: Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, equinox@diac24.net, 
 Christina Quast <contact@christina-quast.de>, 
 Daniel Beer <daniel.beer@igorinstitute.com>, 
 Michael Zaidman <michael.zaidman@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708095834; l=35949;
 i=contact@christina-quast.de; s=20240130; h=from:subject:message-id;
 bh=cby+aF/vuGdlAeSp1DITP+a6iqT5t4vGYIYxLU3BIuQ=;
 b=rCVk7nHLRQdcHptl9yg753WjAeSsndWBrhl6Ari26PooH9X+oUm58olCNoGg7QlGSu/hXx7DQ
 sVobHTuy8TXD8BpnsWUkbfpeeoK73LxXJ3DsQ+HSw9xfatVtKiphuU/
X-Developer-Key: i=contact@christina-quast.de; a=ed25519;
 pk=aoQfinjbnr265vCkIZdYteLDcmIqLBhY1m74WfFUU9E=

Adds the serial driver for FT260 USB HID devices, providing direct and
simplified access to UART functionality without the need for FT260 HID
report format knowledge.

This chip implements an UART and I2C interface, but only the latter was
previously supported with a kernel driver. For the UART interface, only
FTDI example code using hidraw from userspace was available.

This commit adds a serial interface /dev/ttyFTx (FT as in FT260), which
implements tty serial driver ops, facilitating baudrate configuration,
data transmission and reception, termios settings.

Signed-off-by: Christina Quast <contact@christina-quast.de>
Co-developed-by: Daniel Beer <daniel.beer@igorinstitute.com>
Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
Co-developed-by: Michael Zaidman <michael.zaidman@gmail.com>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
Adds the serial driver for FT260 USB HID devices, providing direct and
simplified access to UART functionality without the need for FT260 HID
report format knowledge.

This chip implements an UART and I2C interface, but only the latter was
previously supported with a kernel driver. For the UART interface, only
FTDI example code using hidraw from userspace was available.

This commit adds a serial interface /dev/ttyFTx (FT as in FT260), which
implements tty serial driver ops, facilitating baudrate configuration,
data transmission and reception, termios settings.
---
V1 -> V2: Adressed review comments, added power saving mode quirk
V2 -> V3: Added return 0 in ft260_i2c_probe function
V3 -> V4:
 - Adressed review comments
 - Added get_icount
 - Fixed tty port lifetime bug
V4 -> V5:
  Added and squashed patches from Michael Zaidman:
  [PATCH v1 2/19] hid-ft260: fix Wformat warning
  [PATCH v1 3/19] hid-ft260: fix i2c driver regression in ft260_raw_event
  [PATCH v1 4/19] hid-ft260: remove dead code in ft260_uart_receive_chars
  [PATCH v1 5/19] hid-ft260: fix unprotected write_buf concurrent access
  [PATCH v1 6/19] hid-ft260: uart: enable wakeup workaround
  [PATCH v1 7/19] hid-ft260: depend wakeup workaround activation on uart baud rate
  [PATCH v1 8/19] hid-ft260: depend wakeup workaround activation on eeprom config
  [PATCH v1 9/19] hid-ft260: uart: wakeup device early to not lose rx data
  [PATCH v1 10/19] hid-ft260: uart: do not configure baud rate twice
  [PATCH v1 11/19] hid-ft260: uart: do not disable wakeup workaround twice
  [PATCH v1 12/19] hid-ft260: uart: use kfifo_avail for fifo write room check
  [PATCH v1 13/19] hid-ft260: improve usb interface type detection logic
  [PATCH v1 14/19] hid-ft260: uart: cleanup and refactoring
  [PATCH v1 15/19] hid-ft260: uart: remove FIXME for wake-up workaround
  [PATCH v1 16/19] hid-ft260: uart: suppress unhandled report 0xb1 dmesg
  [PATCH v1 17/19] hid-ft260: uart: arm wake-up timer unconditionally on tty session start
  [PATCH v1 18/19] hid-ft260: uart: fix rx data loss after device reopening
  [PATCH v1 19/19] hid-ft260: uart: improve write performance
---
 drivers/hid/hid-ft260.c | 901 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 835 insertions(+), 66 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 333341e80b0e..f90ee96990b2 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * hid-ft260.c - FTDI FT260 USB HID to I2C host bridge
+ * FTDI FT260 USB HID to I2C/UART host bridge
  *
  * Copyright (c) 2021, Michael Zaidman <michaelz@xsightlabs.com>
  *
@@ -13,6 +13,12 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/usb.h>
+#include <linux/serial.h>
+#include <linux/serial_core.h>
+#include <linux/kfifo.h>
+#include <linux/tty_flip.h>
+#include <linux/minmax.h>
+#include <asm/unaligned.h>
 
 #ifdef DEBUG
 static int ft260_debug = 1;
@@ -28,8 +34,12 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 			pr_info("%s: " format, __func__, ##arg);	  \
 	} while (0)
 
-#define FT260_REPORT_MAX_LENGTH (64)
-#define FT260_I2C_DATA_REPORT_ID(len) (FT260_I2C_REPORT_MIN + (len - 1) / 4)
+#define FT260_REPORT_MAX_LEN (64)
+#define FT260_DATA_REPORT_ID(min, len) (min + (len - 1) / 4)
+#define FT260_I2C_DATA_REPORT_ID(len) \
+		FT260_DATA_REPORT_ID(FT260_I2C_REPORT_MIN, len)
+#define FT260_UART_DATA_REPORT_ID(len) \
+		FT260_DATA_REPORT_ID(FT260_UART_REPORT_MIN, len)
 
 #define FT260_WAKEUP_NEEDED_AFTER_MS (4800) /* 5s minus 200ms margin */
 
@@ -43,9 +53,10 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
  * or optoe limit the i2c reads to 128 bytes. To not block other drivers out
  * of I2C for potentially troublesome amounts of time, we select the maximum
  * read payload length to be 180 bytes.
-*/
+ */
 #define FT260_RD_DATA_MAX (180)
-#define FT260_WR_DATA_MAX (60)
+#define FT260_WR_I2C_DATA_MAX (60)
+#define FT260_WR_UART_DATA_MAX (62)
 
 /*
  * Device interface configuration.
@@ -79,9 +90,10 @@ enum {
 	FT260_I2C_REPORT_MAX		= 0xDE,
 	FT260_GPIO			= 0xB0,
 	FT260_UART_INTERRUPT_STATUS	= 0xB1,
-	FT260_UART_STATUS		= 0xE0,
+	FT260_UART_SETTINGS		= 0xE0,
 	FT260_UART_RI_DCD_STATUS	= 0xE1,
-	FT260_UART_REPORT		= 0xF0,
+	FT260_UART_REPORT_MIN		= 0xF0,
+	FT260_UART_REPORT_MAX		= 0xFE,
 };
 
 /* Feature Out */
@@ -132,6 +144,13 @@ enum {
 	FT260_FLAG_START_STOP_REPEATED	= 0x07,
 };
 
+/* USB interface type values */
+enum {
+	FT260_IFACE_NONE,
+	FT260_IFACE_I2C,
+	FT260_IFACE_UART
+};
+
 #define FT260_SET_REQUEST_VALUE(report_id) ((FT260_FEATURE << 8) | report_id)
 
 /* Feature In reports */
@@ -171,6 +190,18 @@ struct ft260_get_i2c_status_report {
 	u8 reserved;
 } __packed;
 
+struct ft260_get_uart_settings_report {
+	u8 report;		/* FT260_UART_SETTINGS */
+	u8 flow_ctrl;		/* 0 - OFF; 1 - RTS_CTS, 2 - DTR_DSR, */
+				/* 3 - XON_XOFF, 4 - No flow control */
+	/* The baudrate field is unaligned */
+	__le32 baudrate;	/* little endian, 9600 = 0x2580, 19200 = 0x4B00 */
+	u8 data_bit;		/* 7 or 8 */
+	u8 parity;		/* 0: no parity, 1: odd, 2: even, 3: high, 4: low */
+	u8 stop_bit;		/* 0: one stop bit, 2: 2 stop bits */
+	u8 breaking;		/* 0: no break */
+} __packed;
+
 /* Feature Out reports */
 
 struct ft260_set_system_clock_report {
@@ -210,7 +241,7 @@ struct ft260_i2c_write_request_report {
 	u8 address;		/* 7-bit I2C address */
 	u8 flag;		/* I2C transaction condition */
 	u8 length;		/* data payload length */
-	u8 data[FT260_WR_DATA_MAX]; /* data payload */
+	u8 data[FT260_WR_I2C_DATA_MAX]; /* data payload */
 } __packed;
 
 struct ft260_i2c_read_request_report {
@@ -220,12 +251,65 @@ struct ft260_i2c_read_request_report {
 	__le16 length;		/* data payload length */
 } __packed;
 
-struct ft260_i2c_input_report {
-	u8 report;		/* FT260_I2C_REPORT */
+struct ft260_input_report {
+	u8 report;		/* FT260_I2C_REPORT or FT260_UART_REPORT */
 	u8 length;		/* data payload length */
 	u8 data[2];		/* data payload */
 } __packed;
 
+/* UART reports */
+
+struct ft260_uart_write_request_report {
+	u8 report;		/* FT260_UART_REPORT */
+	u8 length;		/* data payload length */
+	u8 data[FT260_WR_UART_DATA_MAX]; /* data payload */
+} __packed;
+
+struct ft260_configure_uart_request_report {
+	u8 report;		/* FT260_SYSTEM_SETTINGS */
+	u8 request;		/* FT260_SET_UART_CONFIG */
+	u8 flow_ctrl;		/* 0: OFF, 1: RTS_CTS, 2: DTR_DSR */
+				/* 3: XON_XOFF, 4: No flow ctrl */
+	/* The baudrate field is unaligned */
+	__le32 baudrate;	/* little endian, 9600 = 0x2580, 19200 = 0x4B00 */
+	u8 data_bit;		/* 7 or 8 */
+	u8 parity;		/* 0: no parity, 1: odd, 2: even, 3: high, 4: low */
+	u8 stop_bit;		/* 0: one stop bit, 2: 2 stop bits */
+	u8 breaking;		/* 0: no break */
+} __packed;
+
+/* UART interface configuration */
+enum {
+	FT260_CFG_FLOW_CTRL_OFF		= 0x00,
+	FT260_CFG_FLOW_CTRL_RTS_CTS	= 0x01,
+	FT260_CFG_FLOW_CTRL_DTR_DSR	= 0x02,
+	FT260_CFG_FLOW_CTRL_XON_XOFF	= 0x03,
+	FT260_CFG_FLOW_CTRL_NONE	= 0x04,
+
+	FT260_CFG_DATA_BITS_7		= 0x07,
+	FT260_CFG_DATA_BITS_8		= 0x08,
+
+	FT260_CFG_PAR_NO		= 0x00,
+	FT260_CFG_PAR_ODD		= 0x01,
+	FT260_CFG_PAR_EVEN		= 0x02,
+	FT260_CFG_PAR_HIGH		= 0x03,
+	FT260_CFG_PAR_LOW		= 0x04,
+
+	FT260_CFG_STOP_ONE_BIT		= 0x00,
+	FT260_CFG_STOP_TWO_BIT		= 0x02,
+
+	FT260_CFG_BREAKING_NO		= 0x00,
+	FT260_CFG_BEAKING_YES		= 0x01,
+
+	FT260_CFG_BAUD_MIN		= 1200,
+	FT260_CFG_BAUD_MAX		= 12000000,
+};
+
+#define FT260_UART_EN_PW_SAVE_BAUD	(4800)
+
+#define UART_COUNT_MAX (4) /* Number of supported UARTs */
+#define XMIT_FIFO_SIZE (PAGE_SIZE)
+
 static const struct hid_device_id ft260_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FUTURE_TECHNOLOGY,
 			 USB_DEVICE_ID_FT260) },
@@ -236,9 +320,22 @@ MODULE_DEVICE_TABLE(hid, ft260_devices);
 struct ft260_device {
 	struct i2c_adapter adap;
 	struct hid_device *hdev;
+	int iface_type;
+	struct list_head device_list;
+	struct tty_port port;
+	/* tty port index */
+	unsigned int index;
+	struct kfifo xmit_fifo;
+	spinlock_t xmit_fifo_lock;
+	struct uart_icount icount;
+	struct timer_list wakeup_timer;
+	struct work_struct wakeup_work;
+	bool reschedule_work;
+	bool power_saving_en;
 	struct completion wait;
 	struct mutex lock;
-	u8 write_buf[FT260_REPORT_MAX_LENGTH];
+	u8 i2c_wr_buf[FT260_REPORT_MAX_LEN];
+	u8 uart_wr_buf[FT260_REPORT_MAX_LEN];
 	unsigned long need_wakeup_at;
 	u8 *read_buf;
 	u16 read_idx;
@@ -247,8 +344,7 @@ struct ft260_device {
 };
 
 static int ft260_hid_feature_report_get(struct hid_device *hdev,
-					unsigned char report_id, u8 *data,
-					size_t len)
+					u8 report_id, u8 *data, size_t len)
 {
 	u8 *buf;
 	int ret;
@@ -377,8 +473,6 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 
 	ret = ft260_hid_output_report(hdev, data, len);
 	if (ret < 0) {
-		hid_err(hdev, "%s: failed to start transfer, ret %d\n",
-			__func__, ret);
 		ft260_i2c_reset(hdev);
 		return ret;
 	}
@@ -420,7 +514,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 	int ret, wr_len, idx = 0;
 	struct hid_device *hdev = dev->hdev;
 	struct ft260_i2c_write_request_report *rep =
-		(struct ft260_i2c_write_request_report *)dev->write_buf;
+		(struct ft260_i2c_write_request_report *)dev->i2c_wr_buf;
 
 	if (len < 1)
 		return -EINVAL;
@@ -428,12 +522,12 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 	rep->flag = FT260_FLAG_START;
 
 	do {
-		if (len <= FT260_WR_DATA_MAX) {
+		if (len <= FT260_WR_I2C_DATA_MAX) {
 			wr_len = len;
 			if (flag == FT260_FLAG_START_STOP)
 				rep->flag |= FT260_FLAG_STOP;
 		} else {
-			wr_len = FT260_WR_DATA_MAX;
+			wr_len = FT260_WR_I2C_DATA_MAX;
 		}
 
 		rep->report = FT260_I2C_DATA_REPORT_ID(wr_len);
@@ -469,7 +563,7 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 	int len = 4;
 
 	struct ft260_i2c_write_request_report *rep =
-		(struct ft260_i2c_write_request_report *)dev->write_buf;
+		(struct ft260_i2c_write_request_report *)dev->i2c_wr_buf;
 
 	if (data_len >= sizeof(rep->data))
 		return -EINVAL;
@@ -489,6 +583,8 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 		  rep->report, addr, cmd, rep->length, len);
 
 	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
+	if (ret < 0)
+		hid_err(dev->hdev, "%s: failed with %d\n", __func__, ret);
 
 	return ret;
 }
@@ -592,8 +688,7 @@ static int ft260_i2c_write_read(struct ft260_device *dev, struct i2c_msg *msgs)
 		else
 			read_off = *msgs[0].buf;
 
-		pr_info("%s: off %#x rlen %d wlen %d\n", __func__,
-			read_off, rd_len, wr_len);
+		ft260_dbg("off %#x rlen %d wlen %d\n", read_off, rd_len, wr_len);
 	}
 
 	ret = ft260_i2c_write(dev, addr, msgs[0].buf, wr_len,
@@ -782,7 +877,7 @@ static int ft260_get_system_config(struct hid_device *hdev,
 	return 0;
 }
 
-static int ft260_is_interface_enabled(struct hid_device *hdev)
+static int ft260_get_interface_type(struct hid_device *hdev, struct ft260_device *dev)
 {
 	struct ft260_get_system_status_report cfg;
 	struct usb_interface *usbif = to_usb_interface(hdev->dev.parent);
@@ -799,21 +894,25 @@ static int ft260_is_interface_enabled(struct hid_device *hdev)
 	ft260_dbg("i2c_enable: 0x%02x\n", cfg.i2c_enable);
 	ft260_dbg("uart_mode:  0x%02x\n", cfg.uart_mode);
 
+	dev->power_saving_en = cfg.power_saving_en;
+
 	switch (cfg.chip_mode) {
 	case FT260_MODE_ALL:
 	case FT260_MODE_BOTH:
 		if (interface == 1)
-			hid_info(hdev, "uart interface is not supported\n");
+			ret = FT260_IFACE_UART;
 		else
-			ret = 1;
+			ret = FT260_IFACE_I2C;
 		break;
 	case FT260_MODE_UART:
-		hid_info(hdev, "uart interface is not supported\n");
+		ret = FT260_IFACE_UART;
 		break;
 	case FT260_MODE_I2C:
-		ret = 1;
+		ret = FT260_IFACE_I2C;
 		break;
 	}
+
+	dev->iface_type = ret;
 	return ret;
 }
 
@@ -957,51 +1056,518 @@ static const struct attribute_group ft260_attr_group = {
 	}
 };
 
-static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
+static DEFINE_MUTEX(ft260_uart_list_lock);
+static LIST_HEAD(ft260_uart_device_list);
+
+static void ft260_uart_wakeup(struct ft260_device *dev);
+
+static int ft260_get_uart_settings(struct hid_device *hdev,
+				   struct ft260_get_uart_settings_report *cfg)
 {
+	int ret;
+	int len = sizeof(struct ft260_get_uart_settings_report);
+
+	ret = ft260_hid_feature_report_get(hdev, FT260_UART_SETTINGS,
+					   (u8 *)cfg, len);
+	if (ret < 0) {
+		hid_err(hdev, "failed to retrieve uart settings\n");
+		return ret;
+	}
+	return 0;
+}
+
+static void ft260_uart_wakeup_workaraund_enable(struct ft260_device *port,
+						bool enable)
+{
+	if (port->power_saving_en) {
+		port->reschedule_work = enable;
+		ft260_dbg("%s wakeup workaround",
+			  enable ? "activate" : "deactivate");
+	}
+}
+
+static struct ft260_device *ft260_dev_by_index(int index)
+{
+	struct ft260_device *port;
+
+	list_for_each_entry(port, &ft260_uart_device_list, device_list) {
+		if (index == port->index)
+			return port;
+	}
+	return NULL;
+}
+
+static int ft260_uart_add_port(struct ft260_device *port)
+{
+	int index = 0, ret = 0;
 	struct ft260_device *dev;
-	struct ft260_get_chip_version_report version;
-	int ret;
 
-	if (!hid_is_usb(hdev))
-		return -EINVAL;
-
-	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
-	if (!dev)
+	spin_lock_init(&port->xmit_fifo_lock);
+	if (kfifo_alloc(&port->xmit_fifo, XMIT_FIFO_SIZE, GFP_KERNEL))
 		return -ENOMEM;
 
-	ret = hid_parse(hdev);
-	if (ret) {
-		hid_err(hdev, "failed to parse HID\n");
-		return ret;
+	mutex_lock(&ft260_uart_list_lock);
+	list_for_each_entry(dev, &ft260_uart_device_list, device_list) {
+		if (dev->index != index)
+			break;
+		index++;
 	}
 
-	ret = hid_hw_start(hdev, 0);
-	if (ret) {
-		hid_err(hdev, "failed to start HID HW\n");
-		return ret;
-	}
+	port->index = index;
+	list_add(&port->device_list, &ft260_uart_device_list);
+	mutex_unlock(&ft260_uart_list_lock);
+
+	return ret;
+}
+
+static void ft260_uart_port_put(struct ft260_device *port)
+{
+	tty_port_put(&port->port);
+}
+
+static void ft260_uart_port_remove(struct ft260_device *port)
+{
+	timer_delete_sync(&port->wakeup_timer);
+
+	mutex_lock(&ft260_uart_list_lock);
+	list_del(&port->device_list);
+	mutex_unlock(&ft260_uart_list_lock);
+
+	spin_lock(&port->xmit_fifo_lock);
+	kfifo_free(&port->xmit_fifo);
+	spin_unlock(&port->xmit_fifo_lock);
+
+	mutex_lock(&port->port.mutex);
+	tty_port_tty_hangup(&port->port, false);
+	mutex_unlock(&port->port.mutex);
+
+	ft260_uart_port_put(port);
+}
+
+static struct ft260_device *ft260_uart_port_get(int index)
+{
+	struct ft260_device *port;
+
+	if (index >= UART_COUNT_MAX)
+		return NULL;
+
+	mutex_lock(&ft260_uart_list_lock);
+	port = ft260_dev_by_index(index);
+	if (port)
+		tty_port_get(&port->port);
+	mutex_unlock(&ft260_uart_list_lock);
+
+	return port;
+}
+
+static int ft260_uart_open(struct tty_struct *tty, struct file *filp)
+{
+	int ret;
+	struct ft260_device *port = tty->driver_data;
+
+	ret = tty_port_open(&port->port, tty, filp);
+
+	return ret;
+}
+
+static void ft260_uart_close(struct tty_struct *tty, struct file *filp)
+{
+	struct ft260_device *port = tty->driver_data;
+
+	tty_port_close(&port->port, tty, filp);
+}
+
+static void ft260_uart_hangup(struct tty_struct *tty)
+{
+	struct ft260_device *port = tty->driver_data;
 
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "failed to open HID HW\n");
-		goto err_hid_stop;
+	tty_port_hangup(&port->port);
+}
+
+static int ft260_uart_transmit_chars(struct ft260_device *port)
+{
+	struct hid_device *hdev = port->hdev;
+	struct kfifo *xmit = &port->xmit_fifo;
+	struct tty_struct *tty;
+	struct ft260_uart_write_request_report *rep;
+	int len, data_len, ret = 0;
+
+	tty = tty_port_tty_get(&port->port);
+
+	data_len = kfifo_len(xmit);
+	if (!tty || !data_len) {
+		ret = -EINVAL;
+		goto tty_out;
 	}
 
-	ret = ft260_hid_feature_report_get(hdev, FT260_CHIP_VERSION,
-					   (u8 *)&version, sizeof(version));
+	rep = (struct ft260_uart_write_request_report *)port->uart_wr_buf;
+
+	do {
+		len = min(data_len, FT260_WR_UART_DATA_MAX);
+
+		rep->report = FT260_UART_DATA_REPORT_ID(len);
+		rep->length = len;
+
+		len = kfifo_out_spinlocked(xmit, rep->data, len, &port->xmit_fifo_lock);
+
+		ret = ft260_hid_output_report(hdev, (u8 *)rep, len + 2);
+		if (ret < 0)
+			goto tty_out;
+
+		data_len -= len;
+		port->icount.tx += len;
+	} while (data_len > 0);
+
+	ret = 0;
+
+tty_out:
+	tty_kref_put(tty);
+	return ret;
+}
+
+static int ft260_uart_receive_chars(struct ft260_device *port, u8 *data, u8 length)
+{
+	int ret;
+
+	ret = tty_insert_flip_string(&port->port, data, length);
+	if (ret != length)
+		ft260_dbg("%d char not inserted to flip buf\n", length - ret);
+
+	port->icount.rx += ret;
+
+	if (ret)
+		tty_flip_buffer_push(&port->port);
+
+	return ret;
+}
+
+static ssize_t ft260_uart_write(struct tty_struct *tty, const u8 *buf, size_t cnt)
+{
+	struct ft260_device *port = tty->driver_data;
+	int len, ret, diff;
+
+	len = kfifo_in_spinlocked(&port->xmit_fifo, buf, cnt, &port->xmit_fifo_lock);
+	ft260_dbg("count: %lu, len: %d", cnt, len);
+
+	ret = ft260_uart_transmit_chars(port);
 	if (ret < 0) {
-		hid_err(hdev, "failed to retrieve chip version\n");
-		goto err_hid_close;
+		ft260_dbg("failed to transmit %d\n", ret);
+		return 0;
 	}
 
-	hid_info(hdev, "chip code: %02x%02x %02x%02x\n",
-		 version.chip_code[0], version.chip_code[1],
-		 version.chip_code[2], version.chip_code[3]);
+	ret = kfifo_len(&port->xmit_fifo);
+	if (ret > 0) {
+		diff = len - ret;
+		ft260_dbg("failed to send %d out of %d bytes\n", diff, len);
+		return diff;
+	}
+
+	return len;
+}
+
+static unsigned int ft260_uart_write_room(struct tty_struct *tty)
+{
+	struct ft260_device *port = tty->driver_data;
+
+	return kfifo_avail(&port->xmit_fifo);
+}
+
+static unsigned int ft260_uart_chars_in_buffer(struct tty_struct *tty)
+{
+	struct ft260_device *port = tty->driver_data;
+
+	return kfifo_len(&port->xmit_fifo);
+}
+
+static int ft260_uart_change_speed(struct ft260_device *port,
+				   struct ktermios *termios,
+				    struct ktermios *old)
+{
+	struct hid_device *hdev = port->hdev;
+	unsigned int baud;
+	struct ft260_configure_uart_request_report req;
+	bool wakeup_workaraund = false;
+	int ret;
+
+	memset(&req, 0, sizeof(req));
+
+	req.report = FT260_SYSTEM_SETTINGS;
+	req.request = FT260_SET_UART_CONFIG;
+
+	switch (termios->c_cflag & CSIZE) {
+	case CS7:
+		req.data_bit = FT260_CFG_DATA_BITS_7;
+		break;
+	case CS5:
+	case CS6:
+		hid_err(hdev, "invalid data bit size, setting a default\n");
+		req.data_bit = FT260_CFG_DATA_BITS_8;
+		termios->c_cflag &= ~CSIZE;
+		termios->c_cflag |= CS8;
+		break;
+	default:
+	case CS8:
+		req.data_bit = FT260_CFG_DATA_BITS_8;
+		break;
+	}
+
+	req.stop_bit = (termios->c_cflag & CSTOPB) ?
+		FT260_CFG_STOP_TWO_BIT : FT260_CFG_STOP_ONE_BIT;
+
+	if (termios->c_cflag & PARENB) {
+		req.parity = (termios->c_cflag & PARODD) ?
+			FT260_CFG_PAR_ODD : FT260_CFG_PAR_EVEN;
+	} else {
+		req.parity = FT260_CFG_PAR_NO;
+	}
+
+	baud = tty_termios_baud_rate(termios);
+	if (baud == 0 || baud < FT260_CFG_BAUD_MIN || baud > FT260_CFG_BAUD_MAX) {
+		struct tty_struct *tty = tty_port_tty_get(&port->port);
+
+		hid_err(hdev, "invalid baud rate %d\n", baud);
+		baud = 9600;
+		tty_encode_baud_rate(tty, baud, baud);
+		tty_kref_put(tty);
+	}
+
+	if (baud > FT260_UART_EN_PW_SAVE_BAUD)
+		wakeup_workaraund = true;
+
+	ft260_uart_wakeup_workaraund_enable(port, wakeup_workaraund);
+
+	put_unaligned_le32(cpu_to_le32(baud), &req.baudrate);
+
+	if (termios->c_cflag & CRTSCTS)
+		req.flow_ctrl = FT260_CFG_FLOW_CTRL_RTS_CTS;
+	else
+		req.flow_ctrl = FT260_CFG_FLOW_CTRL_OFF;
+
+	ft260_dbg("configured termios: flow control: %d, baudrate: %d, ",
+		  req.flow_ctrl, baud);
+	ft260_dbg("data_bit: %d, parity: %d, stop_bit: %d, breaking: %d\n",
+		  req.data_bit, req.parity,
+		  req.stop_bit, req.breaking);
+
+	req.flow_ctrl = FT260_CFG_FLOW_CTRL_NONE;
+	req.breaking = FT260_CFG_BREAKING_NO;
+
+	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
+	if (ret < 0)
+		hid_err(hdev, "failed to change termios: %d\n", ret);
+
+	return ret;
+}
+
+static int ft260_uart_get_icount(struct tty_struct *tty,
+		struct serial_icounter_struct *icount)
+{
+	struct ft260_device *port = tty->driver_data;
+
+	memcpy(icount, &port->icount, sizeof(struct uart_icount));
+
+	return 0;
+}
+
+static void ft260_uart_set_termios(struct tty_struct *tty,
+		const struct ktermios *old_termios)
+{
+	struct ft260_device *port = tty->driver_data;
+
+	ft260_uart_change_speed(port, &tty->termios, NULL);
+}
+
+static int ft260_uart_install(struct tty_driver *driver, struct tty_struct *tty)
+{
+	int idx = tty->index;
+	struct ft260_device *port = ft260_uart_port_get(idx);
+	int ret = tty_standard_install(driver, tty);
+
+	if (ret == 0)
+		/* This is the ref ft260_uart_port get provided */
+		tty->driver_data = port;
+	else
+		ft260_uart_port_put(port);
+
+	return ret;
+}
+
+static void ft260_uart_cleanup(struct tty_struct *tty)
+{
+	struct ft260_device *port = tty->driver_data;
+
+	tty->driver_data = NULL;	/* Bug trap */
+	ft260_uart_port_put(port);
+}
+
+static int ft260_uart_proc_show(struct seq_file *m, void *v)
+{
+	int i;
+
+	seq_printf(m, "ft260 info:1.0 driver%s%s revision:%s\n", "", "", "");
+
+	for (i = 0; i < UART_COUNT_MAX; i++) {
+		struct ft260_device *port = ft260_uart_port_get(i);
+
+		if (port) {
+			seq_printf(m, "%d: uart:FT260", i);
+			if (capable(CAP_SYS_ADMIN)) {
+				seq_printf(m, " tx:%d rx:%d",
+						port->icount.tx, port->icount.rx);
+				if (port->icount.frame)
+					seq_printf(m, " fe:%d",
+							port->icount.frame);
+				if (port->icount.parity)
+					seq_printf(m, " pe:%d",
+							port->icount.parity);
+				if (port->icount.brk)
+					seq_printf(m, " brk:%d",
+							port->icount.brk);
+				if (port->icount.overrun)
+					seq_printf(m, " oe:%d",
+							port->icount.overrun);
+				if (port->icount.cts)
+					seq_printf(m, " cts:%d",
+							port->icount.cts);
+				if (port->icount.dsr)
+					seq_printf(m, " dsr:%d",
+							port->icount.dsr);
+				if (port->icount.rng)
+					seq_printf(m, " rng:%d",
+							port->icount.rng);
+				if (port->icount.dcd)
+					seq_printf(m, " dcd:%d",
+							port->icount.dcd);
+			}
+			ft260_uart_port_put(port);
+			seq_putc(m, '\n');
+		}
+	}
+	return 0;
+}
+
+static const struct tty_operations ft260_uart_ops = {
+	.open			= ft260_uart_open,
+	.close			= ft260_uart_close,
+	.write			= ft260_uart_write,
+	.write_room		= ft260_uart_write_room,
+	.chars_in_buffer	= ft260_uart_chars_in_buffer,
+	.set_termios		= ft260_uart_set_termios,
+	.hangup			= ft260_uart_hangup,
+	.install		= ft260_uart_install,
+	.cleanup		= ft260_uart_cleanup,
+	.proc_show		= ft260_uart_proc_show,
+	.get_icount		= ft260_uart_get_icount,
+};
+
+/*
+ * The FT260 has a "power saving mode" that causes the device to switch
+ * to a 30 kHz oscillator if there's no activity for 5 seconds.
+ * Unfortunately, this mode can only be disabled by reprogramming
+ * internal fuses, which requires an additional programming voltage.
+ *
+ * One effect of this mode is to cause data loss on an Rx line at baud
+ * rates higher than 4800 after being idle for longer than 5 seconds.
+ * We work around this by sending a dummy report at least once per 4.8
+ * seconds if the UART is in use.
+ */
+static void ft260_uart_start_wakeup(struct timer_list *t)
+{
+	struct ft260_device *dev =
+		container_of(t, struct ft260_device, wakeup_timer);
+
+	if (dev->reschedule_work) {
+		schedule_work(&dev->wakeup_work);
+		mod_timer(&dev->wakeup_timer, jiffies +
+			msecs_to_jiffies(FT260_WAKEUP_NEEDED_AFTER_MS));
+	}
+}
+
+static void ft260_uart_wakeup(struct ft260_device *dev)
+{
+	struct ft260_get_chip_version_report ver;
+	int ret;
+
+	if (dev->reschedule_work) {
+		ret = ft260_hid_feature_report_get(dev->hdev, FT260_CHIP_VERSION,
+						   (u8 *)&ver, sizeof(ver));
+		if (ret < 0)
+			hid_err(dev->hdev, "%s: failed with %d\n", __func__, ret);
+	}
+}
+
+static void ft260_uart_do_wakeup(struct work_struct *work)
+{
+	struct ft260_device *dev =
+		container_of(work, struct ft260_device, wakeup_work);
+
+	ft260_uart_wakeup(dev);
+}
+
+static void ft260_uart_port_shutdown(struct tty_port *tport)
+{
+	struct ft260_device *port =
+		container_of(tport, struct ft260_device, port);
+
+	ft260_uart_wakeup_workaraund_enable(port, false);
+}
+
+static int ft260_uart_port_activate(struct tty_port *tport, struct tty_struct *tty)
+{
+	int ret;
+	int baudrate;
+	struct ft260_get_uart_settings_report cfg;
+	struct ft260_device *port = container_of(tport, struct ft260_device, port);
+
+	set_bit(TTY_IO_ERROR, &tty->flags);
+
+	spin_lock(&port->xmit_fifo_lock);
+	kfifo_reset(&port->xmit_fifo);
+	spin_unlock(&port->xmit_fifo_lock);
+
+	clear_bit(TTY_IO_ERROR, &tty->flags);
+
+	/*
+	 * The port setting may remain intact after session termination.
+	 * Then, when reopening the port without configuring the port
+	 * setting, we need to retrieve the baud rate from the device to
+	 * reactivate the wakeup workaround if needed.
+	 */
+	ret = ft260_get_uart_settings(port->hdev, &cfg);
+	if (ret)
+		return ret;
+
+	baudrate = get_unaligned_le32(&cfg.baudrate);
+	if (baudrate > FT260_UART_EN_PW_SAVE_BAUD)
+		ft260_uart_wakeup_workaraund_enable(port, true);
+
+	ft260_dbg("configured baudrate = %d", baudrate);
+
+	mod_timer(&port->wakeup_timer, jiffies +
+		  msecs_to_jiffies(FT260_WAKEUP_NEEDED_AFTER_MS));
+
+	return 0;
+}
+
+static void ft260_uart_port_destroy(struct tty_port *tport)
+{
+	struct ft260_device *port =
+		container_of(tport, struct ft260_device, port);
+
+	kfree(port);
+}
+
+static const struct tty_port_operations ft260_uart_port_ops = {
+	.shutdown = ft260_uart_port_shutdown,
+	.activate = ft260_uart_port_activate,
+	.destruct = ft260_uart_port_destroy,
+};
+
+static struct tty_driver *ft260_tty_driver;
 
-	ret = ft260_is_interface_enabled(hdev);
-	if (ret <= 0)
-		goto err_hid_close;
+static int ft260_i2c_probe(struct hid_device *hdev, struct ft260_device *dev)
+{
+	int ret;
 
 	hid_info(hdev, "USB HID v%x.%02x Device [%s] on %s\n",
 		hdev->version >> 8, hdev->version & 0xff, hdev->name,
@@ -1028,7 +1594,7 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	ret = i2c_add_adapter(&dev->adap);
 	if (ret) {
 		hid_err(hdev, "failed to add i2c adapter\n");
-		goto err_hid_close;
+		return ret;
 	}
 
 	ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
@@ -1036,15 +1602,144 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		hid_err(hdev, "failed to create sysfs attrs\n");
 		goto err_i2c_free;
 	}
-
 	return 0;
 
 err_i2c_free:
 	i2c_del_adapter(&dev->adap);
+	return ret;
+}
+
+static int ft260_uart_probe(struct hid_device *hdev, struct ft260_device *dev)
+{
+	struct ft260_configure_uart_request_report req;
+	int ret;
+	struct device *devt;
+
+	INIT_WORK(&dev->wakeup_work, ft260_uart_do_wakeup);
+	// FIXME: are all kfifo access secured by lock? with irq or not?
+	ft260_uart_wakeup_workaraund_enable(dev, true);
+	/* Work not started at this point */
+	timer_setup(&dev->wakeup_timer, ft260_uart_start_wakeup, 0);
+
+	tty_port_init(&dev->port);
+	dev->port.ops = &ft260_uart_port_ops;
+
+	ret = ft260_uart_add_port(dev);
+	if (ret) {
+		hid_err(hdev, "failed to add port\n");
+		return ret;
+	}
+	devt = tty_port_register_device_attr(&dev->port,
+					     ft260_tty_driver,
+					     dev->index, &hdev->dev,
+					     dev, NULL);
+	if (IS_ERR(devt)) {
+		hid_err(hdev, "failed to register tty port\n");
+		ret = PTR_ERR(devt);
+		goto err_register_tty;
+	}
+	hid_info(hdev, "registering device /dev/%s%d\n",
+		ft260_tty_driver->name, dev->index);
+
+	/* Configure UART to 9600n8 */
+	req.report	= FT260_SYSTEM_SETTINGS;
+	req.request	= FT260_SET_UART_CONFIG;
+	req.flow_ctrl	= FT260_CFG_FLOW_CTRL_NONE;
+	put_unaligned_le32(cpu_to_le32(9600), &req.baudrate);
+	req.data_bit	= FT260_CFG_DATA_BITS_8;
+	req.parity	= FT260_CFG_PAR_NO;
+	req.stop_bit	= FT260_CFG_STOP_ONE_BIT;
+	req.breaking	= FT260_CFG_BREAKING_NO;
+
+	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
+	if (ret < 0) {
+		hid_err(hdev, "failed to configure uart: %d\n", ret);
+		goto err_hid_report;
+	}
+
+	return 0;
+
+err_hid_report:
+	tty_port_unregister_device(&dev->port, ft260_tty_driver, dev->index);
+err_register_tty:
+	ft260_uart_port_remove(dev);
+	return ret;
+}
+
+static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct ft260_device *dev;
+	struct ft260_get_chip_version_report version;
+	int ret;
+
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+	/*
+	 * We cannot use devm_kzalloc here because the port has to survive
+	 * until destroy function call.
+	 */
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev) {
+		ret = -ENOMEM;
+		goto alloc_fail;
+	}
+	hid_set_drvdata(hdev, dev);
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "failed to parse HID\n");
+		goto hid_fail;
+	}
+
+	ret = hid_hw_start(hdev, 0);
+	if (ret) {
+		hid_err(hdev, "failed to start HID HW\n");
+		goto hid_fail;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "failed to open HID HW\n");
+		goto err_hid_stop;
+	}
+
+	ret = ft260_hid_feature_report_get(hdev, FT260_CHIP_VERSION,
+					   (u8 *)&version, sizeof(version));
+	if (ret < 0) {
+		hid_err(hdev, "failed to retrieve chip version\n");
+		goto err_hid_close;
+	}
+
+	hid_info(hdev, "chip code: %02x%02x %02x%02x\n",
+		 version.chip_code[0], version.chip_code[1],
+		 version.chip_code[2], version.chip_code[3]);
+
+	ret = ft260_get_interface_type(hdev, dev);
+	if (ret <= FT260_IFACE_NONE)
+		goto err_hid_close;
+
+	hid_set_drvdata(hdev, dev);
+	dev->hdev = hdev;
+
+	mutex_init(&dev->lock);
+	init_completion(&dev->wait);
+
+	if (ret == FT260_IFACE_I2C)
+		ret = ft260_i2c_probe(hdev, dev);
+	else
+		ret = ft260_uart_probe(hdev, dev);
+	if (ret)
+		goto err_hid_close;
+
+	return 0;
+
 err_hid_close:
 	hid_hw_close(hdev);
 err_hid_stop:
 	hid_hw_stop(hdev);
+hid_fail:
+	kfree(dev);
+alloc_fail:
 	return ret;
 }
 
@@ -1055,8 +1750,17 @@ static void ft260_remove(struct hid_device *hdev)
 	if (!dev)
 		return;
 
-	sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
-	i2c_del_adapter(&dev->adap);
+	if (dev->iface_type == FT260_IFACE_UART) {
+		cancel_work_sync(&dev->wakeup_work);
+		tty_port_unregister_device(&dev->port, ft260_tty_driver,
+					   dev->index);
+		ft260_uart_port_remove(dev);
+		/* dev is still needed, so we will free it in _destroy func */
+	} else {
+		sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
+		i2c_del_adapter(&dev->adap);
+		kfree(dev);
+	}
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
@@ -1066,7 +1770,7 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
 			   u8 *data, int size)
 {
 	struct ft260_device *dev = hid_get_drvdata(hdev);
-	struct ft260_i2c_input_report *xfer = (void *)data;
+	struct ft260_input_report *xfer = (void *)data;
 
 	if (xfer->report >= FT260_I2C_REPORT_MIN &&
 	    xfer->report <= FT260_I2C_REPORT_MAX) {
@@ -1087,9 +1791,19 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
 		if (dev->read_idx == dev->read_len)
 			complete(&dev->wait);
 
-	} else {
-		hid_err(hdev, "unhandled report %#02x\n", xfer->report);
+		return 0;
+
+	} else if (xfer->length > FT260_RD_DATA_MAX) {
+		hid_err(hdev, "received data too long (%d)\n", xfer->length);
+		return -EBADR;
+	} else if (xfer->report >= FT260_UART_REPORT_MIN &&
+		   xfer->report <= FT260_UART_REPORT_MAX) {
+		return ft260_uart_receive_chars(dev, xfer->data, xfer->length);
+	} else if (xfer->report == FT260_UART_INTERRUPT_STATUS) {
+		return 0;
 	}
+	hid_err(hdev, "unhandled report %#02x\n", xfer->report);
+
 	return 0;
 }
 
@@ -1101,7 +1815,62 @@ static struct hid_driver ft260_driver = {
 	.raw_event	= ft260_raw_event,
 };
 
-module_hid_driver(ft260_driver);
-MODULE_DESCRIPTION("FTDI FT260 USB HID to I2C host bridge");
+static int __init ft260_driver_init(void)
+{
+	int ret;
+
+	ft260_tty_driver = tty_alloc_driver(UART_COUNT_MAX,
+		TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
+	if (IS_ERR(ft260_tty_driver)) {
+		pr_err("tty_alloc_driver failed: %d\n",
+			(int)PTR_ERR(ft260_tty_driver));
+		return PTR_ERR(ft260_tty_driver);
+	}
+
+	ft260_tty_driver->driver_name = "ft260_ser";
+	ft260_tty_driver->name = "ttyFT";
+	ft260_tty_driver->major = 0;
+	ft260_tty_driver->minor_start = 0;
+	ft260_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
+	ft260_tty_driver->subtype = SERIAL_TYPE_NORMAL;
+	ft260_tty_driver->init_termios = tty_std_termios;
+	ft260_tty_driver->init_termios.c_cflag = B9600 | CS8 | CREAD | HUPCL | CLOCAL;
+	ft260_tty_driver->init_termios.c_ispeed = 9600;
+	ft260_tty_driver->init_termios.c_ospeed = 9600;
+	tty_set_operations(ft260_tty_driver, &ft260_uart_ops);
+
+	ret = tty_register_driver(ft260_tty_driver);
+	if (ret) {
+		pr_err("tty_register_driver failed: %d\n", ret);
+		goto err_reg_driver;
+	}
+
+	ret = hid_register_driver(&ft260_driver);
+	if (ret) {
+		pr_err("hid_register_driver failed: %d\n", ret);
+		goto err_reg_hid;
+	}
+
+	return 0;
+
+err_reg_hid:
+	tty_unregister_driver(ft260_tty_driver);
+err_reg_driver:
+	tty_driver_kref_put(ft260_tty_driver);
+
+	return ret;
+}
+
+static void __exit ft260_driver_exit(void)
+{
+	hid_unregister_driver(&ft260_driver);
+	tty_unregister_driver(ft260_tty_driver);
+	tty_driver_kref_put(ft260_tty_driver);
+}
+
+module_init(ft260_driver_init);
+module_exit(ft260_driver_exit);
+
+MODULE_DESCRIPTION("FTDI FT260 USB HID to I2C host bridge and TTY driver");
 MODULE_AUTHOR("Michael Zaidman <michael.zaidman@gmail.com>");
 MODULE_LICENSE("GPL v2");

---
base-commit: 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478
change-id: 20240216-ft260_review5-c750c39d9674

Best regards,
-- 
Christina Quast <contact@christina-quast.de>


