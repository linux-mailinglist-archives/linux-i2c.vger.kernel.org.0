Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF22A428DCE
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 15:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236889AbhJKNaL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 09:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235413AbhJKNaK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 09:30:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31BFC06161C
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 06:28:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLZ-0006fm-Rm; Mon, 11 Oct 2021 15:28:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLV-0003np-VQ; Mon, 11 Oct 2021 15:28:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLV-0000Si-Ub; Mon, 11 Oct 2021 15:28:01 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        kernel@pengutronix.de, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: [PATCH 04/13] input: adxl34xx: Make adxl34x_remove() return void
Date:   Mon, 11 Oct 2021 15:27:45 +0200
Message-Id: <20211011132754.2479853-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=wc1dQ8068Cu8i6oLG4jCUQi32w4OqgSEom4N8oawnTg=; m=Z35zEqGg82zhKujZki3WXSREWKfbS0aTa8UkTMklTJg=; p=QT+3ZtPBPblOHahXh7QoMrpcjZbKAO38bG2mksoUihY=; g=d0f6a150c9b3211526c2456a0a1697e753433591
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkO2oACgkQwfwUeK3K7Amjfwf+INL 5+mM7MZTzfOIOy9XQt1fxv/W6wejE3GeQOE8M0jdUI2dIcGIyHeApTUiE+s8MclhhUJdDl9dT8E0+ +NdMpx2wTOKlbDktuRhtM+90n8J1z8UIeV/31ZRPPRLQnbb1CgxEbxHCf6BqflDApcgHVJ35Kgzrx Np91kEU8L7OfMqarf/fDeeBWSli19tjLRCzqJbeYCXRNoc07AKM/osbTEFXRVhrYiYECUgTK4VyLu +/ziJVCAJyioAQzjGEi56XaI5x3smZS3Scpg6rReG1TBrpB1pnEtb9A8wpA09ksxBhGzzACvO1obN TP9l1yUCTxn13jobBbW9YCEHzJ4gLtg==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now adxl34x_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/misc/adxl34x-i2c.c | 4 +++-
 drivers/input/misc/adxl34x-spi.c | 4 +++-
 drivers/input/misc/adxl34x.c     | 4 +---
 drivers/input/misc/adxl34x.h     | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34x-i2c.c
index e64368a63346..a3b5f88d2bd1 100644
--- a/drivers/input/misc/adxl34x-i2c.c
+++ b/drivers/input/misc/adxl34x-i2c.c
@@ -103,7 +103,9 @@ static int adxl34x_i2c_remove(struct i2c_client *client)
 {
 	struct adxl34x *ac = i2c_get_clientdata(client);
 
-	return adxl34x_remove(ac);
+	adxl34x_remove(ac);
+
+	return 0;
 }
 
 static int __maybe_unused adxl34x_i2c_suspend(struct device *dev)
diff --git a/drivers/input/misc/adxl34x-spi.c b/drivers/input/misc/adxl34x-spi.c
index df6afa455e46..6e51c9bc619f 100644
--- a/drivers/input/misc/adxl34x-spi.c
+++ b/drivers/input/misc/adxl34x-spi.c
@@ -91,7 +91,9 @@ static int adxl34x_spi_remove(struct spi_device *spi)
 {
 	struct adxl34x *ac = spi_get_drvdata(spi);
 
-	return adxl34x_remove(ac);
+	adxl34x_remove(ac);
+
+	return 0;
 }
 
 static int __maybe_unused adxl34x_spi_suspend(struct device *dev)
diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index 4cc4e8ff42b3..34beac80e6f0 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -896,15 +896,13 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 }
 EXPORT_SYMBOL_GPL(adxl34x_probe);
 
-int adxl34x_remove(struct adxl34x *ac)
+void adxl34x_remove(struct adxl34x *ac)
 {
 	sysfs_remove_group(&ac->dev->kobj, &adxl34x_attr_group);
 	free_irq(ac->irq, ac);
 	input_unregister_device(ac->input);
 	dev_dbg(ac->dev, "unregistered accelerometer\n");
 	kfree(ac);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(adxl34x_remove);
 
diff --git a/drivers/input/misc/adxl34x.h b/drivers/input/misc/adxl34x.h
index 83a0eeccf613..febf85270fff 100644
--- a/drivers/input/misc/adxl34x.h
+++ b/drivers/input/misc/adxl34x.h
@@ -25,6 +25,6 @@ void adxl34x_resume(struct adxl34x *ac);
 struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 			      bool fifo_delay_default,
 			      const struct adxl34x_bus_ops *bops);
-int adxl34x_remove(struct adxl34x *ac);
+void adxl34x_remove(struct adxl34x *ac);
 
 #endif
-- 
2.30.2

