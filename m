Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23D12A5089
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 20:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgKCTyt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 14:54:49 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8033 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729645AbgKCTys (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 14:54:48 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa1b58c0000>; Tue, 03 Nov 2020 11:54:52 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 19:54:48 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Tue, 3 Nov
 2020 19:54:47 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-next v2 4/6] i2c: mlxbf: Update reference clock frequency
Date:   Tue, 3 Nov 2020 14:54:41 -0500
Message-ID: <d7d989d8518171d4c7073904dafb23ece3af8cec.1604432921.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <cover.1604432921.git.kblaiech@nvidia.com>
References: <cover.1604432921.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604433292; bh=oIuCubzP3wg+WmeGh/HCtjkoZnXzUrTPSrfRnNi6Myg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=Fxwd6Ugfeky87GJvncJbfig92X4QfrJ6iJ75l7rodCkLyY5vo83JNTHc05ruIQB2X
         7T9AYoUWZPMxk66z4ELHpVimYGmtT1fjcsaCjVLG2OGGAPnt7ouAEwbdBeSUoN895F
         hZJx5MAOeJJfkt4Cc/u4B6wOwwdhSsDCGlu6/kuhZ5Mlfs2VwBx2w6W5SZEwAkIfSC
         68rD1bAm6ReUP8JsSkmecsYXkF8Q+fcYu3ofwuMpJYqe0cJmPRmDunauh6vgfxUA8n
         8yD/hso7aKYAiHxPqbUQ/5UvpraA6DINLjLYyiU0x787Ebap2KgjG2gwu2+w9rf5GO
         2Q7C1BYVpH41A==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The reference clock frequency remains the same across Bluefield
products. Thus, update the frequency and rename the macro.

Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC")
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index fca8a3b..afc996d 100644
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
 
 /* Constant used to determine the PLL frequency. */
 #define MLNXBF_I2C_COREPLL_CONST    16384
@@ -1422,7 +1420,7 @@ static u64 mlxbf_calculate_freq_from_tyu(struct mlxbf_i2c_resource *corepll_res)
 	u32 corepll_val;
 	u16 core_f;
 
-	pad_frequency = MLXBF_I2C_TYU_PLL_IN_FREQ;
+	pad_frequency = MLXBF_I2C_PLL_IN_FREQ;
 
 	corepll_val = readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG1);
 
@@ -1457,7 +1455,7 @@ static u64 mlxbf_calculate_freq_from_yu(struct mlxbf_i2c_resource *corepll_res)
 	u8 core_od, core_r;
 	u32 core_f;
 
-	pad_frequency = MLXBF_I2C_YU_PLL_IN_FREQ;
+	pad_frequency = MLXBF_I2C_PLL_IN_FREQ;
 
 	corepll_reg1_val = readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG1);
 	corepll_reg2_val = readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG2);
-- 
2.1.2

