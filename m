Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A98930D7AB
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Feb 2021 11:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbhBCKgY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Feb 2021 05:36:24 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:49796 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233825AbhBCKgQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Feb 2021 05:36:16 -0500
X-UUID: 5a4cfd566a3b4d3fab00057c9881199f-20210203
X-UUID: 5a4cfd566a3b4d3fab00057c9881199f-20210203
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 615688265; Wed, 03 Feb 2021 18:35:30 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 18:35:28 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 18:35:28 +0800
From:   <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH] i2c: mediatek: Get device clock-stretch time via dts
Date:   Wed, 3 Feb 2021 18:35:25 +0800
Message-ID: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Qii Wang <qii.wang@mediatek.com>

tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
clock-stretching or circuit loss, we could get device
clock-stretch time from dts to adjust these parameters
to meet the spec via EXT_CONF register.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2ffd2f3..47c7255 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -245,6 +245,7 @@ struct mtk_i2c {
 	u16 irq_stat;			/* interrupt status */
 	unsigned int clk_src_div;
 	unsigned int speed_hz;		/* The speed in transfer */
+	unsigned int clock_stretch_ns;
 	enum mtk_trans_op op;
 	u16 timing_reg;
 	u16 high_speed_reg;
@@ -607,7 +608,8 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	else
 		clk_ns = sample_ns / 2;
 
-	su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
+	su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns + i2c->clock_stretch_ns,
+				  clk_ns);
 	if (su_sta_cnt > max_sta_cnt)
 		return -1;
 
@@ -1171,6 +1173,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	if (i2c->clk_src_div == 0)
 		return -EINVAL;
 
+	of_property_read_u32(np, "clock-stretch-ns", &i2c->clock_stretch_ns);
+
 	i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
 	i2c->use_push_pull =
 		of_property_read_bool(np, "mediatek,use-push-pull");
-- 
1.9.1

