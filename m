Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262EC46667E
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 16:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347610AbhLBPfv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 10:35:51 -0500
Received: from smtp2.axis.com ([195.60.68.18]:29932 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347557AbhLBPfu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Dec 2021 10:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1638459148;
  x=1669995148;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QW6971HeXyxZD+Obc/BuWEJRNHl9yOf9lvXC3G7vFAg=;
  b=oHUYFcU/NACfx5/L4eMODi44n74TxBmIF87Y7EA++uH4iemoxkEgDGbk
   a2eecqelhvJOJRDYH3wHNkaE4ZnWGqYF7ShhAv+XR5vatIklYcV9NtmWq
   hcOfu/5Nuf1PZ+DFL+l8h19KakU7ITSBoIMSTAHug9J2Cezgef8hTdvAX
   o4GK3eEMFyDgJDNgJ54/IjESLLRbQgF1rEj6ewKUuAuzi5+o7WT2k3vNE
   kqHXJq2Hs3d2K+bNsJEAc3IbQC0Y9UY0WotPBxPLv5G1v1M2Mg9J8DiSD
   Om5k1nRZR6FWJ7cSIS2v7VCtujjTj0YnHOD+p0ey0k1ovfRD4vbAOUFKV
   w==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>, Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Jie Deng <jie.deng@intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>, <linux-i2c@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] i2c: virtio: fix completion handling
Date:   Thu, 2 Dec 2021 16:32:14 +0100
Message-ID: <20211202153215.31796-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.33.1
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

Notes:
    v3: Wait for all completions instead of only the last one.
    v2: Add Acked-by and Fixes tags.

 drivers/i2c/busses/i2c-virtio.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 95378780da6d..41eb0dcc3204 100644
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
@@ -62,6 +64,8 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
 	for (i = 0; i < num; i++) {
 		int outcnt = 0, incnt = 0;
 
+		init_completion(&reqs[i].completion);
+
 		/*
 		 * Only 7-bit mode supported for this moment. For the address
 		 * format, Please check the Virtio I2C Specification.
@@ -106,21 +110,15 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
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
+		wait_for_completion(&req->completion);
+
+		if (!failed && req->in_hdr.status != VIRTIO_I2C_MSG_OK)
 			failed = true;
 
 		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
@@ -156,12 +154,8 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * remote here to clear the virtqueue, so we can try another set of
 	 * messages later on.
 	 */
-
-	reinit_completion(&vi->completion);
 	virtqueue_kick(vq);
 
-	wait_for_completion(&vi->completion);
-
 	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count);
 
 err_free:
@@ -210,8 +204,6 @@ static int virtio_i2c_probe(struct virtio_device *vdev)
 	vdev->priv = vi;
 	vi->vdev = vdev;
 
-	init_completion(&vi->completion);
-
 	ret = virtio_i2c_setup_vqs(vi);
 	if (ret)
 		return ret;
-- 
2.33.1

