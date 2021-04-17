Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9BE362E1E
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 08:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhDQGrj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 02:47:39 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36091 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229870AbhDQGrj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Apr 2021 02:47:39 -0400
X-UUID: c7268d6c56eb44369a79ff3fe396c159-20210417
X-UUID: c7268d6c56eb44369a79ff3fe396c159-20210417
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 783124928; Sat, 17 Apr 2021 14:47:10 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 14:47:09 +0800
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
Subject: [PATCH 1/3] i2c: mediatek: Fix send master code at more than 1MHz
Date:   Sat, 17 Apr 2021 14:46:50 +0800
Message-ID: <1618642012-10444-2-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are some omissions in the previous patch about replacing
I2C_MAX_FAST_MODE__FREQ with I2C_MAX_FAST_MODE_PLUS_FREQ and
need to fix it.

Fixes: b44658e755b5("i2c: mediatek: Send i2c master code at more than 1MHz")
Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2ffd2f3..3e34261 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -564,7 +564,7 @@ static const struct i2c_spec_values *mtk_i2c_get_spec(unsigned int speed)
 
 static int mtk_i2c_max_step_cnt(unsigned int target_speed)
 {
-	if (target_speed > I2C_MAX_FAST_MODE_FREQ)
+	if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		return MAX_HS_STEP_CNT_DIV;
 	else
 		return MAX_STEP_CNT_DIV;
@@ -635,7 +635,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	if (sda_min > sda_max)
 		return -3;
 
-	if (check_speed > I2C_MAX_FAST_MODE_FREQ) {
+	if (check_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		if (i2c->dev_comp->ltiming_adjust) {
 			i2c->ac_timing.hs = I2C_TIME_DEFAULT_VALUE |
 				(sample_cnt << 12) | (high_cnt << 8);
@@ -850,7 +850,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 	control_reg = mtk_i2c_readw(i2c, OFFSET_CONTROL) &
 			~(I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS);
-	if ((i2c->speed_hz > I2C_MAX_FAST_MODE_FREQ) || (left_num >= 1))
+	if ((i2c->speed_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) || (left_num >= 1))
 		control_reg |= I2C_CONTROL_RS;
 
 	if (i2c->op == I2C_MASTER_WRRD)
@@ -1067,7 +1067,8 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 		}
 	}
 
-	if (i2c->auto_restart && num >= 2 && i2c->speed_hz > I2C_MAX_FAST_MODE_FREQ)
+	if (i2c->auto_restart && num >= 2 &&
+		i2c->speed_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		/* ignore the first restart irq after the master code,
 		 * otherwise the first transfer will be discarded.
 		 */
-- 
1.9.1

