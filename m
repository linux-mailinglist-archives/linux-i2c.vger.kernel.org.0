Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E35A42CB05
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhJMUet (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhJMUer (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206FFC061764
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvU-0007IC-Qf; Wed, 13 Oct 2021 22:32:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvU-0005nw-0y; Wed, 13 Oct 2021 22:32:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvQ-0000QQ-VO; Wed, 13 Oct 2021 22:32:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 06/15] iio: accel: ad5064: Make ad5064_core_remove() return void
Date:   Wed, 13 Oct 2021 22:32:14 +0200
Message-Id: <20211013203223.2694577-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=wALG4gz7iqyUvwiTn3Je59AipFj3jq2HLGDkJBMKnos=; m=h1tkDeOfl4YaLT3aOB/5yD/xhKvZDwH7eKg7/DHHYwM=; p=e74TrROuU6T6V9lnkyiudHD8P8opoQJc7TvaaUz2mxw=; g=0f6a0b9c50fa16e50189537d670916018d7daa2c
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQfQACgkQwfwUeK3K7Altgwf/XJw GVG0dOpYsB/nTd4t7baFIotjtNKa2sGk6lTJkdROyWkKSRtKaE0b4Lqv2AROxDZMfTqT/XJfcGrRU 21u7A+eVM8tZVHYOa6AS00aNIMW37HlN6K+ik8yT4uSzg3rgzN0f6S+Zxx5uOIRmrZNLzwpqieNT3 /qQYbBnzykQhoPfXGiyW1GktyOeWwV1xppLMj3S+4hYq2UOiY5e72kJjT33er5fzJMsrQEyKqY7vw xehLNjuRUbB9v0kuH9AogppdnR0WmA2hsxRrwkY2dhCNnGFjWMmD30rtR0MufKuyBCAvriTWSpIm5 nriFPK2yMfOFIRtbKgsszR4R6jxbh5Q==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now ad5064_core_remove() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/dac/ad5064.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/dac/ad5064.c b/drivers/iio/dac/ad5064.c
index dff623b65e4f..6f66796942c0 100644
--- a/drivers/iio/dac/ad5064.c
+++ b/drivers/iio/dac/ad5064.c
@@ -900,7 +900,7 @@ static int ad5064_probe(struct device *dev, enum ad5064_type type,
 	return ret;
 }
 
-static int ad5064_remove(struct device *dev)
+static void ad5064_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct ad5064_state *st = iio_priv(indio_dev);
@@ -909,8 +909,6 @@ static int ad5064_remove(struct device *dev)
 
 	if (!st->use_internal_vref)
 		regulator_bulk_disable(ad5064_num_vref(st), st->vref_reg);
-
-	return 0;
 }
 
 #if IS_ENABLED(CONFIG_SPI_MASTER)
@@ -934,7 +932,9 @@ static int ad5064_spi_probe(struct spi_device *spi)
 
 static int ad5064_spi_remove(struct spi_device *spi)
 {
-	return ad5064_remove(&spi->dev);
+	ad5064_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id ad5064_spi_ids[] = {
@@ -1021,7 +1021,9 @@ static int ad5064_i2c_probe(struct i2c_client *i2c,
 
 static int ad5064_i2c_remove(struct i2c_client *i2c)
 {
-	return ad5064_remove(&i2c->dev);
+	ad5064_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id ad5064_i2c_ids[] = {
-- 
2.30.2

