Return-Path: <linux-i2c+bounces-2661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C854892225
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC794288587
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDBF137926;
	Fri, 29 Mar 2024 17:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="k2OAG2bX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44A4137765;
	Fri, 29 Mar 2024 17:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731737; cv=none; b=MplyW2OBAOeydszDhZI1N/+MXIQTxfExHFSCb82vg8XsqP5SgGOrph7WUdXqfJpWeb2SCueJeVAHhpy5dfcSY7wnCOzQu99TXPAJIpi4dqrasntnfidtLj6ko2OR4YC2+MuAVlV3+HGa4vdU9JxC7veAD1hZX5Jfgq8xi6VbYLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731737; c=relaxed/simple;
	bh=H6bz0CfkO4gTsYfvw+YszUR3KdUOwgOGo+Cq5qQlOzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dZTYy052zwGZqr8337QoD7nZ866wLYjawrGyU9KTZTlPKzP1QJ8J2FBgilCp0NzcKbjyLvuAruRyyMXq9patzyQzQnifbanvDVVvfDDGOuoddSD+5pqkAthZQDe87DgM0vQjiQTvIN8Or5se9Z5caAWPdFVz4wRWgXPgBw5jiW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=k2OAG2bX; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 524DE20E6F3E;
	Fri, 29 Mar 2024 10:02:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 524DE20E6F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731735;
	bh=zpJQ9Yx6Dd0ijDrG1ibCrDM6HiWKo8HuenXuwgSh1gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k2OAG2bXObNwd7zLzFpdKdhsn1LKhDiQITLJKkS3q2pGn9PxA3ubhREeHhGxvckij
	 nLyXymTBDq9Ktn8A9/zpNbhRdsl7VLIq5Js+n+Oswu+EbOPOOSioPoSLmBOHoAA2vr
	 P5o/VzJptXE99vw9t54N+2+8Dq5xlzvfBuwUqRiY=
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
Subject: [PATCH v0 04/14] media: au0828: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:28 +0000
Message-Id: <20240329170038.3863998-5-eahariha@linux.microsoft.com>
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
 drivers/media/usb/au0828/au0828-i2c.c   | 4 ++--
 drivers/media/usb/au0828/au0828-input.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-i2c.c b/drivers/media/usb/au0828/au0828-i2c.c
index 749f90d73b5b..3e66d42bf134 100644
--- a/drivers/media/usb/au0828/au0828-i2c.c
+++ b/drivers/media/usb/au0828/au0828-i2c.c
@@ -23,7 +23,7 @@ MODULE_PARM_DESC(i2c_scan, "scan i2c bus at insmod time");
 #define I2C_WAIT_DELAY 25
 #define I2C_WAIT_RETRY 1000
 
-static inline int i2c_slave_did_read_ack(struct i2c_adapter *i2c_adap)
+static inline int i2c_client_did_read_ack(struct i2c_adapter *i2c_adap)
 {
 	struct au0828_dev *dev = i2c_adap->algo_data;
 	return au0828_read(dev, AU0828_I2C_STATUS_201) &
@@ -35,7 +35,7 @@ static int i2c_wait_read_ack(struct i2c_adapter *i2c_adap)
 	int count;
 
 	for (count = 0; count < I2C_WAIT_RETRY; count++) {
-		if (!i2c_slave_did_read_ack(i2c_adap))
+		if (!i2c_client_did_read_ack(i2c_adap))
 			break;
 		udelay(I2C_WAIT_DELAY);
 	}
diff --git a/drivers/media/usb/au0828/au0828-input.c b/drivers/media/usb/au0828/au0828-input.c
index 3d3368202cd0..98a57b6e02e2 100644
--- a/drivers/media/usb/au0828/au0828-input.c
+++ b/drivers/media/usb/au0828/au0828-input.c
@@ -30,7 +30,7 @@ struct au0828_rc {
 	int polling;
 	struct delayed_work work;
 
-	/* i2c slave address of external device (if used) */
+	/* i2c client address of external device (if used) */
 	u16 i2c_dev_addr;
 
 	int  (*get_key_i2c)(struct au0828_rc *ir);
-- 
2.34.1


