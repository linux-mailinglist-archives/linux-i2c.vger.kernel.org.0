Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC5F42CB0C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhJMUev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhJMUeu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6BDC061749
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makva-0007V8-0v; Wed, 13 Oct 2021 22:32:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvZ-0005ox-F7; Wed, 13 Oct 2021 22:32:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvS-0000Qs-4s; Wed, 13 Oct 2021 22:32:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 12/15] iio: imu: st_lsm9ds0: Make st_lsm9ds0_remove() return void
Date:   Wed, 13 Oct 2021 22:32:20 +0200
Message-Id: <20211013203223.2694577-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=AGeN3Q/SspEn2MoM/pWPCj1QKilHWunS/AuwB8lHJUE=; m=aQQgov2727+jJMLIbWugt+5xwUaxNmBWU2qYBWe9g+0=; p=AVhk4TcHWG+9E/lZnoFWx7WiTReT8KYIL5KdOOGD1rU=; g=2c065251b9b68312a8f2195153169eb00a8981c5
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQgwACgkQwfwUeK3K7Am6UQf/XFw tkypXhwx/2T/31kWq/aroNGe1prZwozqMwxHS05Medkd742cdBHgkQNrOpLJrAYfLxmRfKcOi5lxM LaRXDAcLDZ3ClUKbLK3jDr+7Q2ZV6RQEhBNPxFzkpCpbH6Z2PtB+e4J814yhgK755E0rghMuPU9xx KrnYAeNyFlmn20pztgQde3i4RGLp50lq3csFT7f8+48gbX4vgpcipfDghyjtjRIRRuDY8td3mpyLQ /MzEDEWlil/NmX8uHQrvO0plma58eUPFdDpG6Jflzg3fyibAg4yuRx4zkBuuCtPvbEOM/fYNlsuWf IByyWVUbBkWp3DVBfK32b/U8t3ZL4BQ==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now st_lsm9ds0_remove() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h      | 2 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c | 4 +---
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c  | 4 +++-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c  | 4 +++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h
index 146393afd9a7..3f0b24e9eeea 100644
--- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h
+++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h
@@ -18,6 +18,6 @@ struct st_lsm9ds0 {
 };
 
 int st_lsm9ds0_probe(struct st_lsm9ds0 *lsm9ds0, struct regmap *regmap);
-int st_lsm9ds0_remove(struct st_lsm9ds0 *lsm9ds0);
+void st_lsm9ds0_remove(struct st_lsm9ds0 *lsm9ds0);
 
 #endif /* ST_LSM9DS0_H */
diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c
index 5e6625140db7..bfd7da4353a8 100644
--- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c
+++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c
@@ -150,12 +150,10 @@ int st_lsm9ds0_probe(struct st_lsm9ds0 *lsm9ds0, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(st_lsm9ds0_probe);
 
-int st_lsm9ds0_remove(struct st_lsm9ds0 *lsm9ds0)
+void st_lsm9ds0_remove(struct st_lsm9ds0 *lsm9ds0)
 {
 	st_magn_common_remove(lsm9ds0->magn);
 	st_accel_common_remove(lsm9ds0->accel);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(st_lsm9ds0_remove);
 
diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c
index 78bede358747..e9205b46a4e6 100644
--- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c
+++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c
@@ -66,7 +66,9 @@ static int st_lsm9ds0_i2c_probe(struct i2c_client *client)
 
 static int st_lsm9ds0_i2c_remove(struct i2c_client *client)
 {
-	return st_lsm9ds0_remove(i2c_get_clientdata(client));
+	st_lsm9ds0_remove(i2c_get_clientdata(client));
+
+	return 0;
 }
 
 static struct i2c_driver st_lsm9ds0_driver = {
diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c
index 180b54e66438..c51164c9f151 100644
--- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c
+++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c
@@ -65,7 +65,9 @@ static int st_lsm9ds0_spi_probe(struct spi_device *spi)
 
 static int st_lsm9ds0_spi_remove(struct spi_device *spi)
 {
-	return st_lsm9ds0_remove(spi_get_drvdata(spi));
+	st_lsm9ds0_remove(spi_get_drvdata(spi));
+
+	return 0;
 }
 
 static struct spi_driver st_lsm9ds0_driver = {
-- 
2.30.2

