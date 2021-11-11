Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8170C44D9C0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 17:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbhKKQHI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 11:07:08 -0500
Received: from smtp2.axis.com ([195.60.68.18]:37534 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233902AbhKKQHH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Nov 2021 11:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636646658;
  x=1668182658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ewH1kGjLHxx6u24wLlQZv3p2b5h5AfAa9KIwPCRDzk=;
  b=Iq9qRX57uGNbSasJlg+NDCw5qtJlkZw5f19B4r/4pOGTTG1uIMBVbk0c
   MrmOVR+LFtzkHKzOZcS2024Ye6l82H0q4JPAFCKBJ2ZPxr3f+/F+gZR6t
   8CbM1ZhJ9VPI3M0+WqFQNAmizL0Ocpxt9Z5wolbc/A01Th0t8dhi2BU7j
   IX5USzm5YBFMsdTpAvJvKhj4x/bt2D5BbpqxVeCbk5IGNaF4nlatmSLtP
   in8SIbBOfbJzKcpXdgCSzBdxuha2Fsix1xjC1Z4haJhVVsuJcEu6o8qtm
   YKxYKI9YDPNzl4G6z+a8CPZof6u6ucYmEzA7Aj7u5w61unjk3M/mPU8jO
   A==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>, <jie.deng@intel.com>, <viresh.kumar@linaro.org>
CC:     <conghui.chen@intel.com>, <mst@redhat.com>,
        <virtualization@lists.linux-foundation.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH v2 2/2] i2c: virtio: fix completion handling
Date:   Thu, 11 Nov 2021 17:04:12 +0100
Message-ID: <20211111160412.11980-3-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211111160412.11980-1-vincent.whitchurch@axis.com>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver currently assumes that the notify callback is only received
when the device is done with all the queued buffers.

However, this is not true, since the notify callback could be called
without any of the queued buffers being completed (for example, with
virtio-pci and shared interrupts) or with only some of the buffers being
completed (since the driver makes them available to the device in
multiple separate virtqueue_add_sgs() calls).

This can lead to incorrect data on the I2C bus or memory corruption in
the guest if the device operates on buffers which are have been freed by
the driver.  (The WARN_ON in the driver is also triggered.)

 BUG kmalloc-128 (Tainted: G        W        ): Poison overwritten
 First byte 0x0 instead of 0x6b
 Allocated in i2cdev_ioctl_rdwr+0x9d/0x1de age=243 cpu=0 pid=28
 	memdup_user+0x2e/0xbd
 	i2cdev_ioctl_rdwr+0x9d/0x1de
 	i2cdev_ioctl+0x247/0x2ed
 	vfs_ioctl+0x21/0x30
 	sys_ioctl+0xb18/0xb41
 Freed in i2cdev_ioctl_rdwr+0x1bb/0x1de age=68 cpu=0 pid=28
 	kfree+0x1bd/0x1cc
 	i2cdev_ioctl_rdwr+0x1bb/0x1de
 	i2cdev_ioctl+0x247/0x2ed
 	vfs_ioctl+0x21/0x30
 	sys_ioctl+0xb18/0xb41

Fix this by calling virtio_get_buf() from the notify handler like other
virtio drivers and by actually waiting for all the buffers to be
completed.

Fixes: 3cfc88380413d20f ("i2c: virtio: add a virtio i2c frontend driver")
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/i2c/busses/i2c-virtio.c | 34 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 7b2474e6876f..2d3ae8e238ec 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -22,24 +22,24 @@
 /**
  * struct virtio_i2c - virtio I2C data
  * @vdev: virtio device for this controller
- * @completion: completion of virtio I2C message
  * @adap: I2C adapter for this controller
  * @vq: the virtio virtqueue for communication
  */
 struct virtio_i2c {
 	struct virtio_device *vdev;
-	struct completion completion;
 	struct i2c_adapter adap;
 	struct virtqueue *vq;
 };
 
 /**
  * struct virtio_i2c_req - the virtio I2C request structure
+ * @completion: completion of virtio I2C message
  * @out_hdr: the OUT header of the virtio I2C message
  * @buf: the buffer into which data is read, or from which it's written
  * @in_hdr: the IN header of the virtio I2C message
  */
 struct virtio_i2c_req {
+	struct completion completion;
 	struct virtio_i2c_out_hdr out_hdr	____cacheline_aligned;
 	uint8_t *buf				____cacheline_aligned;
 	struct virtio_i2c_in_hdr in_hdr		____cacheline_aligned;
@@ -47,9 +47,11 @@ struct virtio_i2c_req {
 
 static void virtio_i2c_msg_done(struct virtqueue *vq)
 {
-	struct virtio_i2c *vi = vq->vdev->priv;
+	struct virtio_i2c_req *req;
+	unsigned int len;
 
-	complete(&vi->completion);
+	while ((req = virtqueue_get_buf(vq, &len)))
+		complete(&req->completion);
 }
 
 static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
@@ -69,6 +71,8 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
 		if (!msgs[i].len)
 			break;
 
+		init_completion(&reqs[i].completion);
+
 		/*
 		 * Only 7-bit mode supported for this moment. For the address
 		 * format, Please check the Virtio I2C Specification.
@@ -108,21 +112,13 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
 				    struct virtio_i2c_req *reqs,
 				    struct i2c_msg *msgs, int num)
 {
-	struct virtio_i2c_req *req;
 	bool failed = false;
-	unsigned int len;
 	int i, j = 0;
 
 	for (i = 0; i < num; i++) {
-		/* Detach the ith request from the vq */
-		req = virtqueue_get_buf(vq, &len);
+		struct virtio_i2c_req *req = &reqs[i];
 
-		/*
-		 * Condition req == &reqs[i] should always meet since we have
-		 * total num requests in the vq. reqs[i] can never be NULL here.
-		 */
-		if (!failed && (WARN_ON(req != &reqs[i]) ||
-				req->in_hdr.status != VIRTIO_I2C_MSG_OK))
+		if (!failed && req->in_hdr.status != VIRTIO_I2C_MSG_OK)
 			failed = true;
 
 		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
@@ -158,11 +154,13 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * remote here to clear the virtqueue, so we can try another set of
 	 * messages later on.
 	 */
-
-	reinit_completion(&vi->completion);
 	virtqueue_kick(vq);
 
-	wait_for_completion(&vi->completion);
+	/*
+	 * We only need to wait for the last one since the device is required
+	 * to complete requests in order.
+	 */
+	wait_for_completion(&reqs[count - 1].completion);
 
 	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count);
 
@@ -211,8 +209,6 @@ static int virtio_i2c_probe(struct virtio_device *vdev)
 	vdev->priv = vi;
 	vi->vdev = vdev;
 
-	init_completion(&vi->completion);
-
 	ret = virtio_i2c_setup_vqs(vi);
 	if (ret)
 		return ret;
-- 
2.28.0

