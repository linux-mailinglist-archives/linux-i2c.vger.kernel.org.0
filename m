Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E25E44D9C2
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 17:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbhKKQHJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 11:07:09 -0500
Received: from smtp1.axis.com ([195.60.68.17]:62896 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232033AbhKKQHI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Nov 2021 11:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636646660;
  x=1668182660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0i1LfHXs6uH2x7I8DD0PdVPydkm4E1YEPDn4tVDfrSs=;
  b=CNqYbl1pjo4/CBTQ2RMkkq5tAVBnsLApnCH55T0DUuxY9gSoPt9HqbyK
   fPuS9GE4elGJzQSqhwWulk6dEa2xoa8W388A9XQlaHCs05Q+x2xC41xmo
   3pigNtWGvGEIEnmlDpZJ63iaKF8qrYfZHrFJ6Lx1tzh1vlvuh9oP3msdb
   RhM3lgymNGfq4VfDiZ5de8kfhvebv1QHX7dD2kwvZZv3oElehh5ulxML8
   rpO3FPpkuHMtQkbpkiZ0U4sDlDzi8H70fx27bWASbhbx2zMYW2jIZUFOj
   0hDtFfaS1FRooRAhSx0Yn2h8RvAi2NUl6E0dVYB3xtFY3oFyEpDk1FIeG
   w==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>, <jie.deng@intel.com>, <viresh.kumar@linaro.org>
CC:     <conghui.chen@intel.com>, <mst@redhat.com>,
        <virtualization@lists.linux-foundation.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH v2 1/2] i2c: virtio: disable timeout handling
Date:   Thu, 11 Nov 2021 17:04:11 +0100
Message-ID: <20211111160412.11980-2-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211111160412.11980-1-vincent.whitchurch@axis.com>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
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

Fixes: 3cfc88380413d20f ("i2c: virtio: add a virtio i2c frontend driver")
Acked-by: Jie Deng <jie.deng@intel.com>
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

