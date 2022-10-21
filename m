Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93F65641B5C
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Dec 2022 08:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiLDHwJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Dec 2022 02:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLDHwI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Dec 2022 02:52:08 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C0517062
        for <linux-i2c@vger.kernel.org>; Sat,  3 Dec 2022 23:52:03 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id 21so8631330pfw.4
        for <linux-i2c@vger.kernel.org>; Sat, 03 Dec 2022 23:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMmTFEhM5kDFADAJclzVZPShmCmZQODVD5HcW2B6AvE=;
        b=u8bjVGRW7q69RC80d7rZ1GJBta2Bk8E+f7ZKPBrnLEnPSM7Rl24qRiU/4ixRNrdHg3
         k+NMxF6ShCJWmXTxsFnAV53ofxPbLePr57wRY/FB7bbniA6bhyR37Ox7IamJBCbbo557
         fNpR2O2TSQuBznbhkfDfT6iXwJAHcLGMNWcZWOOdTkGIODrf/RQy6konzl0EWciORpGA
         kS6Ce1Mys3C0wKERjsEiAdRbLNVmBagSrxEI3d6F2SOXJqBhNKd9wMZxHd1KAYXYLQT3
         C9bOcgbjWP3tMHtENTBM4qiDscirStiudB7elJYnOWSsHt2NS5ZsTV0Z10i1G7MnMUf0
         xiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMmTFEhM5kDFADAJclzVZPShmCmZQODVD5HcW2B6AvE=;
        b=0m9IuNGwkV82oIiGQN8yTHorAHDKlQOll3x37mcWXYw+SLnpbQ2srKmfWb5SQmQ+nx
         ceL9RU/MSKSEZnLPBRACA7996jcfFy0qMKTqmHVYBec0xXa2xUL5A9eY5foB2tLPHS2B
         y/oQDuqin+fT0kNkYa3+f8QqE4rA++RkdsUSfJPpnYMaFAwpENfyvRHu99zEldXI+hzz
         JKsDnId4DUf1I3Suc/3WvSYdVrjgelQGJyTpmQ6CLpJvZYmejMNnQzGkSga8QNOkEXHN
         04AVAIfSNg8rg4wEerkmtv8NjX6e2pPuVaoaRcRg6G/9TTUlMWVNFceWLsPG/L/So5uO
         WuFg==
X-Gm-Message-State: ANoB5pl3VhsfbyY4/oKlN4AH2whIqyokThg2/K2pM3NObggOnhCZAO1M
        flkYQJaxNdhMymUXc77LJhBrIw==
X-Google-Smtp-Source: AA0mqf6R3vPlRuIjWCs/4uQ8HY1oY3sssi1WzxzG+fdsedM79tW7e424BFZJe40taC0TcrlxO5HH0Q==
X-Received: by 2002:a63:e411:0:b0:45f:b2a7:2659 with SMTP id a17-20020a63e411000000b0045fb2a72659mr52718736pgi.132.1670140323113;
        Sat, 03 Dec 2022 23:52:03 -0800 (PST)
Received: from localhost ([121.99.145.49])
        by smtp.gmail.com with ESMTPSA id w64-20020a17090a6bc600b00219025945dcsm9084606pjj.19.2022.12.03.23.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 23:52:02 -0800 (PST)
Message-ID: <638c51a2.170a0220.3af16.18f8@mx.google.com>
From:   Daniel Beer <daniel.beer@igorinstitute.com>
Date:   Sat, 22 Oct 2022 11:19:20 +1300
Subject: [PATCH] hid-ft260: add UART support.
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Christina Quast <contact@christina-quast.de>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Based on an earlier patch submitted by Christina Quast:

    https://patches.linaro.org/project/linux-serial/patch/20220928192421.11908-1-contact@christina-quast.de/

Simplified and reworked to use the UART API rather than the TTY layer
directly. Transmit, receive and baud rate changes are supported.

Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
---
 drivers/hid/hid-ft260.c          | 586 +++++++++++++++++++++++++++++--
 include/uapi/linux/major.h       |   2 +
 include/uapi/linux/serial_core.h |   3 +
 3 files changed, 552 insertions(+), 39 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 333341e80b0e..0d0afb5ec3da 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -13,6 +13,17 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/usb.h>
