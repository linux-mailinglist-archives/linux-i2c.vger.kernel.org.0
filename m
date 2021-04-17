Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB67362E22
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 08:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhDQGrn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 02:47:43 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36112 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230393AbhDQGrm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Apr 2021 02:47:42 -0400
X-UUID: e677ee4519b94d69a324b883dddec74f-20210417
X-UUID: e677ee4519b94d69a324b883dddec74f-20210417
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 556087318; Sat, 17 Apr 2021 14:47:11 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 14:47:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Apr 2021 14:47:09 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH 2/3] i2c: mediatek: Fix wrong dma sync flag
Date:   Sat, 17 Apr 2021 14:46:51 +0800
Message-ID: <1618642012-10444-3-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The right flag is apdma_sync when apdma remove hand-shake signel.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 3e34261..bf25acb 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -479,7 +479,7 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
 
-	if (i2c->dev_comp->dma_sync) {
+	if (i2c->dev_comp->apdma_sync) {
 		writel(I2C_DMA_WARM_RST, i2c->pdmabase + OFFSET_RST);
 		udelay(10);
 		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
-- 
1.9.1

