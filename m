Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6280243300C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 09:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234556AbhJSHtg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 03:49:36 -0400
Received: from smtp2.axis.com ([195.60.68.18]:3156 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231758AbhJSHtf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Oct 2021 03:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634629643;
  x=1666165643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ojV3071KZMIn0lt4+At3XuTc62g2zZKG5RW/jTDctIQ=;
  b=Bdmm6t/1c61jEq+V3KcjDQVghF/0EEfg5KI8HRoIBQqGFRdfIAQb69YO
   gnL17Za9FIKwXBPFhTq2Un4sNw4Bhi3GKiP4c9IyI3GXgp10hG5lv0sOl
   Eg8AfUYa4z/oJBd1ngJsepItYosgpt1hqdZzW66hyo9xnbnOwM8pJYbtT
   ujH73QUmQkjvyYrZnt1TPaEZxRuU0V5V41zqpcT3t6XgkGozNC0pT4ntG
   /4UgLYktDgaLVQtMO1LXRJ4QJoSoE07a1SCL4HbtPsRXzDxBeobXPxi3l
   jnGwz9k+7nFMN4OusuMsucmvzapNOjce+QZU5Ghu6clu0yHdovQj+QdE5
   Q==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>, <jie.deng@intel.com>, <viresh.kumar@linaro.org>
CC:     <virtualization@lists.linux-foundation.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 1/2] i2c: virtio: disable timeout handling
Date:   Tue, 19 Oct 2021 09:46:46 +0200
Message-ID: <20211019074647.19061-2-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211019074647.19061-1-vincent.whitchurch@axis.com>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If a timeout is hit, it can result is incorrect data on the I2C bus
and/or memory corruptions in the guest since the device can still be
operating on the buffers it was given while the guest has freed them.

Here is, for example, the start of a slub_debug splat which was
triggered on the next transfer after one transfer was forced to timeout
by setting a breakpoint in the backend (rust-vmm/vhost-device):

 BUG kmalloc-1k (Not tainted): Poison overwritten
 First byte 0x1 instead of 0x6b
 Allocated in virtio_i2c_xfer+0x65/0x35c age=350 cpu=0 pid=29
 	__kmalloc+0xc2/0x1c9
 	virtio_i2c_xfer+0x65/0x35c
 	__i2c_transfer+0x429/0x57d
 	i2c_transfer+0x115/0x134
 	i2cdev_ioctl_rdwr+0x16a/0x1de
 	i2cdev_ioctl+0x247/0x2ed
 	vfs_ioctl+0x21/0x30
 	sys_ioctl+0xb18/0xb41
 Freed in virtio_i2c_xfer+0x32e/0x35c age=244 cpu=0 pid=29
 	kfree+0x1bd/0x1cc
 	virtio_i2c_xfer+0x32e/0x35c
 	__i2c_transfer+0x429/0x57d
 	i2c_transfer+0x115/0x134
 	i2cdev_ioctl_rdwr+0x16a/0x1de
 	i2cdev_ioctl+0x247/0x2ed
 	vfs_ioctl+0x21/0x30
 	sys_ioctl+0xb18/0xb41

There is no simple fix for this (the driver would have to always create
bounce buffers and hold on to them until the device eventually returns
the buffers), so just disable the timeout support for now.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/i2c/busses/i2c-virtio.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index f10a603b13fb..7b2474e6876f 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -106,11 +106,10 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
 
 static int virtio_i2c_complete_reqs(struct virtqueue *vq,
 				    struct virtio_i2c_req *reqs,
-				    struct i2c_msg *msgs, int num,
-				    bool timedout)
+				    struct i2c_msg *msgs, int num)
 {
 	struct virtio_i2c_req *req;
-	bool failed = timedout;
+	bool failed = false;
 	unsigned int len;
 	int i, j = 0;
 
@@ -132,7 +131,7 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
 			j++;
 	}
 
-	return timedout ? -ETIMEDOUT : j;
+	return j;
 }
 
 static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
@@ -141,7 +140,6 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	struct virtio_i2c *vi = i2c_get_adapdata(adap);
 	struct virtqueue *vq = vi->vq;
 	struct virtio_i2c_req *reqs;
-	unsigned long time_left;
 	int count;
 
 	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
@@ -164,11 +162,9 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	reinit_completion(&vi->completion);
 	virtqueue_kick(vq);
 
-	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
-	if (!time_left)
-		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
+	wait_for_completion(&vi->completion);
 
-	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count, !time_left);
+	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count);
 
 err_free:
 	kfree(reqs);
-- 
2.28.0

