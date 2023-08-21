Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285787821CE
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 05:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbjHUD3q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Aug 2023 23:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbjHUD3q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Aug 2023 23:29:46 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3907A2
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 20:29:43 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RTdGk0pQRzrS1Y;
        Mon, 21 Aug 2023 11:28:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:29:40 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux@armlinux.org.uk>,
        <linus.walleij@linaro.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v3] I2C: Make return value check more accurate and explicit for devm_pinctrl_get()
Date:   Mon, 21 Aug 2023 11:29:14 +0800
Message-ID: <20230821032914.1976317-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
recovery can't work, because we can't switch the I2C pins between the
I2C controller and GPIO. So, it is quite correct to print
"can't get pinctrl, bus recovery not supported" because the I2C bus
can't be recovered without pinctrl.

The PTR_ERR() is also fine - because if pinctrl is not present and
returns NULL, we'll end up returning zero, which is exactly what we
want.

However, open code that with a more accurate message will be more explicit
for NULL case when CONFIG_PINCTRL is not defined.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
---
v3:
- Split into two if() statements instead of removing the NULL checks.
- Remove the fix tags.
- Update the commit title and message.
- Update to bring the author's name before.
v2:
- Remove NULL check instead of using IS_ERR_OR_NULL() to avoid leaving them behind.
- Update the commit title and message.
---
 drivers/i2c/busses/i2c-at91-master.c | 6 +++++-
 drivers/i2c/busses/i2c-imx.c         | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 94cff1cd527e..d311981d3e60 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -831,7 +831,11 @@ static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
 	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
 
 	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
+	if (!rinfo->pinctrl) {
+		dev_info(dev->dev, "pinctrl unavailable, bus recovery not supported\n");
+		return 0;
+	}
+	if (IS_ERR(rinfo->pinctrl)) {
 		dev_info(dev->dev, "can't get pinctrl, bus recovery not supported\n");
 		return PTR_ERR(rinfo->pinctrl);
 	}
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 10e89586ca72..1775a79aeba2 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1388,7 +1388,11 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
 
 	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
+	if (!i2c_imx->pinctrl) {
+		dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
+		return 0;
+	}
+	if (IS_ERR(i2c_imx->pinctrl)) {
 		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
 		return PTR_ERR(i2c_imx->pinctrl);
 	}
-- 
2.34.1

