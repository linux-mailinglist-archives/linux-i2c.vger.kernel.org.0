Return-Path: <linux-i2c+bounces-3399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAA68BB27E
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 20:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC5281C2343C
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D33158DCB;
	Fri,  3 May 2024 18:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="rfIuhLjI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE41158D8B;
	Fri,  3 May 2024 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760114; cv=none; b=s6ztKaRecBEDhDEkyEX/KxMjUdp1fOJPrJJ+tPFLtdNPWxBwUO0jlRSxFRT0+M4X2AEb/Yb5eLTHE9zJ2o+P7Oz0DuCGDNaJh0Io8sYh+OOB8s7ipSdR/pa9knLvuK9iqoBR6/Wqnnh2e8oqSept3/Ewq3P197c1/F56qJGuyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760114; c=relaxed/simple;
	bh=/aYJQmDrN0FjxDnsO86KPcv39pHYSL0uw6dCOx4k64U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g1IaNJWqUqXfi27fxIRXtxKkz4UrHF11YDI/TCrtfKzBY8QJWEhGXxBWvv7crXpT9iIb7iTtRM0ky1V3jKX15e1p/wSo6X5L8eHkhhuinh0IBerPKYSvfEswBI8tPzOrBN/T/VoLS+0aylD522ElBcEK2nweMRMp0RwfWSMbnt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=rfIuhLjI; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
	by linux.microsoft.com (Postfix) with ESMTPSA id 94110207DBCD;
	Fri,  3 May 2024 11:15:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 94110207DBCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714760112;
	bh=yPBgqwMnI41nWZODa1VgPt3i2GC2rS8MFNAk6cyPzOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rfIuhLjI+nWz0/jefMYCdRu7z0QgobTqyW1zPxD1TwVuhO2KKg4Ni+oUzq+I/XukX
	 26wOMVdahTeJFCuTMXyhhL9PrgBR+9uKmYavaTygXiazKO27T4YFTO11R8/TSNfP4p
	 ujdsIXqG0jDhaZR3+9auXK+74XTO2IjfoQcNBz50=
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
Subject: [PATCH v2 05/12] media: cobalt: Make I2C terminology more inclusive
Date: Fri,  3 May 2024 18:13:26 +0000
Message-Id: <20240503181333.2336999-6-eahariha@linux.microsoft.com>
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
 drivers/media/pci/cobalt/cobalt-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-i2c.c b/drivers/media/pci/cobalt/cobalt-i2c.c
index 10c9ee33f73e..011130aef2ca 100644
--- a/drivers/media/pci/cobalt/cobalt-i2c.c
+++ b/drivers/media/pci/cobalt/cobalt-i2c.c
@@ -45,10 +45,10 @@ struct cobalt_i2c_regs {
 /* I2C stop condition */
 #define M00018_CR_BITMAP_STO_MSK	(1 << 6)
 
-/* I2C read from slave */
+/* I2C read from target */
 #define M00018_CR_BITMAP_RD_MSK		(1 << 5)
 
-/* I2C write to slave */
+/* I2C write to target */
 #define M00018_CR_BITMAP_WR_MSK		(1 << 4)
 
 /* I2C ack */
@@ -59,7 +59,7 @@ struct cobalt_i2c_regs {
 
 /* SR[7:0] - Status register */
 
-/* Receive acknowledge from slave */
+/* Receive acknowledge from target */
 #define M00018_SR_BITMAP_RXACK_MSK	(1 << 7)
 
 /* Busy, I2C bus busy (as defined by start / stop bits) */
-- 
2.34.1


