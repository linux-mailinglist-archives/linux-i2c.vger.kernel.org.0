Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19EAB42CB1A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhJMUex (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhJMUew (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95085C061746
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvZ-0007UN-03; Wed, 13 Oct 2021 22:32:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvY-0005oK-ER; Wed, 13 Oct 2021 22:32:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0000QW-B2; Wed, 13 Oct 2021 22:32:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 08/15] iio: dac: ad5446: Make ad5446_remove() return void
Date:   Wed, 13 Oct 2021 22:32:16 +0200
Message-Id: <20211013203223.2694577-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=dEbl89T9tuVzitmq3oJc+HZp5pSLSQ32W6DCEWmPSbs=; m=eTQC1eHegUvKvX7TuWiKAWSE8IEgS+7QY24Wg6jNSyk=; p=IhvynkxE5az3IgQxdRNlTARa+0WYtIT6kWj3q7lsxN0=; g=63e4cbdc4d1fe92a9e4b22833f3b90276ae18d35
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQfwACgkQwfwUeK3K7AlPjgf8D1H X6fiZIwm175kabkjiOJQapJm9uAs/PeJy/Id0vWzd0qlBdOhgYjMhZlWHWVGQhdk1eNKMBML7zftQ M3tMFW8moX8NsqJ+4DwhDV2uNhAbM8QdMvTTjllxvKOPt2gIKvriJOIsVpiwL6bb0dDXE4iIm7ebh jFgAFtNtUKxkRJOIewSwQbB2cu+km13U8U/1P8sfgmxpHhr/I1fHPWf4smdxc1JpUbyqa6e1gsB4D wBTIHKOGRU4WbQcV6paqIgMifEwXScigeFrLdEpt0YC7b0nzZ+uhC63VCkP/pYyoVFv02czu1/xSv r56JBqOHveeH2grEOVk8HVjrnCeMUqA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now ad5446_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/dac/ad5446.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/dac/ad5446.c b/drivers/iio/dac/ad5446.c
index 488ec69967d6..0ef761521e87 100644
--- a/drivers/iio/dac/ad5446.c
+++ b/drivers/iio/dac/ad5446.c
@@ -283,7 +283,7 @@ static int ad5446_probe(struct device *dev, const char *name,
 	return ret;
 }
 
-static int ad5446_remove(struct device *dev)
+static void ad5446_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct ad5446_state *st = iio_priv(indio_dev);
@@ -291,8 +291,6 @@ static int ad5446_remove(struct device *dev)
 	iio_device_unregister(indio_dev);
 	if (!IS_ERR(st->reg))
 		regulator_disable(st->reg);
-
-	return 0;
 }
 
 #if IS_ENABLED(CONFIG_SPI_MASTER)
@@ -495,7 +493,9 @@ static int ad5446_spi_probe(struct spi_device *spi)
 
 static int ad5446_spi_remove(struct spi_device *spi)
 {
-	return ad5446_remove(&spi->dev);
+	ad5446_remove(&spi->dev);
+
+	return 0;
 }
 
 static struct spi_driver ad5446_spi_driver = {
@@ -572,7 +572,9 @@ static int ad5446_i2c_probe(struct i2c_client *i2c,
 
 static int ad5446_i2c_remove(struct i2c_client *i2c)
 {
-	return ad5446_remove(&i2c->dev);
+	ad5446_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id ad5446_i2c_ids[] = {
-- 
2.30.2

