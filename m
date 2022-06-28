Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24AD55E602
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 18:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347344AbiF1ODc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 10:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347336AbiF1ODb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 10:03:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EF92E098
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jun 2022 07:03:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6BoG-0008Ka-UJ; Tue, 28 Jun 2022 16:03:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6BoC-003DT7-Ln; Tue, 28 Jun 2022 16:03:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6BoF-001gzN-0L; Tue, 28 Jun 2022 16:03:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org
Subject: [PATCH 5/6] gpio: pca953x: Make platform teardown callback return void
Date:   Tue, 28 Jun 2022 16:03:11 +0200
Message-Id: <20220628140313.74984-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3568; h=from:subject; bh=QXt4mJ3H+NGdOsmDjNtywoIO4ywvdWEcvDHh7lh6T6s=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMSTt5hIVfL5mxdXA93cKJ/wrtEgVZFq4OtLERqV+eucBnlOS 8T2fOhmNWRgYuRhkxRRZ6oq0xCZIrPlvV7KEG2YQKxPIFAYuTgGYyPE77P/r8kVs2v/a1PU8eT+1/P ENwemeiXdTV12qeHTbnOtFzPd35yLtixLNN+5j/iec48D0ccXhg8Y6tmt8osQjJcVOW0bLshUwGLOY LLp5/mLF/6Jz3yvOBlS+3CtadVY9R8kuws93rf4tkcg9izvUWA/5BRnoe98qsLF8lvmbubZac59l+o +HhwVdElSXOuXIswmIqWV/Vnc4byDYnaXu7/HzwB456RX/2SQ51iy3i+6+x8+3NaNAyfxQRP5CiVK+ I/6XvOyui7yNcXj88Hv25nPrjp4SeLuB/bFMxsdSe5uWvvcLA5iezKmVSCp6s6fr+Ncyf59yQfWiH6 u9hPe+tc1p/zRpnuiujk3e1sFhAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All platforms that provide a teardown callback return 0. New users are
supposed to not make use of platform support, so there is no
functionality lost.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Forwarded: id:20220502170555.51183-1-u.kleine-koenig@pengutronix.de
---
 arch/arm/mach-davinci/board-da850-evm.c | 12 ++++--------
 drivers/gpio/gpio-pca953x.c             | 11 +++--------
 include/linux/platform_data/pca953x.h   |  2 +-
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index efc26b472ef8..09253e70d0dc 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -518,8 +518,8 @@ static int da850_evm_ui_expander_setup(struct i2c_client *client, unsigned gpio,
 	return ret;
 }
 
-static int da850_evm_ui_expander_teardown(struct i2c_client *client,
-					unsigned gpio, unsigned ngpio, void *c)
+static void da850_evm_ui_expander_teardown(struct i2c_client *client,
+					   unsigned gpio, unsigned ngpio, void *c)
 {
 	platform_device_unregister(&da850_evm_ui_keys_device);
 
@@ -531,8 +531,6 @@ static int da850_evm_ui_expander_teardown(struct i2c_client *client,
 	gpio_free(gpio + DA850_EVM_UI_EXP_SEL_C);
 	gpio_free(gpio + DA850_EVM_UI_EXP_SEL_B);
 	gpio_free(gpio + DA850_EVM_UI_EXP_SEL_A);
-
-	return 0;
 }
 
 /* assign the baseboard expander's GPIOs after the UI board's */
@@ -699,13 +697,11 @@ static int da850_evm_bb_expander_setup(struct i2c_client *client,
 	return ret;
 }
 
-static int da850_evm_bb_expander_teardown(struct i2c_client *client,
-					unsigned gpio, unsigned ngpio, void *c)
+static void da850_evm_bb_expander_teardown(struct i2c_client *client,
+					   unsigned gpio, unsigned ngpio, void *c)
 {
 	platform_device_unregister(&da850_evm_bb_leds_device);
 	platform_device_unregister(&da850_evm_bb_keys_device);
-
-	return 0;
 }
 
 static struct pca953x_platform_data da850_evm_ui_expander_info = {
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 08bc52c3cdcb..3eedeac9ec8d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1099,20 +1099,15 @@ static int pca953x_remove(struct i2c_client *client)
 {
 	struct pca953x_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct pca953x_chip *chip = i2c_get_clientdata(client);
-	int ret;
 
 	if (pdata && pdata->teardown) {
-		ret = pdata->teardown(client, chip->gpio_chip.base,
-				      chip->gpio_chip.ngpio, pdata->context);
-		if (ret < 0)
-			dev_err(&client->dev, "teardown failed, %d\n", ret);
-	} else {
-		ret = 0;
+		pdata->teardown(client, chip->gpio_chip.base,
+				chip->gpio_chip.ngpio, pdata->context);
 	}
 
 	regulator_disable(chip->regulator);
 
-	return ret;
+	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/include/linux/platform_data/pca953x.h b/include/linux/platform_data/pca953x.h
index 4eb53e023997..96c1a14ab365 100644
--- a/include/linux/platform_data/pca953x.h
+++ b/include/linux/platform_data/pca953x.h
@@ -22,7 +22,7 @@ struct pca953x_platform_data {
 	int		(*setup)(struct i2c_client *client,
 				unsigned gpio, unsigned ngpio,
 				void *context);
-	int		(*teardown)(struct i2c_client *client,
+	void		(*teardown)(struct i2c_client *client,
 				unsigned gpio, unsigned ngpio,
 				void *context);
 	const char	*const *names;
-- 
2.36.1

