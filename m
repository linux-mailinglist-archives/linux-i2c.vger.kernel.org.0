Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2387B6DA4D4
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 23:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbjDFVln (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 17:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237881AbjDFVlm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 17:41:42 -0400
Received: from fudo.makrotopia.org (fudo.makrotopia.org [IPv6:2a07:2ec0:3002::71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64FD19749;
        Thu,  6 Apr 2023 14:41:41 -0700 (PDT)
Received: from local
        by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1pkXMR-0004rW-27;
        Thu, 06 Apr 2023 23:41:39 +0200
Date:   Thu, 6 Apr 2023 22:41:34 +0100
From:   Daniel Golle <daniel@makrotopia.org>
To:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Qii Wang <qii.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH 1/2] i2c: mediatek: add support for MT7981 SoC
Message-ID: <5f611059ba664f912c4c5c6cc859acb9b5121e2e.1680817105.git.daniel@makrotopia.org>
References: <cover.1680817105.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680817105.git.daniel@makrotopia.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the I2C units found in the MediaTek MT7981 and MT7988
SoCs. Just like other recent MediaTek I2C units that also uses v3
register offsets (which differ from v2 only by OFFSET_SLAVE_ADDR being
0x94 instead of 0x4).

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 59eaefe999b11..a43c4d77739ab 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -431,6 +431,18 @@ static const struct mtk_i2c_compatible mt8168_compat = {
 	.max_dma_support = 33,
 };
 
+static const struct mtk_i2c_compatible mt7981_compat = {
+	.regs = mt_i2c_regs_v3,
+	.pmic_i2c = 0,
+	.dcm = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 1,
+	.ltiming_adjust = 1,
+	.max_dma_support = 33
+};
+
 static const struct mtk_i2c_compatible mt7986_compat = {
 	.quirks = &mt7622_i2c_quirks,
 	.regs = mt_i2c_regs_v1,
@@ -516,6 +528,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
 	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
 	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
+	{ .compatible = "mediatek,mt7981-i2c", .data = &mt7981_compat },
 	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },
 	{ .compatible = "mediatek,mt8168-i2c", .data = &mt8168_compat },
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
-- 
2.40.0

