Return-Path: <linux-i2c+bounces-2668-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD5189224E
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6D41F26D09
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AD638DF1;
	Fri, 29 Mar 2024 17:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="X60gdqy7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BE913BC1C;
	Fri, 29 Mar 2024 17:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731750; cv=none; b=eZFxNb7KsSjEcelbiRvtuny7grCuKu+yeW2Eus0NujsjLRk/1R7yfWbXmdLQEJOKFmFH9da+NAHSe2gu33H58pIl9fSQ6w6w6KjYdXNAkeJ6lbXrmsbWb9lAyWVFXi7D3b1OdN9L0sUD+jpe14+sTzE511PxVtUxbwhwvlIVBh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731750; c=relaxed/simple;
	bh=j6O2Cgf4gtBJ/xAsEYl5CND4SoSEVHgFBIGo2rcCcus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CextaUJ6ppypGyKsdnL8QUkNKkeOx0znuO+Ea1IWuTPqJKtV1qulEWSf7cGQsEQnGYNzBpuyFHfR+RmYgweqUMXYWU1O/tW+aR7ZvBC4JrqTtM49m6NZ6WsLjwgMhxebPj8vI1IUJo0tfV7SGtVKFZWtk6Y/Gi2ouQPWj/MOQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=X60gdqy7; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id B440E20E6F57;
	Fri, 29 Mar 2024 10:02:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B440E20E6F57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731748;
	bh=tlknWGbMb3rjua/hpEHcjQpDWIsRD3ogPSvWtRvZlV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X60gdqy7oRJ8sXP2NRdej38mifm46re6sPVQ/xjUIGUPf/F9KRvsSIQSX4R7SSSZ/
	 R5Iot9zo7babVELykw9DtZJ8rc9zU+y+6OnPPYDYY91zI91j/AQt3DedynATZDzAGd
	 LsvgWCIO74+nFbOl93ByhkMAt1ADbIXvwGHCu6Dg=
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
Subject: [PATCH v0 11/14] fbdev/smscufx: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:35 +0000
Message-Id: <20240329170038.3863998-12-eahariha@linux.microsoft.com>
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
 drivers/video/fbdev/smscufx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 35d682b110c4..1c80c1a3d516 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1292,7 +1292,7 @@ static int ufx_realloc_framebuffer(struct ufx_data *dev, struct fb_info *info)
 	return 0;
 }
 
-/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, master,
+/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, host,
  * restart enabled, but no start byte, enable controller */
 static int ufx_i2c_init(struct ufx_data *dev)
 {
@@ -1321,7 +1321,7 @@ static int ufx_i2c_init(struct ufx_data *dev)
 	/* 7-bit (not 10-bit) addressing */
 	tmp &= ~(0x10);
 
-	/* enable restart conditions and master mode */
+	/* enable restart conditions and host mode */
 	tmp |= 0x21;
 
 	status = ufx_reg_write(dev, 0x1000, tmp);
-- 
2.34.1


