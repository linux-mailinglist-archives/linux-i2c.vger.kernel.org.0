Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD442428DD9
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 15:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236915AbhJKNaO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 09:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236908AbhJKNaN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 09:30:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D01FC06161C
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 06:28:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLa-0006g5-4V; Mon, 11 Oct 2021 15:28:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLZ-0003o1-IA; Mon, 11 Oct 2021 15:28:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLW-0000T4-GR; Mon, 11 Oct 2021 15:28:02 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH 07/13] mfd: mc13xxx: Make mc13xxx_common_exit() return void
Date:   Mon, 11 Oct 2021 15:27:48 +0200
Message-Id: <20211011132754.2479853-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=J0ahGtF24eL+BKixNT+eVqqWAgunLx1WrSLObTBrLHE=; m=iAYXBDyS7vtYm0Q4B+/bh1iHsdzFe765AJZBSjfwEOk=; p=8kKdW/WtJXFWuGJPQK2wUzWAROZ7oQx017enqo1HbSA=; g=73aca2f699ec96f28f86a963cdbadcba1e264bad
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkO3MACgkQwfwUeK3K7AltHwgAoGz FUwbxbAqMyOHx4sitIeberQakX/PoLYv20EYZsmoRQSvc/h4ncaXiRGA7ZyoutBXBRM9fXvBF6ixX 7/Otz/CA/UtpP1eU0w6/vV8YIsHxhzJzY9kkQhyPMgp2eQLc3nhsvrc0+7rSMCFV9kd0Q2xhhyYhD TRSyweceBWoQeXBd60uACQIkk9oFeZDJSS7D6psK3NoILnvF1EEanbia76Gv6dQPudGPnYP4J9J78 db4ZFxIpbL7EDnb+B9/EasbWC5ZM+TjEpxuAiN+nOhD4u30w6u6wQypcWtCLi3j7cbG4IOOJLP0MV mRN59458Z5KdwAK67lLa3qTNQXjg3OA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now mc13xxx_common_exit() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mfd/mc13xxx-core.c | 4 +---
 drivers/mfd/mc13xxx-i2c.c  | 3 ++-
 drivers/mfd/mc13xxx-spi.c  | 3 ++-
 drivers/mfd/mc13xxx.h      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 1abe7432aad8..8a4f1d90dcfd 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -496,15 +496,13 @@ int mc13xxx_common_init(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(mc13xxx_common_init);
 
-int mc13xxx_common_exit(struct device *dev)
+void mc13xxx_common_exit(struct device *dev)
 {
 	struct mc13xxx *mc13xxx = dev_get_drvdata(dev);
 
 	mfd_remove_devices(dev);
 	regmap_del_irq_chip(mc13xxx->irq, mc13xxx->irq_data);
 	mutex_destroy(&mc13xxx->lock);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(mc13xxx_common_exit);
 
diff --git a/drivers/mfd/mc13xxx-i2c.c b/drivers/mfd/mc13xxx-i2c.c
index 65b4dd8e5afb..fb937f66277e 100644
--- a/drivers/mfd/mc13xxx-i2c.c
+++ b/drivers/mfd/mc13xxx-i2c.c
@@ -87,7 +87,8 @@ static int mc13xxx_i2c_probe(struct i2c_client *client,
 
 static int mc13xxx_i2c_remove(struct i2c_client *client)
 {
-	return mc13xxx_common_exit(&client->dev);
+	mc13xxx_common_exit(&client->dev);
+	return 0;
 }
 
 static struct i2c_driver mc13xxx_i2c_driver = {
diff --git a/drivers/mfd/mc13xxx-spi.c b/drivers/mfd/mc13xxx-spi.c
index 286ddcf5ddc6..f60227723b4a 100644
--- a/drivers/mfd/mc13xxx-spi.c
+++ b/drivers/mfd/mc13xxx-spi.c
@@ -168,7 +168,8 @@ static int mc13xxx_spi_probe(struct spi_device *spi)
 
 static int mc13xxx_spi_remove(struct spi_device *spi)
 {
-	return mc13xxx_common_exit(&spi->dev);
+	mc13xxx_common_exit(&spi->dev);
+	return 0
 }
 
 static struct spi_driver mc13xxx_spi_driver = {
diff --git a/drivers/mfd/mc13xxx.h b/drivers/mfd/mc13xxx.h
index ce6eec52e8eb..bd5ba9a0e14f 100644
--- a/drivers/mfd/mc13xxx.h
+++ b/drivers/mfd/mc13xxx.h
@@ -44,6 +44,6 @@ struct mc13xxx {
 };
 
 int mc13xxx_common_init(struct device *dev);
-int mc13xxx_common_exit(struct device *dev);
+void mc13xxx_common_exit(struct device *dev);
 
 #endif /* __DRIVERS_MFD_MC13XXX_H */
-- 
2.30.2

