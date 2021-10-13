Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EAA42CAFE
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhJMUes (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbhJMUeq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C1AC061764
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0007Ea-Rk; Wed, 13 Oct 2021 22:32:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvP-0005mP-Rd; Wed, 13 Oct 2021 22:32:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvP-0000PT-Qc; Wed, 13 Oct 2021 22:32:31 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dan Robertson <dan@dlrobertson.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 01/15] iio: accel: bma400: Make bma400_remove() return void
Date:   Wed, 13 Oct 2021 22:32:09 +0200
Message-Id: <20211013203223.2694577-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=QDczYyDphxvNKuXRKH2cXRiwEymS2yx7zD2QDdltpDY=; m=EVbJFOAF9NcXAqYAleGmigQ0K+gdvn31BWzuJBFugts=; p=NmtA8Cu03zX3c9tRKfuJhxpHhzh4EPweZzxm9x9G5q4=; g=0e6f11aabf39ac1d141a3d3136583348dc3e7329
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQeMACgkQwfwUeK3K7Al58QgAjm/ +g1Nb6c3gOtnnUOCtKpbqsby7PZL9bAFA/m10afBG3DXDLzBsqPvNcUor7x1T7hqF5gQ9v9vOUGJ8 PEHxOJVotFPynnC0/GGWmW/DjoI4u/oo4lNedGI3D1oY4z8IYKCQCkP2ShB6bvjZE3ashoJLinDd8 GK1R7Co101huqd85UFbhAQx+NY1gOS0yoH4eyGLc3CmvVMGkEz86K1WvpicYfa/gzXBShOp3mbV0L sxrmbgGIPwj3eIDkdZdVXB9FVxCuQxXkdhJ/Q3W1X/gXugPGaIM0wcl0PVkoforRgMO60NuG3K5Xz kpCPSytBTd4de8cn0cNEtywWAFOQVZw==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When an i2c or spi driver's remove function returns a non-zero error
code nothing happens apart from emitting a generic error message. Make
this error message more device specific and return zero instead in the
remove callbacks. As the return value of bma400_remove() is unused then,
change the function to not yield a return value.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/accel/bma400.h      | 2 +-
 drivers/iio/accel/bma400_core.c | 7 ++++---
 drivers/iio/accel/bma400_i2c.c  | 4 +++-
 drivers/iio/accel/bma400_spi.c  | 4 +++-
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/accel/bma400.h b/drivers/iio/accel/bma400.h
index 5ad10db9819f..c4c8d74155c2 100644
--- a/drivers/iio/accel/bma400.h
+++ b/drivers/iio/accel/bma400.h
@@ -94,6 +94,6 @@ extern const struct regmap_config bma400_regmap_config;
 
 int bma400_probe(struct device *dev, struct regmap *regmap, const char *name);
 
-int bma400_remove(struct device *dev);
+void bma400_remove(struct device *dev);
 
 #endif
diff --git a/drivers/iio/accel/bma400_core.c b/drivers/iio/accel/bma400_core.c
index 21520e022a21..fd2647b728d3 100644
--- a/drivers/iio/accel/bma400_core.c
+++ b/drivers/iio/accel/bma400_core.c
@@ -828,7 +828,7 @@ int bma400_probe(struct device *dev, struct regmap *regmap, const char *name)
 }
 EXPORT_SYMBOL(bma400_probe);
 
-int bma400_remove(struct device *dev)
+void bma400_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct bma400_data *data = iio_priv(indio_dev);
@@ -838,12 +838,13 @@ int bma400_remove(struct device *dev)
 	ret = bma400_set_power_mode(data, POWER_MODE_SLEEP);
 	mutex_unlock(&data->mutex);
 
+	if (ret)
+		dev_warn(dev, "Failed to put device into sleep mode (%pe)\n", ERR_PTR(ret));
+
 	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
 			       data->regulators);
 
 	iio_device_unregister(indio_dev);
-
-	return ret;
 }
 EXPORT_SYMBOL(bma400_remove);
 
diff --git a/drivers/iio/accel/bma400_i2c.c b/drivers/iio/accel/bma400_i2c.c
index 9dcb7cc9996e..f50df5310beb 100644
--- a/drivers/iio/accel/bma400_i2c.c
+++ b/drivers/iio/accel/bma400_i2c.c
@@ -29,7 +29,9 @@ static int bma400_i2c_probe(struct i2c_client *client,
 
 static int bma400_i2c_remove(struct i2c_client *client)
 {
-	return bma400_remove(&client->dev);
+	bma400_remove(&client->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id bma400_i2c_ids[] = {
diff --git a/drivers/iio/accel/bma400_spi.c b/drivers/iio/accel/bma400_spi.c
index 7c2825904e08..9f622e37477b 100644
--- a/drivers/iio/accel/bma400_spi.c
+++ b/drivers/iio/accel/bma400_spi.c
@@ -89,7 +89,9 @@ static int bma400_spi_probe(struct spi_device *spi)
 
 static int bma400_spi_remove(struct spi_device *spi)
 {
-	return bma400_remove(&spi->dev);
+	bma400_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id bma400_spi_ids[] = {
-- 
2.30.2

