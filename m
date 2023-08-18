Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291A4780689
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 09:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238356AbjHRHq1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 03:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358278AbjHRHpg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 03:45:36 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8AEF3C0C
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 00:45:32 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RRv3V59bHzFqk9;
        Fri, 18 Aug 2023 15:42:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:45:29 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <o.rempel@pengutronix.de>,
        <linus.walleij@linaro.org>, <nicolas.ferre@microchip.com>,
        <leoyang.li@nxp.com>, <s.hauer@pengutronix.de>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 RESEND] I2C: Fix return value check for devm_pinctrl_get()
Date:   Fri, 18 Aug 2023 15:45:08 +0800
Message-ID: <20230818074509.295220-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Though the devm_pinctrl_get() function returns error pointers when
CONFIG_PINCTRL is defined and NULL otherwise. NULL is returned
on purpose for devm_pinctrl_get(). When PINCTRL is disabled NULL becomes
a valid pinctrl cookie which can be passed to the other stub functions.
With this drivers using pinctrl can get through their probe function
without an error when PINCTRL is disabled.

The same approach is taken by the clk and regulator API. It is correct
to test the return value of devm_pinctrl_get() with IS_ERR(). So update
the checks accordingly.

Fixes: 543aa2c4da8b ("i2c: at91: Move to generic GPIO bus recovery")
Fixes: fd8961c5ba9e ("i2c: imx: make bus recovery through pinctrl optional")
Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
v2:
- Remove NULL check instead of using IS_ERR_OR_NULL() to avoid leaving them behind.
- Update the commit title and message.
---
 drivers/i2c/busses/i2c-at91-master.c | 2 +-
 drivers/i2c/busses/i2c-imx.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 94cff1cd527e..2bf1df5ef473 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -831,7 +831,7 @@ static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
 	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
 
 	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
+	if (IS_ERR(rinfo->pinctrl)) {
 		dev_info(dev->dev, "can't get pinctrl, bus recovery not supported\n");
 		return PTR_ERR(rinfo->pinctrl);
 	}
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 10e89586ca72..05d55893f04e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1388,7 +1388,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
 
 	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
+	if (IS_ERR(i2c_imx->pinctrl)) {
 		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
 		return PTR_ERR(i2c_imx->pinctrl);
 	}
-- 
2.34.1

