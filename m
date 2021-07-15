Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695033C95EE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 04:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbhGOCdL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 22:33:11 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54052 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232670AbhGOCdJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jul 2021 22:33:09 -0400
X-UUID: 6a27cb5ea7ce49e98856c96fbac6da7a-20210715
X-UUID: 6a27cb5ea7ce49e98856c96fbac6da7a-20210715
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1946866214; Thu, 15 Jul 2021 10:30:13 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:30:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 10:30:10 +0800
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
Subject: [PATCH 3/8] i2c: mediatek: fixing the incorrect register offset
Date:   Thu, 15 Jul 2021 10:29:12 +0800
Message-ID: <1626316157-24935-4-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The reason for the modification here is that the previous
offset information is incorrect, OFFSET_DEBUGSTAT = 0xE4 is
the correct value.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 64acd96..e65a41e 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -195,7 +195,7 @@ enum I2C_REGS_OFFSET {
 	[OFFSET_SOFTRESET] = 0x50,
 	[OFFSET_MULTI_DMA] = 0x84,
 	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
-	[OFFSET_DEBUGSTAT] = 0xe0,
+	[OFFSET_DEBUGSTAT] = 0xe4,
 	[OFFSET_DEBUGCTRL] = 0xe8,
 	[OFFSET_FIFO_STAT] = 0xf4,
 	[OFFSET_FIFO_THRESH] = 0xf8,
-- 
1.9.1

