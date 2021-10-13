Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A0842CAF4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhJMUeq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhJMUep (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1475DC061746
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0007Ed-Rk; Wed, 13 Oct 2021 22:32:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvQ-0005mY-KQ; Wed, 13 Oct 2021 22:32:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvQ-0000Q2-JR; Wed, 13 Oct 2021 22:32:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 04/15] iio: accel: kxsd9: Make kxsd9_common_remove() return void
Date:   Wed, 13 Oct 2021 22:32:12 +0200
Message-Id: <20211013203223.2694577-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=h76q3cLCdrlpBZzubcejFNmAN+YxeIevTTFn3m/6Iu4=; m=HXOeAuGEz3UmuRmcI6USXlUHzFnswGV/iLrDmebvpqw=; p=C2975iDAPM5S4ZU15ygYhTAmxjGWjEfdkzsUJijEx+8=; g=a31e9c62397b8fd3b0f84d26651bf3370a81cdb8
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQe0ACgkQwfwUeK3K7Akq0wf/fPU oiHD+U/lT7FXjKUpXS4VOhtuEmwLM36vR32DsVPH0iRB4K0Y73LqZHbrZtNqlR+MRP0j9WO8qsGQY x3eV7aVQ6CQKBEnLTtECSCWgHlsvt+SJ0+rb1ZRi2u4kyiAxQ9gfaCXIKn7aCTiLVTb5eOmJCIMno T6O8DmrySns59vBDgY+SzS93sdOhdkyRFi8nSDt+v/h9HbcDuDpJxx14TL4mQ76Ftl/A+efjpI6r6 I3zW/gSB6NQnw8MUOToIH0ejwMAwEWDxeTGwd9QP8ovE1yafOSN4qHQNzVTb0Aw/waOxnyx79oPAJ L7hdreDkZoEsgZfAWccEutxxYLdTZXg==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now kxsd9_common_remove() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/accel/kxsd9-i2c.c | 4 +++-
 drivers/iio/accel/kxsd9-spi.c | 4 +++-
 drivers/iio/accel/kxsd9.c     | 4 +---
 drivers/iio/accel/kxsd9.h     | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/accel/kxsd9-i2c.c b/drivers/iio/accel/kxsd9-i2c.c
index b580d605f848..274b41a6e603 100644
--- a/drivers/iio/accel/kxsd9-i2c.c
+++ b/drivers/iio/accel/kxsd9-i2c.c
@@ -34,7 +34,9 @@ static int kxsd9_i2c_probe(struct i2c_client *i2c,
 
 static int kxsd9_i2c_remove(struct i2c_client *client)
 {
-	return kxsd9_common_remove(&client->dev);
+	kxsd9_common_remove(&client->dev);
+
+	return 0;
 }
 
 static const struct of_device_id kxsd9_of_match[] = {
diff --git a/drivers/iio/accel/kxsd9-spi.c b/drivers/iio/accel/kxsd9-spi.c
index 7971ec1eeb7e..441e6b764281 100644
--- a/drivers/iio/accel/kxsd9-spi.c
+++ b/drivers/iio/accel/kxsd9-spi.c
@@ -34,7 +34,9 @@ static int kxsd9_spi_probe(struct spi_device *spi)
 
 static int kxsd9_spi_remove(struct spi_device *spi)
 {
-	return kxsd9_common_remove(&spi->dev);
+	kxsd9_common_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id kxsd9_spi_id[] = {
diff --git a/drivers/iio/accel/kxsd9.c b/drivers/iio/accel/kxsd9.c
index bf7ed9e7d00f..2faf85ca996e 100644
--- a/drivers/iio/accel/kxsd9.c
+++ b/drivers/iio/accel/kxsd9.c
@@ -478,7 +478,7 @@ int kxsd9_common_probe(struct device *dev,
 }
 EXPORT_SYMBOL(kxsd9_common_probe);
 
-int kxsd9_common_remove(struct device *dev)
+void kxsd9_common_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct kxsd9_state *st = iio_priv(indio_dev);
@@ -489,8 +489,6 @@ int kxsd9_common_remove(struct device *dev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	kxsd9_power_down(st);
-
-	return 0;
 }
 EXPORT_SYMBOL(kxsd9_common_remove);
 
diff --git a/drivers/iio/accel/kxsd9.h b/drivers/iio/accel/kxsd9.h
index 5e3ca212f5be..c04dbfa4e0d0 100644
--- a/drivers/iio/accel/kxsd9.h
+++ b/drivers/iio/accel/kxsd9.h
@@ -8,6 +8,6 @@
 int kxsd9_common_probe(struct device *dev,
 		       struct regmap *map,
 		       const char *name);
-int kxsd9_common_remove(struct device *dev);
+void kxsd9_common_remove(struct device *dev);
 
 extern const struct dev_pm_ops kxsd9_dev_pm_ops;
-- 
2.30.2