+#include <linux/serial.h>
+#include <linux/serial_core.h>
+#include <linux/kfifo.h>
+#include <linux/tty_flip.h>
+#include <linux/minmax.h>
+#include <linux/timer.h>
+#include <asm-generic/unaligned.h>
+
+#define UART_COUNT_MAX		4	/* Number of UARTs this driver can handle */
+#define FIFO_SIZE	256
+#define TTY_WAKEUP_WATERMARK	(FIFO_SIZE / 2)
 
 #ifdef DEBUG
 static int ft260_debug = 1;
@@ -30,8 +41,8 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 
 #define FT260_REPORT_MAX_LENGTH (64)
 #define FT260_I2C_DATA_REPORT_ID(len) (FT260_I2C_REPORT_MIN + (len - 1) / 4)
-
 #define FT260_WAKEUP_NEEDED_AFTER_MS (4800) /* 5s minus 200ms margin */
+#define FT260_UART_DATA_REPORT_ID(len) (FT260_UART_REPORT_MIN + (len - 1) / 4)
 
 /*
  * The ft260 input report format defines 62 bytes for the data payload, but
@@ -81,7 +92,8 @@ enum {
 	FT260_UART_INTERRUPT_STATUS	= 0xB1,
 	FT260_UART_STATUS		= 0xE0,
 	FT260_UART_RI_DCD_STATUS	= 0xE1,
-	FT260_UART_REPORT		= 0xF0,
+	FT260_UART_REPORT_MIN		= 0xF0,
+	FT260_UART_REPORT_MAX		= 0xFE,
 };
 
 /* Feature Out */
@@ -220,12 +232,59 @@ struct ft260_i2c_read_request_report {
 	__le16 length;		/* data payload length */
 } __packed;
 
-struct ft260_i2c_input_report {
-	u8 report;		/* FT260_I2C_REPORT */
+struct ft260_input_report {
+	u8 report;		/* FT260_I2C_REPORT or FT260_UART_REPORT */
 	u8 length;		/* data payload length */
-	u8 data[2];		/* data payload */
+	u8 data[0];		/* data payload */
+} __packed;
+
+/* UART reports */
+
+struct ft260_uart_write_request_report {
+	u8 report;			/* FT260_UART_REPORT */
+	u8 length;			/* data payload length */
+	u8 data[FT260_WR_DATA_MAX];	/* data payload */
+} __packed;
+
+struct ft260_configure_uart_request {
+	u8 report;		/* FT260_SYSTEM_SETTINGS */
+	u8 request;		/* FT260_SET_UART_CONFIG */
+	u8 flow_ctrl;		/* 0: OFF, 1: RTS_CTS, 2: DTR_DSR */
+				/* 3: XON_XOFF, 4: No flow ctrl */
+	__le32 baudrate;	/* little endian, 9600 = 0x2580, 19200 = 0x4B00 */
+	u8 data_bit;		/* 7 or 8 */
+	u8 parity;		/* 0: no parity, 1: odd, 2: even, 3: high, 4: low */
+	u8 stop_bit;		/* 0: one stop bit, 1: 2 stop bits */
+	u8 breaking;		/* 0: no break */
 } __packed;
 
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
+	FT260_CFG_STOP_TWO_BIT		= 0x01,
+
+	FT260_CFG_BREAKING_NO		= 0x00,
+	FT260_CFG_BREAKING_YES		= 0x01,
+
+	FT260_CFG_BAUD_MIN		= 1200,
+	FT260_CFG_BAUD_MAX		= 12000000,
+};
+
 static const struct hid_device_id ft260_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FUTURE_TECHNOLOGY,
 			 USB_DEVICE_ID_FT260) },
