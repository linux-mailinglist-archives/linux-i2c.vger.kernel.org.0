Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C4B76CA13
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 11:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234236AbjHBJ6d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 05:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233744AbjHBJ6Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 05:58:16 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEF4196;
        Wed,  2 Aug 2023 02:58:13 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RG6lY032YztRnd;
        Wed,  2 Aug 2023 17:54:48 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 17:58:09 +0800
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
Subject: [PATCH 5/9] i2c: qcom-cci: Use dev_err_probe in probe function
Date:   Wed, 2 Aug 2023 17:57:33 +0800
Message-ID: <20230802095737.3957587-6-liaochang1@huawei.com>
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

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 622dc14add9d..cf13abec05f1 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -588,10 +588,8 @@ static int cci_probe(struct platform_device *pdev)
 	/* Clocks */
 
 	ret = devm_clk_bulk_get_all(dev, &cci->clocks);
-	if (ret < 1) {
-		dev_err(dev, "failed to get clocks %d\n", ret);
-		return ret;
-	}
+	if (ret < 1)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
 	cci->nclocks = ret;
 
 	/* Retrieve CCI clock rate */
-- 
2.25.1

