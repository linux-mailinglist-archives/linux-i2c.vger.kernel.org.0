Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A69060969D
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Oct 2022 23:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiJWVva (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Oct 2022 17:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiJWVva (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Oct 2022 17:51:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D0A6A4BF
        for <linux-i2c@vger.kernel.org>; Sun, 23 Oct 2022 14:51:28 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1omisQ-0006UJ-Lc; Sun, 23 Oct 2022 23:51:26 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1omisP-0012aw-DX; Sun, 23 Oct 2022 23:51:25 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1omisO-000vaX-Sh; Sun, 23 Oct 2022 23:51:24 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH] i2c: cadence: make bus recovery optional
Date:   Sun, 23 Oct 2022 23:51:21 +0200
Message-Id: <20221023215121.221316-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no need for the i2c driver to have functional bus recovery to
probe successfully. We patch this by only adding bus_recovery_info only
if we get usable pinctrl data.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/i2c/busses/i2c-cadence.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index fe0cd205502de9..cf212b8ffd56af 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1262,10 +1262,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	}
 
 	id->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (IS_ERR(id->rinfo.pinctrl)) {
+	if (!IS_ERR(id->rinfo.pinctrl))
+		id->adap.bus_recovery_info = &id->rinfo;
+	else
 		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
-		return PTR_ERR(id->rinfo.pinctrl);
-	}
 
 	id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
 	if (IS_ERR(id->membase))
@@ -1283,7 +1283,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	id->adap.retries = 3;		/* Default retry value. */
 	id->adap.algo_data = id;
 	id->adap.dev.parent = &pdev->dev;
-	id->adap.bus_recovery_info = &id->rinfo;
 	init_completion(&id->xfer_done);
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
-- 
2.30.2

