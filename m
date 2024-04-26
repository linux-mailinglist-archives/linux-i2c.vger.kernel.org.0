Return-Path: <linux-i2c+bounces-3243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558A8B416E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 23:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46657B224DD
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 21:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECB7374FF;
	Fri, 26 Apr 2024 21:38:52 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D51C37141
	for <linux-i2c@vger.kernel.org>; Fri, 26 Apr 2024 21:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167532; cv=none; b=GftPPJp1OiGh/LiFFEh9nimpBcm5u0mPYTGQAMmAlQWVmMAhVu5Tw6NIXgBYfplznIdRWW0e+oH2N1C+4FW8+Y9FvOXrV6x95TWNg2jgvHmDV12XgBbpkA9qHsnjEjLp2lUQ+VTxvokYK8Bs+drCzKk0JksYs0IPl1nDzU4tmt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167532; c=relaxed/simple;
	bh=U/JMucBl1OA4+ET1aS0/TAPkPX09IS748hFBLVX4Ta0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l9+SWIdYRivCpSBfppyVkpBEt+n0+YWZjdEyzlN2Yng0zXN9PZZhaBqEchkcbGlWM4jIAV2HajmNV3kQzwcbgv0e/lIS81BX94M4HGI6P1otPz0NHhzC/plq0vlxvw8CTxcvQKQ1YlnxyJDFQQ0wdwc2Z6l/hfCgkF8lJb1gOKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s0THB-0007oq-KL; Fri, 26 Apr 2024 23:38:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s0THA-00EVsF-Kl; Fri, 26 Apr 2024 23:38:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s0THA-009e6N-1m;
	Fri, 26 Apr 2024 23:38:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH RFC] i2c: Add a void pointer to i2c_device_id
Date: Fri, 26 Apr 2024 23:38:33 +0200
Message-ID: <20240426213832.915485-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8541; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=U/JMucBl1OA4+ET1aS0/TAPkPX09IS748hFBLVX4Ta0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmLB7Z+28QBqJkNbTQXmOX9FWVKB4hREumeznf1 Jlr1/ARaH2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZiwe2QAKCRCPgPtYfRL+ Tk7kCACiA9iZJS7dWplG6rWUhKJvxeEV584md1Nfmrtw7GwWTkmSWT2U9yAGM3suwgWu/hS8J+m C3hg5bZOC/fuaJ8jnoDY27D7vnwkx04zqUnMOBZ4NbZI1KsVpefsmpUUKdAyBIXwp3KGDPD7f9v Kw7pJci57pvYUlfX9A85FAN6KfYAN38Yf/8Gqqaq6lkLhNj16rXcxqgDq/AS/TlBJ5KQ7panlEv ua5XxD5jce+69vh992gpa03ruEcvz27rSIeLRjZ5V5Fot5LxvYSPschvDy82Vs+8qzQNNx8FVBR 8d5Jok+ZNlTu8qIzuepAKfFL7LYZFk1s8Mim85+0SqhuvRYH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Traditionally a struct i2c_device_id has a kernel_ulong_t member to
store some chip variant data. Some drivers use it to store an enum,
others to store a pointer. In the latter case there is some ugly(?)
casting involved. To improve that, add a void pointer in an anonymous
union together with the integer driver_data.

This way a i2c_device_id requires usage of a designated initializer when
the driver_data or data member should be initialized, but IMHO that's
fine and you might even consider that an advantage.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I faked a base commit hash to hopefully confuse the auto build bots
enough to not send build reports. This patch isn't complete, quite a
few more drivers would need adaption.
I only converted a few to have a showcase to collect feedback if others
consider this a nice idea, too.

I shuffled the order of hunks to have the most interesting ones at the
top. The first change implements the modification to i2c_device_id. The
next drops cast in the i2c core and the following two show how drivers
that use integer and pointer values respectively can benefit.

There is an annoying amount of drivers that use

 static const struct i2c_device_id mydriver_i2c_id[] = {
	{ "chipname", 0 },
 	{ }
 };

and which is broken with this patch. These would all have to be touched,
probably dropping the ", 0".

Do you like the idea? If the feedback is mostly positive, I'd start
tackling this quest, probably by first preparing the affected drivers by
dropping explitit zeros as above and/or using a designated initializer.

A possible continuation is to apply the same idea to all the other
${subsystem}_device_id structs.

Best regards
Uwe

 include/linux/mod_devicetable.h          |  5 ++++-
 drivers/i2c/i2c-core-base.c              |  2 +-
 sound/soc/codecs/tas571x.c               | 12 ++++++------
 sound/soc/codecs/tlv320aic31xx.c         | 16 ++++++++--------
 arch/arm/mach-s3c/mach-crag6410-module.c |  2 +-
 drivers/pwm/pwm-pca9685.c                |  2 +-
 sound/soc/codecs/nau8825.c               |  2 +-
 sound/soc/codecs/rt1015.c                |  2 +-
 sound/soc/codecs/rt5682-i2c.c            |  2 +-
 sound/soc/codecs/src4xxx-i2c.c           |  2 +-
 sound/soc/codecs/tas2764.c               |  2 +-
 11 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 7a9a07ea451b..f7e51c142a64 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -477,7 +477,10 @@ struct rpmsg_device_id {
 
 struct i2c_device_id {
 	char name[I2C_NAME_SIZE];
-	kernel_ulong_t driver_data;	/* Data private to the driver */
+	union {
+		kernel_ulong_t driver_data;	/* Data private to the driver */
+		const void *data;
+	};
 };
 
 /* pci_epf */
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ff5c486a1dbb..ccabc71d0041 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -129,7 +129,7 @@ const void *i2c_get_match_data(const struct i2c_client *client)
 		if (!match)
 			return NULL;
 
-		data = (const void *)match->driver_data;
+		data = match->data;
 	}
 
 	return data;
diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index f249e93e2a4e..0fde0111c0e2 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -949,12 +949,12 @@ static const struct of_device_id tas571x_of_match[] __maybe_unused = {
 MODULE_DEVICE_TABLE(of, tas571x_of_match);
 
 static const struct i2c_device_id tas571x_i2c_id[] = {
-	{ "tas5707", (kernel_ulong_t) &tas5707_chip },
-	{ "tas5711", (kernel_ulong_t) &tas5711_chip },
-	{ "tas5717", (kernel_ulong_t) &tas5717_chip },
-	{ "tas5719", (kernel_ulong_t) &tas5717_chip },
-	{ "tas5721", (kernel_ulong_t) &tas5721_chip },
-	{ "tas5733", (kernel_ulong_t) &tas5733_chip },
+	{ .name = "tas5707", .data = &tas5707_chip },
+	{ .name = "tas5711", .data = &tas5711_chip },
+	{ .name = "tas5717", .data = &tas5717_chip },
+	{ .name = "tas5719", .data = &tas5717_chip },
+	{ .name = "tas5721", .data = &tas5721_chip },
+	{ .name = "tas5733", .data = &tas5733_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas571x_i2c_id);
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 4d7c5a80c6ed..ed78cb549ace 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1627,14 +1627,14 @@ static void aic31xx_configure_ocmv(struct aic31xx_priv *priv)
 }
 
 static const struct i2c_device_id aic31xx_i2c_id[] = {
-	{ "tlv320aic310x", AIC3100 },
-	{ "tlv320aic311x", AIC3110 },
-	{ "tlv320aic3100", AIC3100 },
-	{ "tlv320aic3110", AIC3110 },
-	{ "tlv320aic3120", AIC3120 },
-	{ "tlv320aic3111", AIC3111 },
-	{ "tlv320dac3100", DAC3100 },
-	{ "tlv320dac3101", DAC3101 },
+	{ .name = "tlv320aic310x", .driver_data = AIC3100 },
+	{ .name = "tlv320aic311x", .driver_data = AIC3110 },
+	{ .name = "tlv320aic3100", .driver_data = AIC3100 },
+	{ .name = "tlv320aic3110", .driver_data = AIC3110 },
+	{ .name = "tlv320aic3120", .driver_data = AIC3120 },
+	{ .name = "tlv320aic3111", .driver_data = AIC3111 },
+	{ .name = "tlv320dac3100", .driver_data = DAC3100 },
+	{ .name = "tlv320dac3101", .driver_data = DAC3101 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aic31xx_i2c_id);
diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 2de1a89f6e99..5d320a767f0d 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -446,7 +446,7 @@ static int wlf_gf_module_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wlf_gf_module_id[] = {
-	{ "wlf-gf-module", 0 },
+	{ "wlf-gf-module", },
 	{ }
 };
 
diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index c5da2a6ed846..15b3481caf72 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -634,7 +634,7 @@ static int __maybe_unused pca9685_pwm_runtime_resume(struct device *dev)
 }
 
 static const struct i2c_device_id pca9685_id[] = {
-	{ "pca9685", 0 },
+	{ "pca9685", },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(i2c, pca9685_id);
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index cd30ad649bae..bde25bc6909d 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2934,7 +2934,7 @@ static void nau8825_i2c_remove(struct i2c_client *client)
 {}
 
 static const struct i2c_device_id nau8825_i2c_ids[] = {
-	{ "nau8825", 0 },
+	{ "nau8825" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8825_i2c_ids);
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 1250cfaf2adc..0f806dde9c39 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1097,7 +1097,7 @@ static const struct regmap_config rt1015_regmap = {
 };
 
 static const struct i2c_device_id rt1015_i2c_id[] = {
-	{ "rt1015", 0 },
+	{ "rt1015" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1015_i2c_id);
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 62f26ce9d476..ff9e14fad0cd 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -318,7 +318,7 @@ static const struct acpi_device_id rt5682_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rt5682_acpi_match);
 
 static const struct i2c_device_id rt5682_i2c_id[] = {
-	{"rt5682", 0},
+	{"rt5682"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, rt5682_i2c_id);
diff --git a/sound/soc/codecs/src4xxx-i2c.c b/sound/soc/codecs/src4xxx-i2c.c
index 93af8e209b05..55f00ce7c718 100644
--- a/sound/soc/codecs/src4xxx-i2c.c
+++ b/sound/soc/codecs/src4xxx-i2c.c
@@ -19,7 +19,7 @@ static int src4xxx_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id src4xxx_i2c_ids[] = {
-	{ "src4392", 0 },
+	{ "src4392" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, src4xxx_i2c_ids);
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index a9838e0738cc..c7eab3289430 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -738,7 +738,7 @@ static int tas2764_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tas2764_i2c_id[] = {
-	{ "tas2764", 0},
+	{ "tas2764" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2764_i2c_id);

base-commit: 6e4f84f18c4ee9b0ccdc19e39b7de41df21699dd
-- 
2.43.0


