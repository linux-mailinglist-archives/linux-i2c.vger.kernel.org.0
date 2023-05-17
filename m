Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B47707503
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 00:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjEQWCb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 18:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjEQWC2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 18:02:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC09A40CE
        for <linux-i2c@vger.kernel.org>; Wed, 17 May 2023 15:02:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzPDS-0000hg-Vd; Thu, 18 May 2023 00:01:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzPDM-000wDY-9S; Thu, 18 May 2023 00:01:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzPDL-005TXx-Dv; Thu, 18 May 2023 00:01:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jean Delvare <jdelvare@suse.com>,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Justin Stitt <justinstitt@google.com>,
        Yuan Can <yuancan@huawei.com>,
        Dan Carpenter <error27@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Machata <petrm@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH] misc: Switch i2c drivers back to use .probe()
Date:   Thu, 18 May 2023 00:01:35 +0200
Message-Id: <20230517220135.170379-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8842; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=weNhufFH3Y4bWFSxn3YPkrBd6c89tUFafI/ObkzG2sU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZU69ZGChmdWXv1JU/zJOI6/KhO2/TGpURd45O PcfXpKyTFaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVOvQAKCRCPgPtYfRL+ Tv2SB/9VNQV5pyAHSi8MFncRlMsjGBspr3DiNBdPD3bh0ebj6Idx0SQ+CDPXfWzOQKmUF1e2STc OyrQpQnWQMqyPLRxmaiyTQKJHbh9o2OkK6tUWm4SLThySnIPpxGtDf2nhRmvobc1HfLI+82254O QpK7okcyTnBhE2q00Xu0k+X1L/cbYxlivhwOUM3Kn4+RdQOyUL78un54TgCOx1x2jI/XpNHeB4X GxucP3RmQcAsztjB9WpuPUx5nAx2hEkX/0k/JPp1dq8LBM3BwqIrC7ShwfwkzK6E6r7XrjPUtVE DF61zGpwVEg59HVJTUlKQCBp3OzagKF9HZDGS8G6uwwb46CX
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

While touching these drivers, fix alignment in apds990x.c and bh1770glc.c.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I used v6.4-rc1 as base for this patch, but it also fits on top of
today's next master. If there are some conflicts when you apply it, feel
free to just drop all conflicting hunks, I'll care about the fallout
later.

I chose to do this in a single patch for all drivers below drivers/misc
If you want me to split it, just tell me.

Best regards
Uwe

 drivers/misc/ad525x_dpot-i2c.c         | 2 +-
 drivers/misc/apds9802als.c             | 2 +-
 drivers/misc/apds990x.c                | 4 ++--
 drivers/misc/bh1770glc.c               | 4 ++--
 drivers/misc/ds1682.c                  | 2 +-
 drivers/misc/eeprom/at24.c             | 2 +-
 drivers/misc/eeprom/ee1004.c           | 2 +-
 drivers/misc/eeprom/eeprom.c           | 2 +-
 drivers/misc/eeprom/idt_89hpesx.c      | 2 +-
 drivers/misc/eeprom/max6875.c          | 2 +-
 drivers/misc/hmc6352.c                 | 2 +-
 drivers/misc/ics932s401.c              | 2 +-
 drivers/misc/isl29003.c                | 2 +-
 drivers/misc/isl29020.c                | 2 +-
 drivers/misc/lis3lv02d/lis3lv02d_i2c.c | 2 +-
 drivers/misc/tsl2550.c                 | 2 +-
 16 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/misc/ad525x_dpot-i2c.c b/drivers/misc/ad525x_dpot-i2c.c
index 3856d5c04c5f..469478f7a1d3 100644
--- a/drivers/misc/ad525x_dpot-i2c.c
+++ b/drivers/misc/ad525x_dpot-i2c.c
@@ -106,7 +106,7 @@ static struct i2c_driver ad_dpot_i2c_driver = {
 	.driver = {
 		.name	= "ad_dpot",
 	},
-	.probe_new	= ad_dpot_i2c_probe,
+	.probe		= ad_dpot_i2c_probe,
 	.remove		= ad_dpot_i2c_remove,
 	.id_table	= ad_dpot_id,
 };
diff --git a/drivers/misc/apds9802als.c b/drivers/misc/apds9802als.c
index 0526c55d5cd5..693f0e539f37 100644
--- a/drivers/misc/apds9802als.c
+++ b/drivers/misc/apds9802als.c
@@ -296,7 +296,7 @@ static struct i2c_driver apds9802als_driver = {
 		.name = DRIVER_NAME,
 		.pm = APDS9802ALS_PM_OPS,
 	},
