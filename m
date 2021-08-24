Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB1E3F56B7
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Aug 2021 05:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbhHXDb1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 23:31:27 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:56260 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234249AbhHXDbZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Aug 2021 23:31:25 -0400
X-UUID: 5bdbe7efc79c4316a554f5c047b42b06-20210824
X-UUID: 5bdbe7efc79c4316a554f5c047b42b06-20210824
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 619583467; Tue, 24 Aug 2021 11:30:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 11:30:37 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 11:30:36 +0800
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
Subject: [RESEND PATCH v5 5/7] i2c: mediatek: Add OFFSET_EXT_CONF setting back
Date:   Tue, 24 Aug 2021 11:30:26 +0800
Message-ID: <1629775828-19993-6-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
References: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
support"), we miss setting OFFSET_EXT_CONF register if
i2c->dev_comp->timing_adjust is false, now add it back.

Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 633bce4..4da6b43 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -42,6 +42,8 @@
 #define I2C_HANDSHAKE_RST		0x0020
 #define I2C_FIFO_ADDR_CLR		0x0001
 #define I2C_DELAY_LEN			0x0002
+#define I2C_ST_START_CON		0x8001
+#define I2C_FS_START_CON		0x1800
 #define I2C_TIME_CLR_VALUE		0x0000
 #define I2C_TIME_DEFAULT_VALUE		0x0003
 #define I2C_WRRD_TRANAC_VALUE		0x0002
@@ -486,6 +488,7 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
 	u16 intr_stat_reg;
+	u16 ext_conf_val;
 
 	mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG, OFFSET_START);
 	intr_stat_reg = mtk_i2c_readw(i2c, OFFSET_INTR_STAT);
@@ -524,8 +527,13 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 	if (i2c->dev_comp->ltiming_adjust)
 		mtk_i2c_writew(i2c, i2c->ltiming_reg, OFFSET_LTIMING);
 
+	if (i2c->speed_hz <= I2C_MAX_STANDARD_MODE_FREQ)
+		ext_conf_val = I2C_ST_START_CON;
+	else
+		ext_conf_val = I2C_FS_START_CON;
+
 	if (i2c->dev_comp->timing_adjust) {
-		mtk_i2c_writew(i2c, i2c->ac_timing.ext, OFFSET_EXT_CONF);
+		ext_conf_val = i2c->ac_timing.ext;
 		mtk_i2c_writew(i2c, i2c->ac_timing.inter_clk_div,
 			       OFFSET_CLOCK_DIV);
 		mtk_i2c_writew(i2c, I2C_SCL_MIS_COMP_VALUE,
@@ -550,6 +558,7 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 				       OFFSET_HS_STA_STO_AC_TIMING);
 		}
 	}
+	mtk_i2c_writew(i2c, ext_conf_val, OFFSET_EXT_CONF);
 
 	/* If use i2c pin from PMIC mt6397 side, need set PATH_DIR first */
 	if (i2c->have_pmic)
-- 
1.9.1

