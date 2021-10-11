Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2FA2428DE2
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 15:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236919AbhJKNaQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 09:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236924AbhJKNaP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 09:30:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B906C06174E
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 06:28:15 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLb-0006hT-FC; Mon, 11 Oct 2021 15:28:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLa-0003pW-K2; Mon, 11 Oct 2021 15:28:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLX-0000TT-I2; Mon, 11 Oct 2021 15:28:03 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Jason Gunthorpe <jgg@ziepe.ca>, kernel@pengutronix.de,
        linux-integrity@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: [PATCH 13/13] tpm: st33zp24: Make st33zp24_remove() return void
Date:   Mon, 11 Oct 2021 15:27:54 +0200
Message-Id: <20211011132754.2479853-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=2RfjlQngpYVdDmF7/sh7VSPt9aAaxh1F9oCTWbtcFaI=; m=YmvLiK47JXRlSzLFzxqwlRAcg9TrPiYd49fSIG4963c=; p=J4sUOjxlatUSZp6KZXQHP7X5Nt2PutSw8I364wwqzYo=; g=fcea7ec8c956ac6a1c9afce0aa9705bb0fa52453
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkO4UACgkQwfwUeK3K7AlUIwf/atw 1vHUc2x10B24gV5mm7WzFEHz2GSF02GivDWJEaPLAPuONjpAXLnN8SZno3395W48ObCVk0L24PP+Y 1HJu2qPsQJOLqU69z94vZm1JfSwVfaUZ0Wl7NGyCrWNotVqEr1d9jl0pPuIUmvr/d3K6qALqc2fQG pMbeTEvlPbzecrx/JwsHWlrFVD5FB6gWRkME3DlN9johP7hRAdfA52dp7giA6XwulZO/j5zeoCufw DfXTedCXk0QSmxGfB1Dp3Ot1ZIEce09+NzggcU1DQ5ROqsC6ReAp48jTNE69bgZfl124AMva3/b4E 1nnBMR8oHlb/dlM0gf7+96cJk176haQ==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now st33zp24_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/char/tpm/st33zp24/i2c.c      | 5 +----
 drivers/char/tpm/st33zp24/spi.c      | 5 +----
 drivers/char/tpm/st33zp24/st33zp24.c | 3 +--
 drivers/char/tpm/st33zp24/st33zp24.h | 2 +-
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/char/tpm/st33zp24/i2c.c b/drivers/char/tpm/st33zp24/i2c.c
index 7c617edff4ca..3170d59d660c 100644
--- a/drivers/char/tpm/st33zp24/i2c.c
+++ b/drivers/char/tpm/st33zp24/i2c.c
@@ -267,11 +267,8 @@ static int st33zp24_i2c_probe(struct i2c_client *client,
 static int st33zp24_i2c_remove(struct i2c_client *client)
 {
 	struct tpm_chip *chip = i2c_get_clientdata(client);
-	int ret;
 
-	ret = st33zp24_remove(chip);
-	if (ret)
-		return ret;
+	st33zp24_remove(chip);
 
 	return 0;
 }
diff --git a/drivers/char/tpm/st33zp24/spi.c b/drivers/char/tpm/st33zp24/spi.c
index a75dafd39445..ccd9e42b8eab 100644
--- a/drivers/char/tpm/st33zp24/spi.c
+++ b/drivers/char/tpm/st33zp24/spi.c
@@ -384,11 +384,8 @@ static int st33zp24_spi_probe(struct spi_device *dev)
 static int st33zp24_spi_remove(struct spi_device *dev)
 {
 	struct tpm_chip *chip = spi_get_drvdata(dev);
-	int ret;
 
-	ret = st33zp24_remove(chip);
-	if (ret)
-		return ret;
+	st33zp24_remove(chip);
 
 	return 0;
 }
diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
index 4ec10ab5e576..2b63654c38d6 100644
--- a/drivers/char/tpm/st33zp24/st33zp24.c
+++ b/drivers/char/tpm/st33zp24/st33zp24.c
@@ -588,10 +588,9 @@ EXPORT_SYMBOL(st33zp24_probe);
  * @param: tpm_data, the tpm phy.
  * @return: 0 in case of success.
  */
-int st33zp24_remove(struct tpm_chip *chip)
+void st33zp24_remove(struct tpm_chip *chip)
 {
 	tpm_chip_unregister(chip);
-	return 0;
 }
 EXPORT_SYMBOL(st33zp24_remove);
 
diff --git a/drivers/char/tpm/st33zp24/st33zp24.h b/drivers/char/tpm/st33zp24/st33zp24.h
index 6747be1e2502..b387a476c555 100644
--- a/drivers/char/tpm/st33zp24/st33zp24.h
+++ b/drivers/char/tpm/st33zp24/st33zp24.h
@@ -34,5 +34,5 @@ int st33zp24_pm_resume(struct device *dev);
 
 int st33zp24_probe(void *phy_id, const struct st33zp24_phy_ops *ops,
 		   struct device *dev, int irq, int io_lpcpd);
-int st33zp24_remove(struct tpm_chip *chip);
+void st33zp24_remove(struct tpm_chip *chip);
 #endif /* __LOCAL_ST33ZP24_H__ */
-- 
2.30.2