@@ -236,6 +295,7 @@ MODULE_DEVICE_TABLE(hid, ft260_devices);
 struct ft260_device {
 	struct i2c_adapter adap;
 	struct hid_device *hdev;
+
 	struct completion wait;
 	struct mutex lock;
 	u8 write_buf[FT260_REPORT_MAX_LENGTH];
@@ -244,6 +304,13 @@ struct ft260_device {
 	u16 read_idx;
 	u16 read_len;
 	u16 clock;
+
+	int ft260_is_serial;
+	struct uart_port port;
+	struct work_struct tx_work;
+
+	struct timer_list wakeup_timer;
+	struct work_struct wakeup_work;
 };
 
 static int ft260_hid_feature_report_get(struct hid_device *hdev,
@@ -803,12 +870,12 @@ static int ft260_is_interface_enabled(struct hid_device *hdev)
 	case FT260_MODE_ALL:
 	case FT260_MODE_BOTH:
 		if (interface == 1)
-			hid_info(hdev, "uart interface is not supported\n");
+			ret = 2;
 		else
 			ret = 1;
 		break;
 	case FT260_MODE_UART:
-		hid_info(hdev, "uart interface is not supported\n");
+		ret = 2;
 		break;
 	case FT260_MODE_I2C:
 		ret = 1;
@@ -957,6 +1024,427 @@ static const struct attribute_group ft260_attr_group = {
 	}
 };
 
+static struct ft260_device *ft260_uart_table[UART_COUNT_MAX];
+static DEFINE_MUTEX(ft260_uart_table_lock);
+
+static int ft260_tx_data(struct ft260_device *port, const u8 *data,
+			 unsigned int len)
+{
+	struct ft260_uart_write_request_report *rep =
+		(struct ft260_uart_write_request_report *)port->write_buf;
+
+	while (len) {
+		unsigned int r = len;
+		int ret;
+
+		if (r > FT260_WR_DATA_MAX)
+			r = FT260_WR_DATA_MAX;
+
+		rep->report = FT260_UART_DATA_REPORT_ID(r);
+		rep->length = r;
+		memcpy(rep->data, data, r);
+
+		ret = ft260_hid_output_report(port->hdev, port->write_buf,
+			r + sizeof(*rep));
+		if (ret < 0) {
+			hid_err(port->hdev,
+				"%s: failed to start transfer, ret %d\n",
+				__func__, ret);
+			return ret;
+		}
+
+		data += r;
+		len -= r;
+	}
+
+	return 0;
+}
+
+/* The FT260 has a "power saving mode" that causes the device to switch
+ * to a 30 kHz oscillator if there's no activity for 5 seconds.
+ * Unfortunately this mode can only be disabled by reprogramming
+ * internal fuses, which requires an additional programming voltage.
+ *
+ * One effect of this mode is to cause data loss on a fast UART that
+ * transmits after being idle for longer than 5 seconds. We work around
+ * this by sending a dummy report at least once per 4 seconds if the
+ * UART is in use.
+ */
+static void ft260_uart_start_wakeup(struct timer_list *t)
+{
+	struct ft260_device *dev =
+		container_of(t, struct ft260_device, wakeup_timer);
+
+	schedule_work(&dev->wakeup_work);
+	mod_timer(&dev->wakeup_timer, jiffies +
+		msecs_to_jiffies(FT260_WAKEUP_NEEDED_AFTER_MS));
+}
+
+static void ft260_uart_do_wakeup(struct work_struct *work)
+{
+	struct ft260_device *dev =
+		container_of(work, struct ft260_device, wakeup_work);
+	struct ft260_get_chip_version_report version;
+	int ret;
+
+	ret = ft260_hid_feature_report_get(dev->hdev, FT260_CHIP_VERSION,
+					   (u8 *)&version, sizeof(version));
+	if (ret < 0)
+		hid_err(dev->hdev,
+			"%s: failed to start transfer, ret %d\n",
+			__func__, ret);
+}
+
+static void ft260_uart_do_tx(struct work_struct *work)
+{
+	struct ft260_device *dev =
+		container_of(work, struct ft260_device, tx_work);
+	struct uart_port *port = &dev->port;
+	struct circ_buf *xmit = &port->state->xmit;
+	int to_send;
+
+	if (port->x_char) {
+		ft260_tx_data(dev, (u8 *)&port->x_char, 1);
+		port->x_char = 0;
+	}
+
+	if (uart_circ_empty(xmit) || uart_tx_stopped(port))
+		return;
+
+	to_send = uart_circ_chars_pending(xmit);
+
+	if (to_send) {
+		int until_end = CIRC_CNT_TO_END(xmit->head,
+			xmit->tail, UART_XMIT_SIZE);
+
+		if (until_end < to_send) {
+			ft260_tx_data(dev, xmit->buf + xmit->tail, until_end);
+			ft260_tx_data(dev, xmit->buf, to_send - until_end);
+		} else {
+			ft260_tx_data(dev, xmit->buf + xmit->tail, to_send);
+		}
+
+		port->icount.tx += to_send;
+		xmit->tail = (xmit->tail + to_send) & (UART_XMIT_SIZE - 1);
+	}
+
+	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
+		uart_write_wakeup(port);
+}
+
+static void ft260_uart_start_tx(struct uart_port *port)
+{
+	struct ft260_device *dev =
+		container_of(port, struct ft260_device, port);
+
+	schedule_work(&dev->tx_work);
+}
+
+static void ft260_uart_stop_tx(struct uart_port *port)
+{
+	struct ft260_device *dev =
+		container_of(port, struct ft260_device, port);
+
+	cancel_work(&dev->tx_work);
+}
+
+static void ft260_uart_receive_chars(struct ft260_device *dev,
+				     u8 *data, u8 length)
+{
+	struct uart_port *port = &dev->port;
+	int i;
+
+	for (i = 0; i < length; i++)
+		uart_insert_char(port, 0, 0, data[i], TTY_NORMAL);
+	port->icount.rx += length;
+
+	tty_flip_buffer_push(&port->state->port);
+}
+
+static void ft260_uart_set_termios(struct uart_port *port,
+				   struct ktermios *termios,
+				   const struct ktermios *old_termios)
+{
+	struct ft260_device *dev = container_of(port, struct ft260_device, port);
+	struct hid_device *hdev = dev->hdev;
+	unsigned int baud;
+	struct ft260_configure_uart_request req;
+	int ret;
+
+	ft260_dbg("%s uart\n", __func__);
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
+		hid_err(hdev,
+			"Invalid data bit size, setting to default (8 bit)\n");
+		termios->c_cflag &= ~CSIZE;
+		termios->c_cflag |= CS8;
+		fallthrough;
+	default:
+	case CS8:
+		req.data_bit = 0x08;
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
+		hid_err(hdev,
+			"Invalid baud rate %d, setting to default (9600)\n",
+			baud);
+		baud = 9600;
+		tty_termios_encode_baud_rate(termios, baud, baud);
+	}
+	put_unaligned_le32(baud, &req.baudrate);
+
+	if (termios->c_cflag & CRTSCTS)
+		req.flow_ctrl = FT260_CFG_FLOW_CTRL_RTS_CTS;
+	else
+		req.flow_ctrl = FT260_CFG_FLOW_CTRL_NONE;
+
+	ft260_dbg("Configured termios: flow control: %d, baudrate: %d, ",
+		  req.flow_ctrl, baud);
+	ft260_dbg("data_bit: %d, parity: %d, stop_bit: %d, breaking: %d\n",
+		  req.data_bit, req.parity,
+		  req.stop_bit, req.breaking);
+
+	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
+	if (ret < 0)
+		hid_err(hdev, "ft260_hid_feature_report_set failed: %d\n", ret);
+}
+
+static int ft260_i2c_probe(struct hid_device *hdev, struct ft260_device *dev)
+{
+	int ret;
+
+	ft260_dbg("%s i2c\n", __func__);
+
+	dev->adap.owner = THIS_MODULE;
+	dev->adap.class = I2C_CLASS_HWMON;
+	dev->adap.algo = &ft260_i2c_algo;
+	dev->adap.quirks = &ft260_i2c_quirks;
+	dev->adap.dev.parent = &hdev->dev;
+	snprintf(dev->adap.name, sizeof(dev->adap.name),
+		 "FT260 usb-i2c bridge");
+
+	ret = ft260_xfer_status(dev, FT260_I2C_STATUS_BUS_BUSY);
+	if (ret)
+		ft260_i2c_reset(hdev);
+
+	i2c_set_adapdata(&dev->adap, dev);
+	ret = i2c_add_adapter(&dev->adap);
+	if (ret) {
+		hid_err(hdev, "failed to add i2c adapter\n");
+		return ret;
+	}
+
+	ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
+	if (ret < 0) {
+		hid_err(hdev, "failed to create sysfs attrs\n");
+		goto err_i2c_free;
+	}
+err_i2c_free:
+	i2c_del_adapter(&dev->adap);
+	return ret;
+}
+
+static unsigned int ft260_uart_tx_empty(struct uart_port *port)
+{
+	/* Not implemented */
+	return TIOCSER_TEMT;
+}
+
+static unsigned int ft260_uart_get_mctrl(struct uart_port *port)
+{
+	/* Not implemented */
+	return TIOCM_DSR | TIOCM_CAR;
+}
+
+static void ft260_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
+{
+	/* Not implemented */
+}
+
+static void ft260_uart_break_ctl(struct uart_port *port, int break_state)
+{
+	/* Not implemented */
+}
+
+static int ft260_uart_startup(struct uart_port *port)
+{
+	struct ft260_device *dev =
+		container_of(port, struct ft260_device, port);
+
+	ft260_dbg("%s uart\n", __func__);
+	mod_timer(&dev->wakeup_timer, jiffies +
+		msecs_to_jiffies(FT260_WAKEUP_NEEDED_AFTER_MS));
+	return 0;
+}
+
+static void ft260_uart_shutdown(struct uart_port *port)
+{
+	struct ft260_device *dev =
+		container_of(port, struct ft260_device, port);
+
+	ft260_dbg("%s uart\n", __func__);
+	del_timer_sync(&dev->wakeup_timer);
+}
+
+static const char *ft260_uart_type(struct uart_port *port)
+{
+	return (port->type == PORT_FT260) ? "FT260 UART" : NULL;
+}
+
+static int ft260_uart_request_port(struct uart_port *port)
+{
+	/* Not implemented */
+	ft260_dbg("%s uart\n", __func__);
+	return 0;
+}
+
+static void ft260_uart_release_port(struct uart_port *port)
+{
+	/* Not implemented */
+	ft260_dbg("%s uart\n", __func__);
+}
+
+static void ft260_uart_config_port(struct uart_port *port, int flags)
+{
+	ft260_dbg("%s uart\n", __func__);
+	port->type = PORT_FT260;
+}
+
+static int ft260_uart_verify_port(struct uart_port *port,
+				  struct serial_struct *ser)
+{
+	if (ser->type != PORT_UNKNOWN && ser->type != PORT_FT260)
+		return -EINVAL;
+	return 0;
+}
+
+static void ft260_uart_stop_rx(struct uart_port *port)
+{
+	/* Not implemented */
+}
+
+static const struct uart_ops ft260_uart_ops = {
+	.tx_empty	= ft260_uart_tx_empty,
+	.get_mctrl	= ft260_uart_get_mctrl,
+	.set_mctrl	= ft260_uart_set_mctrl,
+	.start_tx	= ft260_uart_start_tx,
+	.stop_tx	= ft260_uart_stop_tx,
+	.stop_rx	= ft260_uart_stop_rx,
+	.break_ctl	= ft260_uart_break_ctl,
+	.startup	= ft260_uart_startup,
+	.shutdown	= ft260_uart_shutdown,
+	.set_termios	= ft260_uart_set_termios,
+	.type		= ft260_uart_type,
+	.request_port	= ft260_uart_request_port,
+	.release_port	= ft260_uart_release_port,
+	.config_port	= ft260_uart_config_port,
+	.verify_port	= ft260_uart_verify_port,
+};
+
+static struct uart_driver ft260_uart_driver = {
+	.owner		= THIS_MODULE,
+	.driver_name	= "ft260_uart",
+	.dev_name	= "ttyFT",
+	.major		= FT260_MAJOR,
+	.minor		= 0,
+	.nr		= UART_COUNT_MAX,
+};
+
+static int alloc_port_number(struct ft260_device *dev)
+{
+	int ret = -ENOMEM;
+	int i;
+
+	mutex_lock(&ft260_uart_table_lock);
+	for (i = 0; i < ARRAY_SIZE(ft260_uart_table); i++) {
+		if (!ft260_uart_table[i]) {
+			ft260_uart_table[i] = dev;
+			ret = i;
+			break;
+		}
+	}
+	mutex_unlock(&ft260_uart_table_lock);
+
+	return ret;
+}
+
+static void free_port_number(struct ft260_device *dev)
+{
+	int line = dev->port.line;
+
+	mutex_lock(&ft260_uart_table_lock);
+	WARN_ON(ft260_uart_table[line] != dev);
+	ft260_uart_table[line] = NULL;
+	mutex_unlock(&ft260_uart_table_lock);
+}
+
+static int ft260_uart_probe(struct hid_device *hdev, struct ft260_device *dev)
+{
+	struct ft260_configure_uart_request req;
+	int line;
+	int ret;
+
+	ft260_dbg("%s uart\n", __func__);
+
+	/* Send Feature Report to Configure FT260 as UART 9600-8-N-1 */
+	memset(&req, 0, sizeof(req));
+	req.report = FT260_SYSTEM_SETTINGS;
+	req.request = FT260_SET_UART_CONFIG;
+	req.flow_ctrl = FT260_CFG_FLOW_CTRL_NONE;
+	put_unaligned_le32(9600, &req.baudrate);
+	req.data_bit = FT260_CFG_DATA_BITS_8;
+	req.parity = FT260_CFG_PAR_NO;
+	req.stop_bit = FT260_CFG_STOP_ONE_BIT;
+	req.breaking = FT260_CFG_BREAKING_NO;
+
+	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
+	if (ret < 0) {
+		hid_err(hdev, "ft260_hid_feature_report_set failed: %d\n", ret);
+		return ret;
+	}
+
+	line = alloc_port_number(dev);
+	if (line < 0) {
+		hid_err(hdev, "too many ports\n");
+		return line;
+	}
+
+	dev->port.line = line;
+	dev->port.type = PORT_FT260;
+	dev->port.dev = &hdev->dev;
+	dev->port.iotype = SERIAL_IO_MEM;
+	dev->port.ops = &ft260_uart_ops;
+	dev->port.flags = UPF_BOOT_AUTOCONF;
+
+	INIT_WORK(&dev->tx_work, ft260_uart_do_tx);
+	INIT_WORK(&dev->wakeup_work, ft260_uart_do_wakeup);
+	timer_setup(&dev->wakeup_timer, ft260_uart_start_wakeup, 0);
+
+	uart_add_one_port(&ft260_uart_driver, &dev->port);
+	return 0;
+}
+
 static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct ft260_device *dev;
