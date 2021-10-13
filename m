Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A41D242CB03
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhJMUes (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhJMUeq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B922DC061766
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0007Ee-Rj; Wed, 13 Oct 2021 22:32:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvQ-0005mb-QR; Wed, 13 Oct 2021 22:32:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvQ-0000QE-PO; Wed, 13 Oct 2021 22:32:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 05/15] iio: accel: mma7455: Make mma7455_core_remove() return void
Date:   Wed, 13 Oct 2021 22:32:13 +0200
Message-Id: <20211013203223.2694577-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=rKvC/oSOVZDlFv+j5wQ6EUNPIn+fpEaHiBQX2eeTwuI=; m=lDgVw75eMVw1gNlXDgV2kUOPbyow2s75r/9Xta213hI=; p=EMBM9Ru9ktBC7jMq8LrhOhHLTsd0fTxAUK0l7gw0BMQ=; g=613b4d7ed135e778d967c832af862554e87d651c
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQfEACgkQwfwUeK3K7Antbgf/Rvc Iz2c5KWVk4Lfxct5/hbL/xxtVkxdgwxSiwN9Sfjdrg7UEX/6Z5GsbFteKwIAVksadvh5jHGvBNGi7 rqGamZEUoJPqRTiUkpMJyXYLbb8lnYa8S9OHQzqTzb0jBCNIiBy0NlmtlWp0ia7Jco6LSfHfa0fNq nGkRuzorbgVpcs65QlCdhhkafN7XIoKdWwqwL4ydWqyGE23SRGtscIoXNJGb4WHhsySIQCvMmbID5 KhacLPZO0j2xoYDELupLrWgMk9FgO8WJOX9menYGjPVx/u9LoU3lWs9iqSCIwIvYSnQBBztFAwHwP 6vW3AFCtBtIpfexABsSafXGDazq+2TQ==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now mma7455_core_remove() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/accel/mma7455.h      | 2 +-
 drivers/iio/accel/mma7455_core.c | 4 +---
 drivers/iio/accel/mma7455_i2c.c  | 4 +++-
 drivers/iio/accel/mma7455_spi.c  | 4 +++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/accel/mma7455.h b/drivers/iio/accel/mma7455.h
index 4e3fa988f690..1fcc4b64b3af 100644
--- a/drivers/iio/accel/mma7455.h
+++ b/drivers/iio/accel/mma7455.h
@@ -11,6 +11,6 @@ extern const struct regmap_config mma7455_core_regmap;
 
 int mma7455_core_probe(struct device *dev, struct regmap *regmap,
 		       const char *name);
-int mma7455_core_remove(struct device *dev);
+void mma7455_core_remove(struct device *dev);
 
 #endif
diff --git a/drivers/iio/accel/mma7455_core.c b/drivers/iio/accel/mma7455_core.c
index 922bd38ff6ea..777c6c384b09 100644
--- a/drivers/iio/accel/mma7455_core.c
+++ b/drivers/iio/accel/mma7455_core.c
@@ -294,7 +294,7 @@ int mma7455_core_probe(struct device *dev, struct regmap *regmap,
 }
 EXPORT_SYMBOL_GPL(mma7455_core_probe);
 
-int mma7455_core_remove(struct device *dev)
+void mma7455_core_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct mma7455_data *mma7455 = iio_priv(indio_dev);
@@ -304,8 +304,6 @@ int mma7455_core_remove(struct device *dev)
 
 	regmap_write(mma7455->regmap, MMA7455_REG_MCTL,
 		     MMA7455_MCTL_MODE_STANDBY);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(mma7455_core_remove);
 
diff --git a/drivers/iio/accel/mma7455_i2c.c b/drivers/iio/accel/mma7455_i2c.c
index cddeaa9e230a..8a5256516f9f 100644
--- a/drivers/iio/accel/mma7455_i2c.c
+++ b/drivers/iio/accel/mma7455_i2c.c
@@ -28,7 +28,9 @@ static int mma7455_i2c_probe(struct i2c_client *i2c,
 
 static int mma7455_i2c_remove(struct i2c_client *i2c)
 {
-	return mma7455_core_remove(&i2c->dev);
+	mma7455_core_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id mma7455_i2c_ids[] = {
diff --git a/drivers/iio/accel/mma7455_spi.c b/drivers/iio/accel/mma7455_spi.c
index eb82cdfa8abc..ecf690692dcc 100644
--- a/drivers/iio/accel/mma7455_spi.c
+++ b/drivers/iio/accel/mma7455_spi.c
@@ -24,7 +24,9 @@ static int mma7455_spi_probe(struct spi_device *spi)
 
 static int mma7455_spi_remove(struct spi_device *spi)
 {
-	return mma7455_core_remove(&spi->dev);
+	mma7455_core_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id mma7455_spi_ids[] = {
-- 
2.30.2

