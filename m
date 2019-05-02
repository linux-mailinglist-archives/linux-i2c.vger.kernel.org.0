Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1656912205
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 20:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfEBSiP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 14:38:15 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:34773 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726302AbfEBSiN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 May 2019 14:38:13 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from asmaa@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 2 May 2019 21:38:08 +0300
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x42Ic6Kv009186;
        Thu, 2 May 2019 14:38:06 -0400
Received: (from asmaa@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x42Ic6dQ031642;
        Thu, 2 May 2019 14:38:06 -0400
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     minyard@acm.org, wsa@the-dreams.de, vadimp@mellanox.com,
        michaelsh@mellanox.com
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v5 1/1] Add support for IPMB driver
Date:   Thu,  2 May 2019 14:38:02 -0400
Message-Id: <50bf3fd299e617bb764c69c3704e2f285c7987c7.1556821099.git.Asmaa@mellanox.com>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <cover.1556821099.git.Asmaa@mellanox.com>
References: <cover.1556821099.git.Asmaa@mellanox.com>
In-Reply-To: <cover.1556821099.git.Asmaa@mellanox.com>
References: <cover.1556821099.git.Asmaa@mellanox.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Support receiving IPMB requests on a Satellite MC from the BMC.
Once a response is ready, this driver will send back a response
to the BMC via the IPMB channel.

Signed-off-by: Asmaa Mnebhi <Asmaa@mellanox.com>
---
 Documentation/IPMB.txt           |  64 +++++++
 drivers/char/ipmi/Kconfig        |   8 +
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmb_dev_int.c | 384 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 457 insertions(+)
 create mode 100644 Documentation/IPMB.txt
 create mode 100644 drivers/char/ipmi/ipmb_dev_int.c

diff --git a/Documentation/IPMB.txt b/Documentation/IPMB.txt
new file mode 100644
index 0000000..5416090d
--- /dev/null
+++ b/Documentation/IPMB.txt
@@ -0,0 +1,64 @@
+============================
+IPMB Driver fro Satellite MC
+============================
+
+The Intelligent Platform Management Bus, or IPMB is an
+I2C bus that provides a standardized interconnection between
+different boards within a chassis. This interconnection is
+between the baseboard management (BMC) and chassis electronics.
+IPMB is also associated with the messaging protocol through the
+IPMB bus.
+
+The devices using the IPMB are usually management
+controllers that perform management functions such as servicing
+the front panel interface, monitoring the baseboard,
+hot-swapping disk drivers in the system chassis, etc...
+
+When an IPMB is implemented in the system, the BMC serves as
+a controller to give system software access to the IPMB. The BMC
+sends IPMI requests to a device (usually a Satellite Management
+Controller or Satellite MC) via IPMB and the device
+sends a response back to the BMC.
+
+For more information on IPMB and the format of an IPMB message,
+refer to the IPMB and IPMI specifications.
+
+IPMB driver for Satellite MC
+----------------------------
+
+ipmb-dev-int - This is the driver needed on a Satellite MC to
+receive IPMB messages from a BMC and send a response back.
+This driver works hand with the i2c driver and a userspace
+program such as OpenIPMI:
+
+1) It is an I2C slave backend driver. So, it defines a callback
+function to set the Satellite MC as an I2C slave.
+This callback function handles the received IPMI requests.
+
+2) It defines the read and write functions to enable a user
+space program (such as OpenIPMI) to communicate with the kernel.
+
+Load the IPMB driver
+--------------------
+
+The driver needs to be loaded at boot time or manually first.
+Then, you can instantiate the device as described in the document
+'instantiating-devices'.
+If you have multiple BMCs, each connected to your Satellite MC via
+a different I2C bus, you can instantiate a device for each of
+those BMCs.
+The name of the instantiated device contains the I2C bus number
+associated with it as follows:
+
+BMC1 ------ IPMB/I2C bus 1 ---------|   /dev/ipmb-1
+				Satellite MC
+BMC1 ------ IPMB/I2C bus 2 ---------|   /dev/ipmb-2
+
+For instance, you can instantiate the ipmb-dev-int device from
+user space at the 7 bit address 0x10 on bus 2:
+
+  # echo ipmb-dev 0x10 > /sys/bus/i2c/devices/i2c-2/new_device
+
+This will create device file /dev/ipmb-2, which can be accessed
+by the user space program. The device needs to be instantiated
+before running the user space program.
diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 94719fc..12fe8f2 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -74,6 +74,14 @@ config IPMI_SSIF
 	 have a driver that must be accessed over an I2C bus instead of a
 	 standard interface.  This module requires I2C support.
 
