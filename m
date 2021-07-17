Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D8E3CC285
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Jul 2021 12:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbhGQKVQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Jul 2021 06:21:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50578 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233281AbhGQKVG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Jul 2021 06:21:06 -0400
X-UUID: dde8b2ae8e0f45849948c2dd5feb6610-20210717
X-UUID: dde8b2ae8e0f45849948c2dd5feb6610-20210717
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1101751611; Sat, 17 Jul 2021 18:18:08 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 18:18:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 18:18:05 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <yuhan.wei@mediatek.com>,
        <kewei.xu@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
        <liguo.zhang@mediatek.com>
Subject: [PATCH v4 4/8] i2c: mediatek: Dump i2c/dma register when a timeout occurs
Date:   Sat, 17 Jul 2021 18:17:55 +0800
Message-ID: <1626517079-9057-5-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When a timeout error occurs in i2c transter, it is usually related
to the i2c/dma IP hardware configuration. Therefore, the purpose of
this patch is to dump the key register values of i2c/dma when a
timeout occurs in i2c for debugging.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 56 ++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index c0108387f34b..abdbf27b6eb4 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -128,6 +128,7 @@ enum I2C_REGS_OFFSET {
 	OFFSET_HS,
 	OFFSET_SOFTRESET,
 	OFFSET_DCM_EN,
+	OFFSET_MULTI_DMA,
 	OFFSET_PATH_DIR,
 	OFFSET_DEBUGSTAT,
 	OFFSET_DEBUGCTRL,
@@ -195,6 +196,7 @@ static const u16 mt_i2c_regs_v2[] = {
 	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
 	[OFFSET_CLOCK_DIV] = 0x48,
 	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_MULTI_DMA] = 0x8c,
 	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
 	[OFFSET_DEBUGSTAT] = 0xe4,
 	[OFFSET_DEBUGCTRL] = 0xe8,
@@ -831,6 +833,57 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	return 0;
 }
 
+static void i2c_dump_register(struct mtk_i2c *i2c)
+{
+	dev_err(i2c->dev, "SLAVE_ADDR: 0x%x, INTR_MASK: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR),
+		mtk_i2c_readw(i2c, OFFSET_INTR_MASK));
+	dev_err(i2c->dev, "INTR_STAT: 0x%x, CONTROL: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_INTR_STAT),
+		mtk_i2c_readw(i2c, OFFSET_CONTROL));
+	dev_err(i2c->dev, "TRANSFER_LEN: 0x%x, TRANSAC_LEN: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN),
+		mtk_i2c_readw(i2c, OFFSET_TRANSAC_LEN));
+	dev_err(i2c->dev, "DELAY_LEN: 0x%x, HTIMING: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_DELAY_LEN),
+		mtk_i2c_readw(i2c, OFFSET_TIMING));
+	dev_err(i2c->dev, "START: 0x%x, EXT_CONF: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_START),
+		mtk_i2c_readw(i2c, OFFSET_EXT_CONF));
+	dev_err(i2c->dev, "HS: 0x%x, IO_CONFIG: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_HS),
+		mtk_i2c_readw(i2c, OFFSET_IO_CONFIG));
+	dev_err(i2c->dev, "DCM_EN: 0x%x, TRANSFER_LEN_AUX: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_DCM_EN),
+		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN_AUX));
+	dev_err(i2c->dev, "CLOCK_DIV: 0x%x, FIFO_STAT: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_CLOCK_DIV),
+		mtk_i2c_readw(i2c, OFFSET_FIFO_STAT));
+	dev_err(i2c->dev, "DEBUGCTRL : 0x%x, DEBUGSTAT: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_DEBUGCTRL),
+		mtk_i2c_readw(i2c, OFFSET_DEBUGSTAT));
+	if (i2c->dev_comp->regs == mt_i2c_regs_v2) {
+		dev_err(i2c->dev, "LTIMING: 0x%x, MULTI_DMA: 0x%x\n",
+			mtk_i2c_readw(i2c, OFFSET_LTIMING),
+			mtk_i2c_readw(i2c, OFFSET_MULTI_DMA));
+	}
+	dev_err(i2c->dev, "\nDMA_INT_FLAG: 0x%x, DMA_INT_EN: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_INT_FLAG),
+		readl(i2c->pdmabase + OFFSET_INT_EN));
+	dev_err(i2c->dev, "DMA_EN: 0x%x, DMA_CON: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_EN),
+		readl(i2c->pdmabase + OFFSET_CON));
+	dev_err(i2c->dev, "DMA_TX_MEM_ADDR: 0x%x, DMA_RX_MEM_ADDR: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_MEM_ADDR),
+		readl(i2c->pdmabase + OFFSET_RX_MEM_ADDR));
+	dev_err(i2c->dev, "DMA_TX_LEN: 0x%x, DMA_RX_LEN: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_LEN),
+		readl(i2c->pdmabase + OFFSET_RX_LEN));
+	dev_err(i2c->dev, "DMA_TX_4G_MODE: 0x%x, DMA_RX_4G_MODE: 0x%x",
+		readl(i2c->pdmabase + OFFSET_TX_4G_MODE),
+		readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
+}
+
 static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			       int num, int left_num)
 {
@@ -1048,7 +1101,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	}
 
 	if (ret == 0) {
-		dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
+		dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
+		i2c_dump_register(i2c);
 		mtk_i2c_init_hw(i2c);
 		return -ETIMEDOUT;
 	}
-- 
2.18.0

