Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C89703DBC
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 21:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245027AbjEOTaQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 15:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243497AbjEOTaP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 15:30:15 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376513A8B;
        Mon, 15 May 2023 12:30:14 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34FHoiRi010789;
        Mon, 15 May 2023 12:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684173044;
        bh=38tdvWK8lJabqgnOU0Hs8iF8EpCwonFKkFkL2o92fvU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=a3PDVgb9blJwuByXbXNDbQmFKz2rAS+3gw/BPz6NsfeVUejnTU/cxcuaOeSXn/85Q
         eDAYdkxLsoYeSrEiqVsRWlOZP+Ma40sHloNzpSlRsG/TndxoaYEwQkBP3K3jpmdXkf
         +1ieb/cYasA1nYrjBxmd8Bu+an+GcCm32BMulz4k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34FHoiLu124129
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 May 2023 12:50:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 May 2023 12:50:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 May 2023 12:50:44 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34FHohNq060959;
        Mon, 15 May 2023 12:50:43 -0500
From:   Andrew Davis <afd@ti.com>
To:     Wolfram Sang <wsa@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH v2 2/2] i2c: davinci: Use struct name not type with devm_kzalloc()
Date:   Mon, 15 May 2023 12:50:42 -0500
Message-ID: <20230515175042.495377-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515175042.495377-1-afd@ti.com>
References: <20230515175042.495377-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This reduces chance of error if the type of "dev" changes. While here
remove extra error print out, this is not usually done for memory
allocation failures.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/i2c/busses/i2c-davinci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index c55bd937def7..135f76593e6f 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -767,12 +767,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return dev_err_probe(&pdev->dev, irq, "can't get irq resource\n");
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(struct davinci_i2c_dev),
-			GFP_KERNEL);
-	if (!dev) {
-		dev_err(&pdev->dev, "Memory allocation failed\n");
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
 		return -ENOMEM;
-	}
 
 	init_completion(&dev->cmd_complete);
 
-- 
2.39.2

