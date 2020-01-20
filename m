Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 321E61422C9
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 06:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbgATF17 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 00:27:59 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36268 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgATF17 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jan 2020 00:27:59 -0500
Received: by mail-pl1-f196.google.com with SMTP id a6so12688601plm.3;
        Sun, 19 Jan 2020 21:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=PthESIpC7cydIPq2BjcDDVYvWtvNTkrXvFg0zWFMdKI=;
        b=g8MaMmsCDNfHeoLeqoVKBXkgmHYHdmk5mjQbbozKAuet5V2PscHr8/FUx0B+KZ39nM
         KC0WJcOZDlsu9KUKgvXYI7av4cbBnFQVBc8tIil0fAKsBVfAwoOV/xdqo1Yg1BUx7Wm7
         IOVMwv3jkXlBVAECROsUo4cDyG/x/tKbmOccS8GuMtHbrpCfXJUTHXuv7ubxsZhpKpNE
         ZB4ro3byi0NB2DNCDE5cBB1qJCtLFXdP6xEb9Jn+cpyhAQgln2Qtf0vZIODVujx7SxxI
         j9eVZRgdaRdYa9Jn7DddGjFqcB2QoPUZwLHsjR+OVbh2fu0YoXMMNsztz1cDjyiyuPFb
         i6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=PthESIpC7cydIPq2BjcDDVYvWtvNTkrXvFg0zWFMdKI=;
        b=Lz0BU9I/7NVxP2DHL0zwVjpJQeBInSEPljlmYnNGdLBi63PdiXVzSkAFgYCg1UvNdy
         xAC0gFUWZkt/3jAyPQMRc0yEPeDAPJoKaORJUAbx0p2w0Yc4tu/tUxtpoplKN4zHtnTh
         9uaeUhffKwoYwaRD5OE5R6E6X9kgaCwm25NG+wGIFcFvGmwuO3xHaPRiTmeWDE1w8J6j
         fUfvae7odmqSKznWCt2t8Zd8actVlry8TF6Ojuu+8jN//hcGj1BQFH4jLwCVrpVSE37j
         3bGi8n1YjroO4pdzLQCiHdqjqUnVkBmKXUaHisYk2n635FmaEZq4SXBnbCd26f0NIuLb
         F6dQ==
X-Gm-Message-State: APjAAAV0bYQ3qzhqu5XelVLbaZ/vqN8WadhCM8cRCLtbxSGh4weqQB19
        oikuhNmdweJOHrxaS7b/T74=
X-Google-Smtp-Source: APXvYqzEbUMIxT/ckB+Zvcg/kMtAGdGtd2I3ezRdJZH/Git9qs7mdG1VAEq+s5/f0kILL66XEyj6jw==
X-Received: by 2002:a17:90b:142:: with SMTP id em2mr21731003pjb.4.1579498078395;
        Sun, 19 Jan 2020 21:27:58 -0800 (PST)
Received: from localhost.localdomain ([106.51.19.95])
        by smtp.gmail.com with ESMTPSA id e16sm35069395pgk.77.2020.01.19.21.27.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 19 Jan 2020 21:27:57 -0800 (PST)
From:   Rishi Gupta <gupt21@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        wsa+renesas@sang-engineering.com
Cc:     gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>
Subject: [PATCH v1 1/1] HID: mcp2221: add usb to i2c-smbus host bridge driver
Date:   Mon, 20 Jan 2020 10:57:38 +0530
Message-Id: <7b81210829dabdc96257084ff5b4cc97f2f2ebec.1579497275.git.gupt21@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1579497275.git.gupt21@gmail.com>
References: <cover.1579497275.git.gupt21@gmail.com>
In-Reply-To: <cover.1579497275.git.gupt21@gmail.com>
References: <cover.1579497275.git.gupt21@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

MCP2221 is a USB HID to I2C/SMbus host bridge device. This
commit implements i2c and smbus host adapter support. 7-bit
address and i2c multi-message transaction is also supported.

