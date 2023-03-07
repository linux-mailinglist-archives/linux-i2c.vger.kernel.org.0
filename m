Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9226AEA9B
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Mar 2023 18:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjCGRfX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 12:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjCGRfE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 12:35:04 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E461A2F1F;
        Tue,  7 Mar 2023 09:31:08 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 327HUvcG042899;
        Tue, 7 Mar 2023 11:30:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1678210257;
        bh=6fCjEtwtv/IPhK41kwFaKhQDIWfKphfj41b1psqgSS4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rS9gqOBFX2bgl+o3MSa2d4TrjjkfntbVY2MopaF25Tq10Om0L4+/q70zUgGWzFPid
         FIBVHI7kvMWVPFnXQCbjah9Cn24HzRPA0Z3fu3kKhQMriUWLYe7f+2HvB8PBsRES3W
         HRqWuAt4RprTk7chx/32wjc8bQrQRomy+J2aVvDE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 327HUv2v049933
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Mar 2023 11:30:57 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Mar 2023 11:30:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Mar 2023 11:30:56 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 327HUuUA045064;
        Tue, 7 Mar 2023 11:30:56 -0600
From:   Andrew Davis <afd@ti.com>
To:     Wolfram Sang <wsa@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH 2/3] i2c: davinci: Use struct name not type with devm_kzalloc()
Date:   Tue, 7 Mar 2023 11:30:55 -0600
Message-ID: <20230307173056.30164-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307173056.30164-1-afd@ti.com>
References: <20230307173056.30164-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
index abea1d86035c..4a8e7728ee29 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -770,12 +770,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, irq, "can't get irq resource\n");
 	}
 
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

