Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27FA176CA22
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 11:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234302AbjHBJ6s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 05:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbjHBJ6c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 05:58:32 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6DA19B9;
        Wed,  2 Aug 2023 02:58:15 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RG6lb15PhztRnF;
        Wed,  2 Aug 2023 17:54:51 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 17:58:12 +0800
From:   Liao Chang <liaochang1@huawei.com>
To:     <andi.shyti@kernel.org>, <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <yangyicong@hisilicon.com>,
        <aisheng.dong@nxp.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <kblaiech@nvidia.com>,
        <asmaa@nvidia.com>, <loic.poulain@linaro.org>, <rfoss@kernel.org>,
        <ardb@kernel.org>, <gcherian@marvell.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
Date:   Wed, 2 Aug 2023 17:57:36 +0800
Message-ID: <20230802095737.3957587-9-liaochang1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802095737.3957587-1-liaochang1@huawei.com>
References: <20230802095737.3957587-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-imx-lpi2c.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c3287c887c6f..bfa788b3775b 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -569,10 +569,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 		sizeof(lpi2c_imx->adapter.name));
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "can't get I2C peripheral clock, ret=%d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "can't get I2C peripheral clock\n");
 	lpi2c_imx->num_clks = ret;
 
 	ret = of_property_read_u32(pdev->dev.of_node,
@@ -582,10 +580,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
 			       pdev->name, lpi2c_imx);
-	if (ret) {
-		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);
 
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
-- 
2.25.1

