Return-Path: <linux-i2c+bounces-3402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C18BB28D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 20:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 179251F25395
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37E6159589;
	Fri,  3 May 2024 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="RbaGjOBB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A2315886D;
	Fri,  3 May 2024 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760124; cv=none; b=jhzL9Os+qxN5mSWrqZ9XxvCgTZo4II4oponGHttHxKHTCheSAznyzb2Xse3dq5saJAtSalIaCW1GoYPmluiTXXSkF1C4NYbVSI4avQspYUOCZ6/X1NbbYd6OvgBP1XKMZXiIMBqSpIs9iqJQKADDXBytkTJCw/bToG3qoE8yFbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760124; c=relaxed/simple;
	bh=wLq3sm8LLTny1er+ZAX4jFReI7BFVWVfuWHBZaZCj/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PUo7s9a5MCdg6iedHX8X4LOIOOREJxLS5iqzWSr6IIdCIgNca/vq78kjYf8KtAOmgaMHwXY0jIo/mQBV8FIAQKcvTijoIcn4OdAQzl3hkcdedaAO2UVnscPsS5EHHvBYGFYESbwBjIhiOqqQJ0cV0dheC2xmSSaLd9WI714k4nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=RbaGjOBB; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
	by linux.microsoft.com (Postfix) with ESMTPSA id E4C07207DBD3;
	Fri,  3 May 2024 11:15:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E4C07207DBD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714760123;
	bh=GRfclEajWoxq9anjZ8/quZpV/Z3y2+4plsXg8F9UrVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbaGjOBBdDpdkReR4G1Vy/PQmVk7kDqLiUu/ZWwLqHH3iZsD3GLww0ZwrbgD3eg6e
	 P8CoCikMLUwY0jvmFyD939JMdB60FBBltMTPH5dXcJoMhNDi3+Ff/Am1+J6gq3l6rP
	 ArWOYoPFGDHm1xbRHIAeC4dLAjQygket18Gjs7oE=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:IVTV VIDEO4LINUX DRIVER),
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
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
	Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v2 08/12] media: ivtv: Make I2C terminology more inclusive
Date: Fri,  3 May 2024 18:13:29 +0000
Message-Id: <20240503181333.2336999-9-eahariha@linux.microsoft.com>
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
 drivers/media/pci/ivtv/ivtv-i2c.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index c052c57c6dce..a22c7caa92f7 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -33,14 +33,14 @@
     Some more general comments about what we are doing:
 
     The i2c bus is a 2 wire serial bus, with clock (SCL) and data (SDA)
-    lines.  To communicate on the bus (as a master, we don't act as a slave),
+    lines.  To communicate on the bus (as a controller, we don't act as a target),
     we first initiate a start condition (ivtv_start).  We then write the
     address of the device that we want to communicate with, along with a flag
-    that indicates whether this is a read or a write.  The slave then issues
+    that indicates whether this is a read or a write.  The target then issues
     an ACK signal (ivtv_ack), which tells us that it is ready for reading /
     writing.  We then proceed with reading or writing (ivtv_read/ivtv_write),
     and finally issue a stop condition (ivtv_stop) to make the bus available
-    to other masters.
+    to other controllers.
 
     There is an additional form of transaction where a write may be
     immediately followed by a read.  In this case, there is no intervening
@@ -379,7 +379,7 @@ static int ivtv_waitsda(struct ivtv *itv, int val)
 	return 0;
 }
 
-/* Wait for the slave to issue an ACK */
+/* Wait for the target to issue an ACK */
 static int ivtv_ack(struct ivtv *itv)
 {
 	int ret = 0;
@@ -396,7 +396,7 @@ static int ivtv_ack(struct ivtv *itv)
 	ivtv_scldelay(itv);
 	ivtv_setscl(itv, 1);
 	if (!ivtv_waitsda(itv, 0)) {
-		IVTV_DEBUG_I2C("Slave did not ack\n");
+		IVTV_DEBUG_I2C("Target did not ack\n");
 		ret = -EREMOTEIO;
 	}
 	ivtv_setscl(itv, 0);
@@ -407,7 +407,7 @@ static int ivtv_ack(struct ivtv *itv)
 	return ret;
 }
 
-/* Write a single byte to the i2c bus and wait for the slave to ACK */
+/* Write a single byte to the i2c bus and wait for the target to ACK */
 static int ivtv_sendbyte(struct ivtv *itv, unsigned char byte)
 {
 	int i, bit;
@@ -427,7 +427,7 @@ static int ivtv_sendbyte(struct ivtv *itv, unsigned char byte)
 		}
 		ivtv_setscl(itv, 1);
 		if (!ivtv_waitscl(itv, 1)) {
-			IVTV_DEBUG_I2C("Slave not ready for bit\n");
+			IVTV_DEBUG_I2C("Target not ready for bit\n");
 			return -EREMOTEIO;
 		}
 	}
@@ -471,7 +471,7 @@ static int ivtv_readbyte(struct ivtv *itv, unsigned char *byte, int nack)
 	return 0;
 }
 
-/* Issue a start condition on the i2c bus to alert slaves to prepare for
+/* Issue a start condition on the i2c bus to alert targets to prepare for
    an address write */
 static int ivtv_start(struct ivtv *itv)
 {
@@ -534,7 +534,7 @@ static int ivtv_stop(struct ivtv *itv)
 	return 0;
 }
 
-/* Write a message to the given i2c slave.  do_stop may be 0 to prevent
+/* Write a message to the given i2c target.  do_stop may be 0 to prevent
    issuing the i2c stop condition (when following with a read) */
 static int ivtv_write(struct ivtv *itv, unsigned char addr, unsigned char *data, u32 len, int do_stop)
 {
@@ -558,7 +558,7 @@ static int ivtv_write(struct ivtv *itv, unsigned char addr, unsigned char *data,
 	return ret;
 }
 
-/* Read data from the given i2c slave.  A stop condition is always issued. */
+/* Read data from the given i2c target.  A stop condition is always issued. */
 static int ivtv_read(struct ivtv *itv, unsigned char addr, unsigned char *data, u32 len)
 {
 	int retry, ret = -EREMOTEIO;
-- 
2.34.1


