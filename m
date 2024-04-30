Return-Path: <linux-i2c+bounces-3350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A98B7F0B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 19:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A86B31F23DC6
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 17:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BEE1A38D7;
	Tue, 30 Apr 2024 17:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="DNkzmr1C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145C41A0AFC;
	Tue, 30 Apr 2024 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714498792; cv=none; b=GWk/2i2uK+/yzILEwY8Pym3tFXO6uKRlF2g6jWLOdcv1XxfAahtVo6FWWCzqCJFmLbqDo/uIeGMv6DbOUs1veOnJJMHXLG0Iz9KhZd2lJK/G4LTHOTkDG6zAu5uvnDUCcAf28EVGQ5hdo1arA1xpvgmqpsB9V/JXm/VctGJ9EZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714498792; c=relaxed/simple;
	bh=TEHnBplu4gfwXVe1MoG/VUQKK6V40zApUPCro6v+G6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VtZJFYAG7K0KnEc/PlViHxWW9rxKUCm4Jr/KVbgLOzn6vjw7vn7kPJ646trXcyuDTT7zPqjrsp1mrCHsmKAVZh21X5mYU51HyyVsPGW6Fa25bCvSTkUKgJBNDWgDNTEck1E2rEO2R52AuM+05WrtmM+GPJi9VG5r3vTlh5Q0AjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=DNkzmr1C; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.174.176])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9EB0421112E0;
	Tue, 30 Apr 2024 10:39:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9EB0421112E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714498790;
	bh=/C508Sgc5oG8dRgGNlpHGKxQcys75NzfRyiOW8pPq1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DNkzmr1C/EnkLCcDNNYihg2fh0da5zLqJAsLHzYtB0smxEDrfjowi+AoYOWwUst2z
	 SZxNGBflu1zmRaW4GbdGdCz2HjtQe5jiDjunU2jjb1ghTmSGAs3McJTyqrganfYWti
	 BI5R6Y7dS67uecXImkyhykdw3AqSOg8sRr98RejQ=
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
Subject: [PATCH v1 09/12] media: cx23885: Make I2C terminology more inclusive
Date: Tue, 30 Apr 2024 17:38:08 +0000
Message-Id: <20240430173812.1423757-10-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
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


