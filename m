Return-Path: <linux-i2c+bounces-12909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74FAB54770
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 11:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C099A487081
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 09:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6BD2DBF5E;
	Fri, 12 Sep 2025 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giIEzZaD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5E2BD031
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668835; cv=none; b=FdHwviPpDtmn+nGUCoKsgM9leq7wOAU+7kld7uy3fkOxaiHhWX/7v43WZaZfaQfgQP4I1GZX2WpNnZLV+et2cda6/A1nArQTlbsHJzfUV8O8+R48wfvlqe0Q2nimkzuPvikAtLX3vkgD9snZghfws6ATTHHqzGoMYlBhNS43qFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668835; c=relaxed/simple;
	bh=HkybItgWsl/oXbonoIb9QHF4/ozjXmoQbseBPzeQG9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IU2oaHA8Pi0458veU+6OSU3DVlW0Sqox7ubUWsGNT9JgJRtzZ1sGWfewOgi7hB/w98UXdDzMa2Rjj6TmGaz1PnulK7IqZ5LhBft83JSgnuYFMfe8LitncpHWEnmF9RI2bWXsO1wdfWb0EVvKfHr/Tjz2aDaJxE+712KN6GFPVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giIEzZaD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77619f3f41aso162549b3a.2
        for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 02:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757668831; x=1758273631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRcT8VqkwLwp7YG0RleYXMM2y/9hrkdErwWkWKqV8QQ=;
        b=giIEzZaDe0jDHthCd69R1YXntfQsquGL1B+iNnKcMev7s4t7oDs+YgaJHSRJQH+0gH
         simx0EGK2pPOtx0sNgkXoWIUG54ISiyfGeSV3taRs0jzOtBpLXzmtjWec0unBOESWJWE
         r9s2EmuOoo5ZurF2gJUcucZ0mA6KxoyD/M6rfpYMM3svRHIrKyNXIGncMxElXyJ3sAAG
         iTuyCWMhDb0b1njaiwwPAGP3byeF5aB973ZMVFXBoNt81S7p7t9FxyP+3/9H46unhbrn
         1kRZ05LgpE2gwAwDO8BswIq/0gCtJKUetyXwYe7wRinpEJeG8Izclk7coKCFwvfSejvA
         2gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668831; x=1758273631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRcT8VqkwLwp7YG0RleYXMM2y/9hrkdErwWkWKqV8QQ=;
        b=HnzbRHPAZbWafRViHWXSaccMx/o0EJunfGUI6gIGm7TILXkag+8MLB6vJHZMiK7ZLm
         sqRq6Nhgd4E66xO2H3tg7SvqoUWO/sqjl/Fgn7OXCqiaqFSShDDnG0CH/kebX8UiKACi
         UF0wZz0Zid44UmZF7wZsE0Njb8ySF4TK9Gh8FKDIGz1/rkRpJF2qo5xX0voCh7vF+G4d
         Vdzwg515vizVEJN2tQLGKXa1D+uJI5ciNO+ReFKVa3Kgz1/VgBjdCatSXhk315kYBozj
         82zfXgDAiWaZ45YDCq9V3hz2PArHWkA+BKoQCnuioYccyAVf9Ha4np9vA4eGFxCLHEX2
         /HJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL281F/m2tQp+n2F3udaDEj6IK2miFYxKQOY0EeTAxMSe33ncyVt67IaNER+pzLiZ46hiM8MIeHL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvyZh5ht1hEb+coSljWsSiTGV9LIUiqG8ncLj/plpleln6KybI
	Eqsmr0Jm5QMIU0+3Lsm3WKZPW3zskkN2gRZYlaoySwmbqL+rnBl9SvPQ
X-Gm-Gg: ASbGncvcNv+yaALqRGHcmu045ym1J21q/QFa4lr5c1u3l3RFS/or/ZxUx/m/6JNMP9C
	ubEADq64ZUrJ7OQ6IZEiux/c/P35jReN4XxZqYep0QsmhHoMpUIBCUEn0n2ulbmDwNL9/d637Z/
	SoLeDe21SkpqjDe/+4WNDcmGk4JDio6qMu3PMs+F4q95lLb3Ccl42i5SCkKeJ18CghZ+ReUmi35
	4zusv8oVLjt7EfF3TcAzHGY9aH0kCU9aDt8jwYR6YNXtD3L1Kfz99/4wFvCdFadAflfvxdQEHVm
	CluWERQxXWU1JoLQysmqiQIVlpV4lntZLR0sYJYQiibNG3yBbKbRjf9vuZFDiZKDNy/8IPwTdBf
	d1/K0vzNla5zWq2iuSORH6DAIguxtwB4uheZbG0FC4S35Vz7TLSUCxy9zQAlH0dfk3qssRFMGIE
	Fxl9Yri+ucYB0=
