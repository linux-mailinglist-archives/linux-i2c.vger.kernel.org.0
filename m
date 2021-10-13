Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE15C42CAF8
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbhJMUeq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhJMUeq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19657C061760
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvT-0007Fh-C2; Wed, 13 Oct 2021 22:32:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvS-0005nk-Qg; Wed, 13 Oct 2021 22:32:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvS-0000R1-Pi; Wed, 13 Oct 2021 22:32:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 15/15] iio: pressure: ms5611: Make ms5611_remove() return void
Date:   Wed, 13 Oct 2021 22:32:23 +0200
Message-Id: <20211013203223.2694577-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=/VRI7wZRmFcSbOjCVUYLGjkMVb4qhYVytXhgnxhlT8M=; m=lxKoKlZVQowk7xdd1hVtcDO/bwfnAO7kAD40An36nNI=; p=ju0qK/fA1FRs/jFLg2Wz1o5GOd25Mp81ZaVaWpejtdo=; g=cc7f8a2b89009abb1f248faa74e93d27afb4a720
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQhcACgkQwfwUeK3K7AkB0Qf/Qnu zJOfEoVx0mmr8M5D+IKq90Afb8WftaM2TnvMcCq0DP1+mV31i8ctCJxCHUTV1csXD49ykUl9M1DLa 0qJLRJuKYpbv01y5ST+i5eG1sdgd93qw01tUSM5L1GTYWkOMN2ZIcF77asKFlJdg3XnOj+qjW8K7z DZyxLyxJr4coCbhkGsK/OiCCBwN5LqXK0cAU3mOu+V6214WjyCHBke0eoNpD8gI7Czgv8lKqbfMik HW9kimL/VCYmS6P6GI+B4qQWDKZe4oA4Av1Sn4C36DMn5lQ3nXW32Ta1UfkxS53P0prdE10TT8yi4 nd43pzSCzoSGcVJ+/f5D3B69RGykE4Q==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now ms5611_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/pressure/ms5611.h      | 2 +-
 drivers/iio/pressure/ms5611_core.c | 4 +---
 drivers/iio/pressure/ms5611_i2c.c  | 4 +++-
 drivers/iio/pressure/ms5611_spi.c  | 4 +++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/pressure/ms5611.h b/drivers/iio/pressure/ms5611.h
index bc06271fa38b..86b1c4b1820d 100644
--- a/drivers/iio/pressure/ms5611.h
+++ b/drivers/iio/pressure/ms5611.h
@@ -61,6 +61,6 @@ struct ms5611_state {
 
 int ms5611_probe(struct iio_dev *indio_dev, struct device *dev,
 		 const char *name, int type);
-int ms5611_remove(struct iio_dev *indio_dev);
+void ms5611_remove(struct iio_dev *indio_dev);
 
 #endif /* _MS5611_H */
diff --git a/drivers/iio/pressure/ms5611_core.c b/drivers/iio/pressure/ms5611_core.c
index 214b0d25f598..ee75f08655c9 100644
--- a/drivers/iio/pressure/ms5611_core.c
+++ b/drivers/iio/pressure/ms5611_core.c
@@ -474,13 +474,11 @@ int ms5611_probe(struct iio_dev *indio_dev, struct device *dev,
 }
 EXPORT_SYMBOL(ms5611_probe);
 
-int ms5611_remove(struct iio_dev *indio_dev)
+void ms5611_remove(struct iio_dev *indio_dev)
 {
 	iio_device_unregister(indio_dev);
 	iio_triggered_buffer_cleanup(indio_dev);
 	ms5611_fini(indio_dev);
-
-	return 0;
 }
 EXPORT_SYMBOL(ms5611_remove);
 
diff --git a/drivers/iio/pressure/ms5611_i2c.c b/drivers/iio/pressure/ms5611_i2c.c
index 7c04f730430c..5c82d80f85b6 100644
--- a/drivers/iio/pressure/ms5611_i2c.c
+++ b/drivers/iio/pressure/ms5611_i2c.c
@@ -110,7 +110,9 @@ static int ms5611_i2c_probe(struct i2c_client *client,
 
 static int ms5611_i2c_remove(struct i2c_client *client)
 {
-	return ms5611_remove(i2c_get_clientdata(client));
+	ms5611_remove(i2c_get_clientdata(client));
+
+	return 0;
 }
 
 static const struct of_device_id ms5611_i2c_matches[] = {
diff --git a/drivers/iio/pressure/ms5611_spi.c b/drivers/iio/pressure/ms5611_spi.c
index 45d3a7d5be8e..79bed64c9b68 100644
--- a/drivers/iio/pressure/ms5611_spi.c
+++ b/drivers/iio/pressure/ms5611_spi.c
@@ -112,7 +112,9 @@ static int ms5611_spi_probe(struct spi_device *spi)
 
 static int ms5611_spi_remove(struct spi_device *spi)
 {
-	return ms5611_remove(spi_get_drvdata(spi));
+	ms5611_remove(spi_get_drvdata(spi));
+
+	return 0;
 }
 
 static const struct of_device_id ms5611_spi_matches[] = {
-- 
2.30.2

