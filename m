Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7109529D96C
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Oct 2020 23:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389782AbgJ1WzJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Oct 2020 18:55:09 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16506 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389758AbgJ1WzG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Oct 2020 18:55:06 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f99f6cd0000>; Wed, 28 Oct 2020 15:55:09 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 22:55:02 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Wed, 28 Oct
 2020 22:55:01 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>,
        "kernel test robot" <lkp@intel.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v1 1/6] i2c: mlxbf: Add CONFIG_ACPI to guard ACPI function call
Date:   Wed, 28 Oct 2020 18:54:17 -0400
Message-ID: <c0593f8bb8ff482c130add78a72787db490d9f67.1603925077.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1603925077.git.kblaiech@nvidia.com>
References: <cover.1603925077.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603925709; bh=/90AzoLOz/HXiYndPjXqFdcbsxkEu9cCI692cQHHwS8=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=KP3gUSoH6gSmUFiMstCWWGj6ERi7U91GbWoV1oW2Eyn4CxOFDs+T73se9h6rAeN9G
         2Zjg4whHOenCij290odLzm4aY0KDuKNspqexiiAPAREqsM4oOLKj5lOlAOXATu883+
         E5+cOkO7IbC87qvubEGsLM0PHXiYN5NZFtLyS5/FdYSeTXOOQhcMqKhLcp149MPCg9
         XcXuL2st+n7M5sgTwhklX7i8rAX6zmuSdTW2zzXtnWd68aXo5h6KSqxWNbJCsRLjfp
         ppSGkqwXwFnk4OtzYVTCL7uiRGnVP24n+L65FHBlykx0yTAmWef/zPqILMiWYArcYC
         /m2R2WvWeSGCA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The build fails with "implicit declaration of function
'acpi_device_uid'" error. Thus, protect ACPI function calls
from being called when CONFIG_ACPI is disabled.

Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueFie=
ld SoC")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.=
c
index ee59e0da082d..e18f595b37a7 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2264,6 +2264,7 @@ static const struct of_device_id mlxbf_i2c_dt_ids[] =
=3D {
=20
 MODULE_DEVICE_TABLE(of, mlxbf_i2c_dt_ids);
=20
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id mlxbf_i2c_acpi_ids[] =3D {
 	{ "MLNXBF03", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_1] },
 	{ "MLNXBF23", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_2] },
@@ -2305,6 +2306,12 @@ static int mlxbf_i2c_acpi_probe(struct device *dev, =
struct mlxbf_i2c_priv *priv)
=20
 	return ret;
 }
+#else
+static int mlxbf_i2c_acpi_probe(struct device *dev, struct mlxbf_i2c_priv =
*priv)
+{
+	return -ENOENT;
+}
+#endif /* CONFIG_ACPI */
=20
 static int mlxbf_i2c_of_probe(struct device *dev, struct mlxbf_i2c_priv *p=
riv)
 {
@@ -2473,7 +2480,9 @@ static struct platform_driver mlxbf_i2c_driver =3D {
 	.driver =3D {
 		.name =3D "i2c-mlxbf",
 		.of_match_table =3D mlxbf_i2c_dt_ids,
+#ifdef CONFIG_ACPI
 		.acpi_match_table =3D ACPI_PTR(mlxbf_i2c_acpi_ids),
+#endif /* CONFIG_ACPI  */
 	},
 };
=20
--=20
2.24.1

