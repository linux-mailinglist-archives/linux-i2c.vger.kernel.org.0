Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5A9495484
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 19:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346851AbiATS7C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 13:59:02 -0500
Received: from eu-shark1.inbox.eu ([195.216.236.81]:54560 "EHLO
        eu-shark1.inbox.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346922AbiATS7B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 13:59:01 -0500
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
        by eu-shark1-out.inbox.eu (Postfix) with ESMTP id C85E46C006AE;
        Thu, 20 Jan 2022 20:59:00 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
        t=1642705140; bh=YS/yJ57EWPEjZWHReNFdWuAZ6M+DzTo6MREgxyD6rKU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-ESPOL:
         from:date:to:cc;
        b=PIs4T7wFqbr/TkH1rfoB4IOe/ENUh6SGcZ1ZTqygmsO3/1tw4tfTeo0LNt2R8NJ9V
         cG6d1+Us/RCihN3O3MaawuN8+/FfjODeCUNuU96a8aDGYfJeWj6ENdQ/sqDS1JI0zJ
         91+o7nAzxtp/Hdba8mXhIe9IzmVxt3ewW4J/ewoA=
Received: from localhost (localhost [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id B15736C00771;
        Thu, 20 Jan 2022 20:59:00 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
        by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
        with ESMTP id XGejEganWRFR; Thu, 20 Jan 2022 20:59:00 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 5B1736C006AE;
        Thu, 20 Jan 2022 20:59:00 +0200 (EET)
From:   Boris Lysov <arzamas-16@mail.ee>
To:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     qii.wang@mediatek.com
Subject: [PATCH 2/2] i2c: mediatek: remove mt6577 support
Date:   Thu, 20 Jan 2022 21:58:53 +0300
Message-Id: <20220120185853.24266-3-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220120185853.24266-1-arzamas-16@mail.ee>
References: <20220120185853.24266-1-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: +d1m7upSeE2pjkLDN3bfAA8xrSJNWOnm557a3R5egnr/NzCGf04TURS/gR8IQDzn/iM=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The mt6577 compatibility was introduced back in 2014 in commit 8452c80d5b4b
("I2C: mediatek: Add driver for MediaTek I2C controller") by Xudong Chen.

The i2c-mt65xx driver relies on DMA since it was first introduced. mt6577 does
not support DMA [1] for I2C and doesn't have dedicated DMA engines for I2C.
Moreover, the entire mt65xx Cortex-A9 SoC family (mt6515, mt6517, mt6575,
and mt6577) which share the same I2C IP doesn't support I2C DMA at all which
makes this particular driver incompatible with these SoCs.

The existing code used mt6577 as a "generic" configuration to be used with
other SoCs such as mt6589 (for quirks), and mt2701/mt6797/mt7623 (in general).

This patch makes mt2701 (which is *actually* supported by this driver) a new
placeholder for generic Mediatek I2C bus configuration.

[1] see references in
https://lists.infradead.org/pipermail/linux-mediatek/2021-October/030333.html

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 drivers/i2c/busses/i2c-mt65xx.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 9ea427f53083..24c94e58dc08 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -298,7 +298,7 @@ static const struct i2c_spec_values fast_mode_plus_spec = {
 	.min_su_dat_ns = 50 + I2C_FAST_MODE_PLUS_BUFFER,
 };
 
-static const struct i2c_adapter_quirks mt6577_i2c_quirks = {
+static const struct i2c_adapter_quirks mt2701_i2c_quirks = {
 	.flags = I2C_AQ_COMB_WRITE_THEN_READ,
 	.max_num_msgs = 1,
 	.max_write_len = 255,
@@ -315,35 +315,35 @@ static const struct i2c_adapter_quirks mt8183_i2c_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 };
 
-static const struct mtk_i2c_compatible mt2712_compat = {
+static const struct mtk_i2c_compatible mt2701_compat = {
+	.quirks = &mt2701_i2c_quirks,
 	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
 	.dcm = 1,
-	.auto_restart = 1,
-	.aux_len_reg = 1,
-	.timing_adjust = 1,
+	.auto_restart = 0,
+	.aux_len_reg = 0,
+	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
-	.max_dma_support = 33,
+	.max_dma_support = 32,
 };
 
-static const struct mtk_i2c_compatible mt6577_compat = {
-	.quirks = &mt6577_i2c_quirks,
+static const struct mtk_i2c_compatible mt2712_compat = {
 	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
 	.dcm = 1,
-	.auto_restart = 0,
-	.aux_len_reg = 0,
-	.timing_adjust = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
-	.max_dma_support = 32,
+	.max_dma_support = 33,
 };
 
 static const struct mtk_i2c_compatible mt6589_compat = {
-	.quirks = &mt6577_i2c_quirks,
+	.quirks = &mt2701_i2c_quirks,
 	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 1,
 	.dcm = 0,
@@ -412,8 +412,8 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 };
 
 static const struct of_device_id mtk_i2c_of_match[] = {
+	{ .compatible = "mediatek,mt2701-i2c", .data = &mt2701_compat },
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
-	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
 	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
 	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
-- 
2.20.1

