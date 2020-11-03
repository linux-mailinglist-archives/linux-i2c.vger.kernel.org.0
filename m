Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0B02A5087
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 20:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbgKCTyr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 14:54:47 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8028 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgKCTyr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 14:54:47 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa1b58a0000>; Tue, 03 Nov 2020 11:54:50 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 19:54:46 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Tue, 3 Nov
 2020 19:54:46 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-next v2 2/6] i2c: mlxbf: Fix resrticted cast warning of sparse
Date:   Tue, 3 Nov 2020 14:54:39 -0500
Message-ID: <dbc627e710b7eb6e5127245c33a4e83ab8e5f21a.1604432921.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <cover.1604432921.git.kblaiech@nvidia.com>
References: <cover.1604432921.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604433290; bh=dH0fFfpNI7qtTbZgSZ13Gns37aTMnD7ULiqBGM7EQtw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=O/BHWjYar9BaTRSsSr33CXjFLq+vmPnyiwcainlUUmV7U5XckusQq2E6DVqAAW67F
         gW26Zbppq2QBs0lnRa2d4KFBS4EzZDQhKMdJkdmbzW/mA4SBqnPBr9/ey4Nu7mlHAF
         BK/R47U9ZzMX8K2g3vy0iBgl3BZl8X5vOu5uhotkEdFcuXrqR7sMCKUDN8DHWejOVY
         MRKDHkkiWfgjwDBtks5FB3gwykt63Fv2vqaKeV1o2ExP+wcQllG3RlWAnOopFxfCo1
         /MxfJgRZXzleBMmDWy6rwbsMp0uNaSS6xGSw5P1iArAJb0VIYqx/s0/O2vvr5Y2Rpl
         lS8kOGiw75iGw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Address warnings "warning: cast to restricted __be32" reported
by sparse.

Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index e18f595..4bd80b1 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -510,7 +510,7 @@ static u32 mlxbf_i2c_read(void __iomem *io, int reg)
  */
 static u32 mlxbf_i2c_read_data(void __iomem *io, int reg)
 {
-	return (u32)be32_to_cpu(mlxbf_i2c_read(io, reg));
+	return ioread32be(io + reg);
 }
 
 /*
@@ -524,7 +524,7 @@ static u32 mlxbf_i2c_read_data(void __iomem *io, int reg)
  */
 static void mlxbf_i2c_write_data(void __iomem *io, int reg, u32 val)
 {
-	mlxbf_i2c_write(io, reg, (u32)cpu_to_be32(val));
+	iowrite32be(val, io + reg);
 }
 
 /*
-- 
2.1.2

