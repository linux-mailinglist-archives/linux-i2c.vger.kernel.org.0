Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A23656B107
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 05:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236947AbiGHDPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 23:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236938AbiGHDPh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 23:15:37 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFEA7479E;
        Thu,  7 Jul 2022 20:15:33 -0700 (PDT)
X-UUID: d42387bcdea04c3ab6294f5196600505-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:1bd74901-39be-40ef-b84b-64815b715f7b,OB:0,LO
        B:10,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,
        ACTION:release,TS:95
X-CID-INFO: VERSION:1.1.8,REQID:1bd74901-39be-40ef-b84b-64815b715f7b,OB:0,LOB:
        10,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,
        ACTION:quarantine,TS:95
X-CID-META: VersionHash:0f94e32,CLOUDID:278aedd6-5d6d-4eaf-a635-828a3ee48b7c,C
        OID:2513592131b9,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: d42387bcdea04c3ab6294f5196600505-20220708
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2025295690; Fri, 08 Jul 2022 11:15:27 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Jul 2022 11:15:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 11:15:25 +0800
From:   <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
        <yuhan.wei@mediatek.com>, <kewei.xu@mediatek.com>,
        <david-yh.chiu@mediatek.com>, <liju-clr.chen@mediatek.com>
Subject: [PATCH 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8188
Date:   Fri, 8 Jul 2022 11:15:19 +0800
Message-ID: <20220708031520.22053-2-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220708031520.22053-1-kewei.xu@mediatek.com>
References: <20220708031520.22053-1-kewei.xu@mediatek.com>
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

From: Kewei Xu <kewei.xu@mediatek.com>

Add i2c compatible for MT8188. Compare to MT8192 i2c controller,
The MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Change-Id: Ibcfa101061f058508eb1ae2cc07af5a3e7e3bf4f
---
 drivers/i2c/busses/i2c-mt65xx.c | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 8e6985354fd5..70aff42adf5d 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -229,6 +229,35 @@ static const u16 mt_i2c_regs_v2[] = {
 	[OFFSET_DCM_EN] = 0xf88,
 };
 
+static const u16 mt_i2c_regs_v3[] = {
+	[OFFSET_DATA_PORT] = 0x0,
+	[OFFSET_SLAVE_ADDR] = 0x94,
+	[OFFSET_INTR_MASK] = 0x8,
+	[OFFSET_INTR_STAT] = 0xc,
+	[OFFSET_CONTROL] = 0x10,
+	[OFFSET_TRANSFER_LEN] = 0x14,
+	[OFFSET_TRANSAC_LEN] = 0x18,
+	[OFFSET_DELAY_LEN] = 0x1c,
+	[OFFSET_TIMING] = 0x20,
+	[OFFSET_START] = 0x24,
+	[OFFSET_EXT_CONF] = 0x28,
+	[OFFSET_LTIMING] = 0x2c,
+	[OFFSET_HS] = 0x30,
+	[OFFSET_IO_CONFIG] = 0x34,
+	[OFFSET_FIFO_ADDR_CLR] = 0x38,
+	[OFFSET_SDA_TIMING] = 0x3c,
+	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
+	[OFFSET_CLOCK_DIV] = 0x48,
+	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_MULTI_DMA] = 0x8c,
+	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
+	[OFFSET_DEBUGSTAT] = 0xe4,
+	[OFFSET_DEBUGCTRL] = 0xe8,
+	[OFFSET_FIFO_STAT] = 0xf4,
+	[OFFSET_FIFO_THRESH] = 0xf8,
+	[OFFSET_DCM_EN] = 0xf88,
+};
+
 struct mtk_i2c_compatible {
 	const struct i2c_adapter_quirks *quirks;
 	const u16 *regs;
@@ -442,6 +471,19 @@ static const struct mtk_i2c_compatible mt8186_compat = {
 	.max_dma_support = 36,
 };
 
+static const struct mtk_i2c_compatible mt8188_compat = {
+	.regs = mt_i2c_regs_v3,
+	.pmic_i2c = 0,
+	.dcm = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 0,
+	.ltiming_adjust = 1,
+	.apdma_sync = 1,
+	.max_dma_support = 36,
+};
+
 static const struct mtk_i2c_compatible mt8192_compat = {
 	.quirks = &mt8183_i2c_quirks,
 	.regs = mt_i2c_regs_v2,
@@ -465,6 +507,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
 	{ .compatible = "mediatek,mt8186-i2c", .data = &mt8186_compat },
+	{ .compatible = "mediatek,mt8188-i2c", .data = &mt8188_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
 	{}
 };
-- 
2.18.0

