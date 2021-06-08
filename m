Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC6039ECF0
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 05:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbhFHDTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 23:19:38 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:52090 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230406AbhFHDTh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 23:19:37 -0400
X-UUID: 428521f7cdab4c45abad60841d7ff500-20210608
X-UUID: 428521f7cdab4c45abad60841d7ff500-20210608
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 955989270; Tue, 08 Jun 2021 11:17:42 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 11:17:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 11:17:40 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
        <kewei.xu@mediatek.com>
Subject: [PATCH 2/3] i2c: mediatek: Dump i2c/dma register when a timeout occurs
Date:   Tue, 8 Jun 2021 11:16:39 +0800
Message-ID: <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: "Kewei.Xu" <kewei.xu@mediatek.com>

When a timeout error occurs in i2c transter, it is usually related
to the i2c/dma IP hardware configuration. Therefore, the purpose of
this patch is to dump the key register values of i2c/dma when a
timeout occurs in i2c for debugging.

Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 97 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e..e65a41e 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -125,6 +125,7 @@ enum I2C_REGS_OFFSET {
 	OFFSET_HS,
 	OFFSET_SOFTRESET,
 	OFFSET_DCM_EN,
+	OFFSET_MULTI_DMA,
 	OFFSET_PATH_DIR,
 	OFFSET_DEBUGSTAT,
 	OFFSET_DEBUGCTRL,
@@ -192,8 +193,9 @@ enum I2C_REGS_OFFSET {
 	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
 	[OFFSET_CLOCK_DIV] = 0x48,
 	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_MULTI_DMA] = 0x84,
 	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
-	[OFFSET_DEBUGSTAT] = 0xe0,
+	[OFFSET_DEBUGSTAT] = 0xe4,
 	[OFFSET_DEBUGCTRL] = 0xe8,
 	[OFFSET_FIFO_STAT] = 0xf4,
 	[OFFSET_FIFO_THRESH] = 0xf8,
@@ -828,6 +830,96 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	return 0;
 }
 
