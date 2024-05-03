Return-Path: <linux-i2c+bounces-3398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAA8BB27B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 20:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 897BA1C23428
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEB0158DB4;
	Fri,  3 May 2024 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="YZAHRyiJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55835158D82;
	Fri,  3 May 2024 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760113; cv=none; b=B1fPew9eJidH9p+VdBokxYxURFmLvHY0E3F9l1h3EkWdMaUDFUBVt9LrLZ8thNfaqOIQ0kvkFAfeIj9hnSWN3VX+ZXUXt1uaNmwLOJ+zn+DvsX46q+0NxtV7XTbq3WjgQls/cS/OdYo+jxzBkElR4F/uZD5AL0qTT2Qv6g8qFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760113; c=relaxed/simple;
	bh=HSEFERrpe5SM0/EFdJ6xJv9YcthOL0BO/J1La9e3n4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=syZ0DJdXY9q1gH/LDm8Kf009YC89OZXt2xEcib7veMg7Hknm96zaTiovenOhL7wA9wuuPDa6ddoN7UxDOeNo92hT0QX+9Hf/fGn6qGcwL5xP1ieLtc9WOx9trZAibG62RvRenWUdjx1WUZGB5KbjwR+RL11Q+B6qhI8iIedG5EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=YZAHRyiJ; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
	by linux.microsoft.com (Postfix) with ESMTPSA id D81E2207DBCB;
	Fri,  3 May 2024 11:15:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D81E2207DBCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714760111;
	bh=/A3R6LdZJrExpiEpXl1oiDkbBSQmYdztPra//mlDMZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YZAHRyiJJtKvQIbmQAkEONQGyns54fi6WNNS24AW8WyJNJEmZbe/SKAYgl5kBiSfI
	 lARvpAUaEoE0f10tzgZXfeoW9QsoBn8BBV43otedvIY/biLfCmlKVSq1rV9hPx/XfL
	 89Cf41VoERmXkm1v46ABdX3qlm7jYVqgnmeREf5k=
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
Subject: [PATCH v2 04/12] media: au0828: Make I2C terminology more inclusive
Date: Fri,  3 May 2024 18:13:25 +0000
Message-Id: <20240503181333.2336999-5-eahariha@linux.microsoft.com>
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
 drivers/media/usb/au0828/au0828-i2c.c   | 4 ++--
 drivers/media/usb/au0828/au0828-input.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-i2c.c b/drivers/media/usb/au0828/au0828-i2c.c
index 749f90d73b5b..743cb44f52aa 100644
--- a/drivers/media/usb/au0828/au0828-i2c.c
+++ b/drivers/media/usb/au0828/au0828-i2c.c
@@ -23,7 +23,7 @@ MODULE_PARM_DESC(i2c_scan, "scan i2c bus at insmod time");
 #define I2C_WAIT_DELAY 25
 #define I2C_WAIT_RETRY 1000
 
-static inline int i2c_slave_did_read_ack(struct i2c_adapter *i2c_adap)
+static inline int i2c_target_did_read_ack(struct i2c_adapter *i2c_adap)
 {
 	struct au0828_dev *dev = i2c_adap->algo_data;
 	return au0828_read(dev, AU0828_I2C_STATUS_201) &
@@ -35,7 +35,7 @@ static int i2c_wait_read_ack(struct i2c_adapter *i2c_adap)
 	int count;
 
 	for (count = 0; count < I2C_WAIT_RETRY; count++) {
-		if (!i2c_slave_did_read_ack(i2c_adap))
+		if (!i2c_target_did_read_ack(i2c_adap))
 			break;
 		udelay(I2C_WAIT_DELAY);
 	}
diff --git a/drivers/media/usb/au0828/au0828-input.c b/drivers/media/usb/au0828/au0828-input.c
index 3d3368202cd0..6c9e5ea795f2 100644
--- a/drivers/media/usb/au0828/au0828-input.c
+++ b/drivers/media/usb/au0828/au0828-input.c
@@ -30,7 +30,7 @@ struct au0828_rc {
 	int polling;
 	struct delayed_work work;
 
-	/* i2c slave address of external device (if used) */
+	/* i2c target address of external device (if used) */
 	u16 i2c_dev_addr;
 
 	int  (*get_key_i2c)(struct au0828_rc *ir);
-- 
2.34.1


