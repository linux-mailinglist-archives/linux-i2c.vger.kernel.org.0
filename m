Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7083C95F1
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 04:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbhGOCdL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 22:33:11 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54070 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232740AbhGOCdK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jul 2021 22:33:10 -0400
X-UUID: 586b3013e21e49649fa3a5f1f7b2f648-20210715
X-UUID: 586b3013e21e49649fa3a5f1f7b2f648-20210715
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2032874960; Thu, 15 Jul 2021 10:30:13 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:30:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 10:30:11 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
        <kewei.xu@mediatek.com>, <ot_daolong.zhu@mediatek.com>
Subject: [PATCH 4/8] i2c: mediatek: Reset the handshake signal between i2c and dma
Date:   Thu, 15 Jul 2021 10:29:13 +0800
Message-ID: <1626316157-24935-5-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Due to changes in the hardware design of the handshaking signal
between i2c and dma, it is necessary to reset the handshaking
signal before each transfer to ensure that the multi-msgs can
be transferred correctly.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e65a41e..ded94f9 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -47,6 +47,9 @@
 #define I2C_RD_TRANAC_VALUE		0x0001
 #define I2C_SCL_MIS_COMP_VALUE		0x0000
 #define I2C_CHN_CLR_FLAG		0x0000
+#define I2C_CLR_DEBUGCTR		0x0000
+#define I2C_RELIABILITY			0x0010
+#define I2C_DMAACK_ENABLE		0x0008
 
 #define I2C_DMA_CON_TX			0x0000
 #define I2C_DMA_CON_RX			0x0001
@@ -942,6 +945,17 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 	reinit_completion(&i2c->msg_complete);
 
+	if (i2c->dev_comp->apdma_sync) {
+		mtk_i2c_writew(i2c, I2C_CLR_DEBUGCTR, OFFSET_DEBUGCTRL);
+		writel(I2C_DMA_HANDSHAKE_RST | I2C_DMA_WARM_RST,
+		       i2c->pdmabase + OFFSET_RST);
+		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+		mtk_i2c_writew(i2c, I2C_HANDSHAKE_RST, OFFSET_SOFTRESET);
+		mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG, OFFSET_SOFTRESET);
+		mtk_i2c_writew(i2c, I2C_RELIABILITY | I2C_DMAACK_ENABLE,
+			       OFFSET_DEBUGCTRL);
+	}
+
 	control_reg = mtk_i2c_readw(i2c, OFFSET_CONTROL) &
 			~(I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS);
 	if ((i2c->speed_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) || (left_num >= 1))
-- 
1.9.1

