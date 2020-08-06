Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0FF23E159
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 20:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725272AbgHFSo4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 14:44:56 -0400
Received: from 2.mo177.mail-out.ovh.net ([178.33.109.80]:38718 "EHLO
        2.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgHFSoz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 14:44:55 -0400
X-Greylist: delayed 4197 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Aug 2020 14:44:46 EDT
Received: from player787.ha.ovh.net (unknown [10.110.103.121])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id 25631139A67
        for <linux-i2c@vger.kernel.org>; Thu,  6 Aug 2020 18:17:01 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player787.ha.ovh.net (Postfix) with ESMTPSA id 6B4AC153DDFC7;
        Thu,  6 Aug 2020 16:16:56 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-103G005ebd5d218-b482-4ccf-aed0-089f45a1c0de,
                    9D5F4B8471F7AF6BEF45141B8B52B4DEEC6DEFE4) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH] hwmon/pmbus: use simple i2c probe function
Date:   Thu,  6 Aug 2020 18:16:45 +0200
Message-Id: <20200806161645.9437-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3241747309955337486
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeetgedugfelkeeikeetgeegteevfeeufeetuefgudeiiedthfehtdeffeekvdeffeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pmbus_do_probe doesn't use the id information provided in its second
argument, so this can be removed, which then allows using the
single-parameter i2c probe function ("probe_new") for probes which
don't use the id information either.

This avoids scanning the identifier tables during probes.

Additionally, in cases where the id information (driver_data) isn't
used, the corresponding declarations are removed from the id_table,
and .name is specified explicitly.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/hwmon/pmbus/bel-pfe.c      |  2 +-
 drivers/hwmon/pmbus/ibm-cffps.c    |  2 +-
 drivers/hwmon/pmbus/inspur-ipsps.c |  9 ++++-----
 drivers/hwmon/pmbus/ir35221.c      |  9 ++++-----
 drivers/hwmon/pmbus/ir38064.c      |  9 ++++-----
 drivers/hwmon/pmbus/irps5401.c     |  9 ++++-----
 drivers/hwmon/pmbus/isl68137.c     |  2 +-
 drivers/hwmon/pmbus/lm25066.c      |  2 +-
 drivers/hwmon/pmbus/ltc2978.c      |  2 +-
 drivers/hwmon/pmbus/ltc3815.c      |  9 ++++-----
 drivers/hwmon/pmbus/max16064.c     |  9 ++++-----
 drivers/hwmon/pmbus/max16601.c     |  9 ++++-----
 drivers/hwmon/pmbus/max20730.c     |  2 +-
 drivers/hwmon/pmbus/max20751.c     |  9 ++++-----
 drivers/hwmon/pmbus/max31785.c     | 13 ++++++-------
 drivers/hwmon/pmbus/max34440.c     |  2 +-
 drivers/hwmon/pmbus/max8688.c      |  9 ++++-----
 drivers/hwmon/pmbus/pmbus.c        |  2 +-
 drivers/hwmon/pmbus/pmbus.h        |  3 +--
 drivers/hwmon/pmbus/pmbus_core.c   |  3 +--
 drivers/hwmon/pmbus/pxe1610.c      | 13 ++++++-------
 drivers/hwmon/pmbus/tps40422.c     |  9 ++++-----
 drivers/hwmon/pmbus/tps53679.c     |  2 +-
 drivers/hwmon/pmbus/ucd9000.c      |  2 +-
 drivers/hwmon/pmbus/ucd9200.c      |  2 +-
 drivers/hwmon/pmbus/xdpe12284.c    | 11 +++++------
 drivers/hwmon/pmbus/zl6100.c       |  2 +-
 27 files changed, 71 insertions(+), 86 deletions(-)

diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
index f236e18f45a5..240d86043d75 100644
--- a/drivers/hwmon/pmbus/bel-pfe.c
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -104,7 +104,7 @@ static int pfe_pmbus_probe(struct i2c_client *client,
 		i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
 	}
 
-	return pmbus_do_probe(client, id, &pfe_driver_info[model]);
+	return pmbus_do_probe(client, &pfe_driver_info[model]);
 }
 
 static const struct i2c_device_id pfe_device_id[] = {
diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 7d300f2f338d..0215e792ec7e 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -519,7 +519,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	}
 
 	client->dev.platform_data = &ibm_cffps_pdata;
