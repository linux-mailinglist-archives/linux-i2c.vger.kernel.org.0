Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF93E29D96A
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Oct 2020 23:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732005AbgJ1WzG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Oct 2020 18:55:06 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16500 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389777AbgJ1WzF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Oct 2020 18:55:05 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f99f6cc0000>; Wed, 28 Oct 2020 15:55:08 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 22:55:02 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Wed, 28 Oct
 2020 22:55:02 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>,
        "kernel test robot" <lkp@intel.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v1 2/6] i2c: mlxbf: Fix resrticted cast warning of sparse
Date:   Wed, 28 Oct 2020 18:54:18 -0400
Message-ID: <aa2a06696f4461b7481c1407daf37a4aecce6610.1603925077.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1603925077.git.kblaiech@nvidia.com>
References: <cover.1603925077.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603925708; bh=OBIhAJg6cKFfI2zKpYtPUfI+O2XMgI5WpM73U3VZZ8c=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=k8knNgN3LC+xGxrzxnIl7Rj5h6Z83fN8c8UJAXGqIGduvugBHdmaq830+1Lmk7Dxe
         77os4aLS8lOJ/NzSiePTd575FZNnBzySv14f16SrnR75uS0N/nO2WUVfFpqUaPHwIk
         3xUXetyxboMR7koNYJkRRwM1cr4SSP7x4F5YjGQLY7lAqMqF8vC70iTVlGPcJjh129
         x4EMsgVQxiiPysoBp4YYwzee4/xQPJ8IkgUr7t2mnjRDDjYx4fWDoLRjl5K5tisfj5
         w46MytQt2Ej7aulgOElqBEX90jwhVRsTeKqovU74tSyftoIObhFkULvRJcmqovm1QL
         gAbrJWivQ75iw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Address warnings "warning: cast to restricted __be32" reported
by sparse.

Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueFie=
ld SoC")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.=
c
index e18f595b37a7..4bd80b1b6a29 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -510,7 +510,7 @@ static u32 mlxbf_i2c_read(void __iomem *io, int reg)
  */
 static u32 mlxbf_i2c_read_data(void __iomem *io, int reg)
 {
-	return (u32)be32_to_cpu(mlxbf_i2c_read(io, reg));
+	return ioread32be(io + reg);
 }
=20
 /*
@@ -524,7 +524,7 @@ static u32 mlxbf_i2c_read_data(void __iomem *io, int re=
g)
  */
 static void mlxbf_i2c_write_data(void __iomem *io, int reg, u32 val)
 {
-	mlxbf_i2c_write(io, reg, (u32)cpu_to_be32(val));
+	iowrite32be(val, io + reg);
 }
=20
 /*
--=20
2.24.1

