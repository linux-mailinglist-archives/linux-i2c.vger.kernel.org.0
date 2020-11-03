Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5882A508A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 20:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729693AbgKCTyt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 14:54:49 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9997 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729645AbgKCTyt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 14:54:49 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa1b58c0001>; Tue, 03 Nov 2020 11:54:52 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 19:54:49 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Tue, 3 Nov
 2020 19:54:48 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-next v2 5/6] i2c: mlxbf: Update author and maintainer email info
Date:   Tue, 3 Nov 2020 14:54:42 -0500
Message-ID: <d13cc817ae2f5b6000d3e7b5a18da697ac8e1b69.1604432921.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <cover.1604432921.git.kblaiech@nvidia.com>
References: <cover.1604432921.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604433292; bh=zbdZwNYr0n1udRjcNEQdG8uqKleniBytQn3GSjBxXQg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=qsZTD2vNW3Mlgrpp02HEYlG4YWviFAv9hyj1Rjadho29cCdIEEg5mOzpOwAr7Ri6M
         kRs+ElkV5Of5kjHZSJ6JuiruL3311bX80zNHq2xzRvmPgZBr1GErLfdUFcJwwZs1uB
         js9V1dAffoN2+Mj5F0uDm6D3h02HLCDNKhGP6uVVR6OI1H/fZZGyawD4QEYUhWItUq
         0z+g8faj43ZX1D+GKaWw2/jZtXy8MpkSRn2Dj9zYM+XOZj1zALkwKpOOyALgRV4lZL
         HtuZpbYTwW+w9Pd9HUP4E5U5mmMa7OzdbN6bdNxIWJJ5YIUc/bMBxduPbKHh+3hcme
         Kk6kij7mDst7Q==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Correct the email addresses of the author and the maintainer
of the Mellanox BlueField I2C driver.

Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC")
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 MAINTAINERS                    | 2 +-
 drivers/i2c/busses/i2c-mlxbf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b516bb3..551587f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11163,7 +11163,7 @@ F:	Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
 F:	drivers/input/touchscreen/melfas_mip4.c
 
 MELLANOX BLUEFIELD I2C DRIVER
-M:	Khalil Blaiech <kblaiech@mellanox.com>
+M:	Khalil Blaiech <kblaiech@nvidia.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
 F:	drivers/i2c/busses/i2c-mlxbf.c
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index afc996d..33574d4 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2470,5 +2470,5 @@ static void __exit mlxbf_i2c_exit(void)
 module_exit(mlxbf_i2c_exit);
 
 MODULE_DESCRIPTION("Mellanox BlueField I2C bus driver");
-MODULE_AUTHOR("Khalil Blaiech <kblaiech@mellanox.com>");
+MODULE_AUTHOR("Khalil Blaiech <kblaiech@nvidia.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.1.2

