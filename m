Return-Path: <linux-i2c+bounces-2666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F45892244
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59B961F26BFC
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551C413BAFA;
	Fri, 29 Mar 2024 17:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="MamCsWkS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A762E132813;
	Fri, 29 Mar 2024 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731747; cv=none; b=FMsp/lq2du5UQj0PC9fPSoox77opGFpzh34HdI+jFQcE1NgXUk0P9qt+eV3eVDZsNfGVKYvrwJUcZItP2AohGy7f9oCCodkDpzRjzD5D8LevDexNtH3psjeHCucL7x3GiUE+SFhLHUFgSbyBDwUEgQ/t7YMRepuX6DewHFbLkmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731747; c=relaxed/simple;
	bh=79SP0jhttzR/Vp6eOcMGPSjOPX3Y4AriMKSLx2VJ2hY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mmfTOOisriUvTdDsRYGwaostRutrW8gYs+qRuGiXe/5O/YQwsfqiN9MV89Pdr7n9IJhMj6nCJB6I+zCaCOhHqUNPPGfb68uiaxo3jw0z/KQyWGLknBQnDwl12WGFS4oiUY+rJCqOsl/UOKGBsIFdOSHG1lZTBRk7rED/Bg/uUWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=MamCsWkS; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3927120E6F4C;
	Fri, 29 Mar 2024 10:02:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3927120E6F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731745;
	bh=Qwmeem4B9Er90dGhL6Lz2R55/4URZeEt+O0fc3RlyyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MamCsWkSG1A8wjsPWLRC6O+cRsXcTXtSmo33DRenRj2SdRGUCn2XjFQAoKhRfxK1U
	 iLrIpepTKnR67z5VbnSZwrZDp8t6ZrW9tERhbZzQqL7j9/VaOxMLl9WUeK3zcCRdAb
	 Rw/T2kNc4a0kXs69OY24H4edkMV2Vnk5WlEXOO1k=
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
Subject: [PATCH v0 09/14] media: cx23885: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:33 +0000
Message-Id: <20240329170038.3863998-10-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/media/pci/cx23885/cx23885-f300.c | 8 ++++----
 drivers/media/pci/cx23885/cx23885-i2c.c  | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-f300.c b/drivers/media/pci/cx23885/cx23885-f300.c
index ac1c434e8e24..5f937c281793 100644
--- a/drivers/media/pci/cx23885/cx23885-f300.c
+++ b/drivers/media/pci/cx23885/cx23885-f300.c
@@ -92,7 +92,7 @@ static u8 f300_xfer(struct dvb_frontend *fe, u8 *buf)
 	f300_set_line(dev, F300_RESET, 0);/* begin to send data */
 	msleep(1);
 
-	f300_send_byte(dev, 0xe0);/* the slave address is 0xe0, write */
+	f300_send_byte(dev, 0xe0);/* the client address is 0xe0, write */
 	msleep(1);
 
 	temp = buf[0];
@@ -112,10 +112,10 @@ static u8 f300_xfer(struct dvb_frontend *fe, u8 *buf)
 	}
 
 	if (i > 7) {
-		pr_err("%s: timeout, the slave no response\n",
+		pr_err("%s: timeout, the client no response\n",
 								__func__);
-		ret = 1; /* timeout, the slave no response */
-	} else { /* the slave not busy, prepare for getting data */
+		ret = 1; /* timeout, the client no response */
+	} else { /* the client not busy, prepare for getting data */
 		f300_set_line(dev, F300_RESET, 0);/*ready...*/
 		msleep(1);
 		f300_send_byte(dev, 0xe1);/* 0xe1 is Read */
diff --git a/drivers/media/pci/cx23885/cx23885-i2c.c b/drivers/media/pci/cx23885/cx23885-i2c.c
index f51fad33dc04..385af2a893b4 100644
--- a/drivers/media/pci/cx23885/cx23885-i2c.c
+++ b/drivers/media/pci/cx23885/cx23885-i2c.c
@@ -34,7 +34,7 @@ MODULE_PARM_DESC(i2c_scan, "scan i2c bus at insmod time");
 #define I2C_EXTEND  (1 << 3)
 #define I2C_NOSTOP  (1 << 4)
 
-static inline int i2c_slave_did_ack(struct i2c_adapter *i2c_adap)
+static inline int i2c_client_did_ack(struct i2c_adapter *i2c_adap)
 {
 	struct cx23885_i2c *bus = i2c_adap->algo_data;
 	struct cx23885_dev *dev = bus->dev;
@@ -84,7 +84,7 @@ static int i2c_sendbytes(struct i2c_adapter *i2c_adap,
 		cx_write(bus->reg_ctrl, bus->i2c_period | (1 << 2));
 		if (!i2c_wait_done(i2c_adap))
 			return -EIO;
-		if (!i2c_slave_did_ack(i2c_adap))
+		if (!i2c_client_did_ack(i2c_adap))
 			return -ENXIO;
 
 		dprintk(1, "%s() returns 0\n", __func__);
@@ -163,7 +163,7 @@ static int i2c_readbytes(struct i2c_adapter *i2c_adap,
 		cx_write(bus->reg_ctrl, bus->i2c_period | (1 << 2) | 1);
 		if (!i2c_wait_done(i2c_adap))
 			return -EIO;
-		if (!i2c_slave_did_ack(i2c_adap))
+		if (!i2c_client_did_ack(i2c_adap))
 			return -ENXIO;
 
 
-- 
2.34.1