X-Google-Smtp-Source: AGHT+IGsF9JCrNfFhWtho1Egk7LavWy2gtT62Xfjcy0Cs/7YTskW3JHRrFksbbA2WfHxm6nKngmZbA==
X-Received: by 2002:a05:6a20:1594:b0:243:78a:8291 with SMTP id adf61e73a8af0-2602cf10c79mr2987235637.56.1757668830513;
        Fri, 12 Sep 2025 02:20:30 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a36dc461sm4066564a12.23.2025.09.12.02.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:20:30 -0700 (PDT)
From: a0282524688@gmail.com
To: tmyu0@nuvoton.com,
	lee@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andi.shyti@kernel.org,
	mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH RESEND v14 4/7] can: Add Nuvoton NCT6694 CANFD support
Date: Fri, 12 Sep 2025 17:19:49 +0800
Message-Id: <20250912091952.1169369-5-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912091952.1169369-1-a0282524688@gmail.com>
References: <20250912091952.1169369-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

This driver supports Socket CANFD functionality for NCT6694 MFD
device based on USB interface.

Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes since version 13:

Changes since version 12:
- Implement IDA in MFD driver to handle per-device IDs
- Use same email address in the signature

Changes since version 11:
- Use platform_device's id to replace IDA
- Update struct data_bittiming_params related part

Changes since version 10:
- Implement IDA to allocate id
- Add header <linux/bitfield.h>
- Add support to config tdc

Changes since version 9:

Changes since version 8:
- Modify the signed-off-by with my work address
- Add irq_dispose_mapping() in the error handling path and in the remove
  function
- Rename all function names nct6694_can_xxx to nct6694_canfd_xxx
- Fix nct6694_canfd_handle_state_change()
- Fix nct6694_canfd_start() to configure NBTP and DBTP
- Add can_set_static_ctrlmode()

Changes since version 7:
- Add error handling for devm_mutex_init()
- Modify the name of the child devices CAN1 and CAN2 to CAN0 and CAN1.
- Fix multiline comments to net-dev style

Changes since version 6:
- Fix nct6694_can_handle_state_change()
- Fix warnings
- Move the nct6694_can_priv's bec to the end

Changes since version 5:
- Modify the module name and the driver name consistently
- Update private data and drop mutex
- Fix nct6694_can_handle_state_change()

Changes since version 4:
- Modify arguments in read/write function to a pointer to cmd_header
- Modify all callers that call the read/write function
- Move the nct6694_canfd.c to drivers/net/can/usb/
- Fix the missing rx offload function

Changes since version 3:
- Modify array buffer to structure
- Fix defines and comments
- Modify mutex_init() to devm_mutex_init()
- Add rx-offload helper

Changes since version 2:
- Add MODULE_ALIAS()
- Rename each command
- Modify each function name consistently

Changes since version 1:
- Add each driver's command structure
- Fix platform driver registration
- Fix errors and warnings
- Fix TX-flow control

 MAINTAINERS                         |   1 +
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 832 ++++++++++++++++++++++++++++
 4 files changed, 845 insertions(+)
 create mode 100644 drivers/net/can/usb/nct6694_canfd.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c8f912cb0b95..758c9a67184e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18088,6 +18088,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
+F:	drivers/net/can/usb/nct6694_canfd.c
 F:	include/linux/mfd/nct6694.h
 
 NUVOTON NCT7201 IIO DRIVER
