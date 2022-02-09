Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864324AEEC0
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 10:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236038AbiBIJ4Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 04:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235348AbiBIJ4O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 04:56:14 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED508DF28ACF;
        Wed,  9 Feb 2022 01:56:08 -0800 (PST)
X-UUID: f47de4b025de4216ae53e6b7a645d804-20220209
X-UUID: f47de4b025de4216ae53e6b7a645d804-20220209
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1907449128; Wed, 09 Feb 2022 17:54:14 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Feb 2022 17:54:13 +0800
Received: from localhost.localdomain (10.17.3.14) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Feb 2022 17:54:12 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
        <yuhan.wei@mediatek.com>, <kewei.xu@mediatek.com>,
        <ryan-jh.yu@mediatek.com>, <david-yh.chiu@mediatek.com>
Subject: [PATCH v9 1/1] i2c: mediatek: modify bus speed calculation formula
Date:   Wed, 9 Feb 2022 17:54:07 +0800
Message-ID: <1644400447-6215-2-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1644400447-6215-1-git-send-email-kewei.xu@mediatek.com>
References: <1644400447-6215-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When clock-div is 0 or greater than 1, the bus speed
calculated by the old speed calculation formula will be
larger than the target speed. So we update the formula.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Change-Id: Ic0d9b8ab036bcf215d3a5066f2b91c7b8b128ba6
---
 drivers/i2c/busses/i2c-mt65xx.c | 51 +++++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index aa4d218..682293e 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -67,11 +67,12 @@
 
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
@@ -604,6 +605,31 @@ static int mtk_i2c_max_step_cnt(unsigned int target_speed)
 		return MAX_STEP_CNT_DIV;
 }
 
+static int mtk_i2c_get_clk_div_restri(struct mtk_i2c *i2c,
+				      unsigned int sample_cnt)
+{
+	int clk_div_restri = 0;
+
+	if (i2c->dev_comp->ltiming_adjust == 0)
+		return 0;
+
+	if (sample_cnt == 1) {
+		if (i2c->ac_timing.inter_clk_div == 0)
+			clk_div_restri = 0;
+		else
+			clk_div_restri = 1;
+	} else {
+		if (i2c->ac_timing.inter_clk_div == 0)
+			clk_div_restri = -1;
+		else if (i2c->ac_timing.inter_clk_div == 1)
+			clk_div_restri = 0;
+		else
+			clk_div_restri = 1;
+	}
+
+	return clk_div_restri;
+}
+
 /*
  * Check and Calculate i2c ac-timing
  *
@@ -732,6 +758,7 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	unsigned int best_mul;
 	unsigned int cnt_mul;
 	int ret = -EINVAL;
+	int clk_div_restri = 0;
 
 	if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
 		target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;
@@ -749,7 +776,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	 * optimizing for sample_cnt * step_cnt being minimal
 	 */
 	for (sample_cnt = 1; sample_cnt <= MAX_SAMPLE_CNT_DIV; sample_cnt++) {
-		step_cnt = DIV_ROUND_UP(opt_div, sample_cnt);
+		clk_div_restri = mtk_i2c_get_clk_div_restri(i2c, sample_cnt);
+		step_cnt = DIV_ROUND_UP(opt_div + clk_div_restri, sample_cnt);
 		cnt_mul = step_cnt * sample_cnt;
 		if (step_cnt > max_step_cnt)
 			continue;
@@ -763,7 +791,7 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 			best_mul = cnt_mul;
 			base_sample_cnt = sample_cnt;
 			base_step_cnt = step_cnt;
-			if (best_mul == opt_div)
+			if (best_mul == (opt_div + clk_div_restri))
 				break;
 		}
 	}
@@ -774,7 +802,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	sample_cnt = base_sample_cnt;
 	step_cnt = base_step_cnt;
 
-	if ((clk_src / (2 * sample_cnt * step_cnt)) > target_speed) {
+	if ((clk_src / (2 * (sample_cnt * step_cnt - clk_div_restri))) >
+		target_speed) {
 		/* In this case, hardware can't support such
 		 * low i2c_bus_freq
 		 */
@@ -803,13 +832,16 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
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
@@ -856,7 +888,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 		break;
 	}
 
-	i2c->ac_timing.inter_clk_div = clk_div - 1;
 
 	return 0;
 }
-- 
1.9.1

