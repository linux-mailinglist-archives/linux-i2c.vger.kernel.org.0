Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C47440F5A4
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Sep 2021 12:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242191AbhIQKPs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Sep 2021 06:15:48 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41268 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S242144AbhIQKPr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Sep 2021 06:15:47 -0400
X-UUID: f5456bd642c84c0384c826968407f130-20210917
X-UUID: f5456bd642c84c0384c826968407f130-20210917
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1477444208; Fri, 17 Sep 2021 18:14:21 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 18:14:19 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 18:14:19 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
        <yuhan.wei@mediatek.com>, <kewei.xu@mediatek.com>
Subject: [PATCH v7 2/7] i2c: mediatek: Reset the handshake signal between i2c and dma
Date:   Fri, 17 Sep 2021 18:14:11 +0800
Message-ID: <20210917101416.20760-3-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917101416.20760-1-kewei.xu@mediatek.com>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Due to changes in the hardware design of the handshaking signal
between i2c and dma, it is necessary to reset the handshaking
signal before each transfer to ensure that the multi-msgs can
be transferred correctly.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Reviewed-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 32518081b5a4..08ce8a417bed 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -47,6 +48,9 @@
 #define I2C_RD_TRANAC_VALUE		0x0001
 #define I2C_SCL_MIS_COMP_VALUE		0x0000
 #define I2C_CHN_CLR_FLAG		0x0000
+#define I2C_CLR_DEBUGCTR		0x0000
+#define I2C_RELIABILITY			0x0010
+#define I2C_DMAACK_ENABLE		0x0008
 
 #define I2C_DMA_CON_TX			0x0000
 #define I2C_DMA_CON_RX			0x0001
@@ -842,6 +846,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	u16 restart_flag = 0;
 	u16 dma_sync = 0;
 	u32 reg_4g_mode;
+	u32 reg_dma_reset;
 	u8 *dma_rd_buf = NULL;
 	u8 *dma_wr_buf = NULL;
 	dma_addr_t rpaddr = 0;
@@ -855,6 +860,27 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 	reinit_completion(&i2c->msg_complete);
 
+	if (i2c->dev_comp->apdma_sync && i2c->op != I2C_MASTER_WRRD && num > 1) {
+		mtk_i2c_writew(i2c, I2C_CLR_DEBUGCTR, OFFSET_DEBUGCTRL);
+		writel(I2C_DMA_HANDSHAKE_RST | I2C_DMA_WARM_RST,
+		       i2c->pdmabase + OFFSET_RST);
+
+		ret = readw_poll_timeout(i2c->pdmabase + OFFSET_RST,
+					 reg_dma_reset,
+					 !(reg_dma_reset & I2C_DMA_WARM_RST),
+					 0, 100);
+		if (ret) {
+			dev_err(i2c->dev, "DMA warm reset timeout\n");
+			return -ETIMEDOUT;
+		}
+
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
2.25.1

