Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2848A3BB757
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 08:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbhGEG6h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 02:58:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:54120 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhGEG6h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Jul 2021 02:58:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="196216157"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="196216157"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2021 23:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="562441954"
Received: from jiedeng-optiplex-7050.sh.intel.com ([10.239.154.104])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2021 23:55:51 -0700
From:   Jie Deng <jie.deng@intel.com>
To:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     wsa@kernel.org, wsa+renesas@sang-engineering.com,
        jie.deng@intel.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        viresh.kumar@linaro.org, stefanha@redhat.com,
        gregkh@linuxfoundation.org
Subject: [PATCH v13] i2c: virtio: add a virtio i2c frontend driver
Date:   Mon,  5 Jul 2021 14:53:37 +0800
Message-Id: <8908f35a741e25a630d521e1012494e67d31ea64.1625466616.git.jie.deng@intel.com>
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
---
Changes v12 -> v13
	- Use _BITUL() instead of BIT()
	- Rename "virtio_i2c_send_reqs" to "virtio_i2c_prepare_reqs"
	- Optimize the return value of "virtio_i2c_complete_reqs"

Changes v11 -> v12
	- Do not sent msg_buf for zero-length request.
	- Send requests to host only if all the number of transfers requested prepared successfully.
	- Remove the line #include <linux/bits.h> in virtio_i2c.h

Changes v10 -> v11
	- Remove vi->adap.class = I2C_CLASS_DEPRECATED.
	- Use #ifdef CONFIG_PM_SLEEP to replace the "__maybe_unused".
	- Remove "struct mutex lock" in "struct virtio_i2c".
	- Support zero-length request.
	- Remove unnecessary logs.
	- Remove vi->adap.timeout = HZ / 10, just use the default value.
	- Use BIT(0) to define VIRTIO_I2C_FLAGS_FAIL_NEXT.
	- Add the virtio_device index to adapter's naming mechanism.

 drivers/i2c/busses/Kconfig      |  11 ++
 drivers/i2c/busses/Makefile     |   3 +
 drivers/i2c/busses/i2c-virtio.c | 269 ++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_i2c.h |  41 ++++++
 include/uapi/linux/virtio_ids.h |   1 +
 5 files changed, 325 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-virtio.c
 create mode 100644 include/uapi/linux/virtio_i2c.h

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 10acece..e47616a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -21,6 +21,17 @@ config I2C_ALI1535
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-ali1535.
 
+config I2C_VIRTIO
+	tristate "Virtio I2C Adapter"
+	select VIRTIO
+	help
+	  If you say yes to this option, support will be included for the virtio
+	  I2C adapter driver. The hardware can be emulated by any device model
+	  software according to the virtio protocol.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-virtio.
+
 config I2C_ALI1563
 	tristate "ALI 1563"
 	depends on PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 69e9963..9843756 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -147,4 +147,7 @@ obj-$(CONFIG_I2C_XGENE_SLIMPRO) += i2c-xgene-slimpro.o
 obj-$(CONFIG_SCx200_ACB)	+= scx200_acb.o
 obj-$(CONFIG_I2C_FSI)		+= i2c-fsi.o
 
+# VIRTIO I2C host controller driver
+obj-$(CONFIG_I2C_VIRTIO)	+= i2c-virtio.o
+
 ccflags-$(CONFIG_I2C_DEBUG_BUS) := -DDEBUG
diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
new file mode 100644
index 0000000..731267d
--- /dev/null
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -0,0 +1,269 @@
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
+				   struct i2c_msg *msgs, int nr)
+{
+	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
+	int i, outcnt, incnt, err = 0;
+
+	for (i = 0; i < nr; i++) {
+		/*
+		 * Only 7-bit mode supported for this moment. For the address format,
+		 * Please check the Virtio I2C Specification.
+		 */
+		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
+
+		if (i != nr - 1)
+			reqs[i].out_hdr.flags = cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT);
+
+		outcnt = incnt = 0;
+		sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
+		sgs[outcnt++] = &out_hdr;
+
+		if (msgs[i].len) {
+			reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
+			if (!reqs[i].buf)
+				break;
+
+			sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
+
+			if (msgs[i].flags & I2C_M_RD)
+				sgs[outcnt + incnt++] = &msg_buf;
+			else
+				sgs[outcnt++] = &msg_buf;
+		}
+
+		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
+		sgs[outcnt + incnt++] = &in_hdr;
+
+		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
+		if (err < 0) {
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
+				    struct i2c_msg *msgs, int nr,
+				    bool fail)
+{
+	struct virtio_i2c_req *req;
+	bool failed = fail;
+	unsigned int len;
+	int i, j = 0;
+
+	for (i = 0; i < nr; i++) {
+		/* Detach the ith request from the vq */
+		req = virtqueue_get_buf(vq, &len);
+
+		/*
+		 * Condition (req && req == &reqs[i]) should always meet since
+		 * we have total nr requests in the vq.
+		 */
+		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
+		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
+			failed = true;
+
+		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
+		if (!failed)
+			j++;
+	}
+
+	return fail ? 0 : j;
+}
+
+static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct virtio_i2c *vi = i2c_get_adapdata(adap);
+	struct virtqueue *vq = vi->vq;
+	struct virtio_i2c_req *reqs;
+	unsigned long time_left;
+	int ret;
+
+	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
+	if (!reqs)
+		return -ENOMEM;
+
+	ret = virtio_i2c_prepare_reqs(vq, reqs, msgs, num);
+	if (ret != num) {
+		ret = virtio_i2c_complete_reqs(vq, reqs, msgs, ret, true);
+		goto err_free;
+	}
+
+	reinit_completion(&vi->completion);
+	virtqueue_kick(vq);
+	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
+	ret = virtio_i2c_complete_reqs(vq, reqs, msgs, num, !time_left);
+
+	if (!time_left) {
+		ret = -ETIMEDOUT;
+		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
+	}
+
+err_free:
+	kfree(reqs);
+	return ret;
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
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static struct i2c_algorithm virtio_algorithm = {
+	.master_xfer = virtio_i2c_xfer,
+	.functionality = virtio_i2c_func,
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
+	vi->adap.dev.parent = &vdev->dev;
+	i2c_set_adapdata(&vi->adap, vi);
+
+	/* Setup ACPI node for controlled devices which will be probed through ACPI */
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
index 0000000..df936a2
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
+#include <linux/types.h>
+#include <linux/const.h>
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
index 4fe842c..3b5f05a 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -55,6 +55,7 @@
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_I2C_ADAPTER		34 /* virtio i2c adapter */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
2.7.4