+config IPMB_DEVICE_INTERFACE
+       tristate 'IPMB Interface handler'
+       depends on I2C && I2C_SLAVE
+       help
+         Provides a driver for a device (Satellite MC) to
+         receive requests and send responses back to the BMC via
+         the IPMB interface. This module requires I2C support.
+
 config IPMI_POWERNV
        depends on PPC_POWERNV
        tristate 'POWERNV (OPAL firmware) IPMI interface'
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 3f06b20..0822adc 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -26,3 +26,4 @@ obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
+obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
new file mode 100644
index 0000000..b7b9c5d
--- /dev/null
+++ b/drivers/char/ipmi/ipmb_dev_int.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * IPMB driver to receive a request and send a response
+ *
+ * Copyright (C) 2018 Mellanox Techologies, Ltd.
+ *
+ * This was inspired by Brendan Higgins' ipmi-bmc-bt-i2c driver.
+ */
+
+#define	dev_fmt(fmt) "ipmb_dev_int: " fmt
+
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/wait.h>
+
+#define	MAX_MSG_LEN		128
+#define	IPMB_REQUEST_LEN_MIN	7
+#define	NETFN_RSP_BIT_MASK	0x4
+#define	REQUEST_QUEUE_MAX_LEN	256
+
+#define	IPMB_MSG_LEN_IDX	0
+#define	RQ_SA_8BIT_IDX		1
+#define	NETFN_LUN_IDX		2
+
+#define	IPMB_MSG_PAYLOAD_LEN_MAX (MAX_MSG_LEN - IPMB_REQUEST_LEN_MIN - 1)
+
+struct ipmb_msg {
+	u8 len;
+	u8 rs_sa;
+	u8 netfn_rs_lun;
+	u8 checksum1;
+	u8 rq_sa;
+	u8 rq_seq_rq_lun;
+	u8 cmd;
+	u8 payload[IPMB_MSG_PAYLOAD_LEN_MAX];
+	/* checksum2 is included in payload */
+} __packed;
+
+struct ipmb_request_elem {
+	struct list_head list;
+	struct ipmb_msg request;
+};
+
+struct ipmb_dev {
+	struct i2c_client *client;
+	struct miscdevice miscdev;
+	struct ipmb_msg request;
+	struct list_head request_queue;
+	atomic_t request_queue_len;
+	size_t msg_idx;
+	spinlock_t lock;
+	wait_queue_head_t wait_queue;
+	struct mutex file_mutex;
+};
+
+static int receive_ipmb_request(struct ipmb_dev *ipmb_dev_p,
+				bool non_blocking,
+				struct ipmb_msg *ipmb_request)
+{
+	struct ipmb_request_elem *queue_elem;
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&ipmb_dev_p->lock, flags);
+
+	while (!atomic_read(&ipmb_dev_p->request_queue_len)) {
+		spin_unlock_irqrestore(&ipmb_dev_p->lock, flags);
+		if (non_blocking)
+			return -EAGAIN;
+
+		res = wait_event_interruptible(ipmb_dev_p->wait_queue,
+				atomic_read(&ipmb_dev_p->request_queue_len));
+		if (res)
+			return res;
+
+		spin_lock_irqsave(&ipmb_dev_p->lock, flags);
+	}
+
+	if (list_empty(&ipmb_dev_p->request_queue)) {
+		dev_err(&ipmb_dev_p->client->dev, "request_queue is empty\n");
+		return -EIO;
+	}
+
+	queue_elem = list_first_entry(&ipmb_dev_p->request_queue,
+					struct ipmb_request_elem, list);
+	memcpy(ipmb_request, &queue_elem->request, sizeof(*ipmb_request));
+	list_del(&queue_elem->list);
+	kfree(queue_elem);
+	atomic_dec(&ipmb_dev_p->request_queue_len);
+
+	spin_unlock_irqrestore(&ipmb_dev_p->lock, flags);
+
+	return 0;
+}
+
+static inline struct ipmb_dev *to_ipmb_dev(struct file *file)
+{
+	return container_of(file->private_data, struct ipmb_dev, miscdev);
+}
+
+static ssize_t ipmb_read(struct file *file, char __user *buf, size_t count,
+			loff_t *ppos)
+{
+	struct ipmb_dev *ipmb_dev_p = to_ipmb_dev(file);
+	struct ipmb_msg msg;
+	ssize_t ret;
+
+	memset(&msg, 0, sizeof(msg));
+
+	mutex_lock(&ipmb_dev_p->file_mutex);
+	ret = receive_ipmb_request(ipmb_dev_p, file->f_flags & O_NONBLOCK,
+				&msg);
+	if (ret < 0)
+		goto out;
+	count = min_t(size_t, count, msg.len + 1);
+	if (copy_to_user(buf, &msg, count)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+out:
+	mutex_unlock(&ipmb_dev_p->file_mutex);
+	return ret < 0 ? ret : count;
+}
+
+static s32 i2c_smbus_write_block_data_local(struct i2c_client *client,
+					u8 command, u8 length,
+					u16 requester_i2c_addr,
+					const char *msg)
+{
+	union i2c_smbus_data data;
+	int ret;
+
+	if (length > I2C_SMBUS_BLOCK_MAX)
+		length = I2C_SMBUS_BLOCK_MAX;
+
+	data.block[0] = length;
+	memcpy(&data.block[1], msg, length);
+
+	ret = i2c_smbus_xfer(client->adapter, requester_i2c_addr,
+				client->flags,
+				I2C_SMBUS_WRITE, command,
+				I2C_SMBUS_BLOCK_DATA, &data);
+
+	return ret;
+}
+
+static ssize_t ipmb_write(struct file *file, const char __user *buf,
+			size_t count, loff_t *ppos)
+{
+	struct ipmb_dev *ipmb_dev_p = to_ipmb_dev(file);
+	u8 msg[MAX_MSG_LEN];
+	ssize_t ret;
+	u8 rq_sa, netf_rq_lun, msg_len;
+
+	if (count > sizeof(msg))
+		return -EINVAL;
+
+	if (copy_from_user(&msg, buf, count) || count < msg[0])
+		return -EFAULT;
+
+	rq_sa = msg[RQ_SA_8BIT_IDX] >> 1;
+	netf_rq_lun = msg[NETFN_LUN_IDX];
+	/*
+	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
+	 * i2c_smbus_write_block_data_local
+	 */
+	msg_len = msg[IPMB_MSG_LEN_IDX] - 2;
+
+	mutex_lock(&ipmb_dev_p->file_mutex);
+	ret = i2c_smbus_write_block_data_local(ipmb_dev_p->client,
+					netf_rq_lun, msg_len, rq_sa, msg + 3);
+	mutex_unlock(&ipmb_dev_p->file_mutex);
+
+	return ret ?: count;
+}
+
+static unsigned int ipmb_poll(struct file *file, poll_table *wait)
+{
+	struct ipmb_dev *ipmb_dev_p = to_ipmb_dev(file);
+	unsigned int mask = POLLOUT;
+
+	mutex_lock(&ipmb_dev_p->file_mutex);
+	poll_wait(file, &ipmb_dev_p->wait_queue, wait);
+
+	if (atomic_read(&ipmb_dev_p->request_queue_len))
+		mask |= POLLIN;
+	mutex_unlock(&ipmb_dev_p->file_mutex);
+
+	return mask;
+}
+
+static const struct file_operations ipmb_fops = {
+	.owner	= THIS_MODULE,
+	.read	= ipmb_read,
+	.write	= ipmb_write,
+	.poll	= ipmb_poll,
+};
+
+/* Called with ipmb_dev->lock held. */
+static void ipmb_handle_request(struct ipmb_dev *ipmb_dev_p)
+{
+	struct ipmb_request_elem *queue_elem;
+
+	if (atomic_read(&ipmb_dev_p->request_queue_len) >=
+			REQUEST_QUEUE_MAX_LEN)
+		return;
+
+	queue_elem = kmalloc(sizeof(*queue_elem), GFP_KERNEL);
+	if (!queue_elem)
+		return;
+
+	memcpy(&queue_elem->request, &ipmb_dev_p->request,
+		sizeof(struct ipmb_msg));
+	list_add(&queue_elem->list, &ipmb_dev_p->request_queue);
+	atomic_inc(&ipmb_dev_p->request_queue_len);
+	wake_up_all(&ipmb_dev_p->wait_queue);
+}
+
+static u8 ipmb_verify_checksum1(struct ipmb_dev *ipmb_dev_p, u8 rs_sa)
+{
+	/* The 8 lsb of the sum is 0 when the checksum is valid */
+	return (rs_sa + ipmb_dev_p->request.netfn_rs_lun +
+		ipmb_dev_p->request.checksum1);
+}
+
+static bool is_ipmb_request(struct ipmb_dev *ipmb_dev_p, u8 rs_sa)
+{
+	if (ipmb_dev_p->msg_idx >= IPMB_REQUEST_LEN_MIN) {
+		if (ipmb_verify_checksum1(ipmb_dev_p, rs_sa))
+			return false;
+
+		/*
+		 * Check whether this is an IPMB request or
+		 * response.
+		 * The 6 MSB of netfn_rs_lun are dedicated to the netfn
+		 * while the remaining bits are dedicated to the lun.
+		 * If the LSB of the netfn is cleared, it is associated
+		 * with an IPMB request.
+		 * If the LSB of the netfn is set, it is associated with
+		 * an IPMB response.
+		 */
+		if (!(ipmb_dev_p->request.netfn_rs_lun & NETFN_RSP_BIT_MASK))
+			return true;
+	}
+	return false;
+}
+
+/*
+ * The IPMB protocol only supports I2C Writes so there is no need
+ * to support I2C_SLAVE_READ* events.
+ * This i2c callback function only monitors IPMB request messages
+ * and adds them in a queue, so that they can be handled by
+ * receive_ipmb_request.
+ */
+static int ipmb_slave_cb(struct i2c_client *client,
+			enum i2c_slave_event event, u8 *val)
+{
+	struct ipmb_dev *ipmb_dev_p = i2c_get_clientdata(client);
+	u8 *buf = (u8 *)&ipmb_dev_p->request;
+
+	spin_lock(&ipmb_dev_p->lock);
+	switch (event) {
+	case I2C_SLAVE_WRITE_REQUESTED:
+		memset(&ipmb_dev_p->request, 0, sizeof(ipmb_dev_p->request));
+		ipmb_dev_p->msg_idx = 0;
+
+		/*
+		 * At index 0, ipmb_msg stores the length of msg,
+		 * skip it for now.
+		 * The len will be populated once the whole
+		 * buf is populated.
+		 *
+		 * The I2C bus driver's responsibility is to pass the
+		 * data bytes to the backend driver; it does not
+		 * forward the i2c slave address.
+		 * Since the first byte in the IPMB message is the
+		 * address of the responder, it is the responsibility
+		 * of the IPMB driver to format the message properly.
+		 * So this driver prepends the address of the responder
+		 * to the received i2c data before the request message
+		 * is handled in userland.
+		 */
+		buf[++ipmb_dev_p->msg_idx] = (u8)(client->addr << 1);
+		break;
+
+	case I2C_SLAVE_WRITE_RECEIVED:
+		if (ipmb_dev_p->msg_idx >= sizeof(struct ipmb_msg))
+			break;
+
+		buf[++ipmb_dev_p->msg_idx] = *val;
+		break;
+
+	case I2C_SLAVE_STOP:
+		ipmb_dev_p->request.len = ipmb_dev_p->msg_idx;
+
+		if (is_ipmb_request(ipmb_dev_p, (u8)(client->addr << 1)))
+			ipmb_handle_request(ipmb_dev_p);
+		break;
+
+	default:
+		break;
+	}
+	spin_unlock(&ipmb_dev_p->lock);
+
+	return 0;
+}
+
+static int ipmb_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct ipmb_dev *ipmb_dev_p;
+	int ret;
+
+	ipmb_dev_p = devm_kzalloc(&client->dev, sizeof(*ipmb_dev_p),
+					GFP_KERNEL);
+	if (!ipmb_dev_p)
+		return -ENOMEM;
+
+	spin_lock_init(&ipmb_dev_p->lock);
+	init_waitqueue_head(&ipmb_dev_p->wait_queue);
+	atomic_set(&ipmb_dev_p->request_queue_len, 0);
+	INIT_LIST_HEAD(&ipmb_dev_p->request_queue);
+
+	mutex_init(&ipmb_dev_p->file_mutex);
+
+	ipmb_dev_p->miscdev.minor = MISC_DYNAMIC_MINOR;
+
+	ipmb_dev_p->miscdev.name = devm_kasprintf(&client->dev, GFP_KERNEL,
+						"%s%d", "ipmb-",
+						client->adapter->nr);
+	ipmb_dev_p->miscdev.fops = &ipmb_fops;
+	ipmb_dev_p->miscdev.parent = &client->dev;
+	ret = misc_register(&ipmb_dev_p->miscdev);
+	if (ret)
+		return ret;
+
+	ipmb_dev_p->client = client;
+	i2c_set_clientdata(client, ipmb_dev_p);
+	ret = i2c_slave_register(client, ipmb_slave_cb);
+	if (ret) {
+		misc_deregister(&ipmb_dev_p->miscdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ipmb_remove(struct i2c_client *client)
+{
+	struct ipmb_dev *ipmb_dev_p = i2c_get_clientdata(client);
+
+	i2c_slave_unregister(client);
+	misc_deregister(&ipmb_dev_p->miscdev);
+
+	return 0;
+}
+
+static const struct i2c_device_id ipmb_id[] = {
+	{ "ipmb-dev", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, ipmb_id);
+
+static struct i2c_driver ipmb_driver = {
+	.driver = {
+		.name = "ipmb-dev",
+	},
+	.probe = ipmb_probe,
+	.remove = ipmb_remove,
+	.id_table = ipmb_id,
+};
+module_i2c_driver(ipmb_driver);
+
+MODULE_AUTHOR("Mellanox Technologies");
+MODULE_DESCRIPTION("IPMB driver");
+MODULE_LICENSE("GPL v2");
-- 
2.1.2

