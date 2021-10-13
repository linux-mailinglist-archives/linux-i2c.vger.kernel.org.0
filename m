Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC5142CB14
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhJMUew (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhJMUev (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1382BC061746
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvZ-0007US-8H; Wed, 13 Oct 2021 22:32:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvY-0005oP-Md; Wed, 13 Oct 2021 22:32:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0000QZ-HT; Wed, 13 Oct 2021 22:32:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 09/15] iio: dac: ad5592r: Make ad5592r_remove() return void
Date:   Wed, 13 Oct 2021 22:32:17 +0200
Message-Id: <20211013203223.2694577-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=Tc0S2KgSSkaHRAcszXJfnWtq65U89mWihJ1mue6Poe0=; m=LLhHna2OrOwN99U0Ikry2eSET5FRcHGecp02QdELNCU=; p=eYtBPEKNDkicMqJXP7QUINA5rBoAh8d1+wNf4qokILE=; g=80b9323d3cfccbff2624264d0a2490ca703ddf1b
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQgEACgkQwfwUeK3K7AmX+Qf/ZmK 9Ho+m5e1geUguqTp1/j13w0I3yIDo2ir6PbAwETrNek7gr7SywKfK4FWuHtuUZgjtOAFQ0Qncg1Zk nD7fGjT8iArfkg2k5OHI4p38TpGRTq8xz7nqeZuLSDJt0lKfBOUrlkgwK+H2CU7mPdLthBOPSuEda kMuWEcVaG4cBHmdBYRRzaaJkE7GhhxwGRlDza6Nl8OsOgF8fqrSYvQB4lufQ9pNNrI411vqtz0M9H +3bDM3W87HKWhOIUch+XAnJxmohDZWLxLxlhZN58AEpMdaQ8Fk8dQd/+3RPp7wvCXj9C6xC3mpMvH Y9p+RXPjaTmE1XGtW7LSJnavk57OUlQ==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now ad5592r_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/dac/ad5592r-base.c | 4 +---
 drivers/iio/dac/ad5592r-base.h | 2 +-
 drivers/iio/dac/ad5592r.c      | 4 +++-
 drivers/iio/dac/ad5593r.c      | 4 +++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index 0405e92b9e8c..2fcc59728fd6 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -663,7 +663,7 @@ int ad5592r_probe(struct device *dev, const char *name,
 }
 EXPORT_SYMBOL_GPL(ad5592r_probe);
 
-int ad5592r_remove(struct device *dev)
+void ad5592r_remove(struct device *dev)
 {
 	struct iio_dev *iio_dev = dev_get_drvdata(dev);
 	struct ad5592r_state *st = iio_priv(iio_dev);
@@ -674,8 +674,6 @@ int ad5592r_remove(struct device *dev)
 
 	if (st->reg)
 		regulator_disable(st->reg);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(ad5592r_remove);
 
diff --git a/drivers/iio/dac/ad5592r-base.h b/drivers/iio/dac/ad5592r-base.h
index 23dac2f1ff8a..2a22ef691996 100644
--- a/drivers/iio/dac/ad5592r-base.h
+++ b/drivers/iio/dac/ad5592r-base.h
@@ -71,6 +71,6 @@ struct ad5592r_state {
 
 int ad5592r_probe(struct device *dev, const char *name,
 		const struct ad5592r_rw_ops *ops);
-int ad5592r_remove(struct device *dev);
+void ad5592r_remove(struct device *dev);
 
 #endif /* __DRIVERS_IIO_DAC_AD5592R_BASE_H__ */
diff --git a/drivers/iio/dac/ad5592r.c b/drivers/iio/dac/ad5592r.c
index 41f651500668..6bfd7951e18c 100644
--- a/drivers/iio/dac/ad5592r.c
+++ b/drivers/iio/dac/ad5592r.c
@@ -132,7 +132,9 @@ static int ad5592r_spi_probe(struct spi_device *spi)
 
 static int ad5592r_spi_remove(struct spi_device *spi)
 {
-	return ad5592r_remove(&spi->dev);
+	ad5592r_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id ad5592r_spi_ids[] = {
diff --git a/drivers/iio/dac/ad5593r.c b/drivers/iio/dac/ad5593r.c
index 5b4df36fdc2a..64dd7a0bddf7 100644
--- a/drivers/iio/dac/ad5593r.c
+++ b/drivers/iio/dac/ad5593r.c
@@ -99,7 +99,9 @@ static int ad5593r_i2c_probe(struct i2c_client *i2c,
 
 static int ad5593r_i2c_remove(struct i2c_client *i2c)
 {
-	return ad5592r_remove(&i2c->dev);
+	ad5592r_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id ad5593r_i2c_ids[] = {
-- 
2.30.2

