Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03B478EF2D
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 16:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbjHaODq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 10:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234395AbjHaODp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 10:03:45 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BAFC3
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 07:03:42 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Rc2rR3KtWzVkRQ;
        Thu, 31 Aug 2023 22:01:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 31 Aug
 2023 22:03:39 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH] i2c: gpio: Fix the NULL vs IS_ERR() bug for debugfs_create_dir()
Date:   Thu, 31 Aug 2023 22:03:34 +0800
Message-ID: <20230831140334.3165918-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since debugfs_create_dir() returns ERR_PTR and never return NULL, So use
IS_ERR() to check it instead of checking NULL.

Fixes: 14911c6f48ec ("i2c: gpio: add fault injector")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/i2c/busses/i2c-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index e5a5b9e8bf2c..5ecf35c4a21f 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -265,12 +265,12 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 	 */
 	if (!i2c_gpio_debug_dir) {
 		i2c_gpio_debug_dir = debugfs_create_dir("i2c-fault-injector", NULL);
-		if (!i2c_gpio_debug_dir)
+		if (IS_ERR(i2c_gpio_debug_dir))
 			return;
 	}
 
 	priv->debug_dir = debugfs_create_dir(pdev->name, i2c_gpio_debug_dir);
-	if (!priv->debug_dir)
+	if (IS_ERR(priv->debug_dir))
 		return;
 
 	init_completion(&priv->scl_irq_completion);
-- 
2.34.1