@@ -1009,38 +1497,21 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	hid_set_drvdata(hdev, dev);
 	dev->hdev = hdev;
-	dev->adap.owner = THIS_MODULE;
-	dev->adap.class = I2C_CLASS_HWMON;
-	dev->adap.algo = &ft260_i2c_algo;
-	dev->adap.quirks = &ft260_i2c_quirks;
-	dev->adap.dev.parent = &hdev->dev;
-	snprintf(dev->adap.name, sizeof(dev->adap.name),
-		 "FT260 usb-i2c bridge");
-
 	mutex_init(&dev->lock);
 	init_completion(&dev->wait);
 
-	ret = ft260_xfer_status(dev, FT260_I2C_STATUS_BUS_BUSY);
-	if (ret)
-		ft260_i2c_reset(hdev);
-
-	i2c_set_adapdata(&dev->adap, dev);
-	ret = i2c_add_adapter(&dev->adap);
-	if (ret) {
-		hid_err(hdev, "failed to add i2c adapter\n");
-		goto err_hid_close;
-	}
-
-	ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
-	if (ret < 0) {
-		hid_err(hdev, "failed to create sysfs attrs\n");
-		goto err_i2c_free;
+	if (!dev->ft260_is_serial) {
+		ret = ft260_i2c_probe(hdev, dev);
+		if (ret)
+			goto err_hid_close;
+	} else {
+		ret = ft260_uart_probe(hdev, dev);
+		if (ret)
+			goto err_hid_close;
 	}
 
 	return 0;
 
-err_i2c_free:
-	i2c_del_adapter(&dev->adap);
 err_hid_close:
 	hid_hw_close(hdev);
 err_hid_stop:
@@ -1055,8 +1526,15 @@ static void ft260_remove(struct hid_device *hdev)
 	if (!dev)
 		return;
 
-	sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
-	i2c_del_adapter(&dev->adap);
+	if (dev->ft260_is_serial) {
+		cancel_work_sync(&dev->tx_work);
+		cancel_work_sync(&dev->wakeup_work);
+		uart_remove_one_port(&ft260_uart_driver, &dev->port);
+		free_port_number(dev);
+	} else {
+		sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
+		i2c_del_adapter(&dev->adap);
+	}
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
@@ -1066,10 +1544,11 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
 			   u8 *data, int size)
 {
 	struct ft260_device *dev = hid_get_drvdata(hdev);
-	struct ft260_i2c_input_report *xfer = (void *)data;
+	struct ft260_input_report *xfer = (void *)data;
 
 	if (xfer->report >= FT260_I2C_REPORT_MIN &&
-	    xfer->report <= FT260_I2C_REPORT_MAX) {
+	    xfer->report <= FT260_I2C_REPORT_MAX &&
+	    !dev->ft260_is_serial) {
 		ft260_dbg("i2c resp: rep %#02x len %d\n", xfer->report,
 			  xfer->length);
 
@@ -1086,10 +1565,14 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
 
 		if (dev->read_idx == dev->read_len)
 			complete(&dev->wait);
-
+	} else if (xfer->report >= FT260_UART_REPORT_MIN &&
+		   xfer->report <= FT260_UART_REPORT_MAX &&
+		   dev->ft260_is_serial) {
+		ft260_uart_receive_chars(dev, xfer->data, xfer->length);
 	} else {
 		hid_err(hdev, "unhandled report %#02x\n", xfer->report);
 	}
+
 	return 0;
 }
 
