Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 211D3428DE5
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 15:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236923AbhJKNaR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 09:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbhJKNaP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 09:30:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480E0C061765
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 06:28:15 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLe-0006yo-07; Mon, 11 Oct 2021 15:28:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLd-0003pj-F3; Mon, 11 Oct 2021 15:28:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLW-0000Sr-4a; Mon, 11 Oct 2021 15:28:02 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH 05/13] input: touchscreen: tsc200x: Make tsc200x_remove() return void
Date:   Mon, 11 Oct 2021 15:27:46 +0200
Message-Id: <20211011132754.2479853-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=94oorPupYOLS40HYKqyvmBk6HGvbhR+NJnei2QkNFGk=; m=Bsn3NLP3I1exqSpvJBONKOIhA7oOcADEshibx4agNIQ=; p=pfDzld1kjXGNTuCg/DNXdU4bD3Xm44quPdj0xm7SBC8=; g=3fd084dde6e3a61bb5b183e8fae7e15d39e30268
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkO20ACgkQwfwUeK3K7Amzkgf5ASo oSCTj/dU5/QgTvYkfmqc2eevnCHw+IvejFJcMSgiEqRkeRQenBqaZvk9nniufgAb3S084j/fCSTNM gno/H0HVEvrG/DTPiimXeXoGROWuFiiXwIoUJLotuDigqG/qTVTMA8cUJAu/vlNu2h3FGUWTRaxci NBUy288B3wxjGiyykwyxJSOBfnY5GEOeOPCipP5KfoFbwiAHiEi7v9ST67brq8VTwsAStz81cl+QS aYnP+MlIamKLEeLpSjuJ4jBEzyGWFDmsoWJuHmDafXqV12Oq0BR5ZIlYiCAWJeJat7Ul8Oe1QF8Vr 4EVWpW3gMf3cmFTLirPtTWjxGeokLUg==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now tsc200x_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/touchscreen/tsc2004.c      | 4 +++-
 drivers/input/touchscreen/tsc2005.c      | 4 +++-
 drivers/input/touchscreen/tsc200x-core.c | 4 +---
 drivers/input/touchscreen/tsc200x-core.h | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2004.c b/drivers/input/touchscreen/tsc2004.c
index 0272cedcc726..9fdd870c4c0b 100644
--- a/drivers/input/touchscreen/tsc2004.c
+++ b/drivers/input/touchscreen/tsc2004.c
@@ -45,7 +45,9 @@ static int tsc2004_probe(struct i2c_client *i2c,
 
 static int tsc2004_remove(struct i2c_client *i2c)
 {
-	return tsc200x_remove(&i2c->dev);
+	tsc200x_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id tsc2004_idtable[] = {
diff --git a/drivers/input/touchscreen/tsc2005.c b/drivers/input/touchscreen/tsc2005.c
index 923496bbb368..edaa4afbaab4 100644
--- a/drivers/input/touchscreen/tsc2005.c
+++ b/drivers/input/touchscreen/tsc2005.c
@@ -66,7 +66,9 @@ static int tsc2005_probe(struct spi_device *spi)
 
 static int tsc2005_remove(struct spi_device *spi)
 {
-	return tsc200x_remove(&spi->dev);
+	tsc200x_remove(&spi->dev);
+
+	return 0
 }
 
 #ifdef CONFIG_OF
diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index b8d720d52013..27810f6c69f6 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -577,15 +577,13 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 }
 EXPORT_SYMBOL_GPL(tsc200x_probe);
 
-int tsc200x_remove(struct device *dev)
+void tsc200x_remove(struct device *dev)
 {
 	struct tsc200x *ts = dev_get_drvdata(dev);
 
 	sysfs_remove_group(&dev->kobj, &tsc200x_attr_group);
 
 	regulator_disable(ts->vio);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(tsc200x_remove);
 
diff --git a/drivers/input/touchscreen/tsc200x-core.h b/drivers/input/touchscreen/tsc200x-core.h
index a43c08ccfd3d..4ded34425b21 100644
--- a/drivers/input/touchscreen/tsc200x-core.h
+++ b/drivers/input/touchscreen/tsc200x-core.h
@@ -74,6 +74,6 @@ extern const struct dev_pm_ops tsc200x_pm_ops;
 int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 		  struct regmap *regmap,
 		  int (*tsc200x_cmd)(struct device *dev, u8 cmd));
-int tsc200x_remove(struct device *dev);
+void tsc200x_remove(struct device *dev);
 
 #endif
-- 
2.30.2