-	rc = pmbus_do_probe(client, id, &ibm_cffps_info[vs]);
+	rc = pmbus_do_probe(client, &ibm_cffps_info[vs]);
 	if (rc)
 		return rc;
 
diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index 42e01549184a..b97848e05ae2 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -190,15 +190,14 @@ static struct pmbus_platform_data ipsps_pdata = {
 	.flags = PMBUS_SKIP_STATUS_CHECK,
 };
 
-static int ipsps_probe(struct i2c_client *client,
-		       const struct i2c_device_id *id)
+static int ipsps_probe(struct i2c_client *client)
 {
 	client->dev.platform_data = &ipsps_pdata;
-	return pmbus_do_probe(client, id, &ipsps_info);
+	return pmbus_do_probe(client, &ipsps_info);
 }
 
 static const struct i2c_device_id ipsps_id[] = {
-	{ "ipsps1", 0 },
+	{ .name = "ipsps1" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ipsps_id);
@@ -216,7 +215,7 @@ static struct i2c_driver ipsps_driver = {
 		.name = "inspur-ipsps",
 		.of_match_table = of_match_ptr(ipsps_of_match),
 	},
-	.probe = ipsps_probe,
+	.probe_new = ipsps_probe,
 	.remove = pmbus_do_remove,
 	.id_table = ipsps_id,
 };
diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index 3eea3e006a96..e7fabafca2f1 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -67,8 +67,7 @@ static int ir35221_read_word_data(struct i2c_client *client, int page,
 	return ret;
 }
 
-static int ir35221_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int ir35221_probe(struct i2c_client *client)
 {
 	struct pmbus_driver_info *info;
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
@@ -123,11 +122,11 @@ static int ir35221_probe(struct i2c_client *client,
 		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP;
 	info->func[1] = info->func[0];
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id ir35221_id[] = {
-	{"ir35221", 0},
+	{ .name = "ir35221" },
 	{}
 };
 
@@ -137,7 +136,7 @@ static struct i2c_driver ir35221_driver = {
 	.driver = {
 		.name	= "ir35221",
 	},
-	.probe		= ir35221_probe,
+	.probe_new	= ir35221_probe,
 	.remove		= pmbus_do_remove,
 	.id_table	= ir35221_id,
 };
diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 1820f5077f66..a36ab6cc21d7 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -35,14 +35,13 @@ static struct pmbus_driver_info ir38064_info = {
 	    | PMBUS_HAVE_POUT,
 };
 
-static int ir38064_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int ir38064_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, id, &ir38064_info);
+	return pmbus_do_probe(client, &ir38064_info);
 }
 
 static const struct i2c_device_id ir38064_id[] = {
-	{"ir38064", 0},
+	{ .name = "ir38064" },
 	{}
 };
 
@@ -53,7 +52,7 @@ static struct i2c_driver ir38064_driver = {
 	.driver = {
 		   .name = "ir38064",
 		   },
-	.probe = ir38064_probe,
+	.probe_new = ir38064_probe,
 	.remove = pmbus_do_remove,
 	.id_table = ir38064_id,
 };
diff --git a/drivers/hwmon/pmbus/irps5401.c b/drivers/hwmon/pmbus/irps5401.c
index d37daa001fb3..828b91567137 100644
--- a/drivers/hwmon/pmbus/irps5401.c
+++ b/drivers/hwmon/pmbus/irps5401.c
@@ -38,14 +38,13 @@ static struct pmbus_driver_info irps5401_info = {
 	.func[4] = IRPS5401_LDO_FUNC,
 };
 
-static int irps5401_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int irps5401_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, id, &irps5401_info);
+	return pmbus_do_probe(client, &irps5401_info);
 }
 
 static const struct i2c_device_id irps5401_id[] = {
-	{"irps5401", 0},
+	{ .name = "irps5401" },
 	{}
 };
 
