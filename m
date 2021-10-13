Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F2542CB13
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhJMUev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhJMUeu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C83CC061746
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makva-0007V7-18; Wed, 13 Oct 2021 22:32:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvZ-0005ow-F7; Wed, 13 Oct 2021 22:32:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvS-0000Qv-A6; Wed, 13 Oct 2021 22:32:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 13/15] iio: magn: hmc5843: Make hmc5843_common_remove() return void
Date:   Wed, 13 Oct 2021 22:32:21 +0200
Message-Id: <20211013203223.2694577-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=paU/w1QXIpfyZf5iT4fUwKWcGWmU2R37xBPi6s/awJc=; m=2RHLehit8bD6KauKwTKxVg4+SWlEmso2JOfDvmhRDNU=; p=Ne4EHfhx5H9IDKJlpD2Q14+cYTs1aWd6MRJ9wLSwHGs=; g=2cd00c7ca4a0bb52b217151104e80e4060fda355
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFnQhAACgkQwfwUeK3K7AlmJgf+Ovc jMf0cNW7YW32p/7nCZR5omrG47EbB9UFm/LzVkgP0vW7KQDbQbAvVZC4S50QFGgNjprNOP5lpW3SP 2wOEAi3berMwEf9XoFTDMpI5Jp+//ba3gq6/arELIDmYjMBOjFW1/Kw+6y5n6k0xEJliDQR9x8/FO KiD3D1bmhK9Gk3r9II90gCRcWOhmIlY4F8sB+4wnvGhbUjencN8T+f0IoPLiG3AP4IFw/FjHvZegE Ejc0HV5ngPUh8IMb+0gCtbDuChJnbseq0y496M+3SNp9dZfP4AkjgjK1yscixOADNlkXCmLyZLi1i rnMcUKmePLBFkhZXjDMcfr/i731V4YA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now hmc5843_common_remove() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/magnetometer/hmc5843.h      | 2 +-
 drivers/iio/magnetometer/hmc5843_core.c | 4 +---
 drivers/iio/magnetometer/hmc5843_i2c.c  | 4 +++-
 drivers/iio/magnetometer/hmc5843_spi.c  | 4 +++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/magnetometer/hmc5843.h b/drivers/iio/magnetometer/hmc5843.h
index 242f742f2643..9120c8bbf3dd 100644
--- a/drivers/iio/magnetometer/hmc5843.h
+++ b/drivers/iio/magnetometer/hmc5843.h
@@ -50,7 +50,7 @@ struct hmc5843_data {
 
 int hmc5843_common_probe(struct device *dev, struct regmap *regmap,
 			 enum hmc5843_ids id, const char *name);
-int hmc5843_common_remove(struct device *dev);
+void hmc5843_common_remove(struct device *dev);
 
 int hmc5843_common_suspend(struct device *dev);
 int hmc5843_common_resume(struct device *dev);
diff --git a/drivers/iio/magnetometer/hmc5843_core.c b/drivers/iio/magnetometer/hmc5843_core.c
index cf62057480cf..f08726bf5ec3 100644
--- a/drivers/iio/magnetometer/hmc5843_core.c
+++ b/drivers/iio/magnetometer/hmc5843_core.c
@@ -671,7 +671,7 @@ int hmc5843_common_probe(struct device *dev, struct regmap *regmap,
 }
 EXPORT_SYMBOL(hmc5843_common_probe);
 
-int hmc5843_common_remove(struct device *dev)
+void hmc5843_common_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 
@@ -680,8 +680,6 @@ int hmc5843_common_remove(struct device *dev)
 
 	/*  sleep mode to save power */
 	hmc5843_set_mode(iio_priv(indio_dev), HMC5843_MODE_SLEEP);
-
-	return 0;
 }
 EXPORT_SYMBOL(hmc5843_common_remove);
 
diff --git a/drivers/iio/magnetometer/hmc5843_i2c.c b/drivers/iio/magnetometer/hmc5843_i2c.c
index 67fe657fdb3e..bc6e12f1d521 100644
--- a/drivers/iio/magnetometer/hmc5843_i2c.c
+++ b/drivers/iio/magnetometer/hmc5843_i2c.c
@@ -67,7 +67,9 @@ static int hmc5843_i2c_probe(struct i2c_client *cli,
 
 static int hmc5843_i2c_remove(struct i2c_client *client)
 {
-	return hmc5843_common_remove(&client->dev);
+	hmc5843_common_remove(&client->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id hmc5843_id[] = {
diff --git a/drivers/iio/magnetometer/hmc5843_spi.c b/drivers/iio/magnetometer/hmc5843_spi.c
index d827554c346e..89cf59a62c28 100644
--- a/drivers/iio/magnetometer/hmc5843_spi.c
+++ b/drivers/iio/magnetometer/hmc5843_spi.c
@@ -76,7 +76,9 @@ static int hmc5843_spi_probe(struct spi_device *spi)
 
 static int hmc5843_spi_remove(struct spi_device *spi)
 {
-	return hmc5843_common_remove(&spi->dev);
+	hmc5843_common_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id hmc5843_id[] = {
-- 
2.30.2

