Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E252842CB10
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhJMUew (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhJMUev (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05FAC061570
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvY-0007UL-VX; Wed, 13 Oct 2021 22:32:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvY-0005oJ-EQ; Wed, 13 Oct 2021 22:32:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0000QT-50; Wed, 13 Oct 2021 22:32:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 07/15] iio: dac: ad5380: Make ad5380_remove() return void
Date:   Wed, 13 Oct 2021 22:32:15 +0200
Message-Id: <20211013203223.2694577-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=VdvWRnw9Zw90iHMeybC2OfejXduindsyC/oofVwEL78=; m=+pV6pNJ6/hCsJwA6Mq9Vw398k64WmZ7f24+71DBiPU4=; p=3EMNXr0o8SsefTlNGeAQHMqEVQqQzlOwTDN7uNTjLSo=; g=cd2c65a0425f1cbc1daedf5e37369fc9a05bfe22
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQfgACgkQwfwUeK3K7An3twf+KnY OfHW1ym6MGJVj1Zajqg9KJffb9wJBLVfxcxvZZipnvhHJe8z+tflvhMYiYktWDeNjGodKZ4i4JRv1 Hx54ijvbbr7Hz4PxFB08lAUWtj2puDC6fvqCaoWTOgd5P0LdWPIFe+Q8PvzPNkQT4rDlw71eoFio0 C4fB2wt4VTgTXP8w+L+jNE1snCWzT38tvpgy7wlTGkpCMFlgVbFKUw6b+HusR+YSuoBzvEYScgIgI 4EQol22v9M1UPGwpoi03Z9Fj7vZMjJ0rbASzinVpOSS7w1CnvKl0brQULs42g1/p/IgBV+9msIzxh 7BXTDDTgixalFNkXfnPWZmEP7zkgVbA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now ad5380_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/dac/ad5380.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/dac/ad5380.c b/drivers/iio/dac/ad5380.c
index 53db5b4e4c53..8ca26bb4b62f 100644
--- a/drivers/iio/dac/ad5380.c
+++ b/drivers/iio/dac/ad5380.c
@@ -444,7 +444,7 @@ static int ad5380_probe(struct device *dev, struct regmap *regmap,
 	return ret;
 }
 
-static int ad5380_remove(struct device *dev)
+static void ad5380_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct ad5380_state *st = iio_priv(indio_dev);
@@ -453,11 +453,8 @@ static int ad5380_remove(struct device *dev)
 
 	kfree(indio_dev->channels);
 
-	if (!IS_ERR(st->vref_reg)) {
+	if (!IS_ERR(st->vref_reg))
 		regulator_disable(st->vref_reg);
-	}
-
-	return 0;
 }
 
 static bool ad5380_reg_false(struct device *dev, unsigned int reg)
@@ -493,7 +490,9 @@ static int ad5380_spi_probe(struct spi_device *spi)
 
 static int ad5380_spi_remove(struct spi_device *spi)
 {
-	return ad5380_remove(&spi->dev);
+	ad5380_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id ad5380_spi_ids[] = {
@@ -566,7 +565,9 @@ static int ad5380_i2c_probe(struct i2c_client *i2c,
 
 static int ad5380_i2c_remove(struct i2c_client *i2c)
 {
-	return ad5380_remove(&i2c->dev);
+	ad5380_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id ad5380_i2c_ids[] = {
-- 
2.30.2

