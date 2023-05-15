Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC81703CA8
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 20:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235006AbjEOSbM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 14:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236831AbjEOSbL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 14:31:11 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB32C46B2;
        Mon, 15 May 2023 11:31:09 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34FHohqw026890;
        Mon, 15 May 2023 12:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684173043;
        bh=li1qACpEc+UiOMT6jAFyohJIo3GdjAxTe9n1fUN9AiE=;
        h=From:To:CC:Subject:Date;
        b=v9tiwB0Bgx2QtIRTsyCWaYsPaFqE0g0Wv391XowCuAHuBR82X6X8KZCT6kGiRBT22
         zsxwMFlR5HcgwgfybS1JDh3GcC2O4sbifqYg4W8hdBrsyJ+V2BFSXsbKhuY5Ys1iJ1
         7yZ3iupwfdZOh1DzZOMsiTrAH8t4Q6G1xy0PLDFk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34FHohA0049310
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 May 2023 12:50:43 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 May 2023 12:50:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 May 2023 12:50:43 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34FHohNp060959;
        Mon, 15 May 2023 12:50:43 -0500
From:   Andrew Davis <afd@ti.com>
To:     Wolfram Sang <wsa@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH v2 1/2] i2c: davinci: Use platform table macro over module_alias
Date:   Mon, 15 May 2023 12:50:41 -0500
Message-ID: <20230515175042.495377-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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

Generates the same platform module alias. More standard usage.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/i2c/busses/i2c-davinci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 9750310f2c96..c55bd937def7 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -940,12 +940,16 @@ static const struct dev_pm_ops davinci_i2c_pm = {
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

