Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C021E392D7F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 14:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbhE0MFt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 08:05:49 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51625 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234473AbhE0MFt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 May 2021 08:05:49 -0400
X-UUID: 74dbc9213a9a4fc5b3d241da7d927960-20210527
X-UUID: 74dbc9213a9a4fc5b3d241da7d927960-20210527
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2069908993; Thu, 27 May 2021 20:04:11 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 20:04:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 May 2021 20:04:07 +0800
From:   <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH] i2c: mediatek: Disable i2c start_en and clear intr_stat brfore reset
Date:   Thu, 27 May 2021 20:04:04 +0800
Message-ID: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Qii Wang <qii.wang@mediatek.com>

The i2c controller driver do dma reset after transfer timeout,
but sometimes dma reset will trigger an unexpected DMA_ERR irq.
It will cause the i2c controller to continuously send interrupts
to the system and cause soft lock-up. So we need to disable i2c
start_en and clear intr_stat to stop i2c controller before dma
reset when transfer timeout.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index ea337ba..bfd80b2 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -479,6 +479,11 @@ static void mtk_i2c_clock_disable(struct mtk_i2c *i2c)
 static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
+	u16 intr_stat_reg;
+
+	mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG, OFFSET_START);
+	intr_stat_reg = mtk_i2c_readw(i2c, OFFSET_INTR_STAT);
+	mtk_i2c_writew(i2c, intr_stat_reg, OFFSET_INTR_STAT);
 
 	if (i2c->dev_comp->apdma_sync) {
 		writel(I2C_DMA_WARM_RST, i2c->pdmabase + OFFSET_RST);
-- 
1.9.1

