Return-Path: <linux-i2c+bounces-2662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1279089222B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B745289770
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02673139578;
	Fri, 29 Mar 2024 17:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="V9EU/QtD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7053912D1E8;
	Fri, 29 Mar 2024 17:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731737; cv=none; b=qrPki3xGjFtUpvY0UvEZ4qeXMwMRKyA7/0ff1SHKOUe1L1J26FcL+wizzHY/DlCC+1+FeSZ/+h0ztMzwt+Zgg6quCyE4TPWUXCq6igeK+z8pSHSK9mEB/WNW5GFgPhDrVFZcVHPh9Wm0ubnedZP7HpEVoMQshwDWvhJyGd426fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731737; c=relaxed/simple;
	bh=xYDOge6zGRWLZuaTSuqlbmHqRKyTwcqAOEdGoA/g19M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q44V4m8vVac+Y7Ir3cO11w7bXR+merySdSYMjYSXEHQMImyWrDoJ/GH3mQSTShtaG8rDRIi31ZmhKiYuaF8MUWERN352n9V/2vMLXKxYb1JaIoMJ5xSC6t6fwgSZ6oGbkfQI6bxF0dpz0yqj55qmuwLsDviFGkBCwInK+wuYha8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=V9EU/QtD; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 139CD20E6F4C;
	Fri, 29 Mar 2024 10:02:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 139CD20E6F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731736;
	bh=10QUIiHAlv9I6vQcGTCyRQwtIGq1JOGHzw/GbEWkjZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V9EU/QtD7YjVWs7Rf1Y6NCTvJ90Erzdt3jGzDOOOJxaMRNV6JDsb7FyeIUH+qxPRB
	 ae/egRfHYWa45J1dFxqs39V87C2GGQmXtnkcs6DAPy4TkNM0nzv2DR5NN2FqEfSrr7
	 fM4ULK4Qq6R9xLTgWgp8saHdjd260GfyiGqcmbT4=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:COBALT MEDIA DRIVER),
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
Subject: [PATCH v0 05/14] media: cobalt: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:29 +0000
Message-Id: <20240329170038.3863998-6-eahariha@linux.microsoft.com>
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
 drivers/media/pci/cobalt/cobalt-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-i2c.c b/drivers/media/pci/cobalt/cobalt-i2c.c
index 10c9ee33f73e..d2963370f949 100644
--- a/drivers/media/pci/cobalt/cobalt-i2c.c
+++ b/drivers/media/pci/cobalt/cobalt-i2c.c
@@ -45,10 +45,10 @@ struct cobalt_i2c_regs {
 /* I2C stop condition */
 #define M00018_CR_BITMAP_STO_MSK	(1 << 6)
 
-/* I2C read from slave */
+/* I2C read from client */
 #define M00018_CR_BITMAP_RD_MSK		(1 << 5)
 
-/* I2C write to slave */
+/* I2C write to client */
 #define M00018_CR_BITMAP_WR_MSK		(1 << 4)
 
 /* I2C ack */
@@ -59,7 +59,7 @@ struct cobalt_i2c_regs {
 
 /* SR[7:0] - Status register */
 
-/* Receive acknowledge from slave */
+/* Receive acknowledge from client */
 #define M00018_SR_BITMAP_RXACK_MSK	(1 << 7)
 
 /* Busy, I2C bus busy (as defined by start / stop bits) */
-- 
2.34.1


