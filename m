Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7355529D96D
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Oct 2020 23:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389781AbgJ1WzL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Oct 2020 18:55:11 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18065 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732095AbgJ1WzG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Oct 2020 18:55:06 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f99f6b50000>; Wed, 28 Oct 2020 15:54:45 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 22:55:05 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Wed, 28 Oct
 2020 22:55:05 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>,
        Leon Romanovsky <leonro@nvidia.com>
Subject: [PATCH i2c-next v1 5/6] i2c: mlxbf: Update author and maintainer email info
Date:   Wed, 28 Oct 2020 18:54:21 -0400
Message-ID: <06e1cf8cbb697c817c55b8885415904a98b9642e.1603925078.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1603925077.git.kblaiech@nvidia.com>
References: <cover.1603925077.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603925685; bh=a+SlTyH37duHsyZI8VmNx6g+Rs9Ghxxe6ryBYpOfPD0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=JOKRN+Mw6EOo3sNGtenuXG5zagM9SRIawD42Ys4b5l80FG06pKEpd5VyJV0Km0Rbr
         LJBORZCbR82kT9nmdr5yBoy3DQAJnm7m0Firej+VoK3Numd8W/ajKZWViX5C5M7IH6
         vEHjxVjCzllGjX7R1ntq8mTs2jasMCelGCx4NODjlVqSU8NhenlrQtyGOmY+Q9dbJy
         Irc+UTAG5ICvcGfX+8OJi5wMxlgWFQDUrtMSz/2WcrwAyyg5NKYiJQsKRBN8Eg8uDh
         zKxzXkB2wS8G1w7TmyP2wrjC/3JaMSDtMx3XwwtgNUUy+u/urYoZOa5kUYzyPL74bp
         FWCBw9AZCf5iQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Correct the email addresses of the author and the maintainer
of the Mellanox BlueField I2C driver.

Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueFie=
ld SoC")
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 MAINTAINERS                    | 2 +-
 drivers/i2c/busses/i2c-mlxbf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8580de35179f..9128200af1d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11072,7 +11072,7 @@ F:	Documentation/devicetree/bindings/input/touchscr=
een/melfas_mip4.txt
 F:	drivers/input/touchscreen/melfas_mip4.c
=20
 MELLANOX BLUEFIELD I2C DRIVER
-M:	Khalil Blaiech <kblaiech@mellanox.com>
+M:	Khalil Blaiech <kblaiech@nvidia.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
 F:	drivers/i2c/busses/i2c-mlxbf.c
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.=
c
index afc996d07504..33574d40ea9c 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2470,5 +2470,5 @@ static void __exit mlxbf_i2c_exit(void)
 module_exit(mlxbf_i2c_exit);
=20
 MODULE_DESCRIPTION("Mellanox BlueField I2C bus driver");
-MODULE_AUTHOR("Khalil Blaiech <kblaiech@mellanox.com>");
+MODULE_AUTHOR("Khalil Blaiech <kblaiech@nvidia.com>");
 MODULE_LICENSE("GPL v2");
--=20
2.24.1

