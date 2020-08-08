Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9221523F89E
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Aug 2020 21:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgHHTae (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Aug 2020 15:30:34 -0400
Received: from 2.mo179.mail-out.ovh.net ([178.33.250.45]:48136 "EHLO
        2.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgHHTae (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Aug 2020 15:30:34 -0400
X-Greylist: delayed 1125 seconds by postgrey-1.27 at vger.kernel.org; Sat, 08 Aug 2020 15:30:21 EDT
Received: from player726.ha.ovh.net (unknown [10.110.103.199])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id BA5FE1727CC
        for <linux-i2c@vger.kernel.org>; Sat,  8 Aug 2020 20:56:20 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player726.ha.ovh.net (Postfix) with ESMTPSA id 8D70F1509CF4D;
        Sat,  8 Aug 2020 18:56:14 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G003223e27ad-79b8-49cc-96ac-65057a133bfc,
                    79D32C5DBA076DF52B56DF0DE49DD07428F72CA9) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH v4] hwmon/pmbus: use simple i2c probe function
Date:   Sat,  8 Aug 2020 20:56:09 +0200
Message-Id: <20200808185609.16309-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17677754439882525966
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkeeggddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeetgedugfelkeeikeetgeegteevfeeufeetuefgudeiiedthfehtdeffeekvdeffeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedviedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pmbus_do_probe doesn't use the id information provided in its second
argument, so this can be removed, which then allows using the
single-parameter i2c probe function ("probe_new") for probes.

This avoids scanning the identifier tables during probes.

Drivers which didn't use the id are converted as-is; drivers which did
are modified as follows:

* if the information in i2c_client is sufficient, that's used instead
  (client->name);
* configured v. probed comparisons are performed by comparing the
  configured name to the detected name, instead of the ids; this
  involves strcmp but is still cheaper than comparing all the device
  names when scanning the tables;
* anything else is handled by calling i2c_match_id() with the same
  level of error-handling (if any) as before.

Additionally, the mismatch message in the ltc2978 driver is adjusted
so that it no longer assumes that the driver_data is an index into
ltc2978_id.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
Changes since v1:
  - i2c_device_id declarations are left unchanged;
  - all drivers are converted, using client info or i2c_match_id().
Changes since v2:
  - updated the documentation;
  - fixed unbalanced braces around the modified else in ibm-cffps.c.
Changes since v3:
  - fix ltc2978 to avoid assuming names and driver_data are bijective,
    and that driver_data are indexes into ltc2978_id.

 Documentation/hwmon/pmbus-core.rst |  3 +--
 Documentation/hwmon/pmbus.rst      |  7 +++----
 drivers/hwmon/pmbus/adm1275.c      | 11 +++++------
 drivers/hwmon/pmbus/bel-pfe.c      | 11 ++++++-----
 drivers/hwmon/pmbus/ibm-cffps.c    | 19 ++++++++++++-------
 drivers/hwmon/pmbus/inspur-ipsps.c |  7 +++----
 drivers/hwmon/pmbus/ir35221.c      |  7 +++----
 drivers/hwmon/pmbus/ir38064.c      |  7 +++----
 drivers/hwmon/pmbus/irps5401.c     |  7 +++----
 drivers/hwmon/pmbus/isl68137.c     | 11 ++++++-----
 drivers/hwmon/pmbus/lm25066.c      | 11 ++++++-----
 drivers/hwmon/pmbus/ltc2978.c      | 14 ++++++++------
 drivers/hwmon/pmbus/ltc3815.c      |  7 +++----
 drivers/hwmon/pmbus/max16064.c     |  7 +++----
 drivers/hwmon/pmbus/max16601.c     |  7 +++----
 drivers/hwmon/pmbus/max20730.c     | 11 ++++++-----
 drivers/hwmon/pmbus/max20751.c     |  7 +++----
 drivers/hwmon/pmbus/max31785.c     |  9 ++++-----
 drivers/hwmon/pmbus/max34440.c     | 13 +++++++------
 drivers/hwmon/pmbus/max8688.c      |  7 +++----
 drivers/hwmon/pmbus/pmbus.c        | 11 ++++++-----
 drivers/hwmon/pmbus/pmbus.h        |  3 +--
 drivers/hwmon/pmbus/pmbus_core.c   |  3 +--
 drivers/hwmon/pmbus/pxe1610.c      |  7 +++----
 drivers/hwmon/pmbus/tps40422.c     |  7 +++----
 drivers/hwmon/pmbus/tps53679.c     | 11 ++++++-----
 drivers/hwmon/pmbus/ucd9000.c      | 13 ++++++-------
 drivers/hwmon/pmbus/ucd9200.c      | 13 ++++++-------
 drivers/hwmon/pmbus/xdpe12284.c    |  7 +++----
 drivers/hwmon/pmbus/zl6100.c       | 11 +++++------
 30 files changed, 131 insertions(+), 138 deletions(-)

diff --git a/Documentation/hwmon/pmbus-core.rst b/Documentation/hwmon/pmbus-core.rst
index 501b37b0610d..e22c4f6808bc 100644
--- a/Documentation/hwmon/pmbus-core.rst
+++ b/Documentation/hwmon/pmbus-core.rst
@@ -270,8 +270,7 @@ obtain the chip status. Therefore, it must _not_ be called from that function.
 
 ::
 
-  int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
-		     struct pmbus_driver_info *info);
+  int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
 
 Execute probe function. Similar to standard probe function for other drivers,
 with the pointer to struct pmbus_driver_info as additional argument. Calls
diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index 2658ddee70eb..1f31317fe186 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -143,10 +143,9 @@ Emerson DS1200 power modules might look as follows::
 		   | PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
   };
 
-  static int ds1200_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+  static int ds1200_probe(struct i2c_client *client)
   {
-	return pmbus_do_probe(client, id, &ds1200_info);
+	return pmbus_do_probe(client, &ds1200_info);
   }
 
   static int ds1200_remove(struct i2c_client *client)
@@ -166,7 +165,7 @@ Emerson DS1200 power modules might look as follows::
 	.driver = {
 		   .name = "ds1200",
 		   },
-	.probe = ds1200_probe,
+	.probe_new = ds1200_probe,
 	.remove = ds1200_remove,
 	.id_table = ds1200_id,
   };
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 19317575d1c6..7fc3a3b1b55c 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -462,8 +462,7 @@ static const struct i2c_device_id adm1275_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adm1275_id);
 
-static int adm1275_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int adm1275_probe(struct i2c_client *client)
 {
 	s32 (*config_read_fn)(const struct i2c_client *client, u8 reg);
 	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
@@ -506,10 +505,10 @@ static int adm1275_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	if (id->driver_data != mid->driver_data)
+	if (strcmp(client->name, mid->name) != 0)
 		dev_notice(&client->dev,
 			   "Device mismatch: Configured %s, detected %s\n",
-			   id->name, mid->name);
+			   client->name, mid->name);
 
 	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
 	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
@@ -791,14 +790,14 @@ static int adm1275_probe(struct i2c_client *client,
 		info->R[PSC_TEMPERATURE] = coefficients[tindex].R;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static struct i2c_driver adm1275_driver = {
 	.driver = {
 		   .name = "adm1275",
 		   },
-	.probe = adm1275_probe,
+	.probe_new = adm1275_probe,
 	.remove = pmbus_do_remove,
 	.id_table = adm1275_id,
 };
diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
index f236e18f45a5..2c5b853d6c7f 100644
--- a/drivers/hwmon/pmbus/bel-pfe.c
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -87,12 +87,13 @@ static struct pmbus_driver_info pfe_driver_info[] = {
 	},
 };
 