@@ -55,7 +54,7 @@ static struct i2c_driver irps5401_driver = {
 	.driver = {
 		   .name = "irps5401",
 		   },
-	.probe = irps5401_probe,
+	.probe_new = irps5401_probe,
 	.remove = pmbus_do_remove,
 	.id_table = irps5401_id,
 };
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 0c622711ef7e..2d626ccbc11d 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -262,7 +262,7 @@ static int isl68137_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id raa_dmpvr_id[] = {
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 9e4cf0800186..2d28cddc365f 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -487,7 +487,7 @@ static int lm25066_probe(struct i2c_client *client,
 		info->b[PSC_POWER] = coeff[PSC_POWER].b;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id lm25066_id[] = {
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 7b0e6b37e247..da6832094676 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -832,7 +832,7 @@ static int ltc2978_probe(struct i2c_client *client,
 	}
 #endif
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 
diff --git a/drivers/hwmon/pmbus/ltc3815.c b/drivers/hwmon/pmbus/ltc3815.c
index 3036263e0a66..0a02fbac127a 100644
--- a/drivers/hwmon/pmbus/ltc3815.c
+++ b/drivers/hwmon/pmbus/ltc3815.c
@@ -143,7 +143,7 @@ static int ltc3815_write_word_data(struct i2c_client *client, int page,
 }
 
 static const struct i2c_device_id ltc3815_id[] = {
-	{"ltc3815", 0},
+	{ .name = "ltc3815" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc3815_id);
@@ -178,8 +178,7 @@ static struct pmbus_driver_info ltc3815_info = {
 	.write_word_data = ltc3815_write_word_data,
 };
 
-static int ltc3815_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int ltc3815_probe(struct i2c_client *client)
 {
 	int chip_id;
 
@@ -193,14 +192,14 @@ static int ltc3815_probe(struct i2c_client *client,
 	if ((chip_id & LTC3815_ID_MASK) != LTC3815_ID)
 		return -ENODEV;
 
-	return pmbus_do_probe(client, id, &ltc3815_info);
+	return pmbus_do_probe(client, &ltc3815_info);
 }
 
 static struct i2c_driver ltc3815_driver = {
 	.driver = {
 		   .name = "ltc3815",
 		   },
-	.probe = ltc3815_probe,
+	.probe_new = ltc3815_probe,
 	.remove = pmbus_do_remove,
 	.id_table = ltc3815_id,
 };
diff --git a/drivers/hwmon/pmbus/max16064.c b/drivers/hwmon/pmbus/max16064.c
index 288e93f74c28..e0efc7f6879d 100644
--- a/drivers/hwmon/pmbus/max16064.c
+++ b/drivers/hwmon/pmbus/max16064.c
@@ -85,14 +85,13 @@ static struct pmbus_driver_info max16064_info = {
 	.write_word_data = max16064_write_word_data,
 };
 
-static int max16064_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int max16064_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, id, &max16064_info);
+	return pmbus_do_probe(client, &max16064_info);
 }
 
 static const struct i2c_device_id max16064_id[] = {
-	{"max16064", 0},
+	{ .name = "max16064" },
 	{}
 };
 
@@ -103,7 +102,7 @@ static struct i2c_driver max16064_driver = {
 	.driver = {
 		   .name = "max16064",
 		   },
-	.probe = max16064_probe,
+	.probe_new = max16064_probe,
 	.remove = pmbus_do_remove,
 	.id_table = max16064_id,
 };
diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index 51cdfaf9023c..0d4049c29f9c 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -239,8 +239,7 @@ static void max16601_remove(void *_data)
 	i2c_unregister_device(data->vsa);
 }
 
-static int max16601_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int max16601_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
@@ -288,11 +287,11 @@ static int max16601_probe(struct i2c_client *client,
 
 	data->info = max16601_info;
 
-	return pmbus_do_probe(client, id, &data->info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max16601_id[] = {
-	{"max16601", 0},
+	{ .name = "max16601" },
 	{}
 };
 
@@ -302,7 +301,7 @@ static struct i2c_driver max16601_driver = {
 	.driver = {
 		   .name = "max16601",
 		   },
-	.probe = max16601_probe,
+	.probe_new = max16601_probe,
 	.remove = pmbus_do_remove,
 	.id_table = max16601_id,
 };
diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index c0bb05487e0e..0abcef2ac649 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -335,7 +335,7 @@ static int max20730_probe(struct i2c_client *client,
 		return ret;
 	data->mfr_devset1 = ret;
 
-	return pmbus_do_probe(client, id, &data->info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max20730_id[] = {
diff --git a/drivers/hwmon/pmbus/max20751.c b/drivers/hwmon/pmbus/max20751.c
index da3c38cb9a5c..8ab666969a77 100644
--- a/drivers/hwmon/pmbus/max20751.c
+++ b/drivers/hwmon/pmbus/max20751.c
@@ -26,14 +26,13 @@ static struct pmbus_driver_info max20751_info = {
 		PMBUS_HAVE_POUT,
 };
 
-static int max20751_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int max20751_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, id, &max20751_info);
+	return pmbus_do_probe(client, &max20751_info);
 }
 
 static const struct i2c_device_id max20751_id[] = {
-	{"max20751", 0},
+	{ .name = "max20751" },
 	{}
 };
 
@@ -43,7 +42,7 @@ static struct i2c_driver max20751_driver = {
 	.driver = {
 		   .name = "max20751",
 		   },
-	.probe = max20751_probe,
+	.probe_new = max20751_probe,
 	.remove = pmbus_do_remove,
 	.id_table = max20751_id,
 };
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index d9aa5c873d21..3e77c79f3f42 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -324,8 +324,7 @@ static int max31785_configure_dual_tach(struct i2c_client *client,
 	return 0;
 }
 
-static int max31785_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int max31785_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
@@ -354,7 +353,7 @@ static int max31785_probe(struct i2c_client *client,
 	if (ret == MAX31785A) {
 		dual_tach = true;
 	} else if (ret == MAX31785) {
-		if (!strcmp("max31785a", id->name))
+		if (!strcmp("max31785a", client->name))
 			dev_warn(dev, "Expected max3175a, found max31785: cannot provide secondary tachometer readings\n");
 	} else {
 		return -ENODEV;
@@ -366,12 +365,12 @@ static int max31785_probe(struct i2c_client *client,
 			return ret;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id max31785_id[] = {
-	{ "max31785", 0 },
-	{ "max31785a", 0 },
+	{ .name = "max31785" },
+	{ .name = "max31785a" },
 	{ },
 };
 
@@ -390,7 +389,7 @@ static struct i2c_driver max31785_driver = {
 		.name = "max31785",
 		.of_match_table = max31785_of_match,
 	},
-	.probe = max31785_probe,
+	.probe_new = max31785_probe,
 	.remove = pmbus_do_remove,
 	.id_table = max31785_id,
 };
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 18b4e071067f..0205983bd51f 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -480,7 +480,7 @@ static int max34440_probe(struct i2c_client *client,
 			return rv;
 	}
 
-	return pmbus_do_probe(client, id, &data->info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max34440_id[] = {
diff --git a/drivers/hwmon/pmbus/max8688.c b/drivers/hwmon/pmbus/max8688.c
index 643ccfc05106..2efce192e6af 100644
--- a/drivers/hwmon/pmbus/max8688.c
+++ b/drivers/hwmon/pmbus/max8688.c
@@ -165,14 +165,13 @@ static struct pmbus_driver_info max8688_info = {
 	.write_word_data = max8688_write_word_data,
 };
 
-static int max8688_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int max8688_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, id, &max8688_info);
+	return pmbus_do_probe(client, &max8688_info);
 }
 
 static const struct i2c_device_id max8688_id[] = {
-	{"max8688", 0},
+	{ .name = "max8688" },
 	{ }
 };
 
@@ -183,7 +182,7 @@ static struct i2c_driver max8688_driver = {
 	.driver = {
 		   .name = "max8688",
 		   },
-	.probe = max8688_probe,
+	.probe_new = max8688_probe,
 	.remove = pmbus_do_remove,
 	.id_table = max8688_id,
 };
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 6d384e8ee1db..7742ce83c99f 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -185,7 +185,7 @@ static int pmbus_probe(struct i2c_client *client,
 	info->identify = pmbus_identify;
 	dev->platform_data = pdata;
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct pmbus_device_info pmbus_info_one = {
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 18e06fc6c53f..1ff5314287cb 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -476,8 +476,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 void pmbus_clear_faults(struct i2c_client *client);
 bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
 bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
-int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
-		   struct pmbus_driver_info *info);
+int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
 int pmbus_do_remove(struct i2c_client *client);
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client
 						      *client);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 2191575a448b..065a81f6545d 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2492,8 +2492,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 }
 #endif	/* IS_ENABLED(CONFIG_DEBUG_FS) */
 
-int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
-		   struct pmbus_driver_info *info)
+int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 {
 	struct device *dev = &client->dev;
 	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
index 517584cff3de..732958b2f6b7 100644
--- a/drivers/hwmon/pmbus/pxe1610.c
+++ b/drivers/hwmon/pmbus/pxe1610.c
@@ -78,8 +78,7 @@ static struct pmbus_driver_info pxe1610_info = {
 	.identify = pxe1610_identify,
 };
 
-static int pxe1610_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int pxe1610_probe(struct i2c_client *client)
 {
 	struct pmbus_driver_info *info;
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
@@ -115,13 +114,13 @@ static int pxe1610_probe(struct i2c_client *client,
 	if (!info)
 		return -ENOMEM;
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id pxe1610_id[] = {
-	{"pxe1610", 0},
-	{"pxe1110", 0},
-	{"pxm1310", 0},
+	{ .name = "pxe1610" },
+	{ .name = "pxe1110" },
+	{ .name = "pxm1310" },
 	{}
 };
 
@@ -131,7 +130,7 @@ static struct i2c_driver pxe1610_driver = {
 	.driver = {
 			.name = "pxe1610",
 			},
-	.probe = pxe1610_probe,
+	.probe_new = pxe1610_probe,
 	.remove = pmbus_do_remove,
 	.id_table = pxe1610_id,
 };
diff --git a/drivers/hwmon/pmbus/tps40422.c b/drivers/hwmon/pmbus/tps40422.c
index 2b83dcda964a..d265178c7689 100644
--- a/drivers/hwmon/pmbus/tps40422.c
+++ b/drivers/hwmon/pmbus/tps40422.c
@@ -25,14 +25,13 @@ static struct pmbus_driver_info tps40422_info = {
 		| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
 };
 
-static int tps40422_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int tps40422_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, id, &tps40422_info);
+	return pmbus_do_probe(client, &tps40422_info);
 }
 
 static const struct i2c_device_id tps40422_id[] = {
-	{"tps40422", 0},
+	{ .name = "tps40422" },
 	{}
 };
 
@@ -43,7 +42,7 @@ static struct i2c_driver tps40422_driver = {
 	.driver = {
 		   .name = "tps40422",
 		   },
-	.probe = tps40422_probe,
+	.probe_new = tps40422_probe,
 	.remove = pmbus_do_remove,
 	.id_table = tps40422_id,
 };
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 157c99ffb52b..30832d71102f 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -220,7 +220,7 @@ static int tps53679_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id tps53679_id[] = {
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 81f4c4f166cd..d4c74e21c9d2 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -603,7 +603,7 @@ static int ucd9000_probe(struct i2c_client *client,
 
 	ucd9000_probe_gpio(client, mid, data);
 
-	ret = pmbus_do_probe(client, mid, info);
+	ret = pmbus_do_probe(client, info);
 	if (ret)
 		return ret;
 
diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index 7c04745a9709..58633bb495fb 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -192,7 +192,7 @@ static int ucd9200_probe(struct i2c_client *client,
 	if (mid->driver_data == ucd9240)
 		info->func[0] |= PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12;
 
-	return pmbus_do_probe(client, mid, info);
+	return pmbus_do_probe(client, info);
 }
 
 /* This is the driver that will be inserted */
diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index d5103fc9e269..c05bc13552a7 100644
--- a/drivers/hwmon/pmbus/xdpe12284.c
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -127,8 +127,7 @@ static struct pmbus_driver_info xdpe122_info = {
 	.read_word_data = xdpe122_read_word_data,
 };
 
-static int xdpe122_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int xdpe122_probe(struct i2c_client *client)
 {
 	struct pmbus_driver_info *info;
 
@@ -137,12 +136,12 @@ static int xdpe122_probe(struct i2c_client *client,
 	if (!info)
 		return -ENOMEM;
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id xdpe122_id[] = {
-	{"xdpe12254", 0},
-	{"xdpe12284", 0},
+	{ .name = "xdpe12254" },
+	{ .name = "xdpe12284" },
 	{}
 };
 
@@ -160,7 +159,7 @@ static struct i2c_driver xdpe122_driver = {
 		.name = "xdpe12284",
 		.of_match_table = of_match_ptr(xdpe122_of_match),
 	},
-	.probe = xdpe122_probe,
+	.probe_new = xdpe122_probe,
 	.remove = pmbus_do_remove,
 	.id_table = xdpe122_id,
 };
diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index 3a827d0a881d..24b1b0f46a40 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -389,7 +389,7 @@ static int zl6100_probe(struct i2c_client *client,
 	info->write_word_data = zl6100_write_word_data;
 	info->write_byte = zl6100_write_byte;
 
-	return pmbus_do_probe(client, mid, info);
+	return pmbus_do_probe(client, info);
 }
 
 static struct i2c_driver zl6100_driver = {

base-commit: bcf876870b95592b52519ed4aafcf9d95999bc9c
-- 
2.25.4

