Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5912317254
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Feb 2021 22:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbhBJV0x convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 10 Feb 2021 16:26:53 -0500
Received: from mail.sch.bme.hu ([152.66.249.140]:41250 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232439AbhBJVZl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Feb 2021 16:25:41 -0500
X-Greylist: delayed 943 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Feb 2021 16:25:39 EST
Received: from mail-lj1-f178.google.com (209.85.208.178) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Wed, 10 Feb 2021 22:09:06 +0100
Received: by mail-lj1-f178.google.com with SMTP id x7so2951551ljc.5
        for <linux-i2c@vger.kernel.org>; Wed, 10 Feb 2021 13:09:06 -0800 (PST)
X-Gm-Message-State: AOAM531wQe370/HpHrdIEB4eLalUC+wOnNfAuB4FytbDuH1NhqP/q5ty
        +jdbOUc32VsvVHvZ8l6p+SFGaAGX76sQgcVTgNI=
X-Google-Smtp-Source: ABdhPJx8tgd3ngrsmEGSt7LnZ3NrEcQDFOExTHYWPkGq+xLDr0nkkoqnGHpRGEF/51N/cmJjekTkOOIx+6LciRZVy/E=
X-Received: by 2002:a2e:8583:: with SMTP id b3mr3172889lji.360.1612991346040;
 Wed, 10 Feb 2021 13:09:06 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Wed, 10 Feb 2021 22:08:54 +0100
X-Gmail-Original-Message-ID: <CACCVKEHLHJom4k7YEh2ZRfd-yY9FqLskKmjvcAvYkXLeAaiZ0Q@mail.gmail.com>
Message-ID: <CACCVKEHLHJom4k7YEh2ZRfd-yY9FqLskKmjvcAvYkXLeAaiZ0Q@mail.gmail.com>
Subject: [PATCH 2/2] Adding i2c-cp2615 driver
To:     <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [209.85.208.178]
X-ClientProxiedBy: Exchange2016-1.sch.bme.hu (152.66.249.140) To
 Exchange2016-1.sch.bme.hu (152.66.249.140)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For a hardware project, I need the I2C master of SiLabs' CP2615 chip
to be visible from under Linux. This patchset adds i2c-cp2615, a
driver which sets up an i2c_adapter for said chip.

This is my first contribution, so forgive me (but do let me know) if
I've broken habit.

Signed-off-by: Bence Csókás <bence98@sch.bme.hu>
---
 drivers/i2c/busses/cp2615_drv.c | 150 ++++++++++++++++++++++++++++++++
 drivers/i2c/busses/cp2615_iop.c |  32 +++++++
 drivers/i2c/busses/cp2615_iop.h |  60 +++++++++++++
 3 files changed, 242 insertions(+)
 create mode 100644 drivers/i2c/busses/cp2615_drv.c
 create mode 100644 drivers/i2c/busses/cp2615_iop.c
 create mode 100644 drivers/i2c/busses/cp2615_iop.h

diff --git a/drivers/i2c/busses/cp2615_drv.c b/drivers/i2c/busses/cp2615_drv.c
new file mode 100644
index 000000000000..97a6c99400f8
--- /dev/null
+++ b/drivers/i2c/busses/cp2615_drv.c
@@ -0,0 +1,150 @@
+#include <linux/i2c.h>
+#include <linux/usb.h>
+#include "cp2615_iop.h"
+
+static int
+cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
+{
+    struct cp2615_iop_msg *msg = kzalloc(sizeof(struct
cp2615_iop_msg), GFP_KERNEL);
+    struct usb_device *usbdev = interface_to_usbdev(usbif);
+    int res = cp2615_init_i2c_msg(msg, i2c_w);
+    if (!res)
+        res = usb_bulk_msg(usbdev, usb_sndbulkpipe(usbdev,
IOP_EP_OUT), msg, ntohs(msg->length), NULL, 0);
+    kfree(msg);
+    return res;
+}
+
+static int
+cp2615_i2c_recv(struct usb_interface *usbif, unsigned char tag, void *buf)
+{
+    struct cp2615_iop_msg *msg = kzalloc(sizeof(struct
cp2615_iop_msg), GFP_KERNEL);
+    struct cp2615_i2c_transfer_result *i2c_r = (struct
cp2615_i2c_transfer_result*) &msg->data;
+    struct usb_device *usbdev = interface_to_usbdev(usbif);
+    int res = usb_bulk_msg(usbdev, usb_rcvbulkpipe(usbdev,
IOP_EP_IN), msg, sizeof(struct cp2615_iop_msg), NULL, 0);
+    if (res < 0)
+        return res;
+
+    if (msg->msg != htons(iop_I2cTransferResult) || i2c_r->tag != tag
|| !i2c_r->status)
+        return -EIO;
+
+    memcpy(buf, &i2c_r->data, ntohs(i2c_r->read_len));
+    kfree(msg);
+    return 0;
+}
+
+static int
+cp2615_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+    struct usb_interface *usbif = adap->algo_data;
+    int i = 0, ret = 0;
+    struct i2c_msg *msg;
+    struct cp2615_i2c_transfer i2c_w = {0};
+    dev_dbg(&usbif->dev, "Doing %d I2C transactions\n", num);
+
+    for(; !ret && i < num; i++) {
+        msg = &msgs[i];
+
+        i2c_w.tag = 0xdd;
+        i2c_w.i2caddr = i2c_8bit_addr_from_msg(msg);
+        if (msg->flags & I2C_M_RD) {
+            i2c_w.read_len = msg->len;
+            i2c_w.write_len = 0;
+        } else {
+            i2c_w.read_len = 0;
+            i2c_w.write_len = msg->len;
+            memcpy(&i2c_w.data, msg->buf, i2c_w.write_len);
+        }
+        ret = cp2615_i2c_send(usbif, &i2c_w);
+        if (ret < 0)
+            break;
+        ret = cp2615_i2c_recv(usbif, i2c_w.tag, msg->buf);
+    }
+    return ret;
+}
+
+static u32
+cp2615_i2c_func(struct i2c_adapter *adap)
+{
+    return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm cp2615_i2c_algo = {
+    .master_xfer    = cp2615_i2c_master_xfer,
+    .functionality    = cp2615_i2c_func,
+};
+
+struct i2c_adapter_quirks cp2615_i2c_quirks = {
+    .max_write_len = MAX_I2C_SIZE,
+    .max_read_len = MAX_I2C_SIZE,
+};
+
+static void
+cp2615_i2c_remove(struct usb_interface *usbif)
+{
+    struct i2c_adapter *adap = usb_get_intfdata(usbif);
+
+    usb_set_intfdata(usbif, NULL);
+    i2c_del_adapter(adap);
+    kfree(adap);
+    dev_info(&usbif->dev, "Removed CP2615's I2C bus\n");
+}
+
+static int
+cp2615_i2c_probe(struct usb_interface *usbif, const struct usb_device_id *id)
+{
+    int ret = 0;
+    struct i2c_adapter *adap;
+    struct usb_device *usbdev = interface_to_usbdev(usbif);
+
+    ret = usb_set_interface(usbdev, IOP_IFN, IOP_ALTSETTING);
+    if (ret)
+        goto out;
+
+    adap = kzalloc(sizeof(struct i2c_adapter), GFP_KERNEL);
+    if (!adap) {
+        ret = -ENOMEM;
+        goto out;
+    }
+
+    strncpy(adap->name, usbdev->serial, sizeof(adap->name));
+    adap->owner = THIS_MODULE;
+    adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+    adap->dev.parent = &usbif->dev;
+    adap->dev.of_node = usbif->dev.of_node;
+    adap->timeout = HZ;
+    adap->algo = &cp2615_i2c_algo;
+    adap->quirks = &cp2615_i2c_quirks;
+    adap->algo_data = usbif;
+
+    ret = i2c_add_adapter(adap);
+    if (ret) {
+        kfree(adap);
+        goto out;
+    }
+
+    usb_set_intfdata(usbif, adap);
+    dev_info(&usbif->dev, "Added CP2615's I2C bus\n");
+out:
+    return ret;
+}
+
+static const struct usb_device_id id_table[] = {
+    { USB_DEVICE(CP2615_VID, CP2615_PID) },
+    { }
+};
+
+MODULE_DEVICE_TABLE(usb, id_table);
+
+static struct usb_driver cp2615_i2c_driver = {
+    .name = "i2c-cp2615",
+    .probe = cp2615_i2c_probe,
+    .disconnect = cp2615_i2c_remove,
+    .id_table = id_table,
+//    .dev_groups = cp2615_groups,
+};
+
+module_usb_driver(cp2615_i2c_driver);
+
+MODULE_AUTHOR("Bence Csókás <bence98@sch.bme.hu>");
+MODULE_DESCRIPTION("CP2615 I2C bus driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/cp2615_iop.c b/drivers/i2c/busses/cp2615_iop.c
new file mode 100644
index 000000000000..5235b899033f
--- /dev/null
+++ b/drivers/i2c/busses/cp2615_iop.c
@@ -0,0 +1,32 @@
+/** CP2615 I/O Protocol implementation
+ *  (c) 2021, Bence Csókás <bence98@sch.bme.hu>
+ *  Licensed under GPLv2
+ *  Source: https://www.silabs.com/documents/public/application-notes/an1139-cp2615-io-protocol.pdf
+ */
+
+#include <linux/string.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+
+#include "cp2615_iop.h"
+
+int cp2615_init_iop_msg(struct cp2615_iop_msg *ret, enum
cp2615_iop_msg_type msg, const void *data, size_t data_len)
+{
+    if (data_len > MAX_IOP_PAYLOAD_SIZE)
+        return -EFBIG;
+
+    if (ret) {
+        ret->preamble = 0x2A2A;
+        ret->length = htons(data_len+6);
+        ret->msg = htons(msg);
+        if(data && data_len)
+            memcpy(&ret->data, data, data_len);
+        return 0;
+    } else
+        return -EINVAL;
+}
+
+int cp2615_init_i2c_msg(struct cp2615_iop_msg *ret, const struct
cp2615_i2c_transfer *data)
+{
+    return cp2615_init_iop_msg(ret, iop_DoI2cTransfer, data, 4 +
data->write_len);
+}
diff --git a/drivers/i2c/busses/cp2615_iop.h b/drivers/i2c/busses/cp2615_iop.h
new file mode 100644
index 000000000000..c4a68a120cdf
--- /dev/null
+++ b/drivers/i2c/busses/cp2615_iop.h
@@ -0,0 +1,60 @@
+/** CP2615 I/O Protocol implementation
+ *  (c) 2021, Bence Csókás <bence98@sch.bme.hu>
+ *  Licensed under GPLv2
+ *  Source: https://www.silabs.com/documents/public/application-notes/an1139-cp2615-io-protocol.pdf
+ */
+
+#ifndef CP2615_IOP_H
+#define CP2615_IOP_H
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
+    iop_GetAccessoryInfo = 0xD100,
+    iop_AccessoryInfo = 0xA100,
+    iop_GetPortConfiguration = 0xD203,
+    iop_PortConfiguration = 0xA203,
+    // ...
+    iop_DoI2cTransfer = 0xD400,
+    iop_I2cTransferResult = 0xA400,
+    iop_GetSerialState = 0xD501,
+    iop_SerialState = 0xA501
+};
+
+struct cp2615_iop_msg {
+    uint16_t preamble, length, msg;
+    char data[MAX_IOP_PAYLOAD_SIZE];
+};
+
+int cp2615_init_iop_msg(struct cp2615_iop_msg *ret, enum
cp2615_iop_msg_type msg, const void *data, size_t data_len);
+
+#define PART_ID_A01 0x1400
+#define PART_ID_A02 0x1500
+
+struct cp2615_iop_accessory_info {
+    uint16_t part_id, option_id, proto_ver;
+};
+
+struct cp2615_i2c_transfer {
+    unsigned char tag, i2caddr, read_len, write_len;
+    char data[MAX_I2C_SIZE];
+};
+
+struct cp2615_i2c_transfer_result {
+    unsigned char tag, i2caddr, status, read_len;
+    char data[MAX_I2C_SIZE];
+};
+
+int cp2615_init_i2c_msg(struct cp2615_iop_msg *ret, const struct
cp2615_i2c_transfer *data);
+
+#endif //CP2615_IOP_H
--
2.30.0
