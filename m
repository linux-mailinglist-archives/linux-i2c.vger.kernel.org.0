Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAACC6121EF
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Oct 2022 11:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiJ2Jjq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Oct 2022 05:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ2Jjp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Oct 2022 05:39:45 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8A6140C1
        for <linux-i2c@vger.kernel.org>; Sat, 29 Oct 2022 02:39:41 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MzvRt1K6fzpVqQ;
        Sat, 29 Oct 2022 17:36:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 29 Oct 2022 17:39:39 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 29 Oct
 2022 17:39:38 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <peda@axentia.se>, <yorksun@freescale.com>,
        <alexander.sverdlin@nokia.com>, <wsa@kernel.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH RESEND] i2c: mux: reg: check return value after calling platform_get_resource()
Date:   Sat, 29 Oct 2022 17:38:25 +0800
Message-ID: <20221029093825.3425857-1-yangyingliang@huawei.com>
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

It will cause null-ptr-deref in resource_size(), if platform_get_resource()
returns NULL, move calling resource_size() after devm_ioremap_resource() that
will check 'res' to avoid null-ptr-deref.
And use devm_platform_get_and_ioremap_resource() to simplify code.

Fixes: b3fdd32799d8 ("i2c: mux: Add register-based mux i2c-mux-reg")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
The previous link:
https://lore.kernel.org/lkml/20220425090509.2524814-1-yangyingliang@huawei.com/
---
 drivers/i2c/muxes/i2c-mux-reg.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
index 0e0679f65cf7..30a6de1694e0 100644
--- a/drivers/i2c/muxes/i2c-mux-reg.c
+++ b/drivers/i2c/muxes/i2c-mux-reg.c
@@ -183,13 +183,12 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
 	if (!mux->data.reg) {
 		dev_info(&pdev->dev,
 			"Register not set, using platform resource\n");
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		mux->data.reg_size = resource_size(res);
-		mux->data.reg = devm_ioremap_resource(&pdev->dev, res);
+		mux->data.reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 		if (IS_ERR(mux->data.reg)) {
 			ret = PTR_ERR(mux->data.reg);
 			goto err_put_parent;
 		}
+		mux->data.reg_size = resource_size(res);
 	}
 
 	if (mux->data.reg_size != 4 && mux->data.reg_size != 2 &&
-- 
2.25.1

