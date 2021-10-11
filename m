Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2F8428DE6
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 15:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236937AbhJKNaR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 09:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236932AbhJKNaQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 09:30:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E49C061768
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 06:28:15 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLe-0006z0-HZ; Mon, 11 Oct 2021 15:28:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLd-0003pn-VX; Mon, 11 Oct 2021 15:28:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLW-0000TA-RY; Mon, 11 Oct 2021 15:28:02 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH 09/13] mfd: tps65912: Make tps65912_device_exit() return void
Date:   Mon, 11 Oct 2021 15:27:50 +0200
Message-Id: <20211011132754.2479853-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=nx2G3bSXyIBmXaCH/JIMwwjfiGaioLfJDUtNgpYpxVg=; m=LMEJl9AEXG+mpOLwOIRYDu4jaVrbQ1G8O5KgAC1rhv4=; p=kmQFR3EAOk/QVFV0rwWjN00wyW1LWfMmamyUeZzQodw=; g=a9d478ecc85a81aad5001d3bdbf6a57f2e27c5c7
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkO3kACgkQwfwUeK3K7Amj1Qf/SOB UQicqlhFlcQeEsX0gen5G3ONen3ATgeSWO0sj0Rj3uWKA5ndFLjAeHrRI+zEDjgfBk29ojHlBJ6lg gCeb67UdgvY+hXDtlzXDMx5aUKHdBNzY/ONM8YQHiAR+eh+fYGGyMBqr+6MasFa7u2s3Vy1VYM30+ WcekRJGzbkIQ0z2pE+mwZIgwbghKIe6G8/IHDwHS5FUQuGnYrYzR2mpnaZKh3VX9+ivnScWqLJIBG Dw4E8budfHlPTUODRe0aBPZoPRR6E0AnqjactRIYCiHqyFd7x11ZZ1+s0VyAvKFRLEqoz09lf2+MP Kbb0DoFmOS31pw2Z/watMEG1vY2PEDg==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now tps65912_device_exit() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mfd/tps65912-core.c  | 4 +---
 drivers/mfd/tps65912-i2c.c   | 4 +++-
 drivers/mfd/tps65912-spi.c   | 4 +++-
 include/linux/mfd/tps65912.h | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/tps65912-core.c b/drivers/mfd/tps65912-core.c
index b55b1d5d6955..c282a05e7146 100644
--- a/drivers/mfd/tps65912-core.c
+++ b/drivers/mfd/tps65912-core.c
@@ -115,11 +115,9 @@ int tps65912_device_init(struct tps65912 *tps)
 }
 EXPORT_SYMBOL_GPL(tps65912_device_init);
 
-int tps65912_device_exit(struct tps65912 *tps)
+void tps65912_device_exit(struct tps65912 *tps)
 {
 	regmap_del_irq_chip(tps->irq, tps->irq_data);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(tps65912_device_exit);
 
diff --git a/drivers/mfd/tps65912-i2c.c b/drivers/mfd/tps65912-i2c.c
index f7c22ea7b36c..06eb2784d322 100644
--- a/drivers/mfd/tps65912-i2c.c
+++ b/drivers/mfd/tps65912-i2c.c
@@ -55,7 +55,9 @@ static int tps65912_i2c_remove(struct i2c_client *client)
 {
 	struct tps65912 *tps = i2c_get_clientdata(client);
 
-	return tps65912_device_exit(tps);
+	tps65912_device_exit(tps);
+
+	return 0;
 }
 
 static const struct i2c_device_id tps65912_i2c_id_table[] = {
diff --git a/drivers/mfd/tps65912-spi.c b/drivers/mfd/tps65912-spi.c
index 21a8d6ac5c4a..d701926aa46e 100644
--- a/drivers/mfd/tps65912-spi.c
+++ b/drivers/mfd/tps65912-spi.c
@@ -54,7 +54,9 @@ static int tps65912_spi_remove(struct spi_device *spi)
 {
 	struct tps65912 *tps = spi_get_drvdata(spi);
 
-	return tps65912_device_exit(tps);
+	tps65912_device_exit(tps);
+
+	return 0;
 }
 
 static const struct spi_device_id tps65912_spi_id_table[] = {
diff --git a/include/linux/mfd/tps65912.h b/include/linux/mfd/tps65912.h
index 7943e413deae..8a61386cb8c1 100644
--- a/include/linux/mfd/tps65912.h
+++ b/include/linux/mfd/tps65912.h
@@ -322,6 +322,6 @@ struct tps65912 {
 extern const struct regmap_config tps65912_regmap_config;
 
 int tps65912_device_init(struct tps65912 *tps);
-int tps65912_device_exit(struct tps65912 *tps);
+void tps65912_device_exit(struct tps65912 *tps);
 
 #endif /*  __LINUX_MFD_TPS65912_H */
-- 
2.30.2

