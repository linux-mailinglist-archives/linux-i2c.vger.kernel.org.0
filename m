Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2910F42CAF9
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhJMUer (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhJMUeq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A865C061765
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvS-0007Ef-H9; Wed, 13 Oct 2021 22:32:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0005me-PV; Wed, 13 Oct 2021 22:32:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0000Qc-OH; Wed, 13 Oct 2021 22:32:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 10/15] iio: dac: ad5686: Make ad5686_remove() return void
Date:   Wed, 13 Oct 2021 22:32:18 +0200
Message-Id: <20211013203223.2694577-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=QMuejyC7ti9iGWS4aq/Mg0auEumbcjLiUXg/6aTZyBQ=; m=18nqVQag2sEsyeOjvHnHOLnTqoP0ugWwZtchoOSDR3k=; p=FQEaBCbRRXyB/WZS/lmheIp7jSbyhBnXSI6quIwXiRI=; g=630156e673f7eef71dec8aae3b38e903b2786a9f
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQgUACgkQwfwUeK3K7AllSAf/axM 0Cnkf6812caWnaHugOJkOGsnpP6O0D1tzoTc48ZIrn6/mWmCD0e3idtA/gHfc0ECqcwYSthl+sHxB UulHOXvkmelkDVG5CNSuJ3hCPo8MRoLGxAd62VF9cDavkq4ipdKdA2M52vAUq//pH7wjKCZhkOPE7 McihWXbd90DERLNcIIXyliYHsCnLkMLxsmRNL27sjGpb0saa9DM69efe+NJ/RoEK51h3/mXTg4jpq tju3FclQk62HiunfEh5F6TFn3koVMWnU1ZV8q4PHKIBY4ivFgR9NaSyEW5Fgota5wVmNrKEE8TqEe HPhFma58kuTC3Jgi3ZCdua0Wbiy3ODQ==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now ad5686_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/dac/ad5686-spi.c | 4 +++-
 drivers/iio/dac/ad5686.c     | 4 +---
 drivers/iio/dac/ad5686.h     | 2 +-
 drivers/iio/dac/ad5696-i2c.c | 4 +++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/dac/ad5686-spi.c b/drivers/iio/dac/ad5686-spi.c
index 0188ded5137c..2628810fdbb1 100644
--- a/drivers/iio/dac/ad5686-spi.c
+++ b/drivers/iio/dac/ad5686-spi.c
@@ -97,7 +97,9 @@ static int ad5686_spi_probe(struct spi_device *spi)
 
 static int ad5686_spi_remove(struct spi_device *spi)
 {
-	return ad5686_remove(&spi->dev);
+	ad5686_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id ad5686_spi_id[] = {
diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
index fcb64f20ff64..8f001db775f4 100644
--- a/drivers/iio/dac/ad5686.c
+++ b/drivers/iio/dac/ad5686.c
@@ -538,7 +538,7 @@ int ad5686_probe(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(ad5686_probe);
 
-int ad5686_remove(struct device *dev)
+void ad5686_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct ad5686_state *st = iio_priv(indio_dev);
@@ -546,8 +546,6 @@ int ad5686_remove(struct device *dev)
 	iio_device_unregister(indio_dev);
 	if (!IS_ERR(st->reg))
 		regulator_disable(st->reg);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(ad5686_remove);
 
diff --git a/drivers/iio/dac/ad5686.h b/drivers/iio/dac/ad5686.h
index f89a6f92b427..cd5fff9e9d53 100644
--- a/drivers/iio/dac/ad5686.h
+++ b/drivers/iio/dac/ad5686.h
@@ -154,7 +154,7 @@ int ad5686_probe(struct device *dev,
 		 const char *name, ad5686_write_func write,
 		 ad5686_read_func read);
 
-int ad5686_remove(struct device *dev);
+void ad5686_remove(struct device *dev);
 
 
 #endif /* __DRIVERS_IIO_DAC_AD5686_H__ */
diff --git a/drivers/iio/dac/ad5696-i2c.c b/drivers/iio/dac/ad5696-i2c.c
index 24a6a4a5a2e0..93f0e0e66c22 100644
--- a/drivers/iio/dac/ad5696-i2c.c
+++ b/drivers/iio/dac/ad5696-i2c.c
@@ -67,7 +67,9 @@ static int ad5686_i2c_probe(struct i2c_client *i2c,
 
 static int ad5686_i2c_remove(struct i2c_client *i2c)
 {
-	return ad5686_remove(&i2c->dev);
+	ad5686_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id ad5686_i2c_id[] = {
-- 
2.30.2