-	.probe_new = apds9802als_probe,
+	.probe = apds9802als_probe,
 	.remove = apds9802als_remove,
 	.id_table = apds9802als_id,
 };
diff --git a/drivers/misc/apds990x.c b/drivers/misc/apds990x.c
index 0024503ea6db..92b92be91d60 100644
--- a/drivers/misc/apds990x.c
+++ b/drivers/misc/apds990x.c
@@ -1267,11 +1267,11 @@ static const struct dev_pm_ops apds990x_pm_ops = {
 };
 
 static struct i2c_driver apds990x_driver = {
-	.driver	 = {
+	.driver	  = {
 		.name	= "apds990x",
 		.pm	= &apds990x_pm_ops,
 	},
-	.probe_new = apds990x_probe,
+	.probe    = apds990x_probe,
 	.remove	  = apds990x_remove,
 	.id_table = apds990x_id,
 };
diff --git a/drivers/misc/bh1770glc.c b/drivers/misc/bh1770glc.c
index bedbe0efb330..1629b62fd052 100644
--- a/drivers/misc/bh1770glc.c
+++ b/drivers/misc/bh1770glc.c
@@ -1374,11 +1374,11 @@ static const struct dev_pm_ops bh1770_pm_ops = {
 };
 
 static struct i2c_driver bh1770_driver = {
-	.driver	 = {
+	.driver	  = {
 		.name	= "bh1770glc",
 		.pm	= &bh1770_pm_ops,
 	},
-	.probe_new = bh1770_probe,
+	.probe    = bh1770_probe,
 	.remove	  = bh1770_remove,
 	.id_table = bh1770_id,
 };
diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
index d517eed32971..21fc5bc85c5c 100644
--- a/drivers/misc/ds1682.c
+++ b/drivers/misc/ds1682.c
@@ -250,7 +250,7 @@ static struct i2c_driver ds1682_driver = {
 		.name = "ds1682",
 		.of_match_table = ds1682_of_match,
 	},
-	.probe_new = ds1682_probe,
+	.probe = ds1682_probe,
 	.remove = ds1682_remove,
 	.id_table = ds1682_id,
 };
diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 938c4f41b98c..d93fbb1cb43e 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -832,7 +832,7 @@ static struct i2c_driver at24_driver = {
 		.of_match_table = at24_of_match,
 		.acpi_match_table = ACPI_PTR(at24_acpi_ids),
 	},
-	.probe_new = at24_probe,
+	.probe = at24_probe,
 	.remove = at24_remove,
 	.id_table = at24_ids,
 	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
index c8c6deb7ed89..a1acd77130f2 100644
--- a/drivers/misc/eeprom/ee1004.c
+++ b/drivers/misc/eeprom/ee1004.c
@@ -234,7 +234,7 @@ static struct i2c_driver ee1004_driver = {
 		.name = "ee1004",
 		.dev_groups = ee1004_groups,
 	},
-	.probe_new = ee1004_probe,
+	.probe = ee1004_probe,
 	.remove = ee1004_remove,
 	.id_table = ee1004_ids,
 };
diff --git a/drivers/misc/eeprom/eeprom.c b/drivers/misc/eeprom/eeprom.c
index 32611100d5cd..ccb7c2f7ee2f 100644
--- a/drivers/misc/eeprom/eeprom.c
+++ b/drivers/misc/eeprom/eeprom.c
@@ -196,7 +196,7 @@ static struct i2c_driver eeprom_driver = {
 	.driver = {
 		.name	= "eeprom",
 	},
-	.probe_new	= eeprom_probe,
+	.probe		= eeprom_probe,
 	.remove		= eeprom_remove,
 	.id_table	= eeprom_id,
 
diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
index 7075d0b37881..740c06382b83 100644
--- a/drivers/misc/eeprom/idt_89hpesx.c
+++ b/drivers/misc/eeprom/idt_89hpesx.c
@@ -1556,7 +1556,7 @@ static struct i2c_driver idt_driver = {
 		.name = IDT_NAME,
 		.of_match_table = idt_of_match,
 	},
-	.probe_new = idt_probe,
+	.probe = idt_probe,
 	.remove = idt_remove,
 	.id_table = idt_ids,
 };
