Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E2E29D969
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Oct 2020 23:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389779AbgJ1WzF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Oct 2020 18:55:05 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16502 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389776AbgJ1WzF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Oct 2020 18:55:05 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f99f6cc0001>; Wed, 28 Oct 2020 15:55:08 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 22:55:04 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Wed, 28 Oct
 2020 22:55:04 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>,
        Leon Romanovsky <leonro@nvidia.com>
Subject: [PATCH i2c-next v1 4/6] i2c: mlxbf: Update reference clock frequency
Date:   Wed, 28 Oct 2020 18:54:20 -0400
Message-ID: <e9ce81227b9a073bda4c6c347726ce1006e1a0c8.1603925078.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1603925077.git.kblaiech@nvidia.com>
References: <cover.1603925077.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603925708; bh=JGOozmSPHS6vJ6hfE4OWIInXIDFQZ962Oubpd+qGEHk=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=D1oASc0mvB/4Bv8Q6RNHXB04nscQa3kv3zuNl4uCucVPur61zD0jzAP4HCC1GxKYx
         0Sgsw7sMHYAAl0hWkEv5IF2hXOav3/MuRi7rNY4/fv0OG+g6gAeEAKBg8oxf0pEsOO
         +cZrZmVXZ0x4f6+/WAOor3sCTAJo9sEh2NklhAy2JdkQRUMTgQuETaNF9TYgRLpfI5
         s+t+zeft8lYuY7aMHJLTE10w+qtd9T9/0CnBuc8BCdIHKantId5+LlZO5nZvl3/AkX
         +rubMNH2F7R6e8QrcLkkaWqDwouiwcLTKF3eE3rd5+K1BiniCX8g7CoZSSygVSq7IE
         p/PQoSi+ddPZQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The reference clock frequency remains the same across Bluefield
products. Thus, update the frequency and rename the macro.

Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueFie=
ld SoC")
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.=
c
index fca8a3bddcb1..afc996d07504 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -62,10 +62,8 @@
  * Master. Default value is set to 400MHz.
  */
 #define MLXBF_I2C_TYU_PLL_OUT_FREQ  (400 * 1000 * 1000)
-/* Reference clock for Bluefield 1 - 156 MHz. */
-#define MLXBF_I2C_TYU_PLL_IN_FREQ   (156 * 1000 * 1000)
-/* Reference clock for BlueField 2 - 200 MHz. */
-#define MLXBF_I2C_YU_PLL_IN_FREQ    (200 * 1000 * 1000)
+/* Reference clock for Bluefield - 156 MHz. */
+#define MLXBF_I2C_PLL_IN_FREQ       (156 * 1000 * 1000)
=20
 /* Constant used to determine the PLL frequency. */
 #define MLNXBF_I2C_COREPLL_CONST    16384
@@ -1422,7 +1420,7 @@ static u64 mlxbf_calculate_freq_from_tyu(struct mlxbf=
_i2c_resource *corepll_res)
 	u32 corepll_val;
 	u16 core_f;
=20
-	pad_frequency =3D MLXBF_I2C_TYU_PLL_IN_FREQ;
+	pad_frequency =3D MLXBF_I2C_PLL_IN_FREQ;
=20
 	corepll_val =3D readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG1);
=20
@@ -1457,7 +1455,7 @@ static u64 mlxbf_calculate_freq_from_yu(struct mlxbf_=
i2c_resource *corepll_res)
 	u8 core_od, core_r;
 	u32 core_f;
=20
-	pad_frequency =3D MLXBF_I2C_YU_PLL_IN_FREQ;
+	pad_frequency =3D MLXBF_I2C_PLL_IN_FREQ;
=20
 	corepll_reg1_val =3D readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG1);
 	corepll_reg2_val =3D readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG2);
--=20
2.24.1

