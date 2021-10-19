Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21403432FD8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 09:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhJSHnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 03:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbhJSHnv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Oct 2021 03:43:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E904AC06161C
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 00:41:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mcjka-0000v2-6B; Tue, 19 Oct 2021 09:41:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mcjkY-0002Tz-Js; Tue, 19 Oct 2021 09:41:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mcjkY-0003bQ-It; Tue, 19 Oct 2021 09:41:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, kernel@pengutronix.de,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH] sound: soc: tlv320aic3x: Make aic3x_remove() return void
Date:   Tue, 19 Oct 2021 09:41:25 +0200
Message-Id: <20211019074125.3812513-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=8w7HYJGqdbQ2kbG1aXspZbTyWRRLPAjmywmDfVm7IYA=; m=PnSaQHMz3IEmULDyb5K8OkLrNaSYGahxv3SwQ4WTGOI=; p=hotap3Y2LDS3qFowdf7lx0zLRrc6B5QEQak9kgN63sU=; g=1da81ec36054ff0ab34683732bddc543160beea0
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFudqEACgkQwfwUeK3K7AmTdgf8DQJ 0uk2BQZFdvyF2Xz5VfiursT8uoSv3l5N+trPg1OlUFH28NpX5TfbJbG9U1dTyYvfBuKLgP0kV1Ct/ lAHWqKMAW34TwuATbcN04cLKnfPUNfsaGftQzmEHEVMXLd6mNWj+HHDTsAcCbyJ09Ia5FQqB1f4Z2 7s/oeIKMYn9wrENnsaooqEbkDpIecefxNZAIa3VV80JtZ1QzI9vR7tVg8z5ledzm3Q1y133NJMsWS amKJvms6bIOTQEkAbdnvxxk8W/RLEQuCcE3VVwNm5l09CPGhgyjaj+7OfUzJCMnpuIPOfwPFhfRm1 paKrfz1WuPr60Q1jYF4Si+xYWfyQemA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now aic3x_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/tlv320aic3x-i2c.c | 4 +++-
 sound/soc/codecs/tlv320aic3x-spi.c | 4 +++-
 sound/soc/codecs/tlv320aic3x.c     | 3 +--
 sound/soc/codecs/tlv320aic3x.h     | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x-i2c.c b/sound/soc/codecs/tlv320aic3x-i2c.c
index cd0558ed4dd4..2f272bc3f5da 100644
--- a/sound/soc/codecs/tlv320aic3x-i2c.c
+++ b/sound/soc/codecs/tlv320aic3x-i2c.c
@@ -32,7 +32,9 @@ static int aic3x_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *i
 
 static int aic3x_i2c_remove(struct i2c_client *i2c)
 {
-	return aic3x_remove(&i2c->dev);
+	aic3x_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id aic3x_i2c_id[] = {
diff --git a/sound/soc/codecs/tlv320aic3x-spi.c b/sound/soc/codecs/tlv320aic3x-spi.c
index 8c7b6bb9223f..494e84402232 100644
--- a/sound/soc/codecs/tlv320aic3x-spi.c
+++ b/sound/soc/codecs/tlv320aic3x-spi.c
@@ -37,7 +37,9 @@ static int aic3x_spi_probe(struct spi_device *spi)
 
 static int aic3x_spi_remove(struct spi_device *spi)
 {
-	return aic3x_remove(&spi->dev);
+	aic3x_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id aic3x_spi_id[] = {
diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 7731593a5509..d53037b1509d 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1870,7 +1870,7 @@ int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver
 }
 EXPORT_SYMBOL(aic3x_probe);
 
-int aic3x_remove(struct device *dev)
+void aic3x_remove(struct device *dev)
 {
 	struct aic3x_priv *aic3x = dev_get_drvdata(dev);
 
@@ -1881,7 +1881,6 @@ int aic3x_remove(struct device *dev)
 		gpio_set_value(aic3x->gpio_reset, 0);
 		gpio_free(aic3x->gpio_reset);
 	}
-	return 0;
 }
 EXPORT_SYMBOL(aic3x_remove);
 
diff --git a/sound/soc/codecs/tlv320aic3x.h b/sound/soc/codecs/tlv320aic3x.h
index 7e0063913017..14298f9e6d9b 100644
--- a/sound/soc/codecs/tlv320aic3x.h
+++ b/sound/soc/codecs/tlv320aic3x.h
@@ -14,7 +14,7 @@ struct regmap_config;
 
 extern const struct regmap_config aic3x_regmap;
 int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver_data);
-int aic3x_remove(struct device *dev);
+void aic3x_remove(struct device *dev);
 
 #define AIC3X_MODEL_3X 0
 #define AIC3X_MODEL_33 1
-- 
2.30.2

