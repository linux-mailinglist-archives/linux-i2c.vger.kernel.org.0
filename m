Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837585965C7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Aug 2022 01:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237318AbiHPXBR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 19:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237611AbiHPXBK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 19:01:10 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E68EE8B9BB
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 16:01:05 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 17 Aug 2022 01:54:25 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 27GMsKAJ022533;
        Tue, 16 Aug 2022 18:54:20 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 27GMsKeM009232;
        Tue, 16 Aug 2022 18:54:20 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: [PATCH v1 1/7] i2c-mlxbf.c: Fix frequency calculation
Date:   Tue, 16 Aug 2022 18:54:06 -0400
Message-Id: <20220816225412.9095-2-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220816225412.9095-1-asmaa@nvidia.com>
References: <20220816225412.9095-1-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-mlxbf.c driver is currently broken because there is a bug
in the calculation of the frequency. core_f, core_r and core_od
are components read from hardware registers and are used to
compute the frequency used to compute different timing parameters.
The shifting mechanism used to get core_f, core_r and core_od is
wrong. Use FIELD_GET to mask and shift the bitfields properly.

Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 59 ++++++++++++----------------------
 1 file changed, 21 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 8716032f030a..2e2ac45d9ca0 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -63,13 +64,14 @@
  */
 #define MLXBF_I2C_TYU_PLL_OUT_FREQ  (400 * 1000 * 1000)
 /* Reference clock for Bluefield - 156 MHz. */
-#define MLXBF_I2C_PLL_IN_FREQ       (156 * 1000 * 1000)
+#define MLXBF_I2C_PLL_IN_FREQ       156250000ULL
 
 /* Constant used to determine the PLL frequency. */
-#define MLNXBF_I2C_COREPLL_CONST    16384
+#define MLNXBF_I2C_COREPLL_CONST    16384ULL
+
+#define MLXBF_I2C_FREQUENCY_1GHZ  1000000000ULL
 
 /* PLL registers. */
-#define MLXBF_I2C_CORE_PLL_REG0         0x0
 #define MLXBF_I2C_CORE_PLL_REG1         0x4
 #define MLXBF_I2C_CORE_PLL_REG2         0x8
 
@@ -181,22 +183,15 @@
 #define MLXBF_I2C_COREPLL_FREQ          MLXBF_I2C_TYU_PLL_OUT_FREQ
 
 /* Core PLL TYU configuration. */
-#define MLXBF_I2C_COREPLL_CORE_F_TYU_MASK   GENMASK(12, 0)
-#define MLXBF_I2C_COREPLL_CORE_OD_TYU_MASK  GENMASK(3, 0)
-#define MLXBF_I2C_COREPLL_CORE_R_TYU_MASK   GENMASK(5, 0)
-
-#define MLXBF_I2C_COREPLL_CORE_F_TYU_SHIFT  3
-#define MLXBF_I2C_COREPLL_CORE_OD_TYU_SHIFT 16
-#define MLXBF_I2C_COREPLL_CORE_R_TYU_SHIFT  20
+#define MLXBF_I2C_COREPLL_CORE_F_TYU_MASK   GENMASK(15, 3)
+#define MLXBF_I2C_COREPLL_CORE_OD_TYU_MASK  GENMASK(19, 16)
+#define MLXBF_I2C_COREPLL_CORE_R_TYU_MASK   GENMASK(25, 20)
 
 /* Core PLL YU configuration. */
 #define MLXBF_I2C_COREPLL_CORE_F_YU_MASK    GENMASK(25, 0)
 #define MLXBF_I2C_COREPLL_CORE_OD_YU_MASK   GENMASK(3, 0)
-#define MLXBF_I2C_COREPLL_CORE_R_YU_MASK    GENMASK(5, 0)
+#define MLXBF_I2C_COREPLL_CORE_R_YU_MASK    GENMASK(31, 26)
 
-#define MLXBF_I2C_COREPLL_CORE_F_YU_SHIFT   0
-#define MLXBF_I2C_COREPLL_CORE_OD_YU_SHIFT  1
-#define MLXBF_I2C_COREPLL_CORE_R_YU_SHIFT   26
 
 /* Core PLL frequency. */
 static u64 mlxbf_i2c_corepll_frequency;
@@ -479,8 +474,6 @@ static struct mutex mlxbf_i2c_bus_lock;
 #define MLXBF_I2C_MASK_8    GENMASK(7, 0)
 #define MLXBF_I2C_MASK_16   GENMASK(15, 0)
 