-static int pfe_pmbus_probe(struct i2c_client *client,
-			   const struct i2c_device_id *id)
+static const struct i2c_device_id pfe_device_id[];
+
+static int pfe_pmbus_probe(struct i2c_client *client)
 {
 	int model;
 
-	model = (int)id->driver_data;
+	model = (int)i2c_match_id(pfe_device_id, client)->driver_data;
 
 	/*
 	 * PFE3000-12-069RA devices may not stay in page 0 during device
@@ -104,7 +105,7 @@ static int pfe_pmbus_probe(struct i2c_client *client,
 		i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
 	}
 
-	return pmbus_do_probe(client, id, &pfe_driver_info[model]);
+	return pmbus_do_probe(client, &pfe_driver_info[model]);
 }
 
 static const struct i2c_device_id pfe_device_id[] = {
@@ -119,7 +120,7 @@ static struct i2c_driver pfe_pmbus_driver = {
 	.driver = {
 		   .name = "bel-pfe",
 	},
-	.probe = pfe_pmbus_probe,
+	.probe_new = pfe_pmbus_probe,
 	.remove = pmbus_do_remove,
 	.id_table = pfe_device_id,
 };
diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 7d300f2f338d..2fb7540ee952 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -91,6 +91,8 @@ struct ibm_cffps {
 	struct led_classdev led;
 };
 
+static const struct i2c_device_id ibm_cffps_id[];
+
 #define to_psu(x, y) container_of((x), struct ibm_cffps, debugfs_entries[(y)])
 
 static ssize_t ibm_cffps_read_input_history(struct ibm_cffps *psu,
@@ -473,8 +475,7 @@ static struct pmbus_platform_data ibm_cffps_pdata = {
 	.flags = PMBUS_SKIP_STATUS_CHECK,
 };
 
-static int ibm_cffps_probe(struct i2c_client *client,
-			   const struct i2c_device_id *id)
+static int ibm_cffps_probe(struct i2c_client *client)
 {
 	int i, rc;
 	enum versions vs = cffps_unknown;
@@ -482,11 +483,15 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	struct dentry *ibm_cffps_dir;
 	struct ibm_cffps *psu;
 	const void *md = of_device_get_match_data(&client->dev);
+	const struct i2c_device_id *id;
 
-	if (md)
+	if (md) {
 		vs = (enum versions)md;
-	else if (id)
-		vs = (enum versions)id->driver_data;
+	} else {
+		id = i2c_match_id(ibm_cffps_id, client);
+		if (id)
+			vs = (enum versions)id->driver_data;
+	}
 
 	if (vs == cffps_unknown) {
 		u16 ccin_revision = 0;
@@ -519,7 +524,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	}
 
 	client->dev.platform_data = &ibm_cffps_pdata;
-	rc = pmbus_do_probe(client, id, &ibm_cffps_info[vs]);
+	rc = pmbus_do_probe(client, &ibm_cffps_info[vs]);
 	if (rc)
 		return rc;
 
@@ -611,7 +616,7 @@ static struct i2c_driver ibm_cffps_driver = {
 		.name = "ibm-cffps",
 		.of_match_table = ibm_cffps_of_match,
 	},
-	.probe = ibm_cffps_probe,
+	.probe_new = ibm_cffps_probe,
 	.remove = pmbus_do_remove,
 	.id_table = ibm_cffps_id,
 };
diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index 42e01549184a..be493182174d 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -190,11 +190,10 @@ static struct pmbus_platform_data ipsps_pdata = {
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
index 3eea3e006a96..5fadb1def49f 100644
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
@@ -123,7 +122,7 @@ static int ir35221_probe(struct i2c_client *client,
 		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP;
 	info->func[1] = info->func[0];
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id ir35221_id[] = {
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
index 1820f5077f66..9ac563ce7dd8 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -35,10 +35,9 @@ static struct pmbus_driver_info ir38064_info = {
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
index d37daa001fb3..44aeafcbd56c 100644
--- a/drivers/hwmon/pmbus/irps5401.c
+++ b/drivers/hwmon/pmbus/irps5401.c
@@ -38,10 +38,9 @@ static struct pmbus_driver_info irps5401_info = {
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
index 0c622711ef7e..bb71bf2e943a 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -71,6 +71,8 @@ enum variants {
 	raa_dmpvr2_hv,
 };
 
+static const struct i2c_device_id raa_dmpvr_id[];
+
 static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
 					     int page,
 					     char *buf)
@@ -217,8 +219,7 @@ static struct pmbus_driver_info raa_dmpvr_info = {
 	    | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
 };
 
-static int isl68137_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int isl68137_probe(struct i2c_client *client)
 {
 	struct pmbus_driver_info *info;
 
@@ -227,7 +228,7 @@ static int isl68137_probe(struct i2c_client *client,
 		return -ENOMEM;
 	memcpy(info, &raa_dmpvr_info, sizeof(*info));
 
-	switch (id->driver_data) {
+	switch (i2c_match_id(raa_dmpvr_id, client)->driver_data) {
 	case raa_dmpvr1_2rail:
 		info->pages = 2;
 		info->R[PSC_VOLTAGE_IN] = 3;
@@ -262,7 +263,7 @@ static int isl68137_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id raa_dmpvr_id[] = {
@@ -317,7 +318,7 @@ static struct i2c_driver isl68137_driver = {
 	.driver = {
 		   .name = "isl68137",
 		   },
-	.probe = isl68137_probe,
+	.probe_new = isl68137_probe,
 	.remove = pmbus_do_remove,
 	.id_table = raa_dmpvr_id,
 };
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 9e4cf0800186..429172a42902 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -211,6 +211,8 @@ struct lm25066_data {
 
 #define to_lm25066_data(x)  container_of(x, struct lm25066_data, info)
 
+static const struct i2c_device_id lm25066_id[];
+
 static int lm25066_read_word_data(struct i2c_client *client, int page,
 				  int phase, int reg)
 {
@@ -416,8 +418,7 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
 	return ret;
 }
 
-static int lm25066_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int lm25066_probe(struct i2c_client *client)
 {
 	int config;
 	struct lm25066_data *data;
@@ -437,7 +438,7 @@ static int lm25066_probe(struct i2c_client *client,
 	if (config < 0)
 		return config;
 
-	data->id = id->driver_data;
+	data->id = i2c_match_id(lm25066_id, client)->driver_data;
 	info = &data->info;
 
 	info->pages = 1;
@@ -487,7 +488,7 @@ static int lm25066_probe(struct i2c_client *client,
 		info->b[PSC_POWER] = coeff[PSC_POWER].b;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id lm25066_id[] = {
@@ -506,7 +507,7 @@ static struct i2c_driver lm25066_driver = {
 	.driver = {
 		   .name = "lm25066",
 		   },
-	.probe = lm25066_probe,
+	.probe_new = lm25066_probe,
 	.remove = pmbus_do_remove,
 	.id_table = lm25066_id,
 };
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 7b0e6b37e247..1fe2170d9d0f 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -649,12 +649,12 @@ static int ltc2978_get_id(struct i2c_client *client)
 	return -ENODEV;
 }
 
-static int ltc2978_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int ltc2978_probe(struct i2c_client *client)
 {
 	int i, chip_id;
 	struct ltc2978_data *data;
 	struct pmbus_driver_info *info;
+	const struct i2c_device_id *id;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_READ_WORD_DATA))
@@ -670,11 +670,13 @@ static int ltc2978_probe(struct i2c_client *client,
 		return chip_id;
 
 	data->id = chip_id;
+	id = i2c_match_id(ltc2978_id, client);
 	if (data->id != id->driver_data)
 		dev_warn(&client->dev,
-			 "Device mismatch: Configured %s, detected %s\n",
+			 "Device mismatch: Configured %s (%d), detected %d\n",
 			 id->name,
-			 ltc2978_id[data->id].name);
+			 id->driver_data,
+			 chip_id);
 
 	info = &data->info;
 	info->write_word_data = ltc2978_write_word_data;
@@ -832,7 +834,7 @@ static int ltc2978_probe(struct i2c_client *client,
 	}
 #endif
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 
@@ -872,7 +874,7 @@ static struct i2c_driver ltc2978_driver = {
 		   .name = "ltc2978",
 		   .of_match_table = of_match_ptr(ltc2978_of_match),
 		   },
-	.probe = ltc2978_probe,
+	.probe_new = ltc2978_probe,
 	.remove = pmbus_do_remove,
 	.id_table = ltc2978_id,
 };
diff --git a/drivers/hwmon/pmbus/ltc3815.c b/drivers/hwmon/pmbus/ltc3815.c
index 3036263e0a66..8328fb367ad6 100644
--- a/drivers/hwmon/pmbus/ltc3815.c
+++ b/drivers/hwmon/pmbus/ltc3815.c
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
index 288e93f74c28..26e7f5ef9d7f 100644
--- a/drivers/hwmon/pmbus/max16064.c
+++ b/drivers/hwmon/pmbus/max16064.c
@@ -85,10 +85,9 @@ static struct pmbus_driver_info max16064_info = {
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
index 51cdfaf9023c..71bb74e27a5c 100644
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
@@ -288,7 +287,7 @@ static int max16601_probe(struct i2c_client *client,
 
 	data->info = max16601_info;
 
-	return pmbus_do_probe(client, id, &data->info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max16601_id[] = {
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
index c0bb05487e0e..b34202bda7d5 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -35,6 +35,8 @@ struct max20730_data {
 
 #define MAX20730_MFR_DEVSET1	0xd2
 
+static const struct i2c_device_id max20730_id[];
+
 /*
  * Convert discreet value to direct data format. Strictly speaking, all passed
  * values are constants, so we could do that calculation manually. On the
@@ -260,8 +262,7 @@ static const struct pmbus_driver_info max20730_info[] = {
 	},
 };
 
-static int max20730_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int max20730_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
@@ -321,7 +322,7 @@ static int max20730_probe(struct i2c_client *client,
 	if (client->dev.of_node)
 		chip_id = (enum chips)of_device_get_match_data(dev);
 	else
-		chip_id = id->driver_data;
+		chip_id = i2c_match_id(max20730_id, client)->driver_data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -335,7 +336,7 @@ static int max20730_probe(struct i2c_client *client,
 		return ret;
 	data->mfr_devset1 = ret;
 
-	return pmbus_do_probe(client, id, &data->info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max20730_id[] = {
@@ -361,7 +362,7 @@ static struct i2c_driver max20730_driver = {
 		.name = "max20730",
 		.of_match_table = max20730_of_match,
 	},
-	.probe = max20730_probe,
+	.probe_new = max20730_probe,
 	.remove = pmbus_do_remove,
 	.id_table = max20730_id,
 };
diff --git a/drivers/hwmon/pmbus/max20751.c b/drivers/hwmon/pmbus/max20751.c
index da3c38cb9a5c..921e92d82aec 100644
--- a/drivers/hwmon/pmbus/max20751.c
+++ b/drivers/hwmon/pmbus/max20751.c
@@ -26,10 +26,9 @@ static struct pmbus_driver_info max20751_info = {
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
index d9aa5c873d21..839b957bc03e 100644
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
@@ -366,7 +365,7 @@ static int max31785_probe(struct i2c_client *client,
 			return ret;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id max31785_id[] = {
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
index 18b4e071067f..35f03defa4a6 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -41,6 +41,8 @@ struct max34440_data {
 
 #define to_max34440_data(x)  container_of(x, struct max34440_data, info)
 
+static const struct i2c_device_id max34440_id[];
+
 static int max34440_read_word_data(struct i2c_client *client, int page,
 				   int phase, int reg)
 {
@@ -461,8 +463,7 @@ static struct pmbus_driver_info max34440_info[] = {
 	},
 };
 
-static int max34440_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int max34440_probe(struct i2c_client *client)
 {
 	struct max34440_data *data;
 	int rv;
@@ -471,8 +472,8 @@ static int max34440_probe(struct i2c_client *client,
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-	data->id = id->driver_data;
-	data->info = max34440_info[id->driver_data];
+	data->id = i2c_match_id(max34440_id, client)->driver_data;
+	data->info = max34440_info[data->id];
 
 	if (data->id == max34451) {
 		rv = max34451_set_supported_funcs(client, data);
@@ -480,7 +481,7 @@ static int max34440_probe(struct i2c_client *client,
 			return rv;
 	}
 
-	return pmbus_do_probe(client, id, &data->info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max34440_id[] = {
@@ -499,7 +500,7 @@ static struct i2c_driver max34440_driver = {
 	.driver = {
 		   .name = "max34440",
 		   },
-	.probe = max34440_probe,
+	.probe_new = max34440_probe,
 	.remove = pmbus_do_remove,
 	.id_table = max34440_id,
 };
diff --git a/drivers/hwmon/pmbus/max8688.c b/drivers/hwmon/pmbus/max8688.c
index 643ccfc05106..4b2239a6afd3 100644
--- a/drivers/hwmon/pmbus/max8688.c
+++ b/drivers/hwmon/pmbus/max8688.c
@@ -165,10 +165,9 @@ static struct pmbus_driver_info max8688_info = {
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
index 6d384e8ee1db..20f1af9165c2 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -20,6 +20,8 @@ struct pmbus_device_info {
 	u32 flags;
 };
 
+static const struct i2c_device_id pmbus_id[];
+
 /*
  * Find sensor groups and status registers on each page.
  */
@@ -159,8 +161,7 @@ static int pmbus_identify(struct i2c_client *client,
 	return ret;
 }
 
-static int pmbus_probe(struct i2c_client *client,
-		       const struct i2c_device_id *id)
+static int pmbus_probe(struct i2c_client *client)
 {
 	struct pmbus_driver_info *info;
 	struct pmbus_platform_data *pdata = NULL;
@@ -171,7 +172,7 @@ static int pmbus_probe(struct i2c_client *client,
 	if (!info)
 		return -ENOMEM;
 
-	device_info = (struct pmbus_device_info *)id->driver_data;
+	device_info = (struct pmbus_device_info *)i2c_match_id(pmbus_id, client)->driver_data;
 	if (device_info->flags & PMBUS_SKIP_STATUS_CHECK) {
 		pdata = devm_kzalloc(dev, sizeof(struct pmbus_platform_data),
 				     GFP_KERNEL);
@@ -185,7 +186,7 @@ static int pmbus_probe(struct i2c_client *client,
 	info->identify = pmbus_identify;
 	dev->platform_data = pdata;
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct pmbus_device_info pmbus_info_one = {
@@ -236,7 +237,7 @@ static struct i2c_driver pmbus_driver = {
 	.driver = {
 		   .name = "pmbus",
 		   },
-	.probe = pmbus_probe,
+	.probe_new = pmbus_probe,
 	.remove = pmbus_do_remove,
 	.id_table = pmbus_id,
 };
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
index 517584cff3de..fa5c5dd29b7a 100644
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
@@ -115,7 +114,7 @@ static int pxe1610_probe(struct i2c_client *client,
 	if (!info)
 		return -ENOMEM;
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id pxe1610_id[] = {
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
index 2b83dcda964a..edbdfa809d51 100644
--- a/drivers/hwmon/pmbus/tps40422.c
+++ b/drivers/hwmon/pmbus/tps40422.c
@@ -25,10 +25,9 @@ static struct pmbus_driver_info tps40422_info = {
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
index 157c99ffb52b..db2bdf2a1f02 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -34,6 +34,8 @@ enum chips {
 
 #define TPS53681_MFR_SPECIFIC_20	0xe4	/* Number of phases, per page */
 
+static const struct i2c_device_id tps53679_id[];
+
 static int tps53679_identify_mode(struct i2c_client *client,
 				  struct pmbus_driver_info *info)
 {
@@ -183,8 +185,7 @@ static struct pmbus_driver_info tps53679_info = {
 	.pfunc[5] = PMBUS_HAVE_IOUT,
 };
 
-static int tps53679_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int tps53679_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
@@ -193,7 +194,7 @@ static int tps53679_probe(struct i2c_client *client,
 	if (dev->of_node)
 		chip_id = (enum chips)of_device_get_match_data(dev);
 	else
-		chip_id = id->driver_data;
+		chip_id = i2c_match_id(tps53679_id, client)->driver_data;
 
 	info = devm_kmemdup(dev, &tps53679_info, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -220,7 +221,7 @@ static int tps53679_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id tps53679_id[] = {
@@ -249,7 +250,7 @@ static struct i2c_driver tps53679_driver = {
 		.name = "tps53679",
 		.of_match_table = of_match_ptr(tps53679_of_match),
 	},
-	.probe = tps53679_probe,
+	.probe_new = tps53679_probe,
 	.remove = pmbus_do_remove,
 	.id_table = tps53679_id,
 };
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 81f4c4f166cd..f8017993e2b4 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -487,8 +487,7 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
 }
 #endif /* CONFIG_DEBUG_FS */
 
-static int ucd9000_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int ucd9000_probe(struct i2c_client *client)
 {
 	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
 	struct ucd9000_data *data;
@@ -523,12 +522,12 @@ static int ucd9000_probe(struct i2c_client *client,
 	if (client->dev.of_node)
 		chip = (enum chips)of_device_get_match_data(&client->dev);
 	else
-		chip = id->driver_data;
+		chip = mid->driver_data;
 
-	if (chip != ucd9000 && chip != mid->driver_data)
+	if (chip != ucd9000 && strcmp(client->name, mid->name) != 0)
 		dev_notice(&client->dev,
 			   "Device mismatch: Configured %s, detected %s\n",
-			   id->name, mid->name);
+			   client->name, mid->name);
 
 	data = devm_kzalloc(&client->dev, sizeof(struct ucd9000_data),
 			    GFP_KERNEL);
@@ -603,7 +602,7 @@ static int ucd9000_probe(struct i2c_client *client,
 
 	ucd9000_probe_gpio(client, mid, data);
 
-	ret = pmbus_do_probe(client, mid, info);
+	ret = pmbus_do_probe(client, info);
 	if (ret)
 		return ret;
 
@@ -621,7 +620,7 @@ static struct i2c_driver ucd9000_driver = {
 		.name = "ucd9000",
 		.of_match_table = of_match_ptr(ucd9000_of_match),
 	},
-	.probe = ucd9000_probe,
+	.probe_new = ucd9000_probe,
 	.remove = pmbus_do_remove,
 	.id_table = ucd9000_id,
 };
diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index 7c04745a9709..e111e25e1619 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -71,8 +71,7 @@ static const struct of_device_id __maybe_unused ucd9200_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ucd9200_of_match);
 
-static int ucd9200_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int ucd9200_probe(struct i2c_client *client)
 {
 	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
 	struct pmbus_driver_info *info;
@@ -106,12 +105,12 @@ static int ucd9200_probe(struct i2c_client *client,
 	if (client->dev.of_node)
 		chip = (enum chips)of_device_get_match_data(&client->dev);
 	else
-		chip = id->driver_data;
+		chip = mid->driver_data;
 
-	if (chip != ucd9200 && chip != mid->driver_data)
+	if (chip != ucd9200 && strcmp(client->name, mid->name) != 0)
 		dev_notice(&client->dev,
 			   "Device mismatch: Configured %s, detected %s\n",
-			   id->name, mid->name);
+			   client->name, mid->name);
 
 	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
 			    GFP_KERNEL);
@@ -192,7 +191,7 @@ static int ucd9200_probe(struct i2c_client *client,
 	if (mid->driver_data == ucd9240)
 		info->func[0] |= PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12;
 
-	return pmbus_do_probe(client, mid, info);
+	return pmbus_do_probe(client, info);
 }
 
 /* This is the driver that will be inserted */
@@ -201,7 +200,7 @@ static struct i2c_driver ucd9200_driver = {
 		.name = "ucd9200",
 		.of_match_table = of_match_ptr(ucd9200_of_match),
 	},
-	.probe = ucd9200_probe,
+	.probe_new = ucd9200_probe,
 	.remove = pmbus_do_remove,
 	.id_table = ucd9200_id,
 };
diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index d5103fc9e269..c95ac934fde4 100644
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
 
@@ -137,7 +136,7 @@ static int xdpe122_probe(struct i2c_client *client,
 	if (!info)
 		return -ENOMEM;
 
-	return pmbus_do_probe(client, id, info);
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id xdpe122_id[] = {
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
index 3a827d0a881d..e8bda340482b 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -301,8 +301,7 @@ static const struct i2c_device_id zl6100_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, zl6100_id);
 
-static int zl6100_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int zl6100_probe(struct i2c_client *client)
 {
 	int ret;
 	struct zl6100_data *data;
@@ -333,10 +332,10 @@ static int zl6100_probe(struct i2c_client *client,
 		dev_err(&client->dev, "Unsupported device\n");
 		return -ENODEV;
 	}
-	if (id->driver_data != mid->driver_data)
+	if (strcmp(client->name, mid->name) != 0)
 		dev_notice(&client->dev,
 			   "Device mismatch: Configured %s, detected %s\n",
-			   id->name, mid->name);
+			   client->name, mid->name);
 
 	data = devm_kzalloc(&client->dev, sizeof(struct zl6100_data),
 			    GFP_KERNEL);
@@ -389,14 +388,14 @@ static int zl6100_probe(struct i2c_client *client,
 	info->write_word_data = zl6100_write_word_data;
 	info->write_byte = zl6100_write_byte;
 
-	return pmbus_do_probe(client, mid, info);
+	return pmbus_do_probe(client, info);
 }
 
 static struct i2c_driver zl6100_driver = {
 	.driver = {
 		   .name = "zl6100",
 		   },
-	.probe = zl6100_probe,
+	.probe_new = zl6100_probe,
 	.remove = pmbus_do_remove,
 	.id_table = zl6100_id,
 };

base-commit: bcf876870b95592b52519ed4aafcf9d95999bc9c
-- 
2.20.1

