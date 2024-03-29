Return-Path: <linux-i2c+bounces-2665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2167C892240
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A41B8288A50
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CE513B5A4;
	Fri, 29 Mar 2024 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="XF4fNR3O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F70613AD33;
	Fri, 29 Mar 2024 17:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731743; cv=none; b=YKd2gri4QL5AywmRr7SaqNo0ffssYStrY7liRAcNJKdQfwAid7+Z5u3jJTCxwreYMLxbQ1TnawVc1f0SVmPGn7KYXNNSjScMg5eD+5VEfqGMIW1Ak8MdCxHlpYS7qgPZdAYQi1WLuNmI48pDga4Q3xaasr80bXXdrqWf4PPw+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731743; c=relaxed/simple;
	bh=WHg65YvAzu1XaJUhKwMN4FXJNwArcJ3Pi9rSr/8R8+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jprXQ6qn00GPsYKuFNXA53Vz4Mp7sIX6lOy75nMc22/aJ8zpyEeowaXIbKzIo7oxx1c04XFBR0B/wh88+3Gp40R1itEDHdrqeA6nufS87i2bpgG0c8ZwYJrkrLgygOI/jvMzBoIpG+vcVXSlFjDFozZhqdLSP2AI2gIjdBdMWiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=XF4fNR3O; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id B6D7220E6F3E;
	Fri, 29 Mar 2024 10:02:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B6D7220E6F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731740;
	bh=nQsV4GOg2x3niy+ZAQMhUw9K0ZB96KvatJri7O7xATQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XF4fNR3Ozy3mJsPY6T+9mlhLoJGSBoyJzvpjeQ2h6xbGkQL+owP3a3WaVvSKmZMto
	 kWUMIVxdwzXCaE2PU+EyG8eqT9bgmORlECAK0QExbKxFMfx2G9UJqlggPExNc+O+cl
	 GgezOH/3fh17M0r4v8dvzTmwXBNEE1cC0TUhNBmo=
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
Subject: [PATCH v0 08/14] media: ivtv: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:32 +0000
Message-Id: <20240329170038.3863998-9-eahariha@linux.microsoft.com>
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
 drivers/media/pci/ivtv/ivtv-i2c.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index c052c57c6dce..967e6a025020 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -33,14 +33,14 @@
     Some more general comments about what we are doing:
 
     The i2c bus is a 2 wire serial bus, with clock (SCL) and data (SDA)
-    lines.  To communicate on the bus (as a master, we don't act as a slave),
+    lines.  To communicate on the bus (as a host, we don't act as a client),
     we first initiate a start condition (ivtv_start).  We then write the
     address of the device that we want to communicate with, along with a flag
-    that indicates whether this is a read or a write.  The slave then issues
+    that indicates whether this is a read or a write.  The client then issues
     an ACK signal (ivtv_ack), which tells us that it is ready for reading /
     writing.  We then proceed with reading or writing (ivtv_read/ivtv_write),
     and finally issue a stop condition (ivtv_stop) to make the bus available
-    to other masters.
+    to other hosts.
 
     There is an additional form of transaction where a write may be
     immediately followed by a read.  In this case, there is no intervening
@@ -379,7 +379,7 @@ static int ivtv_waitsda(struct ivtv *itv, int val)
 	return 0;
 }
 
-/* Wait for the slave to issue an ACK */
+/* Wait for the client to issue an ACK */
 static int ivtv_ack(struct ivtv *itv)
 {
 	int ret = 0;
@@ -407,7 +407,7 @@ static int ivtv_ack(struct ivtv *itv)
 	return ret;
 }
 
-/* Write a single byte to the i2c bus and wait for the slave to ACK */
+/* Write a single byte to the i2c bus and wait for the client to ACK */
 static int ivtv_sendbyte(struct ivtv *itv, unsigned char byte)
 {
 	int i, bit;
@@ -471,7 +471,7 @@ static int ivtv_readbyte(struct ivtv *itv, unsigned char *byte, int nack)
 	return 0;
 }
 
-/* Issue a start condition on the i2c bus to alert slaves to prepare for
+/* Issue a start condition on the i2c bus to alert clients to prepare for
    an address write */
 static int ivtv_start(struct ivtv *itv)
 {
@@ -534,7 +534,7 @@ static int ivtv_stop(struct ivtv *itv)
 	return 0;
 }
 
-/* Write a message to the given i2c slave.  do_stop may be 0 to prevent
+/* Write a message to the given i2c client.  do_stop may be 0 to prevent
    issuing the i2c stop condition (when following with a read) */
 static int ivtv_write(struct ivtv *itv, unsigned char addr, unsigned char *data, u32 len, int do_stop)
 {
@@ -558,7 +558,7 @@ static int ivtv_write(struct ivtv *itv, unsigned char addr, unsigned char *data,
 	return ret;
 }
 
-/* Read data from the given i2c slave.  A stop condition is always issued. */
+/* Read data from the given i2c client.  A stop condition is always issued. */
 static int ivtv_read(struct ivtv *itv, unsigned char addr, unsigned char *data, u32 len)
 {
 	int retry, ret = -EREMOTEIO;
-- 
2.34.1