Signed-off-by: Rishi Gupta <gupt21@gmail.com>
---
 drivers/hid/Kconfig       |  10 +
 drivers/hid/Makefile      |   1 +
 drivers/hid/hid-ids.h     |   1 +
 drivers/hid/hid-mcp2221.c | 773 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-quirks.c  |   3 +
 5 files changed, 788 insertions(+)
 create mode 100644 drivers/hid/hid-mcp2221.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 494a39e..3f0edca 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1145,6 +1145,16 @@ config HID_ALPS
 	Say Y here if you have a Alps touchpads over i2c-hid or usbhid
 	and want support for its special functionalities.
 
+config HID_MCP2221
+	tristate "Silicon Labs MCP2221 HID USB-to-I2C/SMbus host support"
+	depends on USB_HID && HIDRAW && I2C
+	---help---
+	Provides I2C host adapter functionality over USB through MCP2221
+	from Silicon Labs. I2C bus speed can be set during driver loading.
+
+	To compile this driver as a module, choose M here: the module
+	will be called hid-mcp2221.ko.
+
 endmenu
 
 endif # HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index bfefa36..567a241 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_HID_MACALLY)	+= hid-macally.o
 obj-$(CONFIG_HID_MAGICMOUSE)	+= hid-magicmouse.o
 obj-$(CONFIG_HID_MALTRON)	+= hid-maltron.o
 obj-$(CONFIG_HID_MAYFLASH)	+= hid-mf.o
+obj-$(CONFIG_HID_MCP2221)	+= hid-mcp2221.o
 obj-$(CONFIG_HID_MICROSOFT)	+= hid-microsoft.o
 obj-$(CONFIG_HID_MONTEREY)	+= hid-monterey.o
 obj-$(CONFIG_HID_MULTITOUCH)	+= hid-multitouch.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 3a400ce..53236ac 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -819,6 +819,7 @@
 #define USB_DEVICE_ID_PICK16F1454	0x0042
 #define USB_DEVICE_ID_PICK16F1454_V2	0xf2f7
 #define USB_DEVICE_ID_LUXAFOR		0xf372
+#define USB_DEVICE_ID_MCP2221		0x00dd
 
 #define USB_VENDOR_ID_MICROSOFT		0x045e
 #define USB_DEVICE_ID_SIDEWINDER_GV	0x003b
diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
new file mode 100644
index 0000000..9897599
--- /dev/null
+++ b/drivers/hid/hid-mcp2221.c
@@ -0,0 +1,773 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MCP2221A - Silicon Labs USB to I2C Protocol Bridge
+ *
+ * Copyright (c) 2019, Rishi Gupta <gupt21@gmail.com>
+ *
+ * Datasheet: http://ww1.microchip.com/downloads/en/DeviceDoc/20005565B.pdf
+ */
+
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/hid.h>
+#include <linux/usb.h>
+#include <linux/i2c.h>
+#include "hid-ids.h"
+
+/* Commands codes in a raw output report */
+#define MCP2221_I2C_WR_DATA			0x90
+#define MCP2221_I2C_WR_NO_STOP		0x94
+#define MCP2221_I2C_RD_DATA			0x91
+#define MCP2221_I2C_RD_RPT_START	0x93
+#define MCP2221_I2C_GET_DATA		0x40
+#define MCP2221_I2C_PARAM_OR_STATUS	0x10
+#define MCP2221_I2C_SET_SPEED		0x20
+#define MCP2221_I2C_CANCEL			0x10
+
+/* Response codes in a raw input report */
+#define MCP2221_SUCCESS				0x00
+#define MCP2221_I2C_ENG_BUSY		0x01
+#define MCP2221_I2C_START_TOUT		0x12
+#define MCP2221_I2C_STOP_TOUT		0x62
+#define MCP2221_I2C_WRADDRL_TOUT	0x23
+#define MCP2221_I2C_WRDATA_TOUT		0x44
+#define MCP2221_I2C_WRADDRL_NACK	0x25
+#define MCP2221_I2C_MASK_ADDR_NACK	0x40
+#define MCP2221_I2C_WRADDRL_SEND	0x21
+#define MCP2221_I2C_ADDR_NACK		0x25
+#define MCP2221_I2C_READ_COMPL		0x55
+
+/*
+ * There is no way to distinguish responses. Therefore next command
+ * is sent only after response to previous has been received. Mutex
+ * lock is used for this purpose mainly.
+ */
+struct mcp2221 {
+	struct hid_device *hdev;
+	struct i2c_adapter adapter;
+	struct mutex lock;
+	struct completion wait_in_report;
+	u8 *rxbuf;
+	u8 txbuf[64];
+	int rxbuf_idx;
+	int status;
+	u8 cur_i2c_clk_div;
+};
+
+/*
+ * Default i2c bus clock frequency in kHz. Override through
+ * module param if required.
+ */
+static uint i2c_clk_freq = 400;
+
+/* Synchronously send output report to the device */
+static int mcp_send_report(struct mcp2221 *mcp,
+					u8 *out_report, size_t len)
+{
+	u8 *buf;
+	int ret;
+
+	buf = kmemdup(out_report, len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* mcp2221 uses interrupt endpoint for out reports */
+	ret = hid_hw_output_report(mcp->hdev, buf, len);
+	kfree(buf);
+
+	if (ret < 0)
+		return ret;
+	return 0;
+}
+
+/*
+ * Send o/p report to the device and wait for i/p report to be
+ * received from the device. If the device does not respond,
+ * we timeout.
+ */
+static int mcp_send_data_req_status(struct mcp2221 *mcp,
+			u8 *out_report, int len)
+{
+	int ret;
+	unsigned long t;
+
+	reinit_completion(&mcp->wait_in_report);
+
+	ret = mcp_send_report(mcp, out_report, len);
+	if (ret)
+		return ret;
+
+	t = wait_for_completion_timeout(&mcp->wait_in_report,
+							msecs_to_jiffies(4000));
+	if (!t)
+		return -ETIMEDOUT;
+
+	return mcp->status;
+}
+
+/* Check pass/fail for actual communication with i2c slave */
+static int mcp_chk_last_cmd_status(struct mcp2221 *mcp)
+{
+	int x;
+
+	mcp->txbuf[0] = MCP2221_I2C_PARAM_OR_STATUS;
+
+	for (x = 1; x < 8; x++)
+		mcp->txbuf[x] = 0;
+
+	return mcp_send_data_req_status(mcp, mcp->txbuf, 8);
+}
+
+/* Cancels last command releasing i2c bus just in case occupied */
+static int mcp_cancel_last_cmd(struct mcp2221 *mcp)
+{
+	int x;
+
+	mcp->txbuf[0] = MCP2221_I2C_PARAM_OR_STATUS;
+	mcp->txbuf[1] = 0;
+	mcp->txbuf[2] = MCP2221_I2C_CANCEL;
+
+	for (x = 3; x < 8; x++)
+		mcp->txbuf[x] = 0;
+
+	return mcp_send_data_req_status(mcp, mcp->txbuf, 8);
+}
+
+static int mcp_set_i2c_speed(struct mcp2221 *mcp)
+{
+	int ret;
+
+	mcp->txbuf[0] = MCP2221_I2C_PARAM_OR_STATUS;
+	mcp->txbuf[1] = 0;
+	mcp->txbuf[2] = 0;
+	mcp->txbuf[3] = MCP2221_I2C_SET_SPEED;
+	mcp->txbuf[4] = mcp->cur_i2c_clk_div;
+	mcp->txbuf[5] = 0;
+	mcp->txbuf[6] = 0;
+	mcp->txbuf[7] = 0;
+
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 8);
+	if (ret) {
+		/* Small delay is needed here */
+		usleep_range(980, 1000);
+		mcp_cancel_last_cmd(mcp);
+	}
+
+	return 0;
+}
+
+/*
+ * An output report can contain minimum 1 and maximum 60 user data
+ * bytes. If the number of data bytes is more then 60, we send it
+ * in chunks of 60 bytes. Last chunk may contain exactly 60 or less
+ * bytes. Total number of bytes is informed in very first report to
+ * mcp2221, from that point onwards it first collect all the data
+ * from host and then send to i2c slave device.
+ */
+static int mcp_i2c_write(struct mcp2221 *mcp,
+				struct i2c_msg *msg, int type, u8 last_status)
+{
+	int ret, len, idx, loop_count, remainder;
+
+	mcp->txbuf[0] = type;
+	mcp->txbuf[1] = msg->len & 0xff;
+	mcp->txbuf[2] = msg->len >> 8;
+	mcp->txbuf[3] = (u8)(msg->addr << 1);
+
+	if (msg->len < 60)
+		len = msg->len;
+	else
+		len = 60;
+	memcpy(&mcp->txbuf[4], msg->buf, len);
+
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, len + 4);
+	if (ret)
+		return ret;
+
+	if (last_status) {
+		usleep_range(980, 1000);
+
+		ret = mcp_chk_last_cmd_status(mcp);
+		if (ret)
+			return ret;
+	}
+
+	if (msg->len <= 60)
+		return ret;
+
+	loop_count = (msg->len - 60) / 60;
+	remainder = (msg->len - 60) % 60;
+
+	if (loop_count == 0)
+		len = remainder;
+	else
+		len = 60;
+
+	idx = 60;
+	do {
+		/*
+		 * Testing shows delay is needed between successive writes
+		 * otherwise next write fails on first-try from i2c core.
+		 * This value is obtained through automated stress testing.
+		 */
+		usleep_range(980, 1000);
+
+		memcpy(&mcp->txbuf[4], &msg->buf[idx], len);
+
+		ret = mcp_send_data_req_status(mcp, mcp->txbuf, len + 4);
+		if (ret)
+			return ret;
+
+		usleep_range(980, 1000);
+
+		ret = mcp_chk_last_cmd_status(mcp);
+		if (ret)
+			return ret;
+
+		loop_count--;
+		idx = idx + len;
+		if (loop_count <= 0)
+			len = remainder;
+		else
+			len = 60;
+	} while (len > 0 && idx < msg->len);
+
+	return ret;
+}
+
+/*
+ * Device reads all data (0 - 65535 bytes) from i2c slave device and
+ * stores it in device itself. This data is read back from device to
+ * host in multiples of 60 bytes using input reports.
+ */
+static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
+				struct i2c_msg *msg, int type, u16 smbus_addr,
+				u8 smbus_len, u8 *smbus_buf)
+{
+	int ret;
+	u16 total_len;
+
+	mcp->txbuf[0] = type;
+	if (msg) {
+		mcp->txbuf[1] = msg->len & 0xff;
+		mcp->txbuf[2] = msg->len >> 8;
+		mcp->txbuf[3] = (u8)(msg->addr << 1);
+		total_len = msg->len;
+		mcp->rxbuf = msg->buf;
+	} else {
+		mcp->txbuf[1] = smbus_len;
+		mcp->txbuf[2] = 0;
+		mcp->txbuf[3] = (u8)(smbus_addr << 1);
+		total_len = smbus_len;
+		mcp->rxbuf = smbus_buf;
+	}
+
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 4);
+	if (ret)
+		return ret;
+
+	mcp->rxbuf_idx = 0;
+
+	do {
+		mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
+		mcp->txbuf[1] = 0;
+		mcp->txbuf[2] = 0;
+		mcp->txbuf[3] = 0;
+
+		ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+		if (ret)
+			return ret;
+
+		ret = mcp_chk_last_cmd_status(mcp);
+		if (ret)
+			return ret;
+	} while (mcp->rxbuf_idx < total_len);
+
+	return ret;
+}
+
+static int mcp_i2c_xfer(struct i2c_adapter *adapter,
+				struct i2c_msg msgs[], int num)
+{
+	int ret;
+	struct mcp2221 *mcp = i2c_get_adapdata(adapter);
+
+	hid_hw_power(mcp->hdev, PM_HINT_FULLON);
+
+	mutex_lock(&mcp->lock);
+
+	/* Setting speed before every transaction is required for mcp2221 */
+	ret = mcp_set_i2c_speed(mcp);
+	if (ret)
+		goto exit;
+
+	if (num == 1) {
+		if (msgs->flags & I2C_M_RD) {
+			ret = mcp_i2c_smbus_read(mcp, msgs, MCP2221_I2C_RD_DATA,
+							0, 0, NULL);
+		} else {
+			ret = mcp_i2c_write(mcp, msgs, MCP2221_I2C_WR_DATA, 1);
+		}
+		if (ret)
+			goto exit;
+		ret = num;
+	} else if (num == 2) {
+		/* Ex transaction; send reg address and read its contents */
+		if (msgs[0].addr == msgs[1].addr &&
+			!(msgs[0].flags & I2C_M_RD) &&
+			 (msgs[1].flags & I2C_M_RD)) {
+
+			ret = mcp_i2c_write(mcp, &msgs[0],
+						MCP2221_I2C_WR_NO_STOP, 0);
+			if (ret)
+				goto exit;
+
+			ret = mcp_i2c_smbus_read(mcp, &msgs[1],
+						MCP2221_I2C_RD_RPT_START,
+						0, 0, NULL);
+			if (ret)
+				goto exit;
+			ret = num;
+		} else {
+			dev_err(&adapter->dev,
+				"unsupported i2c transaction size: %d\n", num);
+			ret = -EOPNOTSUPP;
+		}
+	} else {
+		dev_err(&adapter->dev,
+			"unsupported i2c transaction size: %d\n", num);
+		ret = -EOPNOTSUPP;
+	}
+
+exit:
+	hid_hw_power(mcp->hdev, PM_HINT_NORMAL);
+	mutex_unlock(&mcp->lock);
+	return ret;
+}
+
+static int mcp_smbus_write(struct mcp2221 *mcp, u16 addr,
+				u8 command, u8 *buf, u8 len, int type,
+				u8 last_status)
+{
+	int data_len, ret;
+
+	mcp->txbuf[0] = type;
+	mcp->txbuf[1] = len;
+	mcp->txbuf[2] = 0;
+	mcp->txbuf[3] = (u8)(addr << 1);
+	mcp->txbuf[4] = command;
+
+	switch (len) {
+	case 0:
+		mcp->txbuf[1] = 1;
+		data_len = 5;
+		break;
+	case 1:
+		mcp->txbuf[5] = buf[0];
+		data_len = 6;
+		break;
+	case 2:
+		mcp->txbuf[5] = buf[0];
+		mcp->txbuf[6] = buf[1];
+		data_len = 7;
+		break;
+	default:
+		memcpy(&mcp->txbuf[5], buf, len);
+		data_len = len + 5;
+	}
+
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, data_len);
+	if (ret)
+		return ret;
+
+	if (last_status) {
+		usleep_range(980, 1000);
+
+		ret = mcp_chk_last_cmd_status(mcp);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
+				unsigned short flags, char read_write,
+				u8 command, int size,
+				union i2c_smbus_data *data)
+{
+	int ret;
+	struct mcp2221 *mcp = i2c_get_adapdata(adapter);
+
+	hid_hw_power(mcp->hdev, PM_HINT_FULLON);
+
+	mutex_lock(&mcp->lock);
+
+	ret = mcp_set_i2c_speed(mcp);
+	if (ret)
+		goto exit;
+
+	switch (size) {
+
+	case I2C_SMBUS_QUICK:
+		if (read_write == I2C_SMBUS_READ)
+			ret = mcp_i2c_smbus_read(mcp, NULL, MCP2221_I2C_RD_DATA,
+						addr, 0, &data->byte);
+		else
+			ret = mcp_smbus_write(mcp, addr, command, NULL,
+						0, MCP2221_I2C_WR_DATA, 1);
+		break;
+	case I2C_SMBUS_BYTE:
+		if (read_write == I2C_SMBUS_READ)
+			ret = mcp_i2c_smbus_read(mcp, NULL, MCP2221_I2C_RD_DATA,
+						addr, 1, &data->byte);
+		else
+			ret = mcp_smbus_write(mcp, addr, command, NULL,
+						0, MCP2221_I2C_WR_DATA, 1);
+		break;
+	case I2C_SMBUS_BYTE_DATA:
+		if (read_write == I2C_SMBUS_READ) {
+			ret = mcp_smbus_write(mcp, addr, command, NULL,
+						0, MCP2221_I2C_WR_NO_STOP, 0);
+			if (ret)
+				goto exit;
+
+			ret = mcp_i2c_smbus_read(mcp, NULL,
+						MCP2221_I2C_RD_RPT_START,
+						addr, 1, &data->byte);
+		} else {
+			ret = mcp_smbus_write(mcp, addr, command, &data->byte,
+						1, MCP2221_I2C_WR_DATA, 1);
+		}
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		if (read_write == I2C_SMBUS_READ) {
+			ret = mcp_smbus_write(mcp, addr, command, NULL,
+						0, MCP2221_I2C_WR_NO_STOP, 0);
+			if (ret)
+				goto exit;
+
+			ret = mcp_i2c_smbus_read(mcp, NULL,
+						MCP2221_I2C_RD_RPT_START,
+						addr, 2, (u8 *)&data->word);
+		} else {
+			ret = mcp_smbus_write(mcp, addr, command,
+						(u8 *)&data->word, 2,
+						MCP2221_I2C_WR_DATA, 1);
+		}
+		break;
+	case I2C_SMBUS_BLOCK_DATA:
+		if (read_write == I2C_SMBUS_READ) {
+			ret = mcp_smbus_write(mcp, addr, command, NULL,
+						0, MCP2221_I2C_WR_NO_STOP, 0);
+			if (ret)
+				goto exit;
+
+			mcp->rxbuf = data->block;
+			mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
+			ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+			if (ret)
+				goto exit;
+		} else {
+			if (!data->block[0]) {
+				ret = -EINVAL;
+				goto exit;
+			}
+			ret = mcp_smbus_write(mcp, addr, command, data->block,
+						data->block[0] + 1,
+						MCP2221_I2C_WR_DATA, 1);
+		}
+		break;
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		if (read_write == I2C_SMBUS_READ) {
+			ret = mcp_smbus_write(mcp, addr, command, NULL,
+						0, MCP2221_I2C_WR_NO_STOP, 1);
+			if (ret)
+				goto exit;
+
+			mcp->rxbuf = data->block;
+			mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
+			ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+			if (ret)
+				goto exit;
+		} else {
+			if (!data->block[0]) {
+				ret = -EINVAL;
+				goto exit;
+			}
+			ret = mcp_smbus_write(mcp, addr, command,
+						&data->block[1], data->block[0],
+						MCP2221_I2C_WR_DATA, 1);
+		}
+		break;
+	case I2C_SMBUS_PROC_CALL:
+		ret = mcp_smbus_write(mcp, addr, command,
+						(u8 *)&data->word,
+						2, MCP2221_I2C_WR_NO_STOP, 0);
+		if (ret)
+			goto exit;
+
+		ret = mcp_i2c_smbus_read(mcp, NULL,
+						MCP2221_I2C_RD_RPT_START,
+						addr, 2, (u8 *)&data->word);
+		break;
+	case I2C_SMBUS_BLOCK_PROC_CALL:
+		ret = mcp_smbus_write(mcp, addr, command, data->block,
+						data->block[0] + 1,
+						MCP2221_I2C_WR_NO_STOP, 0);
+		if (ret)
+			goto exit;
+
+		ret = mcp_i2c_smbus_read(mcp, NULL,
+						MCP2221_I2C_RD_RPT_START,
+						addr, I2C_SMBUS_BLOCK_MAX,
+						data->block);
+		break;
+
+	default:
+		dev_err(&mcp->adapter.dev,
+			"unsupported smbus transaction size:%d\n", size);
+		ret = -EOPNOTSUPP;
+	}
+
+exit:
+	hid_hw_power(mcp->hdev, PM_HINT_NORMAL);
+	mutex_unlock(&mcp->lock);
+	return ret;
+}
+
+static u32 mcp_i2c_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C |
+			I2C_FUNC_SMBUS_READ_BLOCK_DATA |
+			I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
+			(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_PEC);
+}
+
+static const struct i2c_algorithm mcp_i2c_algo = {
+	.master_xfer = mcp_i2c_xfer,
+	.smbus_xfer = mcp_smbus_xfer,
+	.functionality = mcp_i2c_func,
+};
+
+static int mcp_get_i2c_eng_state(struct mcp2221 *mcp,
+				u8 *data, u8 idx)
+{
+	int ret;
+
+	switch (data[idx]) {
+	case MCP2221_I2C_WRADDRL_NACK:
+	case MCP2221_I2C_WRADDRL_SEND:
+		ret = -ENXIO;
+		break;
+	case MCP2221_I2C_START_TOUT:
+	case MCP2221_I2C_STOP_TOUT:
+	case MCP2221_I2C_WRADDRL_TOUT:
+	case MCP2221_I2C_WRDATA_TOUT:
+		ret = -ETIMEDOUT;
+		break;
+	case MCP2221_I2C_ENG_BUSY:
+		ret = -EAGAIN;
+		break;
+	case MCP2221_SUCCESS:
+		ret = 0x00;
+		break;
+	default:
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+/*
+ * MCP2221 uses interrupt endpoint for input reports. This function
+ * is called by HID layer when it receives i/p report from mcp2221,
+ * which is actually a response to the previously sent command.
+ *
+ * MCP2221A firmware specific return codes are parsed and 0 or
+ * appropriate negative error code is returned. Delayed response
+ * results in timeout error and stray reponses results in -EIO.
+ */
+static int mcp2221_raw_event(struct hid_device *hdev,
+				struct hid_report *report, u8 *data, int size)
+{
+	u8 *buf;
+	struct mcp2221 *mcp = hid_get_drvdata(hdev);
+
+	switch (data[0]) {
+
+	case MCP2221_I2C_WR_DATA:
+	case MCP2221_I2C_WR_NO_STOP:
+	case MCP2221_I2C_RD_DATA:
+	case MCP2221_I2C_RD_RPT_START:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			mcp->status = 0;
+			break;
+		default:
+			mcp->status = mcp_get_i2c_eng_state(mcp, data, 2);
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
+	case MCP2221_I2C_PARAM_OR_STATUS:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			if ((mcp->txbuf[3] == MCP2221_I2C_SET_SPEED) &&
+				(data[3] != MCP2221_I2C_SET_SPEED)) {
+				mcp->status = -EAGAIN;
+				break;
+			}
+			if (data[20] & MCP2221_I2C_MASK_ADDR_NACK) {
+				mcp->status = -ENXIO;
+				break;
+			}
+			mcp->status = mcp_get_i2c_eng_state(mcp, data, 8);
+			break;
+		default:
+			mcp->status = -EIO;
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
+	case MCP2221_I2C_GET_DATA:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			if (data[2] == MCP2221_I2C_ADDR_NACK) {
+				mcp->status = -ENXIO;
+				break;
+			}
+			if (!mcp_get_i2c_eng_state(mcp, data, 2)
+				&& (data[3] == 0)) {
+				mcp->status = 0;
+				break;
+			}
+			if (data[3] == 127) {
+				mcp->status = -EIO;
+				break;
+			}
+			if (data[2] == MCP2221_I2C_READ_COMPL) {
+				buf = mcp->rxbuf;
+				memcpy(&buf[mcp->rxbuf_idx], &data[4], data[3]);
+				mcp->rxbuf_idx = mcp->rxbuf_idx + data[3];
+				mcp->status = 0;
+				break;
+			}
+			mcp->status = -EIO;
+			break;
+		default:
+			mcp->status = -EIO;
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
+	default:
+		mcp->status = -EIO;
+		complete(&mcp->wait_in_report);
+	}
+
+	return 1;
+}
+
+static int mcp2221_probe(struct hid_device *hdev,
+					const struct hid_device_id *id)
+{
+	int ret;
+	struct mcp2221 *mcp;
+	struct usb_device *usd = to_usb_device(hdev->dev.parent->parent);
+
+	mcp = devm_kzalloc(&hdev->dev, sizeof(*mcp), GFP_KERNEL);
+	if (!mcp)
+		return -ENOMEM;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "can't parse reports\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hdev, "can't start hardware\n");
+		return ret;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "can't open device\n");
+		goto err_hstop;
+	}
+
+	mutex_init(&mcp->lock);
+	init_completion(&mcp->wait_in_report);
+	hid_set_drvdata(hdev, mcp);
+	mcp->hdev = hdev;
+
+	/* Set I2C bus clock diviser */
+	if (i2c_clk_freq > 400)
+		i2c_clk_freq = 400;
+	if (i2c_clk_freq < 50)
+		i2c_clk_freq = 50;
+	mcp->cur_i2c_clk_div = (12000000 / (i2c_clk_freq * 1000)) - 3;
+
+	mcp->adapter.owner = THIS_MODULE;
+	mcp->adapter.class = I2C_CLASS_HWMON;
+	mcp->adapter.algo = &mcp_i2c_algo;
+	mcp->adapter.retries = 1;
+	mcp->adapter.dev.parent = &hdev->dev;
+	snprintf(mcp->adapter.name, sizeof(mcp->adapter.name),
+		"mcp2221 at usb bus %03d dev %03d", usd->bus->busnum,
+		usd->devnum);
+
+	ret = i2c_add_adapter(&mcp->adapter);
+	if (ret) {
+		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
+		goto err_i2c;
+	}
+	i2c_set_adapdata(&mcp->adapter, mcp);
+
+	return 0;
+
+err_i2c:
+	hid_hw_close(mcp->hdev);
+err_hstop:
+	hid_hw_stop(mcp->hdev);
+	return ret;
+}
+
+static void mcp2221_remove(struct hid_device *hdev)
+{
+	struct mcp2221 *mcp = hid_get_drvdata(hdev);
+
+	i2c_del_adapter(&mcp->adapter);
+	hid_hw_close(mcp->hdev);
+	hid_hw_stop(mcp->hdev);
+}
+
+static const struct hid_device_id mcp2221_devices[] = {
+	{ HID_USB_DEVICE(0x04d8, 0x00dd) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, mcp2221_devices);
+
+static struct hid_driver mcp2221_driver = {
+	.name		= "mcp2221",
+	.id_table	= mcp2221_devices,
+	.probe		= mcp2221_probe,
+	.remove		= mcp2221_remove,
+	.raw_event	= mcp2221_raw_event,
+};
+
+/* Register with HID core */
+module_hid_driver(mcp2221_driver);
+
+/* I2C bus clock frequency can be set only during driver loading */
+module_param(i2c_clk_freq, uint, 0444);
+MODULE_PARM_DESC(i2c_clk_freq, "I2C bus clock frequency 50-400 kHz");
+
+MODULE_AUTHOR("Rishi Gupta <gupt21@gmail.com>");
+MODULE_DESCRIPTION("MCP2221 Silicon Labs HID USB to I2C master bridge");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 0e7b2d9..ee815eb 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -473,6 +473,9 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_GAMECUBE1) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_GAMECUBE2) },
 #endif
+#if IS_ENABLED(CONFIG_HID_MCP2221)
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_MCP2221) },
+#endif
 #if IS_ENABLED(CONFIG_HID_MICROSOFT)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_COMFORT_MOUSE_4500) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_COMFORT_KEYBOARD) },
-- 
2.7.4

