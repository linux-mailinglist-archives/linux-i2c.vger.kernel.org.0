Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4C02E26D7
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Dec 2020 13:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgLXM1E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Dec 2020 07:27:04 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:60167 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726746AbgLXM1E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Dec 2020 07:27:04 -0500
X-UUID: cd4c9f1888c4451b88cd7fff41c16f91-20201224
X-UUID: cd4c9f1888c4451b88cd7fff41c16f91-20201224
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1540264706; Thu, 24 Dec 2020 20:26:16 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 20:26:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 20:26:13 +0800
From:   <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: i2c: mediatek: Fix apdma and i2c hand-shake timeout
Date:   Thu, 24 Dec 2020 20:26:07 +0800
Message-ID: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Qii Wang <qii.wang@mediatek.com>

With the apdma remove hand-shake signal, it requirs special
operation timing to reset i2c manually, otherwise the interrupt
will not be triggered, i2c transmission will be timeout.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

base Message ID: 1605701861-30800-1-git-send-email-qii.wang@mediatek.com

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 6f61595..2ffd2f3 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -38,6 +38,7 @@
 #define I2C_IO_CONFIG_OPEN_DRAIN	0x0003
 #define I2C_IO_CONFIG_PUSH_PULL		0x0000
 #define I2C_SOFT_RST			0x0001
+#define I2C_HANDSHAKE_RST		0x0020
 #define I2C_FIFO_ADDR_CLR		0x0001
 #define I2C_DELAY_LEN			0x0002
 #define I2C_TIME_CLR_VALUE		0x0000
@@ -45,6 +46,7 @@
 #define I2C_WRRD_TRANAC_VALUE		0x0002
 #define I2C_RD_TRANAC_VALUE		0x0001
 #define I2C_SCL_MIS_COMP_VALUE		0x0000
+#define I2C_CHN_CLR_FLAG		0x0000
 
 #define I2C_DMA_CON_TX			0x0000
 #define I2C_DMA_CON_RX			0x0001
@@ -54,7 +56,9 @@
 #define I2C_DMA_START_EN		0x0001
 #define I2C_DMA_INT_FLAG_NONE		0x0000
 #define I2C_DMA_CLR_FLAG		0x0000
+#define I2C_DMA_WARM_RST		0x0001
 #define I2C_DMA_HARD_RST		0x0002
+#define I2C_DMA_HANDSHAKE_RST		0x0004
 
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
@@ -475,11 +479,24 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
 
-	writel(I2C_DMA_HARD_RST, i2c->pdmabase + OFFSET_RST);
-	udelay(50);
-	writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
-
-	mtk_i2c_writew(i2c, I2C_SOFT_RST, OFFSET_SOFTRESET);
+	if (i2c->dev_comp->dma_sync) {
+		writel(I2C_DMA_WARM_RST, i2c->pdmabase + OFFSET_RST);
+		udelay(10);
+		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+		udelay(10);
+		writel(I2C_DMA_HANDSHAKE_RST | I2C_DMA_HARD_RST,
+		       i2c->pdmabase + OFFSET_RST);
+		mtk_i2c_writew(i2c, I2C_HANDSHAKE_RST | I2C_SOFT_RST,
+			       OFFSET_SOFTRESET);
+		udelay(10);
+		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+		mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG, OFFSET_SOFTRESET);
+	} else {
+		writel(I2C_DMA_HARD_RST, i2c->pdmabase + OFFSET_RST);
+		udelay(50);
+		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+		mtk_i2c_writew(i2c, I2C_SOFT_RST, OFFSET_SOFTRESET);
+	}
 
 	/* Set ioconfig */
 	if (i2c->use_push_pull)
-- 
1.9.1

