Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717C43F56BB
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Aug 2021 05:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbhHXDb3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 23:31:29 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:37570 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232937AbhHXDb1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Aug 2021 23:31:27 -0400
X-UUID: e13adde845df445da4c0281484c3e099-20210824
X-UUID: e13adde845df445da4c0281484c3e099-20210824
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 708686720; Tue, 24 Aug 2021 11:30:40 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 11:30:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 11:30:38 +0800
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
Subject: [RESEND PATCH v5 7/7] i2c: mediatek: modify bus speed calculation formula
Date:   Tue, 24 Aug 2021 11:30:28 +0800
Message-ID: <1629775828-19993-8-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
References: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When clock-div is 0 or greater than 1, the bus speed
calculated by the old speed calculation formula will be
larger than the target speed. So we update the formula.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 18b5659..0b42acd8 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -69,11 +69,12 @@
 #define I2C_DEFAULT_CLK_DIV		5
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
-#define MAX_CLOCK_DIV			256
+#define MAX_CLOCK_DIV_8BITS		256
+#define MAX_CLOCK_DIV_5BITS		32
 #define MAX_HS_STEP_CNT_DIV		8
-#define I2C_STANDARD_MODE_BUFFER	(1000 / 2)
-#define I2C_FAST_MODE_BUFFER		(300 / 2)
-#define I2C_FAST_MODE_PLUS_BUFFER	(20 / 2)
+#define I2C_STANDARD_MODE_BUFFER	(1000 / 3)
+#define I2C_FAST_MODE_BUFFER		(300 / 3)
+#define I2C_FAST_MODE_PLUS_BUFFER	(20 / 3)
 
 #define I2C_CONTROL_RS                  (0x1 << 1)
 #define I2C_CONTROL_DMA_EN              (0x1 << 2)
@@ -725,14 +726,26 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	unsigned int best_mul;
 	unsigned int cnt_mul;
 	int ret = -EINVAL;
+	int clock_div_constraint = 0;
 
 	if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
 		target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;
 
+	if (i2c->use_default_timing) {
+		clock_div_constraint = 0;
+	} else if (i2c->dev_comp->ltiming_adjust &&
+		   i2c->ac_timing.inter_clk_div > 1) {
+		clock_div_constraint = 1;
+	} else if (i2c->dev_comp->ltiming_adjust &&
+		   i2c->ac_timing.inter_clk_div == 0) {
+		clock_div_constraint = -1;
+	}
+
 	max_step_cnt = mtk_i2c_max_step_cnt(target_speed);
 	base_step_cnt = max_step_cnt;
 	/* Find the best combination */
-	opt_div = DIV_ROUND_UP(clk_src >> 1, target_speed);
+	opt_div = DIV_ROUND_UP(clk_src >> 1, target_speed) +
+		  clock_div_constraint;
 	best_mul = MAX_SAMPLE_CNT_DIV * max_step_cnt;
 
 	/* Search for the best pair (sample_cnt, step_cnt) with
@@ -767,7 +780,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	sample_cnt = base_sample_cnt;
 	step_cnt = base_step_cnt;
 
-	if ((clk_src / (2 * sample_cnt * step_cnt)) > target_speed) {
+	if ((clk_src / (2 * (sample_cnt * step_cnt - clock_div_constraint))) >
+		 target_speed) {
 		/* In this case, hardware can't support such
 		 * low i2c_bus_freq
 		 */
@@ -854,13 +868,16 @@ static int mtk_i2c_set_speed_adjust_timing(struct mtk_i2c *i2c,
 	target_speed = i2c->speed_hz;
 	parent_clk /= i2c->clk_src_div;
 
-	if (i2c->dev_comp->timing_adjust)
-		max_clk_div = MAX_CLOCK_DIV;
+	if (i2c->dev_comp->timing_adjust && i2c->dev_comp->ltiming_adjust)
+		max_clk_div = MAX_CLOCK_DIV_5BITS;
+	else if (i2c->dev_comp->timing_adjust)
+		max_clk_div = MAX_CLOCK_DIV_8BITS;
 	else
 		max_clk_div = 1;
 
 	for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
 		clk_src = parent_clk / clk_div;
+		i2c->ac_timing.inter_clk_div = clk_div - 1;
 
 		if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 			/* Set master code speed register */
@@ -907,8 +924,6 @@ static int mtk_i2c_set_speed_adjust_timing(struct mtk_i2c *i2c,
 		break;
 	}
 
-	i2c->ac_timing.inter_clk_div = clk_div - 1;
-
 	return 0;
 }
 
-- 
1.9.1

