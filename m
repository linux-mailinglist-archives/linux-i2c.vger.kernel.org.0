Return-Path: <linux-i2c+bounces-3405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7EB8BB29B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 20:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ED8E1C21158
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615FC15A4B7;
	Fri,  3 May 2024 18:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="UaVCRUsu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD82E15A480;
	Fri,  3 May 2024 18:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760136; cv=none; b=tsIbZbMCkX77mrQM6nAPC3RVIrDB9D1w0XmLCZ83qk8fqZmpFhYW39CUsJ6utacyjX+EXESHGA+ZoFJ3MwJe/AVUeSXAU98vqKaNS7neSfWxL2n64vYGFatEX9fyJGkiYhmS0sH6GyvcDwCzMvB/uy5+oOM2DkYvW6h3SwKfnKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760136; c=relaxed/simple;
	bh=J9xPBTWUP5eBXPn+Dgk0UfIuHOEZvxVmEz8hxCgREAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ee8nPSfxP51MoCWsMdslVcdHxk17rkMGzPk93ZL3AgXUi32mZeEV22UM4ZdPNqv0w3Bf3B9WK0psRQbLx6epIWQkbGRWHBQBlGPHImy1Rx6oAmmqq6KTGbOBL1hnRobImk12kCbStvU2ala7uEZY8yrtYN3GXF94Kdt6p63lcUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=UaVCRUsu; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9A2B8206B4F5;
	Fri,  3 May 2024 11:15:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9A2B8206B4F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714760134;
	bh=vVGkDNNo56U8Q/P5NgLECg7KMVFTufo8Kf+WGL39tKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UaVCRUsueya15wxZcZUnucSdstzXrTUzVkiXFay2KliXj+Rbe1G3i908qEo25d3WF
	 IoyfPrXkNzSWmxSIo5YTMrgoKyP+aHRb9RjY36OkV7c6KVH0scHr7U9o6cfhlVccH/
	 da0S/mJ0b9tJCmLP2PqA2lq6016ChI/iUinpbp3M=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Steve Glendinning <steve.glendinning@shawell.net>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org (open list:SMSC UFX6000 and UFX7000 USB to VGA DRIVER),
	dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
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
Subject: [PATCH v2 11/12] fbdev/smscufx: Make I2C terminology more inclusive
Date: Fri,  3 May 2024 18:13:32 +0000
Message-Id: <20240503181333.2336999-12-eahariha@linux.microsoft.com>
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
 drivers/video/fbdev/smscufx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 35d682b110c4..5f0dd01fd834 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1292,7 +1292,7 @@ static int ufx_realloc_framebuffer(struct ufx_data *dev, struct fb_info *info)
 	return 0;
 }
 
-/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, master,
+/* sets up DDC channel for 100 Kbps, std. speed, 7-bit addr, controller mode,
  * restart enabled, but no start byte, enable controller */
 static int ufx_i2c_init(struct ufx_data *dev)
 {
@@ -1321,7 +1321,7 @@ static int ufx_i2c_init(struct ufx_data *dev)
 	/* 7-bit (not 10-bit) addressing */
 	tmp &= ~(0x10);
 
-	/* enable restart conditions and master mode */
+	/* enable restart conditions and controller mode */
 	tmp |= 0x21;
 
 	status = ufx_reg_write(dev, 0x1000, tmp);
-- 
2.34.1


