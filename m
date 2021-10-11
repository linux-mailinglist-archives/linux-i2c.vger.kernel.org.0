Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3900E428DE8
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 15:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236929AbhJKNaS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 09:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236912AbhJKNaQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 09:30:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6131C061570
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 06:28:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLZ-0006fk-Rm; Mon, 11 Oct 2021 15:28:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLV-0003nj-Jv; Mon, 11 Oct 2021 15:28:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLV-0000SM-IV; Mon, 11 Oct 2021 15:28:01 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        kernel@pengutronix.de, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH 02/13] hwmon: adt7x10: Make adt7x10_remove() return void
Date:   Mon, 11 Oct 2021 15:27:43 +0200
Message-Id: <20211011132754.2479853-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=9He6IzxzqlwCNrbyaU2x86Wz9NsT7rj1rB/U0CelTbM=; m=sqMkzU6U6DMEQr1FURiCM0wFSKVmXZBD0WH+KO+1n50=; p=rpCXoueXF+/6M5DW7UDuOw4hNFSeIvhyHopZtckbJ3w=; g=2d545779f4e06d7b6e6fcd09bcf283a1e608db9e
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkO2QACgkQwfwUeK3K7AkjnQgAk4b 1Rvls6cwIr+4vW5HtNajvUcDh6lULZQr6IxuFUnLBPRRn1QJTVfZ2ewagA+CZrkJ4IKVmtrbgmyYP c/nbeI7q+g3rwO5zz8bGfVuapP0XDyphhZbYzrPVeRM6LUV5eMjRapmn7oQ6e1liFg7HKwRavTu8E o1dOzdvbynwLKR0JOfqMe+P6UAWz/wqodCr2KYVkwV9lAAYjk1j3Ec8oQSpWtJrsN08alEgOd2Ur2 BkmUvURPWU4JrEx/+s3SdNcdXYC4uNieVSXLY86kQGOqtZuVA4mVniONSeBxEQ03PjwNUy/vTh986 KWM+uKI6ffi0jPn1+VNcnFSUhjsEMpQ==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Up to now adt7x10_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/adt7310.c | 3 ++-
 drivers/hwmon/adt7410.c | 3 ++-
 drivers/hwmon/adt7x10.c | 3 +--
 drivers/hwmon/adt7x10.h | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/adt7310.c b/drivers/hwmon/adt7310.c
index 9fad01191620..c40cac16af68 100644
--- a/drivers/hwmon/adt7310.c
+++ b/drivers/hwmon/adt7310.c
@@ -90,7 +90,8 @@ static int adt7310_spi_probe(struct spi_device *spi)
 
 static int adt7310_spi_remove(struct spi_device *spi)
 {
-	return adt7x10_remove(&spi->dev, spi->irq);
+	adt7x10_remove(&spi->dev, spi->irq);
+	return 0;
 }
 
 static const struct spi_device_id adt7310_id[] = {
diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index 9d80895d0266..973db057427b 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -50,7 +50,8 @@ static int adt7410_i2c_probe(struct i2c_client *client)
 
 static int adt7410_i2c_remove(struct i2c_client *client)
 {
-	return adt7x10_remove(&client->dev, client->irq);
+	adt7x10_remove(&client->dev, client->irq);
+	return 0;
 }
 
 static const struct i2c_device_id adt7410_ids[] = {
diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index 3f03b4cf5858..e9d33aa78a19 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -444,7 +444,7 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 }
 EXPORT_SYMBOL_GPL(adt7x10_probe);
 
-int adt7x10_remove(struct device *dev, int irq)
+void adt7x10_remove(struct device *dev, int irq)
 {
 	struct adt7x10_data *data = dev_get_drvdata(dev);
 
@@ -457,7 +457,6 @@ int adt7x10_remove(struct device *dev, int irq)
 	sysfs_remove_group(&dev->kobj, &adt7x10_group);
 	if (data->oldconfig != data->config)
 		adt7x10_write_byte(dev, ADT7X10_CONFIG, data->oldconfig);
-	return 0;
 }
 EXPORT_SYMBOL_GPL(adt7x10_remove);
 
diff --git a/drivers/hwmon/adt7x10.h b/drivers/hwmon/adt7x10.h
index 21ad15ce3163..a1ae682eb32e 100644
--- a/drivers/hwmon/adt7x10.h
+++ b/drivers/hwmon/adt7x10.h
@@ -26,7 +26,7 @@ struct adt7x10_ops {
 
 int adt7x10_probe(struct device *dev, const char *name, int irq,
 	const struct adt7x10_ops *ops);
-int adt7x10_remove(struct device *dev, int irq);
+void adt7x10_remove(struct device *dev, int irq);
 
 #ifdef CONFIG_PM_SLEEP
 extern const struct dev_pm_ops adt7x10_dev_pm_ops;
-- 
2.30.2

