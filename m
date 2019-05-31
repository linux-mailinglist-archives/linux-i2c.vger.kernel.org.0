Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43E06307CB
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 06:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfEaEei (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 00:34:38 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:14548 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfEaEeh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 00:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1559277276; x=1590813276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dEfxOkWZNxq0CPPhj7PBxm4N/QRb4JJUEFPwuKvBkdo=;
  b=MbpM3vXegq0hRSNKjt/RzdhM2rI62aGC7u+sbij7eKBTUZmhaUf1RjCz
   DKku9anuh5VkJjwGt8C7nirhm+h6uCu9b5sOdeSWjcPrLf7EM/V7th/zh
   Zu7XVvM0OVkXSPMNEvTx452odTVIEw6mAD1pVIGADGR1y0NrOxgS36MeO
   Q=;
X-IronPort-AV: E=Sophos;i="5.60,533,1549929600"; 
   d="scan'208";a="677344108"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.47.22.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 31 May 2019 04:34:33 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS id D9020A04C6;
        Fri, 31 May 2019 04:34:29 +0000 (UTC)
Received: from EX13D05UWB004.ant.amazon.com (10.43.161.208) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 04:34:29 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D05UWB004.ant.amazon.com (10.43.161.208) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 04:34:28 +0000
Received: from localhost (10.85.16.145) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Fri, 31 May 2019 04:34:28 +0000
From:   Eduardo Valentin <eduval@amazon.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Haiyue Wang <haiyue.wang@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <andriy.shevchenko@intel.com>,
        <brendanhiggins@google.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Eduardo Valentin" <eduval@amazon.com>
Subject: [PATCH 2/3] i2c: slave-mqueue: add a slave backend to receive and queue messages
Date:   Thu, 30 May 2019 21:33:46 -0700
Message-ID: <20190531043347.4196-3-eduval@amazon.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531043347.4196-1-eduval@amazon.com>
References: <20190531043347.4196-1-eduval@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Haiyue Wang <haiyue.wang@linux.intel.com>

Some protocols over I2C are designed for bi-directional transferring
messages by using I2C Master Write protocol. Like the MCTP (Management
Component Transport Protocol) and IPMB (Intelligent Platform Management
Bus), they both require that the userspace can receive messages from
I2C dirvers under slave mode.

This new slave mqueue backend is used to receive and queue messages, it
will exposes these messages to userspace by sysfs bin file.

Note: DT interface and a couple of minor fixes here and there
by Eduardo, so I kept the original authorship here.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Signed-off-by: Eduardo Valentin <eduval@amazon.com>
---
 Documentation/i2c/slave-mqueue-backend.rst | 124 ++++++++++++
 MAINTAINERS                                |   8 +
 drivers/i2c/Kconfig                        |  25 +++
 drivers/i2c/Makefile                       |   1 +
 drivers/i2c/i2c-slave-mqueue.c             | 211 +++++++++++++++++++++
 5 files changed, 369 insertions(+)
 create mode 100644 Documentation/i2c/slave-mqueue-backend.rst
 create mode 100644 drivers/i2c/i2c-slave-mqueue.c

diff --git a/Documentation/i2c/slave-mqueue-backend.rst b/Documentation/i2c/slave-mqueue-backend.rst
new file mode 100644
index 000000000000..376dff998fa3
--- /dev/null
+++ b/Documentation/i2c/slave-mqueue-backend.rst
@@ -0,0 +1,124 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+Linux I2C slave message queue backend
+=====================================
+
+:Author: Haiyue Wang <haiyue.wang@linux.intel.com>
+
+Some protocols over I2C/SMBus are designed for bi-directional transferring
+messages by using I2C Master Write protocol. This requires that both sides
+of the communication have slave addresses.
+
+Like MCTP (Management Component Transport Protocol) and IPMB (Intelligent
+Platform Management Bus), they both require that the userspace can receive
+messages from i2c drivers under slave mode.
+
+This I2C slave mqueue (message queue) backend is used to receive and queue
+messages from the remote i2c intelligent device; and it will add the target
+slave address (with R/W# bit is always 0) into the message at the first byte,
+so that userspace can use this byte to dispatch the messages into different
+handling modules. Also, like IPMB, the address byte is in its message format,
+it needs it to do checksum.
+
+For messages are time related, so this backend will flush the oldest message
+to queue the newest one.
+
+Link
+----
+`Intelligent Platform Management Bus
+Communications Protocol Specification
+<https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmp-spec-v1.0.pdf>`_
+
+`Management Component Transport Protocol (MCTP)
+SMBus/I2C Transport Binding Specification
+<https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_1.1.0.pdf>`_
+
+How to use
+----------
+For example, the I2C5 bus has slave address 0x10, the below command will create
+the related message queue interface:
+
+    echo slave-mqueue 0x1010 > /sys/bus/i2c/devices/i2c-5/new_device
+
+Then you can dump the messages like this:
+
+    hexdump -C /sys/bus/i2c/devices/5-1010/slave-mqueue
+
+Code Example
+------------
+*Note: call 'lseek' before 'read', this is a requirement from kernfs' design.*
+
+::
+
+  #include <sys/types.h>
+  #include <sys/stat.h>
+  #include <unistd.h>
+  #include <poll.h>
+  #include <time.h>
+  #include <fcntl.h>
+  #include <stdio.h>
+
+  int main(int argc, char *argv[])
+  {
+          int i, r;
+          struct pollfd pfd;
+          struct timespec ts;
+          unsigned char data[256];
+
+          pfd.fd = open(argv[1], O_RDONLY | O_NONBLOCK);
+          if (pfd.fd < 0)
+                  return -1;
+
+          pfd.events = POLLPRI;
+
+          while (1) {
+                  r = poll(&pfd, 1, 5000);
+
+                  if (r < 0)
+                          break;
+
+                  if (r == 0 || !(pfd.revents & POLLPRI))
+                          continue;
+
+                  lseek(pfd.fd, 0, SEEK_SET);
+                  r = read(pfd.fd, data, sizeof(data));
+                  if (r <= 0)
+                          continue;
+
+                  clock_gettime(CLOCK_MONOTONIC, &ts);
+                  printf("[%ld.%.9ld] :", ts.tv_sec, ts.tv_nsec);
+                  for (i = 0; i < r; i++)
+                          printf(" %02x", data[i]);
+                  printf("\n");
+          }
+
+          close(pfd.fd);
+
+          return 0;
+  }
+
+Result
+------
+*./a.out "/sys/bus/i2c/devices/5-1010/slave-mqueue"*
+
+::
+
+  [10183.232500449] : 20 18 c8 2c 78 01 5b
+  [10183.479358348] : 20 18 c8 2c 78 01 5b
+  [10183.726556812] : 20 18 c8 2c 78 01 5b
+  [10183.972605863] : 20 18 c8 2c 78 01 5b
+  [10184.220124772] : 20 18 c8 2c 78 01 5b
+  [10184.467764166] : 20 18 c8 2c 78 01 5b
+  [10193.233421784] : 20 18 c8 2c 7c 01 57
+  [10193.480273460] : 20 18 c8 2c 7c 01 57
+  [10193.726788733] : 20 18 c8 2c 7c 01 57
+  [10193.972781945] : 20 18 c8 2c 7c 01 57
+  [10194.220487360] : 20 18 c8 2c 7c 01 57
+  [10194.468089259] : 20 18 c8 2c 7c 01 57
+  [10203.233433099] : 20 18 c8 2c 80 01 53
+  [10203.481058715] : 20 18 c8 2c 80 01 53
+  [10203.727610472] : 20 18 c8 2c 80 01 53
+  [10203.974044856] : 20 18 c8 2c 80 01 53
+  [10204.220734634] : 20 18 c8 2c 80 01 53
+  [10204.468461664] : 20 18 c8 2c 80 01 53
diff --git a/MAINTAINERS b/MAINTAINERS
index 429c6c624861..bca17c3398b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7445,6 +7445,14 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/i2c-stub.c
 
+I2C SLAVE MQUEUE DRIVER
+M:	Eduardo Valentin <eduval@amazon.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/i2c-slave-mqueue.c
+F:	Documentation/i2c/slave-mqueue-backend.rst
+F:	Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt
+
 I3C SUBSYSTEM
 M:	Boris Brezillon <bbrezillon@kernel.org>
 L:	linux-i3c@lists.infradead.org
diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index abedd55a1264..f335924936ae 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -119,6 +119,31 @@ if I2C_SLAVE
 config I2C_SLAVE_EEPROM
 	tristate "I2C eeprom slave driver"
 
+config I2C_SLAVE_MQUEUE
+	tristate "I2C mqueue (message queue) slave driver"
+	help
+	  Some protocols over I2C are designed for bi-directional transferring
+	  messages by using I2C Master Write protocol. This driver is used to
+	  receive and queue messages from the remote I2C device.
+
+	  Userspace can get the messages by reading sysfs file that this driver
+	  exposes.
+
+	  This support is also available as a module. If so, the module will be
+	  called i2c-slave-mqueue.
+
+config I2C_SLAVE_MQUEUE_MESSAGE_SIZE
+	int "The message size of I2C mqueue slave"
+	depends on I2C_SLAVE_MQUEUE
+	default 120
+
+config I2C_SLAVE_MQUEUE_QUEUE_SIZE
+	int "The queue size of I2C mqueue slave"
+	depends on I2C_SLAVE_MQUEUE
+	default 32
+	help
+	  This number MUST be power of 2.
+
 endif
 
 config I2C_DEBUG_CORE
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index bed6ba63c983..9a31bc75a446 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -16,5 +16,6 @@ obj-$(CONFIG_I2C_MUX)		+= i2c-mux.o
 obj-y				+= algos/ busses/ muxes/
 obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
 obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
+obj-$(CONFIG_I2C_SLAVE_MQUEUE)	+= i2c-slave-mqueue.o
 
 ccflags-$(CONFIG_I2C_DEBUG_CORE) := -DDEBUG
diff --git a/drivers/i2c/i2c-slave-mqueue.c b/drivers/i2c/i2c-slave-mqueue.c
new file mode 100644
index 000000000000..235099549d40
--- /dev/null
+++ b/drivers/i2c/i2c-slave-mqueue.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2017 - 2018, Intel Corporation.
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/sysfs.h>
+
+#define MQ_MSGBUF_SIZE		CONFIG_I2C_SLAVE_MQUEUE_MESSAGE_SIZE
+#define MQ_QUEUE_SIZE		CONFIG_I2C_SLAVE_MQUEUE_QUEUE_SIZE
+#define MQ_QUEUE_NEXT(x)	(((x) + 1) & (MQ_QUEUE_SIZE - 1))
+
+struct mq_msg {
+	int	len;
+	u8	*buf;
+};
+
+struct mq_queue {
+	struct bin_attribute	bin;
+	struct kernfs_node	*kn;
+
+	spinlock_t		lock; /* spinlock for queue index handling */
+	int			in;
+	int			out;
+
+	struct mq_msg		*curr;
+	int			truncated; /* drop current if truncated */
+	struct mq_msg		queue[MQ_QUEUE_SIZE];
+};
+
+static int i2c_slave_mqueue_callback(struct i2c_client *client,
+				     enum i2c_slave_event event, u8 *val)
+{
+	struct mq_queue *mq = i2c_get_clientdata(client);
+	struct mq_msg *msg = mq->curr;
+	int ret = 0;
+
+	switch (event) {
+	case I2C_SLAVE_WRITE_REQUESTED:
+		mq->truncated = 0;
+
+		msg->len = 1;
+		msg->buf[0] = client->addr << 1;
+		break;
+
+	case I2C_SLAVE_WRITE_RECEIVED:
+		if (msg->len < MQ_MSGBUF_SIZE) {
+			msg->buf[msg->len++] = *val;
+		} else {
+			dev_err(&client->dev, "message is truncated!\n");
+			mq->truncated = 1;
+			ret = -EINVAL;
+		}
+		break;
+
+	case I2C_SLAVE_STOP:
+		if (unlikely(mq->truncated || msg->len < 2))
+			break;
+
+		spin_lock(&mq->lock);
+		mq->in = MQ_QUEUE_NEXT(mq->in);
+		mq->curr = &mq->queue[mq->in];
+		mq->curr->len = 0;
+
+		/* Flush the oldest message */
+		if (mq->out == mq->in)
+			mq->out = MQ_QUEUE_NEXT(mq->out);
+		spin_unlock(&mq->lock);
+
+		kernfs_notify(mq->kn);
+		break;
+
+	default:
+		*val = 0xFF;
+		break;
+	}
+
+	return ret;
+}
+
+static ssize_t i2c_slave_mqueue_bin_read(struct file *filp,
+					 struct kobject *kobj,
+					 struct bin_attribute *attr,
+					 char *buf, loff_t pos, size_t count)
+{
+	struct mq_queue *mq;
+	struct mq_msg *msg;
+	unsigned long flags;
+	bool more = false;
+	ssize_t ret = 0;
+
+	mq = dev_get_drvdata(container_of(kobj, struct device, kobj));
+
+	spin_lock_irqsave(&mq->lock, flags);
+	if (mq->out != mq->in) {
+		msg = &mq->queue[mq->out];
+
+		if (msg->len <= count) {
+			ret = msg->len;
+			memcpy(buf, msg->buf, ret);
+		} else {
+			ret = -EOVERFLOW; /* Drop this HUGE one. */
+		}
+
+		mq->out = MQ_QUEUE_NEXT(mq->out);
+		if (mq->out != mq->in)
+			more = true;
+	}
+	spin_unlock_irqrestore(&mq->lock, flags);
+
+	if (more)
+		kernfs_notify(mq->kn);
+
+	return ret;
+}
+
+static int i2c_slave_mqueue_probe(struct i2c_client *client,
+				  const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct mq_queue *mq;
+	int ret, i;
+	void *buf;
+
+	mq = devm_kzalloc(dev, sizeof(*mq), GFP_KERNEL);
+	if (!mq)
+		return -ENOMEM;
+
+	BUILD_BUG_ON(!is_power_of_2(MQ_QUEUE_SIZE));
+
+	buf = devm_kmalloc_array(dev, MQ_QUEUE_SIZE, MQ_MSGBUF_SIZE,
+				 GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = 0; i < MQ_QUEUE_SIZE; i++)
+		mq->queue[i].buf = buf + i * MQ_MSGBUF_SIZE;
+
+	i2c_set_clientdata(client, mq);
+
+	spin_lock_init(&mq->lock);
+	mq->curr = &mq->queue[0];
+
+	sysfs_bin_attr_init(&mq->bin);
+	mq->bin.attr.name = "slave-mqueue";
+	mq->bin.attr.mode = 0400;
+	mq->bin.read = i2c_slave_mqueue_bin_read;
+	mq->bin.size = MQ_MSGBUF_SIZE * MQ_QUEUE_SIZE;
+
+	ret = sysfs_create_bin_file(&dev->kobj, &mq->bin);
+	if (ret)
+		return ret;
+
+	mq->kn = kernfs_find_and_get(dev->kobj.sd, mq->bin.attr.name);
+	if (!mq->kn) {
+		sysfs_remove_bin_file(&dev->kobj, &mq->bin);
+		return -EFAULT;
+	}
+
+	ret = i2c_slave_register(client, i2c_slave_mqueue_callback);
+	if (ret) {
+		kernfs_put(mq->kn);
+		sysfs_remove_bin_file(&dev->kobj, &mq->bin);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int i2c_slave_mqueue_remove(struct i2c_client *client)
+{
+	struct mq_queue *mq = i2c_get_clientdata(client);
+
+	i2c_slave_unregister(client);
+
+	kernfs_put(mq->kn);
+	sysfs_remove_bin_file(&client->dev.kobj, &mq->bin);
+
+	return 0;
+}
+
+static const struct i2c_device_id i2c_slave_mqueue_id[] = {
+	{ "slave-mqueue", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, i2c_slave_mqueue_id);
+
+static const struct of_device_id i2c_slave_mqueue_of_match[] = {
+	{
+		.compatible = "i2c-slave-mqueue",
+	},
+	{ },
+};
+
+static struct i2c_driver i2c_slave_mqueue_driver = {
+	.driver = {
+		.name	= "i2c-slave-mqueue",
+		.of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),
+	},
+	.probe		= i2c_slave_mqueue_probe,
+	.remove		= i2c_slave_mqueue_remove,
+	.id_table	= i2c_slave_mqueue_id,
+};
+module_i2c_driver(i2c_slave_mqueue_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
+MODULE_DESCRIPTION("I2C slave mode for receiving and queuing messages");
-- 
2.21.0

