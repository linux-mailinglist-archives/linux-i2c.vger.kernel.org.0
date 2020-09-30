Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9088827E421
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 10:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbgI3ItY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Sep 2020 04:49:24 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:54326 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725877AbgI3ItY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Sep 2020 04:49:24 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Sep 2020 04:49:23 EDT
Received: from localhost.localdomain (unknown [159.226.5.100])
        by APP-03 (Coremail) with SMTP id rQCowAB3L1z7RHRfZnOjAA--.46271S2;
        Wed, 30 Sep 2020 16:42:36 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     qii.wang@mediatek.com, matthias.bgg@gmail.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mediatek: remove redundant null check
Date:   Wed, 30 Sep 2020 08:42:33 +0000
Message-Id: <20200930084233.53085-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowAB3L1z7RHRfZnOjAA--.46271S2
X-Coremail-Antispam: 1UD129KBjvJXoW7JF4UZF47GFy5Wr1DWF4fGrg_yoW8JrW8pF
        WxGr9Yyr47XFWj9F1DXw4q9ry5ta13GF9agr45Ga4fWr45tr1vvFW5Ka4DZF1IyrWxtw17
        Xr1DKrnrGFyjk3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
        xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
        Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jw2-5UUUUU=
X-Originating-IP: [159.226.5.100]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCAsPA18J9rWkNgAAsI
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Because clk_disable_unprepare already checked NULL clock parameter,
so the additional checks are unnecessary, just remove it

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-mt65xx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 0cbdfbe605b5..48d37de827e1 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -449,8 +449,7 @@ static int mtk_i2c_clock_enable(struct mtk_i2c *i2c)
 	return 0;
 
 err_arb:
-	if (i2c->have_pmic)
-		clk_disable_unprepare(i2c->clk_pmic);
+	clk_disable_unprepare(i2c->clk_pmic);
 err_pmic:
 	clk_disable_unprepare(i2c->clk_main);
 err_main:
@@ -461,11 +460,9 @@ static int mtk_i2c_clock_enable(struct mtk_i2c *i2c)
 
 static void mtk_i2c_clock_disable(struct mtk_i2c *i2c)
 {
-	if (i2c->clk_arb)
-		clk_disable_unprepare(i2c->clk_arb);
+	clk_disable_unprepare(i2c->clk_arb);
 
-	if (i2c->have_pmic)
-		clk_disable_unprepare(i2c->clk_pmic);
+	clk_disable_unprepare(i2c->clk_pmic);
 
 	clk_disable_unprepare(i2c->clk_main);
 	clk_disable_unprepare(i2c->clk_dma);
-- 
2.17.1

