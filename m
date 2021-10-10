Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19FC2427F8B
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Oct 2021 09:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhJJHHa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 Oct 2021 03:07:30 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55630 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230438AbhJJHHU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 Oct 2021 03:07:20 -0400
X-UUID: e84f32ca3ac54996af943db42e0e07bd-20211010
X-UUID: e84f32ca3ac54996af943db42e0e07bd-20211010
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1285986382; Sun, 10 Oct 2021 15:05:21 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sun, 10 Oct 2021 15:05:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 10 Oct 2021 15:05:18 +0800
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
Subject: [PATCH v8 4/5] i2c: mediatek: Isolate speed setting via dts for special devices
Date:   Sun, 10 Oct 2021 15:05:15 +0800
Message-ID: <20211010070516.26763-5-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010070516.26763-1-kewei.xu@mediatek.com>
References: <20211010070516.26763-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
support"), the I2C timing calculation has been revised to support
ac-timing adjustment, however that will break on some I2C components.
As a result we want to introduce a new setting "default-adjust-timing"
so those components can choose to use the old (default) timing algorithm.

Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Reviewed-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 77 +++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a1a2af066704..3db4ed3f9050 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -65,6 +65,7 @@
 #define I2C_DMA_HARD_RST		0x0002
 #define I2C_DMA_HANDSHAKE_RST		0x0004
 
+#define I2C_DEFAULT_CLK_DIV		5
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
 #define MAX_CLOCK_DIV			256
@@ -249,6 +250,7 @@ struct mtk_i2c {
 	struct clk *clk_arb;		/* Arbitrator clock for i2c */
 	bool have_pmic;			/* can use i2c pins from PMIC */
 	bool use_push_pull;		/* IO config push-pull mode */
+	bool use_default_timing;	/* no timing adjust mode */
 
 	u16 irq_stat;			/* interrupt status */
 	unsigned int clk_src_div;
@@ -531,7 +533,11 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 	else
 		ext_conf_val = I2C_FS_START_CON;
 
-	if (i2c->dev_comp->timing_adjust) {
+	if (i2c->use_default_timing) {
+		if (i2c->dev_comp->timing_adjust)
+			mtk_i2c_writew(i2c, I2C_DEFAULT_CLK_DIV - 1,
+				       OFFSET_CLOCK_DIV);
+	} else if (i2c->dev_comp->timing_adjust) {
 		ext_conf_val = i2c->ac_timing.ext;
 		mtk_i2c_writew(i2c, i2c->ac_timing.inter_clk_div,
 			       OFFSET_CLOCK_DIV);
@@ -614,7 +620,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	unsigned int sample_ns = div_u64(1000000000ULL * (sample_cnt + 1),
 					 clk_src);
 
-	if (!i2c->dev_comp->timing_adjust)
+	if (i2c->use_default_timing || !i2c->dev_comp->timing_adjust)
 		return 0;
 
 	if (i2c->dev_comp->ltiming_adjust)
@@ -774,7 +780,65 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	return 0;
 }
 
-static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
+static int mtk_i2c_set_speed_default_timing(struct mtk_i2c *i2c,
+					    unsigned int parent_clk)
+{
+	unsigned int clk_src;
+	unsigned int step_cnt;
+	unsigned int sample_cnt;
+	unsigned int l_step_cnt;
+	unsigned int l_sample_cnt;
+	unsigned int target_speed;
+	int ret;
+
+	if (i2c->dev_comp->timing_adjust)
+		i2c->clk_src_div *= I2C_DEFAULT_CLK_DIV;
+
+	clk_src = parent_clk / i2c->clk_src_div;
+	target_speed = i2c->speed_hz;
+
+	if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
+		/* Set master code speed register */
+		ret = mtk_i2c_calculate_speed(i2c, clk_src,
+					      I2C_MAX_FAST_MODE_FREQ,
+					      &l_step_cnt, &l_sample_cnt);
+		if (ret < 0)
+			return ret;
+
+		i2c->timing_reg = (l_sample_cnt << 8) | l_step_cnt;
+
+		/* Set the high speed mode register */
+		ret = mtk_i2c_calculate_speed(i2c, clk_src, target_speed,
+					      &step_cnt, &sample_cnt);
+		if (ret < 0)
+			return ret;
+
+		i2c->high_speed_reg = I2C_TIME_DEFAULT_VALUE |
+			(sample_cnt << 12) | (step_cnt << 8);
+
+		if (i2c->dev_comp->ltiming_adjust)
+			i2c->ltiming_reg = (l_sample_cnt << 6) | l_step_cnt |
+					   (sample_cnt << 12) | (step_cnt << 9);
+	} else {
+		ret = mtk_i2c_calculate_speed(i2c, clk_src, target_speed,
+					      &step_cnt, &sample_cnt);
+		if (ret < 0)
+			return ret;
+
+		i2c->timing_reg = (sample_cnt << 8) | step_cnt;
+
+		/* Disable the high speed transaction */
+		i2c->high_speed_reg = I2C_TIME_CLR_VALUE;
+
+		if (i2c->dev_comp->ltiming_adjust)
+			i2c->ltiming_reg = (sample_cnt << 6) | step_cnt;
+	}
+
+	return 0;
+}
+
+static int mtk_i2c_set_speed_adjust_timing(struct mtk_i2c *i2c,
+					   unsigned int parent_clk)
 {
 	unsigned int clk_src;
 	unsigned int step_cnt;
@@ -1271,6 +1335,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
 	i2c->use_push_pull =
 		of_property_read_bool(np, "mediatek,use-push-pull");
+	i2c->use_default_timing =
+		of_property_read_bool(np, "mediatek,use-default-timing");
 
 	i2c_parse_fw_timings(i2c->dev, &i2c->timing_info, true);
 
@@ -1357,7 +1423,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	strlcpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
 
-	ret = mtk_i2c_set_speed(i2c, clk_get_rate(clk));
+	if (i2c->use_default_timing)
+		ret = mtk_i2c_set_speed_default_timing(i2c, clk_get_rate(clk));
+	else
+		ret = mtk_i2c_set_speed_adjust_timing(i2c, clk_get_rate(clk));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set the speed.\n");
 		return -EINVAL;
-- 
2.25.1

