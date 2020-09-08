Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB6F261F4C
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 22:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732262AbgIHUBv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 16:01:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7264 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732582AbgIHUB0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 16:01:26 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 088K0urT029137;
        Tue, 8 Sep 2020 16:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mwl+xjJTA3PtBzyEYrKktAJb0WXR7n7VdUze2QgexjI=;
 b=btuHUGXWQB8ysA1C+x+cEuPoU0oaoY3D/dwndFROAmQC+yFMg1BMLs/TpEzvFgYqdL2y
 xXTTScis/eZM1k6C7izvsMt/mUSxaxGwdVpYOmwd0+Xda1bpcxLa81h42vXI2Bv3AJ73
 yZPi38Bz+UiP12ZQbv+81wSfR3tDRGGivFHbUqiR7JI+FOq9wMe/I0avUp6HPiurg6wJ
 mj6G6dZZi3gf2GPyNiPHTjtVujIDf/GVgzus4DB2EyT7KmSaiIVy3t6zR2YHNAAUv1+I
 rtHZALK1e0XqyszFQy5f6IuJSUP8MSje4KbwCZnPgYrElY0l0nenUNU8duzLdfGR0LIf Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33egm100ns-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 16:01:08 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 088K18FG030016;
        Tue, 8 Sep 2020 16:01:08 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33egm100m9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 16:01:07 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088JvbvP002957;
        Tue, 8 Sep 2020 20:01:05 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma01wdc.us.ibm.com with ESMTP id 33c2a8svw0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 20:01:05 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 088K0xih64946514
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 8 Sep 2020 20:00:59 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A15156A064;
        Tue,  8 Sep 2020 20:01:04 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EA1886A047;
        Tue,  8 Sep 2020 20:01:03 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.24.203])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue,  8 Sep 2020 20:01:03 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v2 2/5] input: misc: Add IBM Operation Panel driver
Date:   Tue,  8 Sep 2020 15:00:58 -0500
Message-Id: <20200908200101.64974-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908200101.64974-1-eajames@linux.ibm.com>
References: <20200908200101.64974-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-08_09:2020-09-08,2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=1 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080179
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a driver to get the button events from the panel and provide
them to userspace with the input subsystem. The panel is
connected with I2C and controls the bus, so the driver registers
as an I2C slave device.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS                    |   1 +
 drivers/input/misc/Kconfig     |  18 ++++
 drivers/input/misc/Makefile    |   1 +
 drivers/input/misc/ibm-panel.c | 192 +++++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 drivers/input/misc/ibm-panel.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d83eada50e4..0f9605c4cfc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8350,6 +8350,7 @@ M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/ibm,op-panel.yaml
+F:	drivers/input/misc/ibm-panel.c
 
 IBM Power 842 compression accelerator
 M:	Haren Myneni <haren@us.ibm.com>
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 362e8a01980c..65ab1ce7b259 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -708,6 +708,24 @@ config INPUT_ADXL34X_SPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called adxl34x-spi.
 
+config INPUT_IBM_PANEL
+	tristate "IBM Operation Panel driver"
+	depends on I2C_SLAVE || COMPILE_TEST
+	help
+	  Say Y here if you have an IBM Operation Panel connected to your system
+	  over I2C. The panel is typically connected only to a system's service
+	  processor (BMC).
+
+	  If unsure, say N.
+
+	  The Operation Panel is a controller with some buttons and an LCD
+	  display that allows someone with physical access to the system to
+	  perform various administrative tasks. This driver only supports the part
+	  of the controller that sends commands to the system.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called ibm-panel.
+
 config INPUT_IMS_PCU
 	tristate "IMS Passenger Control Unit driver"
 	depends on USB
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index a48e5f2d859d..7e9edf0a142b 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_INPUT_GPIO_DECODER)	+= gpio_decoder.o
 obj-$(CONFIG_INPUT_GPIO_VIBRA)		+= gpio-vibra.o
 obj-$(CONFIG_INPUT_HISI_POWERKEY)	+= hisi_powerkey.o
 obj-$(CONFIG_HP_SDC_RTC)		+= hp_sdc_rtc.o
+obj-$(CONFIG_INPUT_IBM_PANEL)		+= ibm-panel.o
 obj-$(CONFIG_INPUT_IMS_PCU)		+= ims-pcu.o
 obj-$(CONFIG_INPUT_IQS269A)		+= iqs269a.o
 obj-$(CONFIG_INPUT_IXP4XX_BEEPER)	+= ixp4xx-beeper.o
diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-panel.c
new file mode 100644
index 000000000000..7b147b090c2a
--- /dev/null
+++ b/drivers/input/misc/ibm-panel.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) IBM Corporation 2020
+ */
+
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/spinlock.h>
+
+#define DEVICE_NAME	"ibm-panel"
+
+struct ibm_panel {
+	u8 idx;
+	u8 command[11];
+	spinlock_t lock;	/* protects writes to idx and command */
+	struct input_dev *input;
+};
+
+static void ibm_panel_process_command(struct ibm_panel *panel, u8 command_size)
+{
+	u8 i;
+	u8 chksum;
+	u16 sum = 0;
+	int pressed;
+	int released;
+
+	if (command_size != sizeof(panel->command)) {
+		dev_dbg(&panel->input->dev, "command size incorrect\n");
+		return;
+	}
+
+	if (panel->command[0] != 0xff && panel->command[1] != 0xf0) {
+		dev_dbg(&panel->input->dev, "command invalid\n");
+		return;
+	}
+
+	for (i = 0; i < sizeof(panel->command) - 1; ++i) {
+		sum += panel->command[i];
+		if (sum & 0xff00) {
+			sum &= 0xff;
+			sum++;
+		}
+	}
+
+	chksum = sum & 0xff;
+	chksum = ~chksum;
+	chksum++;
+
+	if (chksum != panel->command[sizeof(panel->command) - 1]) {
+		dev_dbg(&panel->input->dev, "command failed checksum\n");
+		return;
+	}
+
+	released = panel->command[2] & 0x80;
+	pressed = released ? 0 : 1;
+
+	switch (panel->command[2] & 0xf) {
+	case 0:
+		input_report_key(panel->input, BTN_NORTH, pressed);
+		break;
+	case 1:
+		input_report_key(panel->input, BTN_SOUTH, pressed);
+		break;
+	case 2:
+		input_report_key(panel->input, BTN_SELECT, pressed);
+		break;
+	default:
+		dev_dbg(&panel->input->dev, "unknown command %u\n",
+			panel->command[2] & 0xf);
+		return;
+	}
+
+	input_sync(panel->input);
+}
+
+static int ibm_panel_i2c_slave_cb(struct i2c_client *client,
+				  enum i2c_slave_event event, u8 *val)
+{
+	u8 command_size = 0;
+	unsigned long flags;
+	struct ibm_panel *panel = i2c_get_clientdata(client);
+
+	dev_dbg(&panel->input->dev, "event: %u data: %02x\n", event, *val);
+
+	spin_lock_irqsave(&panel->lock, flags);
+
+	switch (event) {
+	case I2C_SLAVE_STOP:
+		command_size = panel->idx;
+		fallthrough;
+	case I2C_SLAVE_WRITE_REQUESTED:
+		panel->idx = 0;
+		break;
+	case I2C_SLAVE_WRITE_RECEIVED:
+		if (panel->idx < sizeof(panel->command))
+			panel->command[panel->idx++] = *val;
+		else
+			/*
+			 * The command is too long and therefore invalid, so set the index
+			 * to it's largest possible value. When a STOP is finally received,
+			 * the command will be rejected upon processing.
+			 */
+			panel->idx = U8_MAX;
+		break;
+	default:
+		break;
+	}
+
+	spin_unlock_irqrestore(&panel->lock, flags);
+
+	if (command_size)
+		ibm_panel_process_command(panel, command_size);
+
+	return 0;
+}
+
+static int ibm_panel_probe(struct i2c_client *client,
+			   const struct i2c_device_id *id)
+{
+	int rc;
+	struct ibm_panel *panel = devm_kzalloc(&client->dev, sizeof(*panel),
+					       GFP_KERNEL);
+
+	if (!panel)
+		return -ENOMEM;
+
+	panel->input = devm_input_allocate_device(&client->dev);
+	if (!panel->input)
+		return -ENOMEM;
+
+	panel->input->name = client->name;
+	panel->input->id.bustype = BUS_I2C;
+	input_set_capability(panel->input, EV_KEY, BTN_NORTH);
+	input_set_capability(panel->input, EV_KEY, BTN_SOUTH);
+	input_set_capability(panel->input, EV_KEY, BTN_SELECT);
+
+	rc = input_register_device(panel->input);
+	if (rc) {
+		dev_err(&client->dev, "Failed to register input device: %d\n",
+			rc);
+		return rc;
+	}
+
+	spin_lock_init(&panel->lock);
+
+	i2c_set_clientdata(client, panel);
+	rc = i2c_slave_register(client, ibm_panel_i2c_slave_cb);
+	if (rc) {
+		input_unregister_device(panel->input);
+		dev_err(&client->dev,
+			"Failed to register I2C slave device: %d\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int ibm_panel_remove(struct i2c_client *client)
+{
+	int rc;
+	struct ibm_panel *panel = i2c_get_clientdata(client);
+
+	rc = i2c_slave_unregister(client);
+
+	input_unregister_device(panel->input);
+
+	return rc;
+}
+
+static const struct of_device_id ibm_panel_match[] = {
+	{ .compatible = "ibm,op-panel" },
+	{ }
+};
+
+static struct i2c_driver ibm_panel_driver = {
+	.driver = {
+		.name = DEVICE_NAME,
+		.of_match_table = ibm_panel_match,
+	},
+	.probe = ibm_panel_probe,
+	.remove = ibm_panel_remove,
+};
+module_i2c_driver(ibm_panel_driver);
+
+MODULE_AUTHOR("Eddie James <eajames@linux.ibm.com>");
+MODULE_DESCRIPTION("IBM Operation Panel Driver");
+MODULE_LICENSE("GPL");
-- 
2.26.2

