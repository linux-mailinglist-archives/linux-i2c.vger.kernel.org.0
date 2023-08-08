Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 121547735ED
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 03:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjHHBal (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 21:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbjHHBae (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 21:30:34 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192AD19A1;
        Mon,  7 Aug 2023 18:30:31 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKbFW0rgWzrSMJ;
        Tue,  8 Aug 2023 09:29:19 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 09:30:28 +0800
From:   Liao Chang <liaochang1@huawei.com>
To:     <andi.shyti@kernel.org>, <florian.fainelli@broadcom.com>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <yangyicong@hisilicon.com>, <aisheng.dong@nxp.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <kblaiech@nvidia.com>, <asmaa@nvidia.com>,
        <loic.poulain@linaro.org>, <rfoss@kernel.org>, <ardb@kernel.org>,
        <gcherian@marvell.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v3 9/9] i2c: synquacer: Use dev_err_probe in probe function
Date:   Tue, 8 Aug 2023 09:29:54 +0800
Message-ID: <20230808012954.1643834-10-liaochang1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808012954.1643834-1-liaochang1@huawei.com>
References: <20230808012954.1643834-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the dev_err_probe function instead of dev_err in the probe function
so that the printed messge includes the return value and also handles
-EPROBE_DEFER nicely.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 drivers/i2c/busses/i2c-synquacer.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index 4cc196ca8f6d..bbea521b05dd 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -557,20 +557,16 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 		dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
 
 		ret = clk_prepare_enable(i2c->pclk);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to enable clock (%d)\n",
-				ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret, "failed to enable clock\n");
 		i2c->pclkrate = clk_get_rate(i2c->pclk);
 	}
 
 	if (i2c->pclkrate < SYNQUACER_I2C_MIN_CLK_RATE ||
-	    i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE) {
-		dev_err(&pdev->dev, "PCLK missing or out of range (%d)\n",
-			i2c->pclkrate);
-		return -EINVAL;
-	}
+	    i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "PCLK missing or out of range (%d)\n",
+				     i2c->pclkrate);
 
 	i2c->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->base))
@@ -582,10 +578,8 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
 			       0, dev_name(&pdev->dev), i2c);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "cannot claim IRQ %d\n", i2c->irq);
 
 	i2c->state = STATE_IDLE;
 	i2c->dev = &pdev->dev;
@@ -605,10 +599,8 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	synquacer_i2c_hw_init(i2c);
 
 	ret = i2c_add_numbered_adapter(&i2c->adapter);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to add bus to i2c core\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to add bus to i2c core\n");
 
 	platform_set_drvdata(pdev, i2c);
 
-- 
2.25.1

