Return-Path: <linux-i2c+bounces-4875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F66D92DF99
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 07:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55CF31F21219
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 05:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9628612E1E0;
	Thu, 11 Jul 2024 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ZHmSw9M7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D4E12C482;
	Thu, 11 Jul 2024 05:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720675749; cv=none; b=Y9onDXyJht7gGzQAeE1NAOx7uZd+DOQ5DHpPNdZjUA8h6vQd6Cfp5ih6KNHa9BWQHmNxa3hGd6F/IAr3J6tXojBl89a5BHQDbvxX7zg4CYLKypp3u4J3e1kIwqDvGEzh9/6Hm4/ICaiyDSDqEnoeZ0NUfMlVSRIkZRSB4VLoYlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720675749; c=relaxed/simple;
	bh=Frix0rMvG35su0A2cCTnA+lHBY0AHSVEHt6HVKbXLAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hiERlZeUs5CaMPin3FPKkegT88cFEU1bwzv0ZLmQHaNf+15i4FPALka9/dE7OAxfKHYUArzud4jJF0E7zk6vshGHAKYvj2Cy+HgF4ST58mSYkeLW49m7vtj362XtxePiXyiujRCt3nwX/IKLBfH1WKpaWU0G+/DAEr2sXZf1OnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=ZHmSw9M7; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.159.213])
	by linux.microsoft.com (Postfix) with ESMTPSA id AE9B420B7165;
	Wed, 10 Jul 2024 22:29:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AE9B420B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1720675747;
	bh=TXslZm7l31oVmL4IRB7cxEknwRuJDanuUWgnpQOIK4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZHmSw9M7RPIsPSrdhoxEFxDDMvqk8wYOGbdg2g/5sp0PrNsyCMIbgsF62JvJvkgKi
	 HjaSMqWKmqjNMGjXh8ZSfR6VES/Q9wnDJi3Pfdq5/YOdQUCfcA36QH9XKhYc5tEqOL
	 eF/jEcVERE3LHkL2Ak/jxDErFr1wXeLs7clp3biI=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Steve Glendinning <steve.glendinning@shawell.net>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org (open list:SMSC UFX6000 and UFX7000 USB to VGA DRIVER),
	dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
	linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 5/6] fbdev/smscufx: Make I2C terminology more inclusive
Date: Thu, 11 Jul 2024 05:27:33 +0000
Message-Id: <20240711052734.1273652-6-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
the approved verbiage exists in the specification.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/video/fbdev/smscufx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 35d682b110c42..5f0dd01fd8349 100644
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