+static void i2c_dump_register(struct mtk_i2c *i2c)
+{
+	dev_err(i2c->dev, "SLAVE_ADDR[0x%x]: 0x%x, INTR_MASK[0x%x]: 0x%x\n",
+		OFFSET_SLAVE_ADDR,
+		(mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR)),
+		OFFSET_INTR_MASK,
+		(mtk_i2c_readw(i2c, OFFSET_INTR_MASK)));
+	dev_err(i2c->dev, "INTR_STAT[0x%x]: 0x%x, CONTROL[0x%x]: 0x%x\n",
+		OFFSET_INTR_STAT,
+		(mtk_i2c_readw(i2c, OFFSET_INTR_STAT)),
+		OFFSET_CONTROL,
+		(mtk_i2c_readw(i2c, OFFSET_CONTROL)));
+	dev_err(i2c->dev, "TRANSFER_LEN[0x%x]: 0x%x, TRANSAC_LEN[0x%x]: 0x%x\n",
+		OFFSET_TRANSFER_LEN,
+		(mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN)),
+		OFFSET_TRANSAC_LEN,
+		(mtk_i2c_readw(i2c, OFFSET_TRANSAC_LEN)));
+	dev_err(i2c->dev, "DELAY_LEN[0x%x]: 0x%x, HTIMING[0x%x]: 0x%x\n",
+		OFFSET_DELAY_LEN,
+		(mtk_i2c_readw(i2c, OFFSET_DELAY_LEN)),
+		OFFSET_TIMING,
+		(mtk_i2c_readw(i2c, OFFSET_TIMING)));
+	dev_err(i2c->dev, "OFFSET_START[0x%x]: 0x%x\n",
+		OFFSET_START,
+		mtk_i2c_readw(i2c, OFFSET_START));
+	dev_err(i2c->dev, "OFFSET_EXT_CONF[0x%x]: 0x%x\n",
+		OFFSET_EXT_CONF,
+		mtk_i2c_readw(i2c, OFFSET_EXT_CONF));
+	dev_err(i2c->dev, "OFFSET_HS[0x%x]: 0x%x\n",
+		OFFSET_HS,
+		mtk_i2c_readw(i2c, OFFSET_HS));
+	dev_err(i2c->dev, "OFFSET_IO_CONFIG[0x%x]: 0x%x\n",
+		OFFSET_IO_CONFIG,
+		mtk_i2c_readw(i2c, OFFSET_IO_CONFIG));
+	dev_err(i2c->dev, "OFFSET_FIFO_ADDR_CLR[0x%x]: 0x%x\n",
+		OFFSET_FIFO_ADDR_CLR,
+		mtk_i2c_readw(i2c, OFFSET_FIFO_ADDR_CLR));
+	dev_err(i2c->dev, "TRANSFER_LEN_AUX[0x%x]: 0x%x\n",
+		OFFSET_TRANSFER_LEN_AUX,
+		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN_AUX));
+	dev_err(i2c->dev, "CLOCK_DIV[0x%x]: 0x%x\n",
+		OFFSET_CLOCK_DIV,
+		mtk_i2c_readw(i2c, OFFSET_CLOCK_DIV));
+	dev_err(i2c->dev, "FIFO_STAT[0x%x]: 0x%x, FIFO_THRESH[0x%x]: 0x%x\n",
+		OFFSET_FIFO_STAT,
+		mtk_i2c_readw(i2c, OFFSET_FIFO_STAT),
+		OFFSET_FIFO_THRESH,
+		mtk_i2c_readw(i2c, OFFSET_FIFO_THRESH));
+	dev_err(i2c->dev, "DCM_EN[0x%x] 0x%x\n",
+		OFFSET_DCM_EN,
+		mtk_i2c_readw(i2c, OFFSET_DCM_EN));
+	dev_err(i2c->dev, "DEBUGSTAT[0x%x]: 0x%x, DEBUGCTRL[0x%x]: 0x%x\n",
+		OFFSET_DEBUGSTAT,
+		(mtk_i2c_readw(i2c, OFFSET_DEBUGSTAT)),
+		OFFSET_DEBUGCTRL,
+		(mtk_i2c_readw(i2c, OFFSET_DEBUGCTRL)));
+
+	if (i2c->dev_comp->regs == mt_i2c_regs_v2) {
+		dev_err(i2c->dev, "OFFSET_LTIMING[0x%x]: 0x%x\n",
+			OFFSET_LTIMING,
+			mtk_i2c_readw(i2c, OFFSET_LTIMING));
+		dev_err(i2c->dev, "MULTI_DMA[0x%x]: 0x%x\n",
+			OFFSET_MULTI_DMA,
+			(mtk_i2c_readw(i2c, OFFSET_MULTI_DMA)));
+	}
+
+	dev_err(i2c->dev, "OFFSET_INT_FLAG = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_INT_FLAG));
+	dev_err(i2c->dev, "OFFSET_INT_EN = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_INT_EN));
+	dev_err(i2c->dev, "OFFSET_EN = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_EN));
+	dev_err(i2c->dev, "OFFSET_RST = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_RST));
+	dev_err(i2c->dev, "OFFSET_CON = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_CON));
+	dev_err(i2c->dev, "OFFSET_TX_MEM_ADDR = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_MEM_ADDR));
+	dev_err(i2c->dev, "OFFSET_RX_MEM_ADDR = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_RX_MEM_ADDR));
+	dev_err(i2c->dev, "OFFSET_TX_LEN = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_LEN));
+	dev_err(i2c->dev, "OFFSET_RX_LEN = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_RX_LEN));
+	dev_err(i2c->dev, "OFFSET_TX_4G_MODE = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_4G_MODE));
+	dev_err(i2c->dev, "OFFSET_RX_4G_MODE = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
+}
+
 static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			       int num, int left_num)
 {
@@ -1034,7 +1126,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	}
 
 	if (ret == 0) {
-		dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
+		dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
+		i2c_dump_register(i2c);
 		mtk_i2c_init_hw(i2c);
 		return -ETIMEDOUT;
 	}
-- 
1.9.1

