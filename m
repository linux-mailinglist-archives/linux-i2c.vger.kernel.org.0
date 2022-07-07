Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B83569A06
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 07:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbiGGFqf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 01:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiGGFqd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 01:46:33 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49893138F;
        Wed,  6 Jul 2022 22:46:31 -0700 (PDT)
X-UUID: b8c1fbdbd01a469a9df8b49ac9075df6-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:324c0550-b744-43dc-8772-009357135868,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,A
        CTION:release,TS:95
X-CID-INFO: VERSION:1.1.8,REQID:324c0550-b744-43dc-8772-009357135868,OB:0,LOB:
        0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,A
        CTION:quarantine,TS:95
X-CID-META: VersionHash:0f94e32,CLOUDID:a484a463-0b3f-4b2c-b3a6-ed5c044366a0,C
        OID:c9092bbef628,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: b8c1fbdbd01a469a9df8b49ac9075df6-20220707
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 262505786; Thu, 07 Jul 2022 13:46:25 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 7 Jul 2022 13:46:24 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jul 2022 13:46:23 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
        <yuhan.wei@mediatek.com>, <kewei.xu@mediatek.com>,
        <david-yh.chiu@mediatek.com>, <liju-clr.chen@mediatek.com>
Subject: [PATCH 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8188
Date:   Thu, 7 Jul 2022 13:46:17 +0800
Message-ID: <20220707054617.13583-3-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220707054617.13583-1-kewei.xu@mediatek.com>
References: <20220707054617.13583-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c compatible for MT8188. Compare to MT8192 i2c controller,
The MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 41 +++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 8e6985354fd5..aa2e1cb87420 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -135,6 +135,7 @@ enum mtk_trans_op {
 enum I2C_REGS_OFFSET {
 	OFFSET_DATA_PORT,
 	OFFSET_SLAVE_ADDR,
+	OFFSET_SLAVE_ADDR1,
 	OFFSET_INTR_MASK,
 	OFFSET_INTR_STAT,
 	OFFSET_CONTROL,
@@ -203,6 +204,7 @@ static const u16 mt_i2c_regs_v1[] = {
 static const u16 mt_i2c_regs_v2[] = {
 	[OFFSET_DATA_PORT] = 0x0,
 	[OFFSET_SLAVE_ADDR] = 0x4,
+	[OFFSET_SLAVE_ADDR1] = 0x94,
 	[OFFSET_INTR_MASK] = 0x8,
 	[OFFSET_INTR_STAT] = 0xc,
 	[OFFSET_CONTROL] = 0x10,
@@ -241,6 +243,7 @@ struct mtk_i2c_compatible {
 	unsigned char ltiming_adjust: 1;
 	unsigned char apdma_sync: 1;
 	unsigned char max_dma_support;
+	unsigned char slave_addr_ver;
 };
 
 struct mtk_i2c_ac_timing {
@@ -345,6 +348,7 @@ static const struct mtk_i2c_compatible mt2712_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 33,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt6577_compat = {
@@ -359,6 +363,7 @@ static const struct mtk_i2c_compatible mt6577_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 32,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt6589_compat = {
@@ -373,6 +378,7 @@ static const struct mtk_i2c_compatible mt6589_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 32,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt7622_compat = {
@@ -387,6 +393,7 @@ static const struct mtk_i2c_compatible mt7622_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 32,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt8168_compat = {
@@ -400,6 +407,7 @@ static const struct mtk_i2c_compatible mt8168_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 33,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt8173_compat = {
@@ -413,6 +421,7 @@ static const struct mtk_i2c_compatible mt8173_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 33,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt8183_compat = {
@@ -427,6 +436,7 @@ static const struct mtk_i2c_compatible mt8183_compat = {
 	.ltiming_adjust = 1,
 	.apdma_sync = 0,
 	.max_dma_support = 33,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt8186_compat = {
@@ -440,6 +450,21 @@ static const struct mtk_i2c_compatible mt8186_compat = {
 	.ltiming_adjust = 1,
 	.apdma_sync = 0,
 	.max_dma_support = 36,
+	.slave_addr_ver = 0,
+};
+
+static const struct mtk_i2c_compatible mt8188_compat = {
+	.regs = mt_i2c_regs_v2,
+	.pmic_i2c = 0,
+	.dcm = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 0,
+	.ltiming_adjust = 1,
+	.apdma_sync = 1,
+	.max_dma_support = 36,
+	.slave_addr_ver = 1,
 };
 
 static const struct mtk_i2c_compatible mt8192_compat = {
@@ -454,6 +479,7 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 	.ltiming_adjust = 1,
 	.apdma_sync = 1,
 	.max_dma_support = 36,
+	.slave_addr_ver = 0,
 };
 
 static const struct of_device_id mtk_i2c_of_match[] = {
@@ -465,6 +491,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
 	{ .compatible = "mediatek,mt8186-i2c", .data = &mt8186_compat },
+	{ .compatible = "mediatek,mt8188-i2c", .data = &mt8188_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
 	{}
 };
@@ -877,8 +904,15 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 
 static void i2c_dump_register(struct mtk_i2c *i2c)
 {
+	enum I2C_REGS_OFFSET sla_addr_offset;
+
+	if (i2c->dev_comp->slave_addr_ver == 1)
+		sla_addr_offset = OFFSET_SLAVE_ADDR1;
+	else
+		sla_addr_offset = OFFSET_SLAVE_ADDR;
+
 	dev_dbg(i2c->dev, "SLAVE_ADDR: 0x%x, INTR_MASK: 0x%x\n",
-		mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR),
+		mtk_i2c_readw(i2c, sla_addr_offset),
 		mtk_i2c_readw(i2c, OFFSET_INTR_MASK));
 	dev_dbg(i2c->dev, "INTR_STAT: 0x%x, CONTROL: 0x%x\n",
 		mtk_i2c_readw(i2c, OFFSET_INTR_STAT),
@@ -982,7 +1016,10 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	mtk_i2c_writew(i2c, control_reg, OFFSET_CONTROL);
 
 	addr_reg = i2c_8bit_addr_from_msg(msgs);
-	mtk_i2c_writew(i2c, addr_reg, OFFSET_SLAVE_ADDR);
+	if (i2c->dev_comp->slave_addr_ver == 1)
+		mtk_i2c_writew(i2c, addr_reg, OFFSET_SLAVE_ADDR1);
+	else
+		mtk_i2c_writew(i2c, addr_reg, OFFSET_SLAVE_ADDR);
 
 	/* Clear interrupt status */
 	mtk_i2c_writew(i2c, restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
-- 
2.18.0

