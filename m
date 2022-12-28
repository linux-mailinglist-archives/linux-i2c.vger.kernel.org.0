Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 186526574AD
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Dec 2022 10:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiL1JfO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Dec 2022 04:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiL1JfN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Dec 2022 04:35:13 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2277AD112;
        Wed, 28 Dec 2022 01:35:12 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NhmYY5pqVz16LvP;
        Wed, 28 Dec 2022 17:33:53 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 17:35:09 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <neil.armstrong@linaro.org>,
        <wsa@kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH] i2c: qcom-geni: fix missing clk_disable_unprepare()
Date:   Wed, 28 Dec 2022 17:32:09 +0800
Message-ID: <20221228093209.3164540-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add missing clk_disable_unprepare() in the error path in geni_i2c_probe().

Fixes: 14d02fbadb5d ("i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index fd70794bfcee..f292e4dab98f 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -859,6 +859,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
 		dev_err(dev, "Error turning on resources %d\n", ret);
+		clk_disable_unprepare(gi2c->core_clk);
 		return ret;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
@@ -878,8 +879,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		/* FIFO is disabled, so we can only use GPI DMA */
 		gi2c->gpi_mode = true;
 		ret = setup_gpi_dma(gi2c);
-		if (ret)
+		if (ret) {
+			clk_disable_unprepare(gi2c->core_clk);
 			return dev_err_probe(dev, ret, "Failed to setup GPI DMA mode\n");
+		}
 
 		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
 	} else {
@@ -892,6 +895,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 		if (!tx_depth) {
 			dev_err(dev, "Invalid TX FIFO depth\n");
+			clk_disable_unprepare(gi2c->core_clk);
 			return -EINVAL;
 		}
 
-- 
2.25.1

