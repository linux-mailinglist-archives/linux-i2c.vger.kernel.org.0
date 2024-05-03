Return-Path: <linux-i2c+bounces-3401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F068BB289
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 20:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD5BF1C23AD1
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1572915956B;
	Fri,  3 May 2024 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="BzM1EruY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830EA15886F;
	Fri,  3 May 2024 18:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760123; cv=none; b=pbG/8w4+P52r2o4d/m1SplbdA+vLb36X3mxORRyS0YpyfT9IOsPd9XM3qK8FsagLS7kLBh2t3H0VRogCVK+WsgkVf6JH0CdofNy3VKQ/d1ZBib8qmGPr7g71V9XiRctDIrELYlVT3fHKvvZ6EzWKU8+wJt5INNBxkG9pEuguwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760123; c=relaxed/simple;
	bh=HWOur8mMNKLom8n/Yk3LM09hNfjdJiCVYJUwP7f6nvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Iy44IBNsPb5FRX6hnWI00v1gzrZmGhJNerOocKfi3RQAcgo0fMEpWU6WyA2lePL7Khm+kDamkIWk2xKithtiO4hYLOjVc+u7/Tsx7irbVtswlwUbOt6O2IWewx/GjZR/iRlj88r4A/6xCDpr/Z2rUgQFEvrsIPYhF7YITPYo8xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=BzM1EruY; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
	by linux.microsoft.com (Postfix) with ESMTPSA id 28BF8206B4F5;
	Fri,  3 May 2024 11:15:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 28BF8206B4F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714760122;
	bh=bQBQraGFvzhYBeoO4i27QnX+vrBgJBB6lkWb2f0RYG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzM1EruYArXSoGqVOAyjgaL7cxLbWCPnUwOxTT5ns7UdswCZ4BDGXiv50bvCSBZ+x
	 5BJ7M6ddV4p76I0AQVwvP81spMsyVeWe5ICb0uxnbSVHMkqypYiucp+x/UA1sn8prm
	 zAWMvt7hag5VChWD0FvyLcb0m6gkN6LjFdNy024E=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v2 07/12] media: cx25821: Make I2C terminology more inclusive
Date: Fri,  3 May 2024 18:13:28 +0000
Message-Id: <20240503181333.2336999-8-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/media/pci/cx25821/cx25821-core.c         | 2 +-
 drivers/media/pci/cx25821/cx25821-i2c.c          | 6 +++---
 drivers/media/pci/cx25821/cx25821-medusa-video.c | 2 +-
 drivers/media/pci/cx25821/cx25821.h              | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 6627fa9166d3..a9af18910c1f 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -877,7 +877,7 @@ static int cx25821_dev_setup(struct cx25821_dev *dev)
 	dev->pci_slot = PCI_SLOT(dev->pci->devfn);
 	dev->pci_irqmask = 0x001f00;
 
-	/* External Master 1 Bus */
+	/* External Controller 1 Bus */
 	dev->i2c_bus[0].nr = 0;
 	dev->i2c_bus[0].dev = dev;
 	dev->i2c_bus[0].reg_stat = I2C1_STAT;
diff --git a/drivers/media/pci/cx25821/cx25821-i2c.c b/drivers/media/pci/cx25821/cx25821-i2c.c
index 0ef4cd6528a0..0000f3322dd2 100644
--- a/drivers/media/pci/cx25821/cx25821-i2c.c
+++ b/drivers/media/pci/cx25821/cx25821-i2c.c
@@ -33,7 +33,7 @@ do {									\
 #define I2C_EXTEND  (1 << 3)
 #define I2C_NOSTOP  (1 << 4)
 
-static inline int i2c_slave_did_ack(struct i2c_adapter *i2c_adap)
+static inline int i2c_target_did_ack(struct i2c_adapter *i2c_adap)
 {
 	struct cx25821_i2c *bus = i2c_adap->algo_data;
 	struct cx25821_dev *dev = bus->dev;
@@ -85,7 +85,7 @@ static int i2c_sendbytes(struct i2c_adapter *i2c_adap,
 		if (!i2c_wait_done(i2c_adap))
 			return -EIO;
 
-		if (!i2c_slave_did_ack(i2c_adap))
+		if (!i2c_target_did_ack(i2c_adap))
 			return -EIO;
 
 		dprintk(1, "%s(): returns 0\n", __func__);
@@ -174,7 +174,7 @@ static int i2c_readbytes(struct i2c_adapter *i2c_adap,
 		cx_write(bus->reg_ctrl, bus->i2c_period | (1 << 2) | 1);
 		if (!i2c_wait_done(i2c_adap))
 			return -EIO;
-		if (!i2c_slave_did_ack(i2c_adap))
+		if (!i2c_target_did_ack(i2c_adap))
 			return -EIO;
 
 		dprintk(1, "%s(): returns 0\n", __func__);
diff --git a/drivers/media/pci/cx25821/cx25821-medusa-video.c b/drivers/media/pci/cx25821/cx25821-medusa-video.c
index f0a1ac77f048..67a18add6ed3 100644
--- a/drivers/media/pci/cx25821/cx25821-medusa-video.c
+++ b/drivers/media/pci/cx25821/cx25821-medusa-video.c
@@ -659,7 +659,7 @@ int medusa_video_init(struct cx25821_dev *dev)
 	if (ret_val < 0)
 		goto error;
 
-	/* Turn off Master source switch enable */
+	/* Turn off Controller source switch enable */
 	value = cx25821_i2c_read(&dev->i2c_bus[0], MON_A_CTRL, &tmp);
 	value &= 0xFFFFFFDF;
 	ret_val = cx25821_i2c_write(&dev->i2c_bus[0], MON_A_CTRL, value);
diff --git a/drivers/media/pci/cx25821/cx25821.h b/drivers/media/pci/cx25821/cx25821.h
index 3aa7604fb944..e96be9127467 100644
--- a/drivers/media/pci/cx25821/cx25821.h
+++ b/drivers/media/pci/cx25821/cx25821.h
@@ -234,7 +234,7 @@ struct cx25821_dev {
 
 	u32 clk_freq;
 
-	/* I2C adapters: Master 1 & 2 (External) & Master 3 (Internal only) */
+	/* I2C adapters: Controller 1 & 2 (External) & Controller 3 (Internal only) */
 	struct cx25821_i2c i2c_bus[3];
 
 	int nr;
-- 
2.34.1


