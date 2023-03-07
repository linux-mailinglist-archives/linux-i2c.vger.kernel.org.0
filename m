Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FF86AEA9D
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Mar 2023 18:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjCGRfY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 12:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjCGRfG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 12:35:06 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEBAA2F19;
        Tue,  7 Mar 2023 09:31:11 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 327HUvWm101754;
        Tue, 7 Mar 2023 11:30:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1678210257;
        bh=PKKOuaAa2gBguzQqapfZCABAxRkqv+t5CDo+WBJoBjM=;
        h=From:To:CC:Subject:Date;
        b=zDZ9PuGLZPOFMiqNXMvMrzkgGj5NXrOciLjfMxye4K1tDBmaxTq7ZTw1fvdRoV6SX
         3sbi+zv1ELZ2RFjris/q6URurCkKW50BsfItYs7K0IPY8RWoZJAEldPJmg/LdTy936
         5RTG+Mz8mvP4wCpdY6YVxKfn7yBGgW3Bkre3ANNU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 327HUvRM094402
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Mar 2023 11:30:57 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Mar 2023 11:30:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Mar 2023 11:30:56 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 327HUuU9045064;
        Tue, 7 Mar 2023 11:30:56 -0600
From:   Andrew Davis <afd@ti.com>
To:     Wolfram Sang <wsa@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH 1/3] i2c: davinci: Use platform table macro over module_alias
Date:   Tue, 7 Mar 2023 11:30:54 -0600
Message-ID: <20230307173056.30164-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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

Generates the same platform module alias. More standard usage.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/i2c/busses/i2c-davinci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index c836cf884185..abea1d86035c 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -943,12 +943,16 @@ static const struct dev_pm_ops davinci_i2c_pm = {
 #define davinci_i2c_pm_ops NULL
 #endif
 
-/* work with hotplug and coldplug */
-MODULE_ALIAS("platform:i2c_davinci");
+static const struct platform_device_id davinci_i2c_driver_ids[] = {
+	{ .name = "i2c_davinci", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, davinci_i2c_driver_ids);
 
 static struct platform_driver davinci_i2c_driver = {
 	.probe		= davinci_i2c_probe,
 	.remove		= davinci_i2c_remove,
+	.id_table	= davinci_i2c_driver_ids,
 	.driver		= {
 		.name	= "i2c_davinci",
 		.pm	= davinci_i2c_pm_ops,
-- 
2.39.2

