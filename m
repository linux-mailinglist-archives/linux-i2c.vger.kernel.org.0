Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09479339CBD
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Mar 2021 09:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhCMIE5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Mar 2021 03:04:57 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:56350 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229968AbhCMIEf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Mar 2021 03:04:35 -0500
X-UUID: c35dee2e5f0140da925f17cf18b31b08-20210313
X-UUID: c35dee2e5f0140da925f17cf18b31b08-20210313
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1916932198; Sat, 13 Mar 2021 16:04:30 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 16:04:28 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Mar 2021 16:04:28 +0800
From:   <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
Date:   Sat, 13 Mar 2021 16:04:24 +0800
Message-ID: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
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