diff --git a/drivers/misc/eeprom/max6875.c b/drivers/misc/eeprom/max6875.c
index 79cf8afcef2e..cb6b1efeafe0 100644
--- a/drivers/misc/eeprom/max6875.c
+++ b/drivers/misc/eeprom/max6875.c
@@ -192,7 +192,7 @@ static struct i2c_driver max6875_driver = {
 	.driver = {
 		.name	= "max6875",
 	},
-	.probe_new	= max6875_probe,
+	.probe		= max6875_probe,
 	.remove		= max6875_remove,
 	.id_table	= max6875_id,
 };
diff --git a/drivers/misc/hmc6352.c b/drivers/misc/hmc6352.c
index 8967940ecd1e..759eaeb64307 100644
--- a/drivers/misc/hmc6352.c
+++ b/drivers/misc/hmc6352.c
@@ -131,7 +131,7 @@ static struct i2c_driver hmc6352_driver = {
 	.driver = {
 		.name = "hmc6352",
 	},
-	.probe_new = hmc6352_probe,
+	.probe = hmc6352_probe,
 	.remove = hmc6352_remove,
 	.id_table = hmc6352_id,
 };
diff --git a/drivers/misc/ics932s401.c b/drivers/misc/ics932s401.c
index 12108a7b9b40..ee6296b98078 100644
--- a/drivers/misc/ics932s401.c
+++ b/drivers/misc/ics932s401.c
@@ -105,7 +105,7 @@ static struct i2c_driver ics932s401_driver = {
 	.driver = {
 		.name	= "ics932s401",
 	},
-	.probe_new	= ics932s401_probe,
+	.probe		= ics932s401_probe,
 	.remove		= ics932s401_remove,
 	.id_table	= ics932s401_id,
 	.detect		= ics932s401_detect,
diff --git a/drivers/misc/isl29003.c b/drivers/misc/isl29003.c
index 147b58f7968d..ebf0635aee64 100644
--- a/drivers/misc/isl29003.c
+++ b/drivers/misc/isl29003.c
@@ -459,7 +459,7 @@ static struct i2c_driver isl29003_driver = {
 		.name	= ISL29003_DRV_NAME,
 		.pm	= ISL29003_PM_OPS,
 	},
-	.probe_new = isl29003_probe,
+	.probe = isl29003_probe,
 	.remove	= isl29003_remove,
 	.id_table = isl29003_id,
 };
diff --git a/drivers/misc/isl29020.c b/drivers/misc/isl29020.c
index 3be02093368c..c5976fa8c825 100644
--- a/drivers/misc/isl29020.c
+++ b/drivers/misc/isl29020.c
@@ -214,7 +214,7 @@ static struct i2c_driver isl29020_driver = {
 		.name = "isl29020",
 		.pm = ISL29020_PM_OPS,
 	},
-	.probe_new = isl29020_probe,
+	.probe = isl29020_probe,
 	.remove = isl29020_remove,
 	.id_table = isl29020_id,
 };
diff --git a/drivers/misc/lis3lv02d/lis3lv02d_i2c.c b/drivers/misc/lis3lv02d/lis3lv02d_i2c.c
index 7071412d6bf6..3882e97e96a7 100644
--- a/drivers/misc/lis3lv02d/lis3lv02d_i2c.c
+++ b/drivers/misc/lis3lv02d/lis3lv02d_i2c.c
@@ -262,7 +262,7 @@ static struct i2c_driver lis3lv02d_i2c_driver = {
 		.pm     = &lis3_pm_ops,
 		.of_match_table = of_match_ptr(lis3lv02d_i2c_dt_ids),
 	},
-	.probe_new = lis3lv02d_i2c_probe,
+	.probe = lis3lv02d_i2c_probe,
 	.remove	= lis3lv02d_i2c_remove,
 	.id_table = lis3lv02d_id,
 };
diff --git a/drivers/misc/tsl2550.c b/drivers/misc/tsl2550.c
index 6c62b94e0acd..a3bc2823143e 100644
--- a/drivers/misc/tsl2550.c
+++ b/drivers/misc/tsl2550.c
@@ -437,7 +437,7 @@ static struct i2c_driver tsl2550_driver = {
 		.of_match_table = tsl2550_of_match,
 		.pm	= TSL2550_PM_OPS,
 	},
-	.probe_new = tsl2550_probe,
+	.probe = tsl2550_probe,
 	.remove	= tsl2550_remove,
 	.id_table = tsl2550_id,
 };

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

