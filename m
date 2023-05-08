Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033FF6FB8C5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjEHUx4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbjEHUxi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B3B7DB6
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rJ-0003cu-Kl; Mon, 08 May 2023 22:53:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rI-0024sd-0v; Mon, 08 May 2023 22:53:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rH-002YXe-03; Mon, 08 May 2023 22:53:23 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 45/89] i2c: npcm7xx: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:22 +0200
Message-Id: <20230508205306.1474415-46-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bu1JB92LvBFf/l3sa5GWAThsUyYU4QwXtineEWc+6mg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDiwMBgQPinZMfuK8OKyLbeevCd80U4pE/vI qR643c+L5yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg4gAKCRCPgPtYfRL+ TmN7B/9xfm9lyE/H7yFw+TMoEACqvAkdqe27T79ZrfqNFyA7Uhhu9AJDZPLTw7+0Zvb/q0uUGia zYmuxh0ZNedyCgDCJMqHlOb4zdXeAYRw+wQVi8jWDArYkIKahxaut0R29IDWAkuUSyLR6kvqxJ9 BBa49Ov/3veYDZYL2mGuj5UIL/JRw4T9Lu0/+fNSlNQGdKJunIVRvM+qmR82o9/BPMCFBEtT784 M/ykSk/+ASXbcG/nenohxlAOImRRbt32ltJAFeEZ+U9ptO3qLGUCOCtqh2d11k4wsdibszncg/p wphKnrYQXFVB/Wqkz8Ui9yFLqfx/D0BlSKBU6FtqAu2+mwFk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 38d5864d0cb5..53b65ffb6a64 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2361,7 +2361,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	return 0;
 }
 
-static int npcm_i2c_remove_bus(struct platform_device *pdev)
+static void npcm_i2c_remove_bus(struct platform_device *pdev)
 {
 	unsigned long lock_flags;
 	struct npcm_i2c *bus = platform_get_drvdata(pdev);
@@ -2371,7 +2371,6 @@ static int npcm_i2c_remove_bus(struct platform_device *pdev)
 	npcm_i2c_disable(bus);
 	spin_unlock_irqrestore(&bus->lock, lock_flags);
 	i2c_del_adapter(&bus->adap);
-	return 0;
 }
 
 static const struct of_device_id npcm_i2c_bus_of_table[] = {
@@ -2383,7 +2382,7 @@ MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
 
 static struct platform_driver npcm_i2c_bus_driver = {
 	.probe = npcm_i2c_probe_bus,
-	.remove = npcm_i2c_remove_bus,
+	.remove_new = npcm_i2c_remove_bus,
 	.driver = {
 		.name = "nuvoton-i2c",
 		.of_match_table = npcm_i2c_bus_of_table,
-- 
2.39.2

