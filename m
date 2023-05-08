Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558AA6FB8A1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbjEHUxe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbjEHUxZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41315BAE
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r9-00035Y-5S; Mon, 08 May 2023 22:53:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r8-0024qC-Bq; Mon, 08 May 2023 22:53:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r7-002YVl-Fo; Mon, 08 May 2023 22:53:13 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 16/89] i2c: davinci: Improve error reporting for problems during .remove()
Date:   Mon,  8 May 2023 22:51:53 +0200
Message-Id: <20230508205306.1474415-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Mleig1htuUBx2XP25VO8EAlaDaDFkfzxGLKYkYnjytY=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTIhLSTqmyXjne47j57W2C185bNh87e0fL9kV36+Erl2 xjVed+tOhmNWRgYuRhkxRRZ7BvXZFpVyUV2rv13GWYQKxPIFAYuTgGYyIYMDoYNDFPXVcru6T3K xmcRY+Yiq1O73p3bmSfK/oho3n8JgW0KWrsqs6ebM9qbT+QWXrdq0QXhmsjHVXKKGi3NR3yEvz+ 9usYh0VX78oyajUv46rcrT3kwo7RZYc9SoVfOrTtqsrd+ZBPSf5JocaJeQWbLsXklT/jjDzIb8u gVXmtdZX6/9pmniLKNSHEl3xPzaSXp5153fQw+NaU/iPPbdn7NLRL8/I9DFU/PnJ1Zx5KiZJ1WM 2vxw6jmFn3RfiEFb64/YtYS1lJ8XLtflTcIzPl1MEx9enKf7JKlvZ//LTl5JpvjmvqcrkcPp+n5 BX9tXrAlu3J6u+8k3nlbDGpO/J4vzpi/fdEywa3yChkBAA==
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

If pm_runtime_get() fails in .remove() the driver used to return the
error to the driver core. The only effect of this (compared to returning
zero) is a generic warning that the error value is ignored. (The device
is unbound then anyhow.)

Emit a better warning and return zero to suppress the generic (and
little helpful) message. Also disable runtime PM in the error case.

This prepares changing platform device remove callbacks to return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-davinci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 9750310f2c96..7ba7e6cbcc97 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -894,11 +894,11 @@ static int davinci_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		return ret;
-
-	davinci_i2c_write_reg(dev, DAVINCI_I2C_MDR_REG, 0);
+		dev_err(&pdev->dev, "Failed to resume device\n");
+	else
+		davinci_i2c_write_reg(dev, DAVINCI_I2C_MDR_REG, 0);
 
 	pm_runtime_dont_use_autosuspend(dev->dev);
 	pm_runtime_put_sync(dev->dev);
-- 
2.39.2

