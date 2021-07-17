Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F093CC287
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Jul 2021 12:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbhGQKVS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Jul 2021 06:21:18 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:35822 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233284AbhGQKVH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Jul 2021 06:21:07 -0400
X-UUID: 3bdf12ecf04e41c6bd94830fcb9adc9b-20210717
X-UUID: 3bdf12ecf04e41c6bd94830fcb9adc9b-20210717
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 810267710; Sat, 17 Jul 2021 18:18:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 18:18:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 18:18:04 +0800
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
Subject: [PATCH v4 3/8] i2c: mediatek: Reset the handshake signal between i2c and dma
Date:   Sat, 17 Jul 2021 18:17:54 +0800
Message-ID: <1626517079-9057-4-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
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
index 222ff765e55d..c0108387f34b 100644
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
@@ -850,6 +853,17 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
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
2.18.0