@@ -1101,7 +1584,32 @@ static struct hid_driver ft260_driver = {
 	.raw_event	= ft260_raw_event,
 };
 
-module_hid_driver(ft260_driver);
-MODULE_DESCRIPTION("FTDI FT260 USB HID to I2C host bridge");
+static int __init ft260_driver_init(void)
+{
+	int ret;
+
+	ret = uart_register_driver(&ft260_uart_driver);
+	if (ret)
+		return ret;
+
+	ret = hid_register_driver(&(ft260_driver));
+	if (ret) {
+		pr_err("hid_register_driver failed: %d\n", ret);
+		uart_unregister_driver(&ft260_uart_driver);
+	}
+
+	return ret;
+}
+
+static void __exit ft260_driver_exit(void)
+{
+	hid_unregister_driver(&(ft260_driver));
+	uart_unregister_driver(&ft260_uart_driver);
+}
+
+module_init(ft260_driver_init);
+module_exit(ft260_driver_exit);
+
+MODULE_DESCRIPTION("FTDI FT260 USB HID to I2C host bridge and TTY driver");
 MODULE_AUTHOR("Michael Zaidman <michael.zaidman@gmail.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/include/uapi/linux/major.h b/include/uapi/linux/major.h
index 4e5f2b3a3d54..dc5845114228 100644
--- a/include/uapi/linux/major.h
+++ b/include/uapi/linux/major.h
@@ -175,4 +175,6 @@
 #define BLOCK_EXT_MAJOR		259
 #define SCSI_OSD_MAJOR		260	/* open-osd's OSD scsi device */
 
+#define FT260_MAJOR		261
+
 #endif
diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
index 3ba34d8378bd..d9a7025f467e 100644
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@ -276,4 +276,7 @@
 /* Sunplus UART */
 #define PORT_SUNPLUS	123
 
+/* FT260 HID UART */
+#define PORT_FT260	124
+
 #endif /* _UAPILINUX_SERIAL_CORE_H */
-- 
2.38.1

