Return-Path: <linux-i2c+bounces-3471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0020B8C0812
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2024 01:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFB1C281780
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 23:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32CE134418;
	Wed,  8 May 2024 23:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="JrbGV5df"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C92613342C;
	Wed,  8 May 2024 23:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715211950; cv=none; b=HadnKBPNjJN5L1X6VvPf5vD5gAq8uO7K+eTk4fpoe2Kj3+JRNAfMB/GtLExurKjEuQ6fDJyUnzT+t1nJTsJ6s8cmABSknd4vAaRVkcJyAFeHGp2tFrrZLNrsH7oY91v58XPZq39iYu1QI5NFu9fFZfbHDJD7k5GcZudnj25z5Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715211950; c=relaxed/simple;
	bh=3zWtvcNWCgLUfgBX4gIzIKMoGwniQ6wxbrwfCecZxcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NmKMxfd7eU9S/bIqi2bQ9nyg7xEWXwTBDVuopwwBrnVb6PZM0fPElzc2/g5hMsTGrCCmi8Sz6AAk0XsjJo0N3hm6oz8ffY3zqzR0jkvWCTx6kYRww4z5FXXuSNgOS/8JdOJ+GMT95WJrePOLevL+GGvHMiB6pgz+Lw8a5a+F2YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=JrbGV5df; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.1.144])
	by linux.microsoft.com (Postfix) with ESMTPSA id DFA0B20B2C80;
	Wed,  8 May 2024 16:45:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DFA0B20B2C80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1715211949;
	bh=Qu3bClL9qiQqt/18Ro/tj+TIHJVXYmveUAFfxO+JRj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JrbGV5dfnw8yry+V9GG0jxyDw1v/YmfDjtYW/LbUsMIaXsfA52i9//DgyVC14mON6
	 Ix0OR3Cj2P9WzyjNLfEUQjYIpqaGGYbnz/3HEFL3D0YaKivrT7AU/z4JIUQWmLQxPy
	 7N0mBeS1PMq4YGnH+1MvdgO8fzKs7F2AblwVHqqQ=
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
Subject: [PATCH v3 4/6] sfc: falcon: Make I2C terminology more inclusive
Date: Wed,  8 May 2024 23:43:40 +0000
Message-Id: <20240508234342.2927398-5-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240508234342.2927398-1-eahariha@linux.microsoft.com>
References: <20240508234342.2927398-1-eahariha@linux.microsoft.com>
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

Compile tested, no functionality changes intended

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


