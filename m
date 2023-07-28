Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6B0766145
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 03:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbjG1Bcj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 21:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbjG1Bcg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 21:32:36 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82F535AD;
        Thu, 27 Jul 2023 18:32:24 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RBqmL5DgxztRgV;
        Fri, 28 Jul 2023 09:29:06 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 28 Jul
 2023 09:32:21 +0800
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
        <linux-arm-msm@vger.kernel.org>, <liaochang1@huawei.com>
Subject: [PATCH 2/9] i2c: mlxbf: Use dev_err_probe in probe function
Date:   Fri, 28 Jul 2023 09:31:41 +0800
Message-ID: <20230728013148.1720978-3-liaochang1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230728013148.1720978-1-liaochang1@huawei.com>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-mlxbf.c | 44 ++++++++++++----------------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index ae66bdd1b737..b5f2aa2fc1db 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2323,10 +2323,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
 
 		ret = mlxbf_i2c_init_resource(pdev, &priv->smbus,
 					      MLXBF_I2C_SMBUS_RES);
-		if (ret < 0) {
-			dev_err(dev, "Cannot fetch smbus resource info");
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Cannot fetch smbus resource info");
 
 		priv->timer->io = priv->smbus->io;
 		priv->mst->io = priv->smbus->io + MLXBF_I2C_MST_ADDR_OFFSET;
@@ -2334,10 +2332,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
 	} else {
 		ret = mlxbf_i2c_init_resource(pdev, &priv->timer,
 					      MLXBF_I2C_SMBUS_TIMER_RES);
-		if (ret < 0) {
-			dev_err(dev, "Cannot fetch timer resource info");
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Cannot fetch timer resource info");
 
 		ret = mlxbf_i2c_init_resource(pdev, &priv->mst,
 					      MLXBF_I2C_SMBUS_MST_RES);
@@ -2348,25 +2344,19 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
 
 		ret = mlxbf_i2c_init_resource(pdev, &priv->slv,
 					      MLXBF_I2C_SMBUS_SLV_RES);
-		if (ret < 0) {
-			dev_err(dev, "Cannot fetch slave resource info");
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Cannot fetch slave resource info");
 	}
 
 	ret = mlxbf_i2c_init_resource(pdev, &priv->mst_cause,
 				      MLXBF_I2C_MST_CAUSE_RES);
-	if (ret < 0) {
-		dev_err(dev, "Cannot fetch cause master resource info");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot fetch cause master resource info");
 
 	ret = mlxbf_i2c_init_resource(pdev, &priv->slv_cause,
 				      MLXBF_I2C_SLV_CAUSE_RES);
-	if (ret < 0) {
-		dev_err(dev, "Cannot fetch cause slave resource info");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot fetch cause slave resource info");
 
 	adap = &priv->adap;
 	adap->owner = THIS_MODULE;
@@ -2397,11 +2387,9 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
 	 * does not really hurt, then keep the code as is.
 	 */
 	ret = mlxbf_i2c_init_master(pdev, priv);
-	if (ret < 0) {
-		dev_err(dev, "failed to initialize smbus master %d",
-			priv->bus);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to initialize smbus master %d",
+				     priv->bus);
 
 	mlxbf_i2c_init_timings(pdev, priv);
 
@@ -2413,10 +2401,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq, mlxbf_i2c_irq,
 			       IRQF_SHARED | IRQF_PROBE_SHARED,
 			       dev_name(dev), priv);
-	if (ret < 0) {
-		dev_err(dev, "Cannot get irq %d\n", irq);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot get irq %d\n", irq);
 
 	priv->irq = irq;
 
-- 
2.25.1