-#define MLXBF_I2C_FREQUENCY_1GHZ  1000000000
-
 /*
  * Function to poll a set of bits at a specific address; it checks whether
  * the bits are equal to zero when eq_zero is set to 'true', and not equal
@@ -1407,24 +1400,19 @@ static int mlxbf_i2c_init_master(struct platform_device *pdev,
 	return 0;
 }
 
-static u64 mlxbf_calculate_freq_from_tyu(struct mlxbf_i2c_resource *corepll_res)
+static u64 mlxbf_i2c_calculate_freq_from_tyu(struct mlxbf_i2c_resource *corepll_res)
 {
-	u64 core_frequency, pad_frequency;
+	u64 core_frequency;
 	u8 core_od, core_r;
 	u32 corepll_val;
 	u16 core_f;
 
-	pad_frequency = MLXBF_I2C_PLL_IN_FREQ;
-
 	corepll_val = readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG1);
 
 	/* Get Core PLL configuration bits. */
-	core_f = rol32(corepll_val, MLXBF_I2C_COREPLL_CORE_F_TYU_SHIFT) &
-			MLXBF_I2C_COREPLL_CORE_F_TYU_MASK;
-	core_od = rol32(corepll_val, MLXBF_I2C_COREPLL_CORE_OD_TYU_SHIFT) &
-			MLXBF_I2C_COREPLL_CORE_OD_TYU_MASK;
-	core_r = rol32(corepll_val, MLXBF_I2C_COREPLL_CORE_R_TYU_SHIFT) &
-			MLXBF_I2C_COREPLL_CORE_R_TYU_MASK;
+	core_f = FIELD_GET(MLXBF_I2C_COREPLL_CORE_F_TYU_MASK, corepll_val);
+	core_od = FIELD_GET(MLXBF_I2C_COREPLL_CORE_OD_TYU_MASK, corepll_val);
+	core_r = FIELD_GET(MLXBF_I2C_COREPLL_CORE_R_TYU_MASK, corepll_val);
 
 	/*
 	 * Compute PLL output frequency as follow:
@@ -1436,31 +1424,26 @@ static u64 mlxbf_calculate_freq_from_tyu(struct mlxbf_i2c_resource *corepll_res)
 	 * Where PLL_OUT_FREQ and PLL_IN_FREQ refer to CoreFrequency
 	 * and PadFrequency, respectively.
 	 */
-	core_frequency = pad_frequency * (++core_f);
+	core_frequency = MLXBF_I2C_PLL_IN_FREQ * (++core_f);
 	core_frequency /= (++core_r) * (++core_od);
 
 	return core_frequency;
 }
 
-static u64 mlxbf_calculate_freq_from_yu(struct mlxbf_i2c_resource *corepll_res)
+static u64 mlxbf_i2c_calculate_freq_from_yu(struct mlxbf_i2c_resource *corepll_res)
 {
 	u32 corepll_reg1_val, corepll_reg2_val;
-	u64 corepll_frequency, pad_frequency;
+	u64 corepll_frequency;
 	u8 core_od, core_r;
 	u32 core_f;
 
-	pad_frequency = MLXBF_I2C_PLL_IN_FREQ;
-
 	corepll_reg1_val = readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG1);
 	corepll_reg2_val = readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG2);
 
 	/* Get Core PLL configuration bits */
-	core_f = rol32(corepll_reg1_val, MLXBF_I2C_COREPLL_CORE_F_YU_SHIFT) &
-			MLXBF_I2C_COREPLL_CORE_F_YU_MASK;
-	core_r = rol32(corepll_reg1_val, MLXBF_I2C_COREPLL_CORE_R_YU_SHIFT) &
-			MLXBF_I2C_COREPLL_CORE_R_YU_MASK;
-	core_od = rol32(corepll_reg2_val,  MLXBF_I2C_COREPLL_CORE_OD_YU_SHIFT) &
-			MLXBF_I2C_COREPLL_CORE_OD_YU_MASK;
+	core_f = FIELD_GET(MLXBF_I2C_COREPLL_CORE_F_YU_MASK, corepll_reg1_val);
+	core_r = FIELD_GET(MLXBF_I2C_COREPLL_CORE_R_YU_MASK, corepll_reg1_val);
+	core_od = FIELD_GET(MLXBF_I2C_COREPLL_CORE_OD_YU_MASK, corepll_reg2_val);
 
 	/*
 	 * Compute PLL output frequency as follow:
@@ -1472,7 +1455,7 @@ static u64 mlxbf_calculate_freq_from_yu(struct mlxbf_i2c_resource *corepll_res)
 	 * Where PLL_OUT_FREQ and PLL_IN_FREQ refer to CoreFrequency
 	 * and PadFrequency, respectively.
 	 */
-	corepll_frequency = (pad_frequency * core_f) / MLNXBF_I2C_COREPLL_CONST;
+	corepll_frequency = (MLXBF_I2C_PLL_IN_FREQ * core_f) / MLNXBF_I2C_COREPLL_CONST;
 	corepll_frequency /= (++core_r) * (++core_od);
 
 	return corepll_frequency;
-- 
2.30.1

