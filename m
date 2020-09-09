Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E9926376A
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 22:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgIIUbb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 16:31:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27676 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729717AbgIIUb2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 16:31:28 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 089K2ZtE106005;
        Wed, 9 Sep 2020 16:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tjUTCjJnfsR1Ss3Jipq9OK8EuvbCvGMKtzXkN+QnI6w=;
 b=Od3MNiuYG1HPg0A58hByhF9v8/sP5o0Srx/QJtBSzKbRZ0He9iCHIds6H/9vVkAwGkWF
 MTpeI5m98hMFeRitf5k0N9DFs7Nyc/A5z56qEMkE3CEI/xmxiWYSn/ctbtduaEixg98j
 E0CjyN2qDILD5lAZkp57uAb0/0G5Psdkam1hgZMpVc9JPdJiNzrQ9rv++/b0WwG2cIBw
 KT/+hdX1YoKuqVc/0AYg1vUEidXE+grYyGIYPWwWqau9lT5q5VI4qBVPGCkvTyxZXxv5
 EkUGkYF2alQQUdejxkGQ1SIdbxjUo8Kh4nRoMS0oloaUgXjKS4bYbE+zlodH0+XZgnRd iA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f542hued-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:03 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 089K2ZSK106056;
        Wed, 9 Sep 2020 16:31:03 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f542hue7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:03 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089KRcNl003189;
        Wed, 9 Sep 2020 20:31:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma04wdc.us.ibm.com with ESMTP id 33c2a92546-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 20:31:02 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 089KUwgZ33096400
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 9 Sep 2020 20:30:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9FFAC78064;
        Wed,  9 Sep 2020 20:31:01 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EBE077805E;
        Wed,  9 Sep 2020 20:31:00 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.76.239])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  9 Sep 2020 20:31:00 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com, joel@jms.id.au,
        andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v3 2/5] input: misc: Add IBM Operation Panel driver
Date:   Wed,  9 Sep 2020 15:30:56 -0500
Message-Id: <20200909203059.23427-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909203059.23427-1-eajames@linux.ibm.com>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-09_16:2020-09-09,2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 suspectscore=1 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090173
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
 drivers/input/misc/ibm-panel.c | 189 +++++++++++++++++++++++++++++++++
 4 files changed, 209 insertions(+)
 create mode 100644 drivers/input/misc/ibm-panel.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 28408d29d873..5429da957a1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8351,6 +8351,7 @@ M:	Eddie James <eajames@linux.ibm.com>
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
index 000000000000..7329f4641636
--- /dev/null
+++ b/drivers/input/misc/ibm-panel.c
@@ -0,0 +1,189 @@
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
+static void ibm_panel_process_command(struct ibm_panel *panel)
+{
+	u8 i;
+	u8 chksum;
+	u16 sum = 0;
+	int pressed;
+	int released;
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
+	unsigned long flags;
+	struct ibm_panel *panel = i2c_get_clientdata(client);
+
+	dev_dbg(&panel->input->dev, "event: %u data: %02x\n", event, *val);
+
+	spin_lock_irqsave(&panel->lock, flags);
+
+	switch (event) {
+	case I2C_SLAVE_STOP:
+		if (panel->idx == sizeof(panel->command))
+			ibm_panel_process_command(panel);
+		else
+			dev_dbg(&panel->input->dev,
+				"command incorrect size %u\n", panel->idx);
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
+	case I2C_SLAVE_READ_REQUESTED:
+	case I2C_SLAVE_READ_PROCESSED:
+		*val = 0xff;
+		break;
+	default:
+		break;
+	}
+
+	spin_unlock_irqrestore(&panel->lock, flags);
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

