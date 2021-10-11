Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9BF428DEA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 15:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236932AbhJKNaT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 09:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236936AbhJKNaR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 09:30:17 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758E3C061570
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 06:28:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLe-0006z2-IO; Mon, 11 Oct 2021 15:28:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLd-0003pm-Vi; Mon, 11 Oct 2021 15:28:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLW-0000T7-LN; Mon, 11 Oct 2021 15:28:02 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: [PATCH 08/13] mfd: stmpe: Make stmpe_remove() return void
Date:   Mon, 11 Oct 2021 15:27:49 +0200
Message-Id: <20211011132754.2479853-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=SOnI2C3pbw0/O28+bQURH4mfZHs+NU3wIaeoHQEhKVQ=; m=WtM/zIhnsdBjs14lkJxT6oj9lbrAmktyLAk6bUH98nQ=; p=12TNER7mUCvsHC1mdfBXwGyRLzDN5LFZT6ziTZdlCA0=; g=86f514a8b5b16374e79dbf0810b2cbb16248162e
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEyBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkO3YACgkQwfwUeK3K7AnLJgf0CXJ kO3lt9dwzmdwAhoUUdGY6ItzC5+w1ZUdYOQ2UXn/Scg0G/igZPuE017453oaD/7jMPzji8xjBzD3h asxVuFEi5MzewAGHnSzgPLnu4PLKmX718KpGDtUshkqEH2cXNH0PpPJVrCf2mZsh7qRGW4FNbb50M fu58sSGoWPOrvGNjgWU1oFhynzOHXpqYNOMUSYOgM/uQCGNOCj82vjDhu6R3RadP5ye/EhtPzK28f UfTq89346qOjHUNY3IY1vqDNhNLaMVjI0JVuB99NYrRt+6QsIS1n3um6IkAENUoNFpFFExMcrwqzZ +Ac8Ka1M50+aEll3WnfovxhTCdu7e
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now stmpe_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mfd/stmpe-i2c.c | 4 +++-
 drivers/mfd/stmpe-spi.c | 4 +++-
 drivers/mfd/stmpe.c     | 4 +---
 drivers/mfd/stmpe.h     | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index cd2f45257dc1..d3eedf3d607e 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -95,7 +95,9 @@ static int stmpe_i2c_remove(struct i2c_client *i2c)
 {
 	struct stmpe *stmpe = dev_get_drvdata(&i2c->dev);
 
-	return stmpe_remove(stmpe);
+	stmpe_remove(stmpe);
+
+	return 0;
 }
 
 static const struct i2c_device_id stmpe_i2c_id[] = {
diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index 7351734f7593..6c5915016be5 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -106,7 +106,9 @@ static int stmpe_spi_remove(struct spi_device *spi)
 {
 	struct stmpe *stmpe = spi_get_drvdata(spi);
 
-	return stmpe_remove(stmpe);
+	stmpe_remove(stmpe);
+
+	return 0;
 }
 
 static const struct of_device_id stmpe_spi_of_match[] = {
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 58d09c615e67..e928df95e316 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1496,7 +1496,7 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 	return ret;
 }
 
-int stmpe_remove(struct stmpe *stmpe)
+void stmpe_remove(struct stmpe *stmpe)
 {
 	if (!IS_ERR(stmpe->vio))
 		regulator_disable(stmpe->vio);
@@ -1506,8 +1506,6 @@ int stmpe_remove(struct stmpe *stmpe)
 	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);
 
 	mfd_remove_devices(stmpe->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/mfd/stmpe.h b/drivers/mfd/stmpe.h
index 83491e99ba3c..1b4f91d03bbf 100644
--- a/drivers/mfd/stmpe.h
+++ b/drivers/mfd/stmpe.h
@@ -98,7 +98,7 @@ struct stmpe_client_info {
 };
 
 int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum);
-int stmpe_remove(struct stmpe *stmpe);
+void stmpe_remove(struct stmpe *stmpe);
 
 #define STMPE_ICR_LSB_HIGH	(1 << 2)
 #define STMPE_ICR_LSB_EDGE	(1 << 1)
-- 
2.30.2

