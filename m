Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECEE362E21
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 08:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhDQGrm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 02:47:42 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:57907 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229629AbhDQGrl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Apr 2021 02:47:41 -0400
X-UUID: 0fce159f55274c4a9aa26a64f79cc043-20210417
X-UUID: 0fce159f55274c4a9aa26a64f79cc043-20210417
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 378527476; Sat, 17 Apr 2021 14:47:12 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 14:47:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Apr 2021 14:47:10 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH 3/3] i2c: mediatek: Use scl_int_delay_ns to compensate clock-stretching
Date:   Sat, 17 Apr 2021 14:46:52 +0800
Message-ID: <1618642012-10444-4-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The parameters of tSU,STA/tHD,STA/tSU,STOP maybe out of spec due
to device clock-stretch or circuit loss, we could get a suitable
scl_int_delay_ns from i2c_timings to compensate these parameters
to meet the spec via EXT_CONF register.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index bf25acb..5ddfa4e 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -231,6 +231,7 @@ struct mtk_i2c {
 	struct i2c_adapter adap;	/* i2c host adapter */
 	struct device *dev;
 	struct completion msg_complete;
+	struct i2c_timings timing_info;
 
 	/* set in i2c probe */
 	void __iomem *base;		/* i2c base addr */
@@ -607,7 +608,8 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	else
 		clk_ns = sample_ns / 2;
 
-	su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
+	su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns +
+				  i2c->timing_info.scl_int_delay_ns, clk_ns);
 	if (su_sta_cnt > max_sta_cnt)
 		return -1;
 
@@ -1176,6 +1178,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	i2c->use_push_pull =
 		of_property_read_bool(np, "mediatek,use-push-pull");
 
+	i2c_parse_fw_timings(i2c->dev, &i2c->timing_info, true);
+
 	return 0;
 }
 
-- 
1.9.1

