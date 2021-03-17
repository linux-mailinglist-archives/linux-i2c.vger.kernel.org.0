Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB55E33EE25
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 11:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhCQKNj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 06:13:39 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:33830 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhCQKNe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 06:13:34 -0400
Received: from Exchange2016-1.sch.bme.hu (152.66.249.140) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Wed, 17 Mar 2021 11:13:27 +0100
Received: from Cognitio.sch.bme.hu (152.66.211.220) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 17 Mar 2021 11:13:27 +0100
From:   =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
To:     <linux-i2c@vger.kernel.org>
CC:     =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] Adding i2c-cp2615: i2c support for Silicon Labs' CP2615 Digital Audio Bridge
Date:   Wed, 17 Mar 2021 10:30:21 +0000
Message-ID: <20210317103021.1913858-1-bence98@sch.bme.hu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Bence Csókás <bence98@sch.bme.hu>
---
 drivers/i2c/busses/Kconfig      |  10 ++
 drivers/i2c/busses/Makefile     |   1 +
 drivers/i2c/busses/i2c-cp2615.c | 282 ++++++++++++++++++++++++++++++++
 3 files changed, 293 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-cp2615.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a49e0ed4a599..7a0dd18140d3 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1227,6 +1227,16 @@ config I2C_DLN2
 	 This driver can also be built as a module.  If so, the module
 	 will be called i2c-dln2.
 
+config I2C_CP2615
+	tristate "Silicon Labs CP2615 USB sound card and I2C adapter"
+	depends on USB
+	help
+	  If you say yes to this option, support will be included for Silicon
+	  Labs CP2615's I2C interface.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-cp2615.
+
 config I2C_PARPORT
 	tristate "Parallel port adapter"
 	depends on PARPORT
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 683c49faca05..adb71d9c9d42 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_I2C_ZX2967)	+= i2c-zx2967.o
 # External I2C/SMBus adapter drivers
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
+obj-$(CONFIG_I2C_CP2615) += i2c-cp2615.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
 obj-$(CONFIG_I2C_ROBOTFUZZ_OSIF)	+= i2c-robotfuzz-osif.o
 obj-$(CONFIG_I2C_TAOS_EVM)	+= i2c-taos-evm.o
diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
new file mode 100644
index 000000000000..75f76201fbb3
--- /dev/null
+++ b/drivers/i2c/busses/i2c-cp2615.c
@@ -0,0 +1,282 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * i2c support for Silicon Labs' CP2615 Digital Audio Bridge
+ *
+ * (c) 2021, Bence Csókás <bence98@sch.bme.hu>
+ */
+
+#include <linux/string.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/usb.h>
+
+/** CP2615 I/O Protocol implementation */
+
+#define CP2615_VID 0x10c4
+#define CP2615_PID 0xeac1
+
+#define IOP_EP_IN  0x82
+#define IOP_EP_OUT 0x02
+#define IOP_IFN 1
+#define IOP_ALTSETTING 2
+
+#define MAX_IOP_SIZE 64
+#define MAX_IOP_PAYLOAD_SIZE MAX_IOP_SIZE-6
+#define MAX_I2C_SIZE MAX_IOP_PAYLOAD_SIZE-4
+
+enum cp2615_iop_msg_type {
+	iop_GetAccessoryInfo = 0xD100,
+	iop_AccessoryInfo = 0xA100,
+	iop_GetPortConfiguration = 0xD203,
+	iop_PortConfiguration = 0xA203,
+	// ...
+	iop_DoI2cTransfer = 0xD400,
+	iop_I2cTransferResult = 0xA400,
+	iop_GetSerialState = 0xD501,
+	iop_SerialState = 0xA501
+};
+
+struct cp2615_iop_msg {
+	uint16_t preamble, length, msg;
+	uint8_t data[MAX_IOP_PAYLOAD_SIZE];
+};
+
+#define PART_ID_A01 0x1400
+#define PART_ID_A02 0x1500
+
+struct cp2615_iop_accessory_info {
+	uint16_t part_id, option_id, proto_ver;
+};
+
+struct cp2615_i2c_transfer {
+	uint8_t tag, i2caddr, read_len, write_len;
+	uint8_t data[MAX_I2C_SIZE];
+};
+
+/** Possible values for struct cp2615_i2c_transfer_result.status
+ *
+ *  Values extracted from the USBXpress(r) SDK
+ */
+enum cp2615_i2c_status {
+	/* Writing to the internal EEPROM failed, because it is locked */
+	CP2615_CFG_LOCKED = -6,
+	/* read_len or write_len out of range */
+	CP2615_INVALID_PARAM = -4,
+	/* I2C slave did not ACK in time */
+	CP2615_TIMEOUT,
+	/* I2C bus busy */
+	CP2615_BUS_BUSY,
+	/* I2C bus error (ie. device NAK'd the request) */
+	CP2615_BUS_ERROR,
+	CP2615_SUCCESS
+};
+
+struct cp2615_i2c_transfer_result {
+	uint8_t tag, i2caddr;
+	int8_t status;
+	uint8_t read_len;
+	uint8_t data[MAX_I2C_SIZE];
+};
+
+int cp2615_init_iop_msg(struct cp2615_iop_msg *ret, enum cp2615_iop_msg_type msg, const void *data, size_t data_len)
+{
+	if (data_len > MAX_IOP_PAYLOAD_SIZE)
+		return -EFBIG;
+
+	if (ret) {
+		ret->preamble = 0x2A2A;
+		ret->length = htons(data_len+6);
+		ret->msg = htons(msg);
+		if(data && data_len)
+			memcpy(&ret->data, data, data_len);
+        return 0;
+	} else {
+        return -EINVAL;
+	}
+}
+
+int cp2615_init_i2c_msg(struct cp2615_iop_msg *ret, const struct cp2615_i2c_transfer *data)
+{
+    return cp2615_init_iop_msg(ret, iop_DoI2cTransfer, data, 4 + data->write_len);
+}
+
+/* Translates status codes to Linux errno's */
+int cp2615_check_status(enum cp2615_i2c_status status)
+{
+	switch (status) {
+	case CP2615_SUCCESS:
+			return 0;
+	case CP2615_BUS_ERROR:
+		return -ECOMM;
+	case CP2615_BUS_BUSY:
+		return -EAGAIN;
+	case CP2615_TIMEOUT:
+		return -ETIMEDOUT;
+	case CP2615_INVALID_PARAM:
+		return -EINVAL;
+	case CP2615_CFG_LOCKED:
+		return -EPERM;
+	}
+	/* Unknown error code */
+	return -EPROTO;
+}
+
+
+static int
+cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
+{
+	struct cp2615_iop_msg *msg = kzalloc(sizeof(struct cp2615_iop_msg), GFP_KERNEL);
+	struct usb_device *usbdev = interface_to_usbdev(usbif);
+	int res = cp2615_init_i2c_msg(msg, i2c_w);
+	if (!res)
+		res = usb_bulk_msg(usbdev, usb_sndbulkpipe(usbdev, IOP_EP_OUT), msg, ntohs(msg->length), NULL, 0);
+	kfree(msg);
+	return res;
+}
+
+static int
+cp2615_i2c_recv(struct usb_interface *usbif, unsigned char tag, void *buf)
+{
+	struct cp2615_iop_msg *msg = kzalloc(sizeof(struct cp2615_iop_msg), GFP_KERNEL);
+	struct cp2615_i2c_transfer_result *i2c_r = (struct cp2615_i2c_transfer_result*) &msg->data;
+	struct usb_device *usbdev = interface_to_usbdev(usbif);
+	int res = usb_bulk_msg(usbdev, usb_rcvbulkpipe(usbdev, IOP_EP_IN), msg, sizeof(struct cp2615_iop_msg), NULL, 0);
+	if (res < 0)
+		return res;
+
+	if (msg->msg != htons(iop_I2cTransferResult) || i2c_r->tag != tag)
+		return -EIO;
+
+	res = cp2615_check_status(i2c_r->status);
+	if (res < 0)
+		return res;
+
+	memcpy(buf, &i2c_r->data, i2c_r->read_len);
+	kfree(msg);
+	return 0;
+}
+
+static int
+cp2615_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct usb_interface *usbif = adap->algo_data;
+	int i = 0, ret = 0;
+	struct i2c_msg *msg;
+	struct cp2615_i2c_transfer i2c_w = {0};
+	dev_dbg(&usbif->dev, "Doing %d I2C transactions\n", num);
+
+	for(; !ret && i < num; i++) {
+		msg = &msgs[i];
+
+		i2c_w.tag = 0xdd;
+		i2c_w.i2caddr = i2c_8bit_addr_from_msg(msg);
+		if (msg->flags & I2C_M_RD) {
+			i2c_w.read_len = msg->len;
+			i2c_w.write_len = 0;
+		} else {
+			i2c_w.read_len = 0;
+			i2c_w.write_len = msg->len;
+			memcpy(&i2c_w.data, msg->buf, i2c_w.write_len);
+		}
+		ret = cp2615_i2c_send(usbif, &i2c_w);
+		if (ret)
+			break;
+		ret = cp2615_i2c_recv(usbif, i2c_w.tag, msg->buf);
+	}
+	if (ret < 0)
+		return ret;
+	return i;
+}
+
+static u32
+cp2615_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm cp2615_i2c_algo = {
+	.master_xfer	= cp2615_i2c_master_xfer,
+	.functionality	= cp2615_i2c_func,
+};
+
+/*
+ * This chip has some limitations: one is that the USB endpoint
+ * can only receive 64 bytes/transfer, that leaves 54 bytes for
+ * the I2C transfer. On top of that, EITHER read_len OR write_len
+ * may be zero, but not both. If both are non-zero, the adapter
+ * issues a write followed by a read. And the chip does not
+ * support repeated START between the write and read phases.
+ *
+ * FIXME: There in no quirk flag for specifying that the adapter
+ * does not support empty transfers, or that it cannot emit a
+ * START condition between the combined phases.
+ */
+struct i2c_adapter_quirks cp2615_i2c_quirks = {
+	.max_write_len = MAX_I2C_SIZE,
+	.max_read_len = MAX_I2C_SIZE,
+	.flags = I2C_AQ_COMB_WRITE_THEN_READ,
+	.max_comb_1st_msg_len = MAX_I2C_SIZE,
+	.max_comb_2nd_msg_len = MAX_I2C_SIZE
+};
+
+static void
+cp2615_i2c_remove(struct usb_interface *usbif)
+{
+	struct i2c_adapter *adap = usb_get_intfdata(usbif);
+
+	usb_set_intfdata(usbif, NULL);
+	i2c_del_adapter(adap);
+}
+
+static int
+cp2615_i2c_probe(struct usb_interface *usbif, const struct usb_device_id *id)
+{
+	int ret = 0;
+	struct i2c_adapter *adap;
+	struct usb_device *usbdev = interface_to_usbdev(usbif);
+
+	ret = usb_set_interface(usbdev, IOP_IFN, IOP_ALTSETTING);
+	if (ret)
+		return ret;
+
+	adap = devm_kzalloc(&usbif->dev, sizeof(struct i2c_adapter), GFP_KERNEL);
+	if (!adap)
+		return -ENOMEM;
+
+	strncpy(adap->name, usbdev->serial, sizeof(adap->name));
+	adap->owner = THIS_MODULE;
+	adap->dev.parent = &usbif->dev;
+	adap->dev.of_node = usbif->dev.of_node;
+	adap->timeout = HZ;
+	adap->algo = &cp2615_i2c_algo;
+	adap->quirks = &cp2615_i2c_quirks;
+	adap->algo_data = usbif;
+
+	ret = i2c_add_adapter(adap);
+	if (ret)
+		return ret;
+
+	usb_set_intfdata(usbif, adap);
+	return ret;
+}
+
+static const struct usb_device_id id_table[] = {
+	{ USB_DEVICE(CP2615_VID, CP2615_PID) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(usb, id_table);
+
+static struct usb_driver cp2615_i2c_driver = {
+	.name = "i2c-cp2615",
+	.probe = cp2615_i2c_probe,
+	.disconnect = cp2615_i2c_remove,
+	.id_table = id_table,
+};
+
+module_usb_driver(cp2615_i2c_driver);
+
+MODULE_AUTHOR("Bence Csókás <bence98@sch.bme.hu>");
+MODULE_DESCRIPTION("CP2615 I2C bus driver");
+MODULE_LICENSE("GPL");
-- 
2.30.1

