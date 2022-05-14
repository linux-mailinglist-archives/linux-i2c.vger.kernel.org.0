Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E87526E95
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 09:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbiENC4S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 22:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbiENCz4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 22:55:56 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A508E311CDC;
        Fri, 13 May 2022 19:20:28 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4L0TjB1ryWz1JC4m;
        Sat, 14 May 2022 10:19:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 10:20:25 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 14 May
 2022 10:20:25 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
CC:     <matthias.bgg@gmail.com>, <sr@denx.de>, <wsa@the-dreams.de>,
        <christophe.jaillet@wanadoo.fr>
Subject: [PATCH -next v2 2/2] i2c: mt7621: Use devm_platform_get_and_ioremap_resource()
Date:   Sat, 14 May 2022 10:31:48 +0800
Message-ID: <20220514023148.305457-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220514023148.305457-1-yangyingliang@huawei.com>
References: <20220514023148.305457-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_platform_get_and_ioremap_resource() to simplify
code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Stefan Roese <sr@denx.de>
---
 drivers/i2c/busses/i2c-mt7621.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 901f0fb04fee..cfe6de8175dd 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -270,18 +270,15 @@ static void mtk_i2c_init(struct mtk_i2c *i2c)
 
 static int mtk_i2c_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct mtk_i2c *i2c;
 	struct i2c_adapter *adap;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct mtk_i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
-	i2c->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-- 
2.25.1

