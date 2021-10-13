Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F8842CAFB
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhJMUer (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbhJMUeq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC52C061762
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0007Eb-Rk; Wed, 13 Oct 2021 22:32:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvQ-0005mS-1Q; Wed, 13 Oct 2021 22:32:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvQ-0000Pg-0R; Wed, 13 Oct 2021 22:32:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 02/15] iio: accel: bmc150: Make bmc150_accel_core_remove() return void
Date:   Wed, 13 Oct 2021 22:32:10 +0200
Message-Id: <20211013203223.2694577-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=NuQ/2prwJlZUSbk5YWEBdpBR2biPcMNKD5aVzW5Uvfk=; m=8dMEYFJx/Fvy0gBbjIys4WnTx/5HPUJMsgL+Jl1IE5g=; p=kVulruz0w8YQqYuVfq1BJbTfnEmyZGiiUhxrivteCT4=; g=92df2cd184b9901d6029b06ac709f84ca42396f2
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQecACgkQwfwUeK3K7AkrUQf9FFO qwGtR0o4RoiJNw4//CZQl2dDLotOVfaojxyxkfaSS1qlyMQaWeWuhzucgb49zi63dVb2dH8oo2eUT du/IYu114woI6626if2UcrZG4/YK2He7IB1yHaUvsQ+oIQlTA0KfY4qCa5I+zrg9fXTRM98X0Q5su mg4T99FoZyG7E9nrgq+S++O07kfIVOAf2/Ld7i8TFn8nDNgxGdRcSmuuWR/Jw31+mySB+YzmjUj9O Qu88wFils1IhHnwrwyhniQ9DVeVDIsTNJ/Kg3PGEUTwSsQhzWZYosBIux/OlGOM1UaEyZaz4aXJIk y4hv3nauVnXkxoJaUBpVCZaA1jJpdmA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now bmc150_accel_core_remove() returns zero unconditionally. Make
it return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/accel/bmc150-accel-core.c | 4 +---
 drivers/iio/accel/bmc150-accel-i2c.c  | 4 +++-
 drivers/iio/accel/bmc150-accel-spi.c  | 4 +++-
 drivers/iio/accel/bmc150-accel.h      | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index e8693a42ad46..590016830a6f 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -1799,7 +1799,7 @@ int bmc150_accel_core_probe(struct device *dev, struct regmap *regmap, int irq,
 }
 EXPORT_SYMBOL_GPL(bmc150_accel_core_probe);
 
-int bmc150_accel_core_remove(struct device *dev)
+void bmc150_accel_core_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct bmc150_accel_data *data = iio_priv(indio_dev);
@@ -1819,8 +1819,6 @@ int bmc150_accel_core_remove(struct device *dev)
 
 	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
 			       data->regulators);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(bmc150_accel_core_remove);
 
diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
index 88bd8a25f142..9e52df9a8f07 100644
--- a/drivers/iio/accel/bmc150-accel-i2c.c
+++ b/drivers/iio/accel/bmc150-accel-i2c.c
@@ -213,7 +213,9 @@ static int bmc150_accel_remove(struct i2c_client *client)
 {
 	bmc150_acpi_dual_accel_remove(client);
 
-	return bmc150_accel_core_remove(&client->dev);
+	bmc150_accel_core_remove(&client->dev);
+
+	return 0;
 }
 
 static const struct acpi_device_id bmc150_accel_acpi_match[] = {
diff --git a/drivers/iio/accel/bmc150-accel-spi.c b/drivers/iio/accel/bmc150-accel-spi.c
index 191e312dc91a..11559567cb39 100644
--- a/drivers/iio/accel/bmc150-accel-spi.c
+++ b/drivers/iio/accel/bmc150-accel-spi.c
@@ -37,7 +37,9 @@ static int bmc150_accel_probe(struct spi_device *spi)
 
 static int bmc150_accel_remove(struct spi_device *spi)
 {
-	return bmc150_accel_core_remove(&spi->dev);
+	bmc150_accel_core_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct acpi_device_id bmc150_accel_acpi_match[] = {
diff --git a/drivers/iio/accel/bmc150-accel.h b/drivers/iio/accel/bmc150-accel.h
index 1bb5023e8ed9..7775c5edaeef 100644
--- a/drivers/iio/accel/bmc150-accel.h
+++ b/drivers/iio/accel/bmc150-accel.h
@@ -88,7 +88,7 @@ struct bmc150_accel_data {
 int bmc150_accel_core_probe(struct device *dev, struct regmap *regmap, int irq,
 			    enum bmc150_type type, const char *name,
 			    bool block_supported);
-int bmc150_accel_core_remove(struct device *dev);
+void bmc150_accel_core_remove(struct device *dev);
 extern const struct dev_pm_ops bmc150_accel_pm_ops;
 extern const struct regmap_config bmc150_regmap_conf;
 
-- 
2.30.2