diff --git a/drivers/net/can/usb/Kconfig b/drivers/net/can/usb/Kconfig
index a7547a83120e..cf65a90816b9 100644
--- a/drivers/net/can/usb/Kconfig
+++ b/drivers/net/can/usb/Kconfig
@@ -134,6 +134,17 @@ config CAN_MCBA_USB
 	  This driver supports the CAN BUS Analyzer interface
 	  from Microchip (http://www.microchip.com/development-tools/).
 
+config CAN_NCT6694
+	tristate "Nuvoton NCT6694 Socket CANfd support"
+	depends on MFD_NCT6694
+	select CAN_RX_OFFLOAD
+	help
+	  If you say yes to this option, support will be included for Nuvoton
+	  NCT6694, a USB device to socket CANfd controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nct6694_canfd.
+
 config CAN_PEAK_USB
 	tristate "PEAK PCAN-USB/USB Pro interfaces for CAN 2.0b/CAN-FD"
 	help
diff --git a/drivers/net/can/usb/Makefile b/drivers/net/can/usb/Makefile
index 8b11088e9a59..fcafb1ac262e 100644
--- a/drivers/net/can/usb/Makefile
+++ b/drivers/net/can/usb/Makefile
@@ -11,5 +11,6 @@ obj-$(CONFIG_CAN_F81604) += f81604.o
 obj-$(CONFIG_CAN_GS_USB) += gs_usb.o
 obj-$(CONFIG_CAN_KVASER_USB) += kvaser_usb/
 obj-$(CONFIG_CAN_MCBA_USB) += mcba_usb.o
+obj-$(CONFIG_CAN_NCT6694) += nct6694_canfd.o
 obj-$(CONFIG_CAN_PEAK_USB) += peak_usb/
 obj-$(CONFIG_CAN_UCAN) += ucan.o
diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nct6694_canfd.c
new file mode 100644
index 000000000000..8deff16491a1
--- /dev/null
+++ b/drivers/net/can/usb/nct6694_canfd.c
@@ -0,0 +1,832 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Nuvoton NCT6694 Socket CANfd driver based on USB interface.
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/can/dev.h>
+#include <linux/can/rx-offload.h>
+#include <linux/ethtool.h>
+#include <linux/idr.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/platform_device.h>
+
+#define DEVICE_NAME "nct6694-canfd"
+
+/* USB command module type for NCT6694 CANfd controller.
+ * This defines the module type used for communication with the NCT6694
+ * CANfd controller over the USB interface.
+ */
+#define NCT6694_CANFD_MOD			0x05
+
+/* Command 00h - CAN Setting and Initialization */
+#define NCT6694_CANFD_SETTING			0x00
+#define NCT6694_CANFD_SETTING_ACTIVE_CTRL1	BIT(0)
+#define NCT6694_CANFD_SETTING_ACTIVE_CTRL2	BIT(1)
+#define NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP	BIT(2)
+#define NCT6694_CANFD_SETTING_CTRL1_MON		BIT(0)
+#define NCT6694_CANFD_SETTING_CTRL1_NISO	BIT(1)
+#define NCT6694_CANFD_SETTING_CTRL1_LBCK	BIT(2)
+#define NCT6694_CANFD_SETTING_NBTP_NTSEG2	GENMASK(6, 0)
+#define NCT6694_CANFD_SETTING_NBTP_NTSEG1	GENMASK(15, 8)
+#define NCT6694_CANFD_SETTING_NBTP_NBRP		GENMASK(24, 16)
+#define NCT6694_CANFD_SETTING_NBTP_NSJW		GENMASK(31, 25)
+#define NCT6694_CANFD_SETTING_DBTP_DSJW		GENMASK(3, 0)
+#define NCT6694_CANFD_SETTING_DBTP_DTSEG2	GENMASK(7, 4)
+#define NCT6694_CANFD_SETTING_DBTP_DTSEG1	GENMASK(12, 8)
+#define NCT6694_CANFD_SETTING_DBTP_DBRP		GENMASK(20, 16)
+#define NCT6694_CANFD_SETTING_DBTP_TDC		BIT(23)
+
+/* Command 01h - CAN Information */
+#define NCT6694_CANFD_INFORMATION		0x01
+#define NCT6694_CANFD_INFORMATION_SEL		0x00
+
+/* Command 02h - CAN Event */
+#define NCT6694_CANFD_EVENT			0x02
+#define NCT6694_CANFD_EVENT_SEL(idx, mask)	\
+	((idx ? 0x80 : 0x00) | ((mask) & 0x7F))
+
+#define NCT6694_CANFD_EVENT_MASK		GENMASK(5, 0)
+#define NCT6694_CANFD_EVT_TX_FIFO_EMPTY		BIT(7)	/* Read-clear */
+#define NCT6694_CANFD_EVT_RX_DATA_LOST		BIT(5)	/* Read-clear */
+#define NCT6694_CANFD_EVT_RX_DATA_IN		BIT(7)	/* Read-clear */
+
+/* Command 10h - CAN Deliver */
+#define NCT6694_CANFD_DELIVER			0x10
+#define NCT6694_CANFD_DELIVER_SEL(buf_cnt)	\
+	((buf_cnt) & 0xFF)
+
+/* Command 11h - CAN Receive */
+#define NCT6694_CANFD_RECEIVE			0x11
+#define NCT6694_CANFD_RECEIVE_SEL(idx, buf_cnt)	\
+	((idx ? 0x80 : 0x00) | ((buf_cnt) & 0x7F))
+
+#define NCT6694_CANFD_FRAME_TAG(idx)		(0xC0 | (idx))
+#define NCT6694_CANFD_FRAME_FLAG_EFF		BIT(0)
+#define NCT6694_CANFD_FRAME_FLAG_RTR		BIT(1)
+#define NCT6694_CANFD_FRAME_FLAG_FD		BIT(2)
+#define NCT6694_CANFD_FRAME_FLAG_BRS		BIT(3)
+#define NCT6694_CANFD_FRAME_FLAG_ERR		BIT(4)
+
+#define NCT6694_NAPI_WEIGHT			32
+
+enum nct6694_event_err {
+	NCT6694_CANFD_EVT_ERR_NO_ERROR = 0,
+	NCT6694_CANFD_EVT_ERR_CRC_ERROR,
+	NCT6694_CANFD_EVT_ERR_STUFF_ERROR,
+	NCT6694_CANFD_EVT_ERR_ACK_ERROR,
+	NCT6694_CANFD_EVT_ERR_FORM_ERROR,
+	NCT6694_CANFD_EVT_ERR_BIT_ERROR,
+	NCT6694_CANFD_EVT_ERR_TIMEOUT_ERROR,
+	NCT6694_CANFD_EVT_ERR_UNKNOWN_ERROR,
+};
+
+enum nct6694_event_status {
+	NCT6694_CANFD_EVT_STS_ERROR_ACTIVE = 0,
+	NCT6694_CANFD_EVT_STS_ERROR_PASSIVE,
+	NCT6694_CANFD_EVT_STS_BUS_OFF,
+	NCT6694_CANFD_EVT_STS_WARNING,
+};
+
+struct __packed nct6694_canfd_setting {
+	__le32 nbr;
+	__le32 dbr;
+	u8 active;
+	u8 reserved[3];
+	__le16 ctrl1;
+	__le16 ctrl2;
+	__le32 nbtp;
+	__le32 dbtp;
+};
+
+struct __packed nct6694_canfd_information {
+	u8 tx_fifo_cnt;
+	u8 rx_fifo_cnt;
+	u8 reserved[2];
+	__le32 can_clk;
+};
+
+struct __packed nct6694_canfd_event {
+	u8 err;
+	u8 status;
+	u8 tx_evt;
+	u8 rx_evt;
+	u8 rec;
+	u8 tec;
+	u8 reserved[2];
+};
+
+struct __packed nct6694_canfd_frame {
+	u8 tag;
+	u8 flag;
+	u8 reserved;
+	u8 length;
+	__le32 id;
+	u8 data[CANFD_MAX_DLEN];
+};
+
+struct nct6694_canfd_priv {
+	struct can_priv can;	/* must be the first member */
+	struct can_rx_offload offload;
+	struct net_device *ndev;
+	struct nct6694 *nct6694;
+	struct workqueue_struct *wq;
+	struct work_struct tx_work;
+	struct nct6694_canfd_frame tx;
+	struct nct6694_canfd_frame rx;
+	struct nct6694_canfd_event event[2];
+	struct can_berr_counter bec;
+};
+
+static inline struct nct6694_canfd_priv *rx_offload_to_priv(struct can_rx_offload *offload)
+{
+	return container_of(offload, struct nct6694_canfd_priv, offload);
+}
+
+static const struct can_bittiming_const nct6694_canfd_bittiming_nominal_const = {
+	.name = DEVICE_NAME,
+	.tseg1_min = 1,
+	.tseg1_max = 256,
+	.tseg2_min = 1,
+	.tseg2_max = 128,
+	.sjw_max = 128,
+	.brp_min = 1,
+	.brp_max = 512,
+	.brp_inc = 1,
+};
+
+static const struct can_bittiming_const nct6694_canfd_bittiming_data_const = {
+	.name = DEVICE_NAME,
+	.tseg1_min = 1,
+	.tseg1_max = 32,
+	.tseg2_min = 1,
+	.tseg2_max = 16,
+	.sjw_max = 16,
+	.brp_min = 1,
+	.brp_max = 32,
+	.brp_inc = 1,
+};
+
+static void nct6694_canfd_rx_offload(struct can_rx_offload *offload,
+				     struct sk_buff *skb)
+{
+	struct nct6694_canfd_priv *priv = rx_offload_to_priv(offload);
+	int ret;
+
+	ret = can_rx_offload_queue_tail(offload, skb);
+	if (ret)
+		priv->ndev->stats.rx_fifo_errors++;
+}
+
+static void nct6694_canfd_handle_lost_msg(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct net_device_stats *stats = &ndev->stats;
+	struct can_frame *cf;
+	struct sk_buff *skb;
+
+	netdev_dbg(ndev, "RX FIFO overflow, message(s) lost.\n");
+
+	stats->rx_errors++;
+	stats->rx_over_errors++;
+
+	skb = alloc_can_err_skb(ndev, &cf);
+	if (!skb)
+		return;
+
+	cf->can_id |= CAN_ERR_CRTL;
+	cf->data[1] = CAN_ERR_CRTL_RX_OVERFLOW;
+
+	nct6694_canfd_rx_offload(&priv->offload, skb);
+}
+
+static void nct6694_canfd_handle_rx(struct net_device *ndev, u8 rx_evt)
+{
+	struct net_device_stats *stats = &ndev->stats;
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct nct6694_canfd_frame *frame = &priv->rx;
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_RECEIVE,
+		.sel = NCT6694_CANFD_RECEIVE_SEL(ndev->dev_port, 1),
+		.len = cpu_to_le16(sizeof(*frame))
+	};
+	struct sk_buff *skb;
+	int ret;
+
+	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, frame);
+	if (ret)
+		return;
+
+	if (frame->flag & NCT6694_CANFD_FRAME_FLAG_FD) {
+		struct canfd_frame *cfd;
+
+		skb = alloc_canfd_skb(priv->ndev, &cfd);
+		if (!skb) {
+			stats->rx_dropped++;
+			return;
+		}
+
+		cfd->can_id = le32_to_cpu(frame->id);
+		cfd->len = canfd_sanitize_len(frame->length);
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_EFF)
+			cfd->can_id |= CAN_EFF_FLAG;
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_BRS)
+			cfd->flags |= CANFD_BRS;
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_ERR)
+			cfd->flags |= CANFD_ESI;
+
+		memcpy(cfd->data, frame->data, cfd->len);
+	} else {
+		struct can_frame *cf;
+
+		skb = alloc_can_skb(priv->ndev, &cf);
+		if (!skb) {
+			stats->rx_dropped++;
+			return;
+		}
+
+		cf->can_id = le32_to_cpu(frame->id);
+		cf->len = can_cc_dlc2len(frame->length);
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_EFF)
+			cf->can_id |= CAN_EFF_FLAG;
+
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_RTR)
+			cf->can_id |= CAN_RTR_FLAG;
+		else
+			memcpy(cf->data, frame->data, cf->len);
+	}
+
+	nct6694_canfd_rx_offload(&priv->offload, skb);
+}
+
+static int nct6694_canfd_get_berr_counter(const struct net_device *ndev,
+					  struct can_berr_counter *bec)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+
+	*bec = priv->bec;
+
+	return 0;
+}
+
+static void nct6694_canfd_handle_state_change(struct net_device *ndev, u8 status)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	enum can_state new_state, rx_state, tx_state;
+	struct can_berr_counter bec;
+	struct can_frame *cf;
+	struct sk_buff *skb;
+
+	nct6694_canfd_get_berr_counter(ndev, &bec);
+	can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);
+
+	new_state = max(tx_state, rx_state);
+
+	/* state hasn't changed */
+	if (new_state == priv->can.state)
+		return;
+
+	skb = alloc_can_err_skb(ndev, &cf);
+
+	can_change_state(ndev, cf, tx_state, rx_state);
+
+	if (new_state == CAN_STATE_BUS_OFF) {
+		can_bus_off(ndev);
+	} else if (cf) {
+		cf->can_id |= CAN_ERR_CNT;
+		cf->data[6] = bec.txerr;
+		cf->data[7] = bec.rxerr;
+	}
+
+	if (skb)
+		nct6694_canfd_rx_offload(&priv->offload, skb);
+}
+
+static void nct6694_canfd_handle_bus_err(struct net_device *ndev, u8 bus_err)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct can_frame *cf;
+	struct sk_buff *skb;
+
+	priv->can.can_stats.bus_error++;
+
+	skb = alloc_can_err_skb(ndev, &cf);
+	if (cf)
+		cf->can_id |= CAN_ERR_PROT | CAN_ERR_BUSERROR;
+
+	switch (bus_err) {
+	case NCT6694_CANFD_EVT_ERR_CRC_ERROR:
+		netdev_dbg(ndev, "CRC error\n");
+		ndev->stats.rx_errors++;
+		if (cf)
+			cf->data[3] |= CAN_ERR_PROT_LOC_CRC_SEQ;
+		break;
+
+	case NCT6694_CANFD_EVT_ERR_STUFF_ERROR:
+		netdev_dbg(ndev, "Stuff error\n");
+		ndev->stats.rx_errors++;
+		if (cf)
+			cf->data[2] |= CAN_ERR_PROT_STUFF;
+		break;
+
+	case NCT6694_CANFD_EVT_ERR_ACK_ERROR:
+		netdev_dbg(ndev, "Ack error\n");
+		ndev->stats.tx_errors++;
+		if (cf) {
+			cf->can_id |= CAN_ERR_ACK;
+			cf->data[2] |= CAN_ERR_PROT_TX;
+		}
+		break;
+
+	case NCT6694_CANFD_EVT_ERR_FORM_ERROR:
+		netdev_dbg(ndev, "Form error\n");
+		ndev->stats.rx_errors++;
+		if (cf)
+			cf->data[2] |= CAN_ERR_PROT_FORM;
+		break;
+
+	case NCT6694_CANFD_EVT_ERR_BIT_ERROR:
+		netdev_dbg(ndev, "Bit error\n");
+		ndev->stats.tx_errors++;
+		if (cf)
+			cf->data[2] |= CAN_ERR_PROT_TX | CAN_ERR_PROT_BIT;
+		break;
+
+	default:
+		break;
+	}
+
+	if (skb)
+		nct6694_canfd_rx_offload(&priv->offload, skb);
+}
+
+static void nct6694_canfd_handle_tx(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct net_device_stats *stats = &ndev->stats;
+
+	stats->tx_bytes += can_rx_offload_get_echo_skb_queue_tail(&priv->offload,
+								  0, NULL);
+	stats->tx_packets++;
+	netif_wake_queue(ndev);
+}
+
+static irqreturn_t nct6694_canfd_irq(int irq, void *data)
+{
+	struct net_device *ndev = data;
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct nct6694_canfd_event *event = &priv->event[ndev->dev_port];
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_EVENT,
+		.sel = NCT6694_CANFD_EVENT_SEL(ndev->dev_port, NCT6694_CANFD_EVENT_MASK),
+		.len = cpu_to_le16(sizeof(priv->event))
+	};
+	irqreturn_t handled = IRQ_NONE;
+	int ret;
+
+	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, priv->event);
+	if (ret < 0)
+		return handled;
+
+	if (event->rx_evt & NCT6694_CANFD_EVT_RX_DATA_IN) {
+		nct6694_canfd_handle_rx(ndev, event->rx_evt);
+		handled = IRQ_HANDLED;
+	}
+
+	if (event->rx_evt & NCT6694_CANFD_EVT_RX_DATA_LOST) {
+		nct6694_canfd_handle_lost_msg(ndev);
+		handled = IRQ_HANDLED;
+	}
+
+	if (event->status) {
+		nct6694_canfd_handle_state_change(ndev, event->status);
+		handled = IRQ_HANDLED;
+	}
+
+	if (event->err != NCT6694_CANFD_EVT_ERR_NO_ERROR) {
+		if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING)
+			nct6694_canfd_handle_bus_err(ndev, event->err);
+		handled = IRQ_HANDLED;
+	}
+
+	if (event->tx_evt & NCT6694_CANFD_EVT_TX_FIFO_EMPTY) {
+		nct6694_canfd_handle_tx(ndev);
+		handled = IRQ_HANDLED;
+	}
+
+	if (handled)
+		can_rx_offload_threaded_irq_finish(&priv->offload);
+
+	priv->bec.rxerr = event->rec;
+	priv->bec.txerr = event->tec;
+
+	return handled;
+}
+
+static void nct6694_canfd_tx_work(struct work_struct *work)
+{
+	struct nct6694_canfd_priv *priv = container_of(work,
+						       struct nct6694_canfd_priv,
+						       tx_work);
+	struct nct6694_canfd_frame *frame = &priv->tx;
+	struct net_device *ndev = priv->ndev;
+	struct net_device_stats *stats = &ndev->stats;
+	struct sk_buff *skb = priv->can.echo_skb[0];
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_DELIVER,
+		.sel = NCT6694_CANFD_DELIVER_SEL(1),
+		.len = cpu_to_le16(sizeof(*frame))
+	};
+	u32 txid;
+	int err;
+
+	memset(frame, 0, sizeof(*frame));
+
+	frame->tag = NCT6694_CANFD_FRAME_TAG(ndev->dev_port);
+
+	if (can_is_canfd_skb(skb)) {
+		struct canfd_frame *cfd = (struct canfd_frame *)skb->data;
+
+		if (cfd->flags & CANFD_BRS)
+			frame->flag |= NCT6694_CANFD_FRAME_FLAG_BRS;
+
+		if (cfd->can_id & CAN_EFF_FLAG) {
+			txid = cfd->can_id & CAN_EFF_MASK;
+			frame->flag |= NCT6694_CANFD_FRAME_FLAG_EFF;
+		} else {
+			txid = cfd->can_id & CAN_SFF_MASK;
+		}
+		frame->flag |= NCT6694_CANFD_FRAME_FLAG_FD;
+		frame->id = cpu_to_le32(txid);
+		frame->length = canfd_sanitize_len(cfd->len);
+
+		memcpy(frame->data, cfd->data, frame->length);
+	} else {
+		struct can_frame *cf = (struct can_frame *)skb->data;
+
+		if (cf->can_id & CAN_EFF_FLAG) {
+			txid = cf->can_id & CAN_EFF_MASK;
+			frame->flag |= NCT6694_CANFD_FRAME_FLAG_EFF;
+		} else {
+			txid = cf->can_id & CAN_SFF_MASK;
+		}
+
+		if (cf->can_id & CAN_RTR_FLAG)
+			frame->flag |= NCT6694_CANFD_FRAME_FLAG_RTR;
+		else
+			memcpy(frame->data, cf->data, cf->len);
+
+		frame->id = cpu_to_le32(txid);
+		frame->length = cf->len;
+	}
+
+	err = nct6694_write_msg(priv->nct6694, &cmd_hd, frame);
+	if (err) {
+		can_free_echo_skb(ndev, 0, NULL);
+		stats->tx_dropped++;
+		stats->tx_errors++;
+		netif_wake_queue(ndev);
+	}
+}
+
+static netdev_tx_t nct6694_canfd_start_xmit(struct sk_buff *skb,
+					    struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+
+	if (can_dev_dropped_skb(ndev, skb))
+		return NETDEV_TX_OK;
+
+	netif_stop_queue(ndev);
+	can_put_echo_skb(skb, ndev, 0, 0);
+	queue_work(priv->wq, &priv->tx_work);
+
+	return NETDEV_TX_OK;
+}
+
+static int nct6694_canfd_start(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	const struct can_bittiming *n_bt = &priv->can.bittiming;
+	const struct can_bittiming *d_bt = &priv->can.fd.data_bittiming;
+	struct nct6694_canfd_setting *setting __free(kfree) = NULL;
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_SETTING,
+		.sel = ndev->dev_port,
+		.len = cpu_to_le16(sizeof(*setting))
+	};
+	u32 en_tdc;
+	int ret;
+
+	setting = kzalloc(sizeof(*setting), GFP_KERNEL);
+	if (!setting)
+		return -ENOMEM;
+
+	if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
+		setting->ctrl1 |= cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_MON);
+
+	if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
+		setting->ctrl1 |= cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_NISO);
+
+	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
+		setting->ctrl1 |= cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_LBCK);
+
+	/* Disable clock divider */
+	setting->ctrl2 = 0;
+
+	setting->nbtp = cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NSJW,
+					       n_bt->sjw - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NBRP,
+					       n_bt->brp - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NTSEG2,
+					       n_bt->phase_seg2 - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NTSEG1,
+					       n_bt->prop_seg + n_bt->phase_seg1 - 1));
+
+	if (d_bt->brp <= 2)
+		en_tdc = NCT6694_CANFD_SETTING_DBTP_TDC;
+	else
+		en_tdc = 0;
+
+	setting->dbtp = cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DSJW,
+					       d_bt->sjw - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DBRP,
+					       d_bt->brp - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSEG2,
+					       d_bt->phase_seg2 - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSEG1,
+					       d_bt->prop_seg + d_bt->phase_seg1 - 1) |
+				    en_tdc);
+
+	setting->active = NCT6694_CANFD_SETTING_ACTIVE_CTRL1 |
+			  NCT6694_CANFD_SETTING_ACTIVE_CTRL2 |
+			  NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP;
+
+	ret = nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
+	if (ret)
+		return ret;
+
+	priv->can.state = CAN_STATE_ERROR_ACTIVE;
+
+	return 0;
+}
+
+static void nct6694_canfd_stop(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct nct6694_canfd_setting *setting __free(kfree) = NULL;
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_SETTING,
+		.sel = ndev->dev_port,
+		.len = cpu_to_le16(sizeof(*setting))
+	};
+
+	/* The NCT6694 cannot be stopped. To ensure safe operation and avoid
+	 * interference, the control mode is set to Listen-Only mode. This
+	 * mode allows the device to monitor bus activity without actively
+	 * participating in communication.
+	 */
+	setting = kzalloc(sizeof(*setting), GFP_KERNEL);
+	if (!setting)
+		return;
+
+	nct6694_read_msg(priv->nct6694, &cmd_hd, setting);
+	setting->ctrl1 = cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_MON);
+	setting->active = NCT6694_CANFD_SETTING_ACTIVE_CTRL1;
+	nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
+
+	priv->can.state = CAN_STATE_STOPPED;
+}
+
+static int nct6694_canfd_close(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+
+	netif_stop_queue(ndev);
+	nct6694_canfd_stop(ndev);
+	destroy_workqueue(priv->wq);
+	free_irq(ndev->irq, ndev);
+	can_rx_offload_disable(&priv->offload);
+	close_candev(ndev);
+	return 0;
+}
+
+static int nct6694_canfd_set_mode(struct net_device *ndev, enum can_mode mode)
+{
+	int ret;
+
+	switch (mode) {
+	case CAN_MODE_START:
+		ret = nct6694_canfd_start(ndev);
+		if (ret)
+			return ret;
+
+		netif_wake_queue(ndev);
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+static int nct6694_canfd_open(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	int ret;
+
+	ret = open_candev(ndev);
+	if (ret)
+		return ret;
+
+	can_rx_offload_enable(&priv->offload);
+
+	ret = request_threaded_irq(ndev->irq, NULL,
+				   nct6694_canfd_irq, IRQF_ONESHOT,
+				   "nct6694_canfd", ndev);
+	if (ret) {
+		netdev_err(ndev, "Failed to request IRQ\n");
+		goto can_rx_offload_disable;
+	}
+
+	priv->wq = alloc_ordered_workqueue("%s-nct6694_wq",
+					   WQ_FREEZABLE | WQ_MEM_RECLAIM,
+					   ndev->name);
+	if (!priv->wq) {
+		ret = -ENOMEM;
+		goto free_irq;
+	}
+
+	ret = nct6694_canfd_start(ndev);
+	if (ret)
+		goto destroy_wq;
+
+	netif_start_queue(ndev);
+
+	return 0;
+
+destroy_wq:
+	destroy_workqueue(priv->wq);
+free_irq:
+	free_irq(ndev->irq, ndev);
+can_rx_offload_disable:
+	can_rx_offload_disable(&priv->offload);
+	close_candev(ndev);
+	return ret;
+}
+
+static const struct net_device_ops nct6694_canfd_netdev_ops = {
+	.ndo_open = nct6694_canfd_open,
+	.ndo_stop = nct6694_canfd_close,
+	.ndo_start_xmit = nct6694_canfd_start_xmit,
+	.ndo_change_mtu = can_change_mtu,
+};
+
+static const struct ethtool_ops nct6694_canfd_ethtool_ops = {
+	.get_ts_info = ethtool_op_get_ts_info,
+};
+
+static int nct6694_canfd_get_clock(struct nct6694_canfd_priv *priv)
+{
+	struct nct6694_canfd_information *info __free(kfree) = NULL;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_INFORMATION,
+		.sel = NCT6694_CANFD_INFORMATION_SEL,
+		.len = cpu_to_le16(sizeof(*info))
+	};
+	int ret;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, info);
+	if (ret)
+		return ret;
+
+	return le32_to_cpu(info->can_clk);
+}
+
+static int nct6694_canfd_probe(struct platform_device *pdev)
+{
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct nct6694_canfd_priv *priv;
+	struct net_device *ndev;
+	int port, irq, ret, can_clk;
+
+	port = ida_alloc(&nct6694->canfd_ida, GFP_KERNEL);
+	if (port < 0)
+		return port;
+
+	irq = irq_create_mapping(nct6694->domain,
+				 NCT6694_IRQ_CAN0 + port);
+	if (!irq) {
+		ret = -EINVAL;
+		goto free_ida;
+	}
+
+	ndev = alloc_candev(sizeof(struct nct6694_canfd_priv), 1);
+	if (!ndev) {
+		ret = -ENOMEM;
+		goto dispose_irq;
+	}
+
+	ndev->irq = irq;
+	ndev->flags |= IFF_ECHO;
+	ndev->dev_port = port;
+	ndev->netdev_ops = &nct6694_canfd_netdev_ops;
+	ndev->ethtool_ops = &nct6694_canfd_ethtool_ops;
+
+	priv = netdev_priv(ndev);
+	priv->nct6694 = nct6694;
+	priv->ndev = ndev;
+
+	can_clk = nct6694_canfd_get_clock(priv);
+	if (can_clk < 0) {
+		ret = dev_err_probe(&pdev->dev, can_clk,
+				    "Failed to get clock\n");
+		goto free_candev;
+	}
+
+	INIT_WORK(&priv->tx_work, nct6694_canfd_tx_work);
+
+	priv->can.clock.freq = can_clk;
+	priv->can.bittiming_const = &nct6694_canfd_bittiming_nominal_const;
+	priv->can.fd.data_bittiming_const = &nct6694_canfd_bittiming_data_const;
+	priv->can.do_set_mode = nct6694_canfd_set_mode;
+	priv->can.do_get_berr_counter = nct6694_canfd_get_berr_counter;
+	priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK |
+		CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING |
+		CAN_CTRLMODE_FD_NON_ISO;
+
+	ret = can_set_static_ctrlmode(ndev, CAN_CTRLMODE_FD);
+	if (ret)
+		goto free_candev;
+
+	ret = can_rx_offload_add_manual(ndev, &priv->offload,
+					NCT6694_NAPI_WEIGHT);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "Failed to add rx_offload\n");
+		goto free_candev;
+	}
+
+	platform_set_drvdata(pdev, priv);
+	SET_NETDEV_DEV(priv->ndev, &pdev->dev);
+
+	ret = register_candev(priv->ndev);
+	if (ret)
+		goto rx_offload_del;
+
+	return 0;
+
+rx_offload_del:
+	can_rx_offload_del(&priv->offload);
+free_candev:
+	free_candev(ndev);
+dispose_irq:
+	irq_dispose_mapping(irq);
+free_ida:
+	ida_free(&nct6694->canfd_ida, port);
+	return ret;
+}
+
+static void nct6694_canfd_remove(struct platform_device *pdev)
+{
+	struct nct6694_canfd_priv *priv = platform_get_drvdata(pdev);
+	struct nct6694 *nct6694 = priv->nct6694;
+	struct net_device *ndev = priv->ndev;
+	int port = ndev->dev_port;
+	int irq = ndev->irq;
+
+	unregister_candev(ndev);
+	can_rx_offload_del(&priv->offload);
+	free_candev(ndev);
+	irq_dispose_mapping(irq);
+	ida_free(&nct6694->canfd_ida, port);
+}
+
+static struct platform_driver nct6694_canfd_driver = {
+	.driver = {
+		.name	= DEVICE_NAME,
+	},
+	.probe		= nct6694_canfd_probe,
+	.remove		= nct6694_canfd_remove,
+};
+
+module_platform_driver(nct6694_canfd_driver);
+
+MODULE_DESCRIPTION("USB-CAN FD driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


