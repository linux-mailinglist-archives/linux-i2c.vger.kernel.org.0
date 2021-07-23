Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1283D343F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jul 2021 07:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhGWFF1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jul 2021 01:05:27 -0400
Received: from mga12.intel.com ([192.55.52.136]:47032 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233641AbhGWFF1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 23 Jul 2021 01:05:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="191404658"
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; 
   d="scan'208";a="191404658"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2021 22:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; 
   d="scan'208";a="496173187"
Received: from jiedeng-optiplex-7050.sh.intel.com ([10.239.154.104])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2021 22:45:49 -0700
From:   Jie Deng <jie.deng@intel.com>
To:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     wsa@kernel.org, wsa+renesas@sang-engineering.com,
        jie.deng@intel.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, conghui.chen@intel.com,
        viresh.kumar@linaro.org, stefanha@redhat.com,
        gregkh@linuxfoundation.org, vincent.guittot@linaro.org,
        alex.bennee@linaro.org, jiedeng@alumni.sjtu.edu.cn
Subject: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
Date:   Fri, 23 Jul 2021 13:44:35 +0800
Message-Id: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add an I2C bus driver for virtio para-virtualization.

The controller can be emulated by the backend driver in
any device model software by following the virtio protocol.

The device specification can be found on
https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.

By following the specification, people may implement different
backend drivers to emulate different controllers according to
their needs.

Co-developed-by: Conghui Chen <conghui.chen@intel.com>
Signed-off-by: Conghui Chen <conghui.chen@intel.com>
Signed-off-by: Jie Deng <jie.deng@intel.com>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
Changes v14 -> v15
	- Minor fixes in Makefile and Kconfig.
	- Add an i2c_adapter_quirks to filter out 0 length messages.
	- Update the MAINTAINERS. 

Changes v13 -> v14
	- Put the headers in virtio_i2c.h in alphabetical order.
	- Dropped I2C_FUNC_SMBUS_QUICK support.
	- Dropped few unnecessary variables and checks.
	- Use "num" everywhere instead of num or nr, to be consistent.
	- Added few comments which make the design more clear. 
 
Changes v12 -> v13
	- Use _BITUL() instead of BIT().
	- Rename "virtio_i2c_send_reqs" to "virtio_i2c_prepare_reqs".
	- Optimize the return value of "virtio_i2c_complete_reqs".

Changes v11 -> v12
	- Do not sent msg_buf for zero-length request.
	- Send requests to host only if all the number of transfers requested prepared successfully.
	- Remove the line #include <linux/bits.h> in virtio_i2c.h.

Changes v10 -> v11
	- Remove vi->adap.class = I2C_CLASS_DEPRECATED.
	- Use #ifdef CONFIG_PM_SLEEP to replace the "__maybe_unused".
	- Remove "struct mutex lock" in "struct virtio_i2c".
	- Support zero-length request.
	- Remove unnecessary logs.
	- Remove vi->adap.timeout = HZ / 10, just use the default value.
	- Use BIT(0) to define VIRTIO_I2C_FLAGS_FAIL_NEXT.
	- Add the virtio_device index to adapter's naming mechanism.

 MAINTAINERS                     |   9 ++
 drivers/i2c/busses/Kconfig      |  11 ++
 drivers/i2c/busses/Makefile     |   1 +
 drivers/i2c/busses/i2c-virtio.c | 290 ++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_i2c.h |  41 ++++++
 include/uapi/linux/virtio_ids.h |   1 +
 6 files changed, 353 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-virtio.c
 create mode 100644 include/uapi/linux/virtio_i2c.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c8be73..0183c50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19707,6 +19707,15 @@ S:	Maintained
 F:	include/uapi/linux/virtio_snd.h
 F:	sound/virtio/*
 
+VIRTIO I2C DRIVER
+M:	Jie Deng <jie.deng@intel.com>
+M:	Viresh Kumar <viresh.kumar@linaro.org>
+L:	linux-i2c@vger.kernel.org
+L:	virtualization@lists.linux-foundation.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-virtio.c
+F:	include/uapi/linux/virtio_i2c.h
+
 VIRTUAL BOX GUEST DEVICE DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 M:	Arnd Bergmann <arnd@arndb.de>
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 10acece..cbaf199 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1402,4 +1402,15 @@ config I2C_FSI
 	  This driver can also be built as a module. If so, the module will be
 	  called as i2c-fsi.
 
+config I2C_VIRTIO
+        tristate "Virtio I2C Adapter"
+        select VIRTIO
+        help
+          If you say yes to this option, support will be included for the virtio
+          I2C adapter driver. The hardware can be emulated by any device model
+          software according to the virtio protocol.
+
+          This driver can also be built as a module. If so, the module
+          will be called i2c-virtio.
+
 endmenu
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 69e9963..1e8c0ba 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -146,5 +146,6 @@ obj-$(CONFIG_I2C_SIBYTE)	+= i2c-sibyte.o
 obj-$(CONFIG_I2C_XGENE_SLIMPRO) += i2c-xgene-slimpro.o
 obj-$(CONFIG_SCx200_ACB)	+= scx200_acb.o
 obj-$(CONFIG_I2C_FSI)		+= i2c-fsi.o
+obj-$(CONFIG_I2C_VIRTIO)	+= i2c-virtio.o
 
 ccflags-$(CONFIG_I2C_DEBUG_BUS) := -DDEBUG
diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
new file mode 100644
index 0000000..d3e60d9
--- /dev/null
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Virtio I2C Bus Driver
+ *
+ * The Virtio I2C Specification:
+ * https://raw.githubusercontent.com/oasis-tcs/virtio-spec/master/virtio-i2c.tex
+ *
+ * Copyright (c) 2021 Intel Corporation. All rights reserved.
+ */
+
+#include <linux/acpi.h>
+#include <linux/completion.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/virtio.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_i2c.h>
+
+/**
+ * struct virtio_i2c - virtio I2C data
+ * @vdev: virtio device for this controller
+ * @completion: completion of virtio I2C message
+ * @adap: I2C adapter for this controller
+ * @vq: the virtio virtqueue for communication
+ */
+struct virtio_i2c {
+	struct virtio_device *vdev;
+	struct completion completion;
+	struct i2c_adapter adap;
+	struct virtqueue *vq;
+};
+
+/**
+ * struct virtio_i2c_req - the virtio I2C request structure
+ * @out_hdr: the OUT header of the virtio I2C message
+ * @buf: the buffer into which data is read, or from which it's written
+ * @in_hdr: the IN header of the virtio I2C message
+ */
+struct virtio_i2c_req {
+	struct virtio_i2c_out_hdr out_hdr	____cacheline_aligned;
+	uint8_t *buf				____cacheline_aligned;
+	struct virtio_i2c_in_hdr in_hdr		____cacheline_aligned;
+};
+
+static void virtio_i2c_msg_done(struct virtqueue *vq)
+{
+	struct virtio_i2c *vi = vq->vdev->priv;
+
+	complete(&vi->completion);
+}
+
+static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
+				   struct virtio_i2c_req *reqs,
+				   struct i2c_msg *msgs, int num)
+{
+	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
+	int i;
+
+	for (i = 0; i < num; i++) {
+		int outcnt = 0, incnt = 0;
+
+		/*
+		 * We don't support 0 length messages and so filter out
+		 * 0 length transfers by using i2c_adapter_quirks.
+		 */
+		if (!msgs[i].len)
+			break;
+
+		/*
+		 * Only 7-bit mode supported for this moment. For the address
+		 * format, Please check the Virtio I2C Specification.
+		 */
+		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
+
+		if (i != num - 1)
+			reqs[i].out_hdr.flags = cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT);
+
+		sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
+		sgs[outcnt++] = &out_hdr;
+
+		reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
+		if (!reqs[i].buf)
+			break;
+
+		sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
+
+		if (msgs[i].flags & I2C_M_RD)
+			sgs[outcnt + incnt++] = &msg_buf;
+		else
+			sgs[outcnt++] = &msg_buf;
+
+		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
+		sgs[outcnt + incnt++] = &in_hdr;
+
+		if (virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL)) {
+			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
+			break;
+		}
+	}
+
+	return i;
+}
+
+static int virtio_i2c_complete_reqs(struct virtqueue *vq,
+				    struct virtio_i2c_req *reqs,
+				    struct i2c_msg *msgs, int num,
+				    bool timedout)
+{
+	struct virtio_i2c_req *req;
+	bool failed = timedout;
+	unsigned int len;
+	int i, j = 0;
+
+	for (i = 0; i < num; i++) {
+		/* Detach the ith request from the vq */
+		req = virtqueue_get_buf(vq, &len);
+
+		/*
+		 * Condition req == &reqs[i] should always meet since we have
+		 * total num requests in the vq. reqs[i] can never be NULL here.
+		 */
+		if (!failed && (WARN_ON(req != &reqs[i]) ||
+				req->in_hdr.status != VIRTIO_I2C_MSG_OK))
+			failed = true;
+
+		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
+
+		if (!failed)
+			j++;
+	}
+
+	return timedout ? -ETIMEDOUT : j;
+}
+
+static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			   int num)
+{
+	struct virtio_i2c *vi = i2c_get_adapdata(adap);
+	struct virtqueue *vq = vi->vq;
+	struct virtio_i2c_req *reqs;
+	unsigned long time_left;
+	int count;
+
+	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
+	if (!reqs)
+		return -ENOMEM;
+
+	count = virtio_i2c_prepare_reqs(vq, reqs, msgs, num);
+	if (!count)
+		goto err_free;
+
+	/*
+	 * For the case where count < num, i.e. we weren't able to queue all the
+	 * msgs, ideally we should abort right away and return early, but some
+	 * of the messages are already sent to the remote I2C controller and the
+	 * virtqueue will be left in undefined state in that case. We kick the
+	 * remote here to clear the virtqueue, so we can try another set of
+	 * messages later on.
+	 */
+
+	reinit_completion(&vi->completion);
+	virtqueue_kick(vq);
+
+	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
+	if (!time_left)
+		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
+
+	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count, !time_left);
+
+err_free:
+	kfree(reqs);
+	return count;
+}
+
+static void virtio_i2c_del_vqs(struct virtio_device *vdev)
+{
+	vdev->config->reset(vdev);
+	vdev->config->del_vqs(vdev);
+}
+
+static int virtio_i2c_setup_vqs(struct virtio_i2c *vi)
+{
+	struct virtio_device *vdev = vi->vdev;
+
+	vi->vq = virtio_find_single_vq(vdev, virtio_i2c_msg_done, "msg");
+	return PTR_ERR_OR_ZERO(vi->vq);
+}
+
+static u32 virtio_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+}
+
+static struct i2c_algorithm virtio_algorithm = {
+	.master_xfer = virtio_i2c_xfer,
+	.functionality = virtio_i2c_func,
+};
+
+static const struct i2c_adapter_quirks virtio_i2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN,
+};
+
+static int virtio_i2c_probe(struct virtio_device *vdev)
+{
+	struct device *pdev = vdev->dev.parent;
+	struct virtio_i2c *vi;
+	int ret;
+
+	vi = devm_kzalloc(&vdev->dev, sizeof(*vi), GFP_KERNEL);
+	if (!vi)
+		return -ENOMEM;
+
+	vdev->priv = vi;
+	vi->vdev = vdev;
+
+	init_completion(&vi->completion);
+
+	ret = virtio_i2c_setup_vqs(vi);
+	if (ret)
+		return ret;
+
+	vi->adap.owner = THIS_MODULE;
+	snprintf(vi->adap.name, sizeof(vi->adap.name),
+		 "i2c_virtio at virtio bus %d", vdev->index);
+	vi->adap.algo = &virtio_algorithm;
+	vi->adap.quirks = &virtio_i2c_quirks;
+	vi->adap.dev.parent = &vdev->dev;
+	i2c_set_adapdata(&vi->adap, vi);
+
+	/*
+	 * Setup ACPI node for controlled devices which will be probed through
+	 * ACPI.
+	 */
+	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
+
+	ret = i2c_add_adapter(&vi->adap);
+	if (ret)
+		virtio_i2c_del_vqs(vdev);
+
+	return ret;
+}
+
+static void virtio_i2c_remove(struct virtio_device *vdev)
+{
+	struct virtio_i2c *vi = vdev->priv;
+
+	i2c_del_adapter(&vi->adap);
+	virtio_i2c_del_vqs(vdev);
+}
+
+static struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_I2C_ADAPTER, VIRTIO_DEV_ANY_ID },
+	{}
+};
+MODULE_DEVICE_TABLE(virtio, id_table);
+
+#ifdef CONFIG_PM_SLEEP
+static int virtio_i2c_freeze(struct virtio_device *vdev)
+{
+	virtio_i2c_del_vqs(vdev);
+	return 0;
+}
+
+static int virtio_i2c_restore(struct virtio_device *vdev)
+{
+	return virtio_i2c_setup_vqs(vdev->priv);
+}
+#endif
+
+static struct virtio_driver virtio_i2c_driver = {
+	.id_table	= id_table,
+	.probe		= virtio_i2c_probe,
+	.remove		= virtio_i2c_remove,
+	.driver	= {
+		.name	= "i2c_virtio",
+	},
+#ifdef CONFIG_PM_SLEEP
+	.freeze = virtio_i2c_freeze,
+	.restore = virtio_i2c_restore,
+#endif
+};
+module_virtio_driver(virtio_i2c_driver);
+
+MODULE_AUTHOR("Jie Deng <jie.deng@intel.com>");
+MODULE_AUTHOR("Conghui Chen <conghui.chen@intel.com>");
+MODULE_DESCRIPTION("Virtio i2c bus driver");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
new file mode 100644
index 0000000..7c6a6fc
--- /dev/null
+++ b/include/uapi/linux/virtio_i2c.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
+/*
+ * Definitions for virtio I2C Adpter
+ *
+ * Copyright (c) 2021 Intel Corporation. All rights reserved.
+ */
+
+#ifndef _UAPI_LINUX_VIRTIO_I2C_H
+#define _UAPI_LINUX_VIRTIO_I2C_H
+
+#include <linux/const.h>
+#include <linux/types.h>
+
+/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the requests */
+#define VIRTIO_I2C_FLAGS_FAIL_NEXT	_BITUL(0)
+
+/**
+ * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
+ * @addr: the controlled device address
+ * @padding: used to pad to full dword
+ * @flags: used for feature extensibility
+ */
+struct virtio_i2c_out_hdr {
+	__le16 addr;
+	__le16 padding;
+	__le32 flags;
+};
+
+/**
+ * struct virtio_i2c_in_hdr - the virtio I2C message IN header
+ * @status: the processing result from the backend
+ */
+struct virtio_i2c_in_hdr {
+	__u8 status;
+};
+
+/* The final status written by the device */
+#define VIRTIO_I2C_MSG_OK	0
+#define VIRTIO_I2C_MSG_ERR	1
+
+#endif /* _UAPI_LINUX_VIRTIO_I2C_H */
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index 70a8057a..99aa27b 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -55,6 +55,7 @@
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_I2C_ADAPTER		34 /* virtio i2c adapter */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
 
 /*
-- 
2.7.4

