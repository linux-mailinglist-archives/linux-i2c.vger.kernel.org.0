Return-Path: <linux-i2c+bounces-4874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7C592DF95
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 07:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1E8BB218D6
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 05:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCABE12C7FF;
	Thu, 11 Jul 2024 05:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="FgqA5hE1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7046712C460;
	Thu, 11 Jul 2024 05:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720675748; cv=none; b=M+XLxEWajwtC18tY1AI8nS1vJSyRbnw75yxMXm7Y6+ZBBuOoiMXmWZmi8H536RHnj/ffuBxfy/rEoofOOPfxII81aDc1C7TLq2bKxWpUenk/0caShx+q8kyxMFaMNGw4PvwOnV2CTponl5MI5lrq05I6y66/egGOj5Y/GmSsLZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720675748; c=relaxed/simple;
	bh=WzclvGDns4ilFyPJYI1eK0hLWJ++VUvbpLuIl5YywWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t4XjVUrpcffYSZym14NWHOe5iQ0En2fTtk/yhYkgUMNvP+xtJPVFPE7RHOEMoKZRs3luS3AfwatdHJ0ifczSRqwdVWoNf2r0eYEUMNsk4lpjIAuuMhmPQPlgAZW45NAPGFcnutvvEOLkvL1U4HITrwZFvs84y8xExDZcD6F8UGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=FgqA5hE1; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.159.213])
	by linux.microsoft.com (Postfix) with ESMTPSA id E6E4C20B7177;
	Wed, 10 Jul 2024 22:29:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E6E4C20B7177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1720675747;
	bh=GrgZD0Hkzoqg2er45AV4orVx3uv9DRAW9Ig4kQ3bnBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FgqA5hE1sXB4iOkQPdDG5oG9oTeIMjYhZ5UIYE3JRiwap/WtMWEgaO891wM+JZ6Sv
	 s2E9Dz+xi/D2+eauPa8a8ZHf3itnSOfI1uKgEfPTRnjWkkbZ28GKFirbWcoCmruE1X
	 X8hwgXpltyxj3N8GgmZDjnahP5QfC/z6V4/402Ik=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Edward Cree <ecree.xilinx@gmail.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	netdev@vger.kernel.org (open list:SFC NETWORK DRIVER),
	linux-net-drivers@amd.com (open list:SFC NETWORK DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v4 4/6] sfc: falcon: Make I2C terminology more inclusive
Date: Thu, 11 Jul 2024 05:27:32 +0000
Message-Id: <20240711052734.1273652-5-eahariha@linux.microsoft.com>
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

Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/net/ethernet/sfc/falcon/falcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
index 7a1c9337081b5..36114ce88034c 100644
--- a/drivers/net/ethernet/sfc/falcon/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon/falcon.c
@@ -367,7 +367,7 @@ static const struct i2c_algo_bit_data falcon_i2c_bit_operations = {
 	.getsda		= falcon_getsda,
 	.getscl		= falcon_getscl,
 	.udelay		= 5,
-	/* Wait up to 50 ms for slave to let us pull SCL high */
+	/* Wait up to 50 ms for target to let us pull SCL high */
 	.timeout	= DIV_ROUND_UP(HZ, 20),
 };
 
-- 
2.34.1


