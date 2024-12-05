Return-Path: <linux-i2c+bounces-8349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BCA9E59AE
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 16:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67DA018853BB
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 15:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F119421C17B;
	Thu,  5 Dec 2024 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GTld4NfS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A821C182
	for <linux-i2c@vger.kernel.org>; Thu,  5 Dec 2024 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733412536; cv=none; b=oSiKkowVOglvfGemt8kCX/toSzxePhD1SsbAr1DBLkbCf6ZLt2WRet07xVDrPUtCBJZUgUqJn2c9eSdwB0qjBBcCZpJmOkW+XXL3kKJ4N45nqOr4BmeYHfNp2kiAyvzrBSp38ZvLFsjLu6XmMmUhkDL+0TsD7C89r+CW+cg9Mqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733412536; c=relaxed/simple;
	bh=6qKygBsA0d81AGtdPJXkMPkb901rzZTeEiimhyrMxP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ooT82q+BCGCwNI21WzF25czWqDsn5dIkt2SKTy/iNZeT+fX3hTCcJOI6WjRcqZeF/JXPpED1lBOFVTH+PQtrNPRaFyLc8d3MdPkFOjRmlj4/X8ozBMTO79nWA1M9Zn1QBUr5n7iCg94KOAHWccKJeU9/q9C5jmIfQ2CUiR9eNEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GTld4NfS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a736518eso12193165e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 05 Dec 2024 07:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733412530; x=1734017330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+6Dah1LuKuVWknCXhucflxf3r3gXUPN9ayiH/SwfWwg=;
        b=GTld4NfSkzQeJALUBy562AkFcev01HwiRQrlL6LuuyGyiJlwOdNrd/jZz3aMM6/iVq
         H/k06B1AzvXZxYCksH+9Ab97P3PFTz7AFE4XMtBwBS0F+HZdTPqmtc14V4RTQ7bzLDpN
         65668iChnEB8Lh4p88Pv6v8FlanzuX0xu+yZz2qisas4MNsujTUDqfNUxV+mhRZk7Gj7
         mivUN0ptBd6BPQ9FoLbAZ00GMCIkPmN/PkwKG0g3WrE86XwaoqaYHWDzxFfvJJAimx+n
         IrfWd/aynTOqzb5qwh0isYD3v/gPSFaIGvtPja381s9AwgKK9p5wyAlfUIYsaN30FkxB
         PGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733412530; x=1734017330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6Dah1LuKuVWknCXhucflxf3r3gXUPN9ayiH/SwfWwg=;
        b=pTzyD6jLGRbO+f6PhCzEV1HwWf8TwupZ90KBiGZpCxjRqNqXOCyGa2E3W6Rzb77Khc
         n1lBehjru3E2/+KapqNgHxoZrBnlytVQLfyY34aev1scfZJJ/hZc1ws0pLBB2Gnm9mxt
         h3cps4wJQMaTlN0/UWJW4s4LTFA6+hGRehhtqZkHgKof5lJotpEtiaJXSv8NC9BSMsoH
         CQN9ukN5g/tw2e6kifZorGUhD0ZajSIKYOQv26rFIJ4NApIMDOcP5K1/fb/VUNEOO0iv
         kJ2qw4j9thBERHhb0DIWWZcHaDP367FChIGq1MP0HxPpDkSDf5YmMQbhhY5uYqZEpB5b
         Fc8g==
X-Forwarded-Encrypted: i=1; AJvYcCUe0m4SWkM2nKEPVARMaBpN549okSt6n/p2z3vbjpeAS6kHCb9SSB52FSU8gpMwptEWQXsAFE6AGdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lGA3zQDNT5nm3/U/8VQWSSwhn77kBZqLppnH8aJ0acye01P6
	tleR+ITYDDAbbyHndQ1YfOaIpkbNqSRCYUnTDs0h/WAMU3nZwRyimmr19Aza/ZO4ZTN9bciN2zo
	P2WQ=
X-Gm-Gg: ASbGnctu8CWC2B7zXF9jIRc4Gfp69tAEHt2Mn/pFEByzuXv2h+RFG6K9JX0SfQaHSq8
	KpqXeVllY94adPtlrKg7gkvfOUjj/VUStNBR4wLcSB0iww54N5rutdtiz8iN6xL5trAAd+TVEp9
	s2r5nosrOVhL8ieg8IoQupReua5KK9oNJ9j4NCGFmr6dhieE0gfxlM5nF/JF0h+A9twMRMLC/Z5
	sCTD+Jaiyj3JipXBZTiGdpKoIfOLTlagP/HoyjemEn45KyjmN3WuzK6yiQiDbtSI25gTZm9U8Hd
	XrwY
X-Google-Smtp-Source: AGHT+IHiSh0laQoRPJbN3HIQjdYmBXKmOs58CfeeQ/vrNeo9DbK5qRhyXHwGcRhTW7ToEDjRcNCmPA==
X-Received: by 2002:a05:600c:3aca:b0:42f:8229:a09e with SMTP id 5b1f17b1804b1-434d0a28616mr99158285e9.29.1733412529993;
        Thu, 05 Dec 2024 07:28:49 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526ac03sm66469095e9.4.2024.12.05.07.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:28:49 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	George Joseph <george.joseph@fairview5.com>,
	Juerg Haefliger <juergh@proton.me>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?utf-8?q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>,
	Zev Weiss <zev@bewilderbeest.net>,
	Eric Tremblay <etremblay@distech-controls.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Potin Lai <potin.lai.pt@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Konstantin Aladyshev <aladyshev22@gmail.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Eddie James <eajames@linux.ibm.com>,
	Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] hwmon: Initialize i2c_device_id structures by name
Date: Thu,  5 Dec 2024 16:28:33 +0100
Message-ID: <20241205152833.1788679-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=59997; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=6qKygBsA0d81AGtdPJXkMPkb901rzZTeEiimhyrMxP8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnUcah/sqH8NQaWXgm4GUUPIW3xGFfaxApGMTBg HLU9w7Byx+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ1HGoQAKCRCPgPtYfRL+ Tg9mCACar3eYT3npc+PmmiFw3rbPdnrP36VzytL3H38G+q/eM+8YuhuSSLfglBfI9smOYvtoDr1 2wE+w4LS+n6rFvWYaRrmax940SU5jvzM5DhcSePTfqg98MDsX8gCJOW8qB5uO3YF/WC3f0M1yPr xMUM6JI8ZWBrcszyFC33R5++bWx9iJCmn7123LUqo7pyVEma0vZSC86+I6gooHfIgX8WNlIWAMv NPzSt0Jlp9gHIkrtu84dFppa0ugPh2G9VzyeRcH/tKkJuT0BAqH0EdlPA9W3zLxF0RY9olusA9r 7YASyzx9ZKQ19VbPAB6lpQK9TICL2pBMmehQuna9fNJvKP6N
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

I intend to change the definition of struct i2c_device_id to look as
follows:

        struct i2c_device_id {
               char name[I2C_NAME_SIZE];
               /* Data private to the driver */
               union {
                       kernel_ulong_t driver_data;
                       const void *driver_data_ptr;
               };
        };

That the initializers for these structures also work with this new
definition, they must use named members.

The motivation for that change is to be able to drop many casts from
pointer to kernel_ulong_t. So once the definition is updated,
initializers that today use:

	{"adp4000", (kernel_ulong_t)&pmbus_info_one},

can be changed to

        { .name = "adp4000", .driver_data_ptr = &pmbus_info_one },

and some more casts when the driver data is used can be dropped, too.
(e.g.

	-       device_info = (struct pmbus_device_info *)i2c_match_id(pmbus_id, client)->driver_data;
	+       device_info = i2c_match_id(pmbus_id, client)->driver_data_ptr;

in pmbus_probe().)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I didn't Cc: all the individual maintainers to not hit sending limits
and spam filters.

Best regards
Uwe

 drivers/hwmon/ad7418.c           |  6 +--
 drivers/hwmon/adm1025.c          |  4 +-
 drivers/hwmon/adm1031.c          |  4 +-
 drivers/hwmon/adm9240.c          |  6 +--
 drivers/hwmon/ads7828.c          |  4 +-
 drivers/hwmon/adt7475.c          |  8 +--
 drivers/hwmon/aht10.c            |  6 +--
 drivers/hwmon/asc7621.c          |  6 +--
 drivers/hwmon/dme1737.c          |  4 +-
 drivers/hwmon/ds1621.c           | 10 ++--
 drivers/hwmon/emc1403.c          | 24 ++++-----
 drivers/hwmon/f75375s.c          |  6 +--
 drivers/hwmon/fschmd.c           | 14 ++---
 drivers/hwmon/ina2xx.c           | 14 ++---
 drivers/hwmon/isl28022.c         |  2 +-
 drivers/hwmon/lm63.c             |  6 +--
 drivers/hwmon/lm75.c             | 58 ++++++++++----------
 drivers/hwmon/lm78.c             |  4 +-
 drivers/hwmon/lm80.c             |  4 +-
 drivers/hwmon/lm83.c             |  4 +-
 drivers/hwmon/lm85.c             | 24 ++++-----
 drivers/hwmon/lm90.c             | 90 ++++++++++++++++----------------
 drivers/hwmon/lm92.c             |  4 +-
 drivers/hwmon/lm95234.c          |  4 +-
 drivers/hwmon/max16065.c         | 12 ++---
 drivers/hwmon/max1668.c          |  6 +--
 drivers/hwmon/max31827.c         |  6 +--
 drivers/hwmon/max6650.c          |  4 +-
 drivers/hwmon/max6697.c          | 20 +++----
 drivers/hwmon/mcp3021.c          |  4 +-
 drivers/hwmon/nct6775-i2c.c      | 26 ++++-----
 drivers/hwmon/pmbus/adm1275.c    | 16 +++---
 drivers/hwmon/pmbus/bel-pfe.c    |  4 +-
 drivers/hwmon/pmbus/bpa-rs600.c  |  6 +--
 drivers/hwmon/pmbus/fsp-3y.c     |  4 +-
 drivers/hwmon/pmbus/ibm-cffps.c  |  6 +--
 drivers/hwmon/pmbus/isl68137.c   | 78 +++++++++++++--------------
 drivers/hwmon/pmbus/lm25066.c    | 10 ++--
 drivers/hwmon/pmbus/ltc2978.c    | 52 +++++++++---------
 drivers/hwmon/pmbus/max16601.c   |  8 +--
 drivers/hwmon/pmbus/max20730.c   | 10 ++--
 drivers/hwmon/pmbus/max34440.c   | 12 ++---
 drivers/hwmon/pmbus/mp2856.c     |  4 +-
 drivers/hwmon/pmbus/mp2975.c     |  6 +--
 drivers/hwmon/pmbus/pim4328.c    | 16 +++---
 drivers/hwmon/pmbus/pmbus.c      | 58 ++++++++++----------
 drivers/hwmon/pmbus/q54sj108a2.c |  4 +-
 drivers/hwmon/pmbus/tps53679.c   | 14 ++---
 drivers/hwmon/pmbus/ucd9000.c    | 14 ++---
 drivers/hwmon/pmbus/ucd9200.c    | 16 +++---
 drivers/hwmon/pmbus/zl6100.c     | 44 ++++++++--------
 drivers/hwmon/powr1220.c         |  4 +-
 drivers/hwmon/sht3x.c            |  4 +-
 drivers/hwmon/shtc1.c            |  6 +--
 drivers/hwmon/thmc50.c           |  4 +-
 drivers/hwmon/tmp401.c           | 10 ++--
 drivers/hwmon/tmp421.c           | 10 ++--
 drivers/hwmon/tmp464.c           |  4 +-
 drivers/hwmon/tmp513.c           |  4 +-
 drivers/hwmon/w83781d.c          |  8 +--
 drivers/hwmon/w83795.c           |  4 +-
 61 files changed, 417 insertions(+), 417 deletions(-)

diff --git a/drivers/hwmon/ad7418.c b/drivers/hwmon/ad7418.c
index 7a132accdf8a..a0c9cf5e12cc 100644
--- a/drivers/hwmon/ad7418.c
+++ b/drivers/hwmon/ad7418.c
@@ -281,9 +281,9 @@ static int ad7418_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad7418_id[] = {
-	{ "ad7416", ad7416 },
-	{ "ad7417", ad7417 },
-	{ "ad7418", ad7418 },
+	{ .name = "ad7416", .driver_data = ad7416 },
+	{ .name = "ad7417", .driver_data = ad7417 },
+	{ .name = "ad7418", .driver_data = ad7418 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad7418_id);
diff --git a/drivers/hwmon/adm1025.c b/drivers/hwmon/adm1025.c
index 389382d54752..ccac7ba601e9 100644
--- a/drivers/hwmon/adm1025.c
+++ b/drivers/hwmon/adm1025.c
@@ -548,8 +548,8 @@ static int adm1025_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adm1025_id[] = {
-	{ "adm1025", adm1025 },
-	{ "ne1619", ne1619 },
+	{ .name = "adm1025", .driver_data = adm1025 },
+	{ .name = "ne1619", .driver_data = ne1619 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adm1025_id);
diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index 343118532cdb..24d0d4146c87 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -1055,8 +1055,8 @@ static int adm1031_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adm1031_id[] = {
-	{ "adm1030", adm1030 },
-	{ "adm1031", adm1031 },
+	{ .name = "adm1030", .driver_data = adm1030 },
+	{ .name = "adm1031", .driver_data = adm1031 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adm1031_id);
diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 6dfbeb6acf00..4cf11c0e9391 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -807,9 +807,9 @@ static int adm9240_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adm9240_id[] = {
-	{ "adm9240", adm9240 },
-	{ "ds1780", ds1780 },
-	{ "lm81", lm81 },
+	{ .name = "adm9240", .driver_data = adm9240 },
+	{ .name = "ds1780", .driver_data = ds1780 },
+	{ .name = "lm81", .driver_data = lm81 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adm9240_id);
diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 436637264056..fde696373133 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -176,8 +176,8 @@ static int ads7828_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ads7828_device_ids[] = {
-	{ "ads7828", ads7828 },
-	{ "ads7830", ads7830 },
+	{ .name = "ads7828", .driver_data = ads7828 },
+	{ .name = "ads7830", .driver_data = ads7830 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ads7828_device_ids);
diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 5f2541c11fe9..10886b8f20fd 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -165,10 +165,10 @@ static const unsigned short normal_i2c[] = { 0x2c, 0x2d, 0x2e, I2C_CLIENT_END };
 enum chips { adt7473, adt7475, adt7476, adt7490 };
 
 static const struct i2c_device_id adt7475_id[] = {
-	{ "adt7473", adt7473 },
-	{ "adt7475", adt7475 },
-	{ "adt7476", adt7476 },
-	{ "adt7490", adt7490 },
+	{ .name = "adt7473", .driver_data = adt7473 },
+	{ .name = "adt7475", .driver_data = adt7475 },
+	{ .name = "adt7476", .driver_data = adt7476 },
+	{ .name = "adt7490", .driver_data = adt7490 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adt7475_id);
diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 312ef3e98754..5b68a9ec0b50 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -51,9 +51,9 @@
 enum aht10_variant { aht10, aht20 };
 
 static const struct i2c_device_id aht10_id[] = {
-	{ "aht10", aht10 },
-	{ "aht20", aht20 },
-	{ },
+	{ .name = "aht10", .driver_data = aht10 },
+	{ .name = "aht20", .driver_data = aht20 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aht10_id);
 
diff --git a/drivers/hwmon/asc7621.c b/drivers/hwmon/asc7621.c
index 87e186700849..79ec6e06db0d 100644
--- a/drivers/hwmon/asc7621.c
+++ b/drivers/hwmon/asc7621.c
@@ -1179,9 +1179,9 @@ static void asc7621_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id asc7621_id[] = {
-	{"asc7621", asc7621},
-	{"asc7621a", asc7621a},
-	{},
+	{ .name = "asc7621", .driver_data = asc7621 },
+	{ .name = "asc7621a", .driver_data = asc7621a },
+	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, asc7621_id);
diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index 3d4057309950..7e839308e58f 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -2515,8 +2515,8 @@ static void dme1737_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dme1737_id[] = {
-	{ "dme1737", dme1737 },
-	{ "sch5027", sch5027 },
+	{ .name = "dme1737", .driver_data = dme1737 },
+	{ .name = "sch5027", .driver_data = sch5027 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dme1737_id);
diff --git a/drivers/hwmon/ds1621.c b/drivers/hwmon/ds1621.c
index 42ec34cb8a5f..0618f6de9679 100644
--- a/drivers/hwmon/ds1621.c
+++ b/drivers/hwmon/ds1621.c
@@ -367,11 +367,11 @@ static int ds1621_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ds1621_id[] = {
-	{ "ds1621", ds1621 },
-	{ "ds1625", ds1625 },
-	{ "ds1631", ds1631 },
-	{ "ds1721", ds1721 },
-	{ "ds1731", ds1731 },
+	{ .name = "ds1621", .driver_data = ds1621 },
+	{ .name = "ds1625", .driver_data = ds1625 },
+	{ .name = "ds1631", .driver_data = ds1631 },
+	{ .name = "ds1721", .driver_data = ds1721 },
+	{ .name = "ds1731", .driver_data = ds1731 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds1621_id);
diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index eca33220d34a..bde37a636d14 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -663,18 +663,18 @@ static const struct hwmon_chip_info emc1403_chip_info = {
 
 /* Last digit of chip name indicates number of channels */
 static const struct i2c_device_id emc1403_idtable[] = {
-	{ "emc1402", emc1402 },
-	{ "emc1403", emc1403 },
-	{ "emc1404", emc1404 },
-	{ "emc1412", emc1402 },
-	{ "emc1413", emc1403 },
-	{ "emc1414", emc1404 },
-	{ "emc1422", emc1402 },
-	{ "emc1423", emc1403 },
-	{ "emc1424", emc1404 },
-	{ "emc1428", emc1428 },
-	{ "emc1438", emc1428 },
-	{ "emc1442", emc1402 },
+	{ .name = "emc1402", .driver_data = emc1402 },
+	{ .name = "emc1403", .driver_data = emc1403 },
+	{ .name = "emc1404", .driver_data = emc1404 },
+	{ .name = "emc1412", .driver_data = emc1402 },
+	{ .name = "emc1413", .driver_data = emc1403 },
+	{ .name = "emc1414", .driver_data = emc1404 },
+	{ .name = "emc1422", .driver_data = emc1402 },
+	{ .name = "emc1423", .driver_data = emc1403 },
+	{ .name = "emc1424", .driver_data = emc1404 },
+	{ .name = "emc1428", .driver_data = emc1428 },
+	{ .name = "emc1438", .driver_data = emc1428 },
+	{ .name = "emc1442", .driver_data = emc1402 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, emc1403_idtable);
diff --git a/drivers/hwmon/f75375s.c b/drivers/hwmon/f75375s.c
index 7e867f132420..cc3a9612f2c0 100644
--- a/drivers/hwmon/f75375s.c
+++ b/drivers/hwmon/f75375s.c
@@ -877,9 +877,9 @@ static int f75375_detect(struct i2c_client *client,
 }
 
 static const struct i2c_device_id f75375_id[] = {
-	{ "f75373", f75373 },
-	{ "f75375", f75375 },
-	{ "f75387", f75387 },
+	{ .name = "f75373", .driver_data = f75373 },
+	{ .name = "f75375", .driver_data = f75375 },
+	{ .name = "f75387", .driver_data = f75387 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, f75375_id);
diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
index a303959879ef..83c3e588fed5 100644
--- a/drivers/hwmon/fschmd.c
+++ b/drivers/hwmon/fschmd.c
@@ -225,13 +225,13 @@ static struct fschmd_data *fschmd_update_device(struct device *dev);
  */
 
 static const struct i2c_device_id fschmd_id[] = {
-	{ "fscpos", fscpos },
-	{ "fscher", fscher },
-	{ "fscscy", fscscy },
-	{ "fschrc", fschrc },
-	{ "fschmd", fschmd },
-	{ "fschds", fschds },
-	{ "fscsyl", fscsyl },
+	{ .name = "fscpos", .driver_data = fscpos },
+	{ .name = "fscher", .driver_data = fscher },
+	{ .name = "fscscy", .driver_data = fscscy },
+	{ .name = "fschrc", .driver_data = fschrc },
+	{ .name = "fschmd", .driver_data = fschmd },
+	{ .name = "fschds", .driver_data = fschds },
+	{ .name = "fscsyl", .driver_data = fscsyl },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fschmd_id);
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 345fe7db9de9..5dfca8b88e27 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -981,13 +981,13 @@ static int ina2xx_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ina2xx_id[] = {
-	{ "ina219", ina219 },
-	{ "ina220", ina219 },
-	{ "ina226", ina226 },
-	{ "ina230", ina226 },
-	{ "ina231", ina226 },
-	{ "ina260", ina260 },
-	{ "sy24655", sy24655 },
+	{ .name = "ina219", .driver_data = ina219 },
+	{ .name = "ina220", .driver_data = ina219 },
+	{ .name = "ina226", .driver_data = ina226 },
+	{ .name = "ina230", .driver_data = ina226 },
+	{ .name = "ina231", .driver_data = ina226 },
+	{ .name = "ina260", .driver_data = ina260 },
+	{ .name = "sy24655", .driver_data = sy24655 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina2xx_id);
diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index f9edcfd164c2..04414075afe8 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -486,7 +486,7 @@ static int isl28022_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id isl28022_ids[] = {
-	{ "isl28022", 0},
+	{ "isl28022" },
 	{ /* LIST END */ }
 };
 MODULE_DEVICE_TABLE(i2c, isl28022_ids);
diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 035176a98ce9..54e8229bd0de 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -1131,9 +1131,9 @@ static int lm63_probe(struct i2c_client *client)
  */
 
 static const struct i2c_device_id lm63_id[] = {
-	{ "lm63", lm63 },
-	{ "lm64", lm64 },
-	{ "lm96163", lm96163 },
+	{ .name = "lm63", .driver_data = lm63 },
+	{ .name = "lm64", .driver_data = lm64 },
+	{ .name = "lm96163", .driver_data = lm96163 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm63_id);
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2c2205aec7d4..f2c2d085bc20 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -719,35 +719,35 @@ static int lm75_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm75_ids[] = {
-	{ "adt75", adt75, },
-	{ "as6200", as6200, },
-	{ "at30ts74", at30ts74, },
-	{ "ds1775", ds1775, },
-	{ "ds75", ds75, },
-	{ "ds7505", ds7505, },
-	{ "g751", g751, },
-	{ "lm75", lm75, },
-	{ "lm75a", lm75a, },
-	{ "lm75b", lm75b, },
-	{ "max6625", max6625, },
-	{ "max6626", max6626, },
-	{ "max31725", max31725, },
-	{ "max31726", max31725, },
-	{ "mcp980x", mcp980x, },
-	{ "pct2075", pct2075, },
-	{ "stds75", stds75, },
-	{ "stlm75", stlm75, },
-	{ "tcn75", tcn75, },
-	{ "tmp100", tmp100, },
-	{ "tmp101", tmp101, },
-	{ "tmp105", tmp105, },
-	{ "tmp112", tmp112, },
-	{ "tmp175", tmp175, },
-	{ "tmp275", tmp275, },
-	{ "tmp75", tmp75, },
-	{ "tmp75b", tmp75b, },
-	{ "tmp75c", tmp75c, },
-	{ "tmp1075", tmp1075, },
+	{ .name = "adt75", .driver_data = adt75, },
+	{ .name = "as6200", .driver_data = as6200, },
+	{ .name = "at30ts74", .driver_data = at30ts74, },
+	{ .name = "ds1775", .driver_data = ds1775, },
+	{ .name = "ds75", .driver_data = ds75, },
+	{ .name = "ds7505", .driver_data = ds7505, },
+	{ .name = "g751", .driver_data = g751, },
+	{ .name = "lm75", .driver_data = lm75, },
+	{ .name = "lm75a", .driver_data = lm75a, },
+	{ .name = "lm75b", .driver_data = lm75b, },
+	{ .name = "max6625", .driver_data = max6625, },
+	{ .name = "max6626", .driver_data = max6626, },
+	{ .name = "max31725", .driver_data = max31725, },
+	{ .name = "max31726", .driver_data = max31725, },
+	{ .name = "mcp980x", .driver_data = mcp980x, },
+	{ .name = "pct2075", .driver_data = pct2075, },
+	{ .name = "stds75", .driver_data = stds75, },
+	{ .name = "stlm75", .driver_data = stlm75, },
+	{ .name = "tcn75", .driver_data = tcn75, },
+	{ .name = "tmp100", .driver_data = tmp100, },
+	{ .name = "tmp101", .driver_data = tmp101, },
+	{ .name = "tmp105", .driver_data = tmp105, },
+	{ .name = "tmp112", .driver_data = tmp112, },
+	{ .name = "tmp175", .driver_data = tmp175, },
+	{ .name = "tmp275", .driver_data = tmp275, },
+	{ .name = "tmp75", .driver_data = tmp75, },
+	{ .name = "tmp75b", .driver_data = tmp75b, },
+	{ .name = "tmp75c", .driver_data = tmp75c, },
+	{ .name = "tmp1075", .driver_data = tmp1075, },
 	{ /* LIST END */ }
 };
 MODULE_DEVICE_TABLE(i2c, lm75_ids);
diff --git a/drivers/hwmon/lm78.c b/drivers/hwmon/lm78.c
index 8b53bb312069..7143285b4ee0 100644
--- a/drivers/hwmon/lm78.c
+++ b/drivers/hwmon/lm78.c
@@ -649,8 +649,8 @@ static int lm78_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm78_i2c_id[] = {
-	{ "lm78", lm78 },
-	{ "lm79", lm79 },
+	{ .name = "lm78", .driver_data = lm78 },
+	{ .name = "lm79", .driver_data = lm79 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm78_i2c_id);
diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
index 63c7831bd3e1..dacb707554c8 100644
--- a/drivers/hwmon/lm80.c
+++ b/drivers/hwmon/lm80.c
@@ -622,8 +622,8 @@ static int lm80_probe(struct i2c_client *client)
  */
 
 static const struct i2c_device_id lm80_id[] = {
-	{ "lm80", 0 },
-	{ "lm96080", 1 },
+	{ .name = "lm80", .driver_data = 0 },
+	{ .name = "lm96080", .driver_data = 1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm80_id);
diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index f800fe2ef18b..8d49df8c9314 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -443,8 +443,8 @@ static int lm83_probe(struct i2c_client *client)
  */
 
 static const struct i2c_device_id lm83_id[] = {
-	{ "lm83", lm83 },
-	{ "lm82", lm82 },
+	{ .name = "lm83", .driver_data = lm83 },
+	{ .name = "lm82", .driver_data = lm82 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm83_id);
diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 1c244ed75122..c56e164d61c1 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -1618,18 +1618,18 @@ static int lm85_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm85_id[] = {
-	{ "adm1027", adm1027 },
-	{ "adt7463", adt7463 },
-	{ "adt7468", adt7468 },
-	{ "lm85", lm85 },
-	{ "lm85b", lm85 },
-	{ "lm85c", lm85 },
-	{ "lm96000", lm96000 },
-	{ "emc6d100", emc6d100 },
-	{ "emc6d101", emc6d100 },
-	{ "emc6d102", emc6d102 },
-	{ "emc6d103", emc6d103 },
-	{ "emc6d103s", emc6d103s },
+	{ .name = "adm1027", .driver_data = adm1027 },
+	{ .name = "adt7463", .driver_data = adt7463 },
+	{ .name = "adt7468", .driver_data = adt7468 },
+	{ .name = "lm85", .driver_data = lm85 },
+	{ .name = "lm85b", .driver_data = lm85 },
+	{ .name = "lm85c", .driver_data = lm85 },
+	{ .name = "lm96000", .driver_data = lm96000 },
+	{ .name = "emc6d100", .driver_data = emc6d100 },
+	{ .name = "emc6d101", .driver_data = emc6d100 },
+	{ .name = "emc6d102", .driver_data = emc6d102 },
+	{ .name = "emc6d103", .driver_data = emc6d103 },
+	{ .name = "emc6d103s", .driver_data = emc6d103s },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm85_id);
diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 511d95a0efb3..d6eb8b363e58 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -236,51 +236,51 @@ enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
  */
 
 static const struct i2c_device_id lm90_id[] = {
-	{ "adm1020", max1617 },
-	{ "adm1021", max1617 },
-	{ "adm1023", adm1023 },
-	{ "adm1032", adm1032 },
-	{ "adt7421", adt7461a },
-	{ "adt7461", adt7461 },
-	{ "adt7461a", adt7461a },
-	{ "adt7481", adt7481 },
-	{ "adt7482", adt7481 },
-	{ "adt7483a", adt7481 },
-	{ "g781", g781 },
-	{ "gl523sm", max1617 },
-	{ "lm84", lm84 },
-	{ "lm86", lm90 },
-	{ "lm89", lm90 },
-	{ "lm90", lm90 },
-	{ "lm99", lm99 },
-	{ "max1617", max1617 },
-	{ "max6642", max6642 },
-	{ "max6646", max6646 },
-	{ "max6647", max6646 },
-	{ "max6648", max6648 },
-	{ "max6649", max6646 },
-	{ "max6654", max6654 },
-	{ "max6657", max6657 },
-	{ "max6658", max6657 },
-	{ "max6659", max6659 },
-	{ "max6680", max6680 },
-	{ "max6681", max6680 },
-	{ "max6690", max6654 },
-	{ "max6692", max6648 },
-	{ "max6695", max6696 },
-	{ "max6696", max6696 },
-	{ "mc1066", max1617 },
-	{ "nct1008", adt7461a },
-	{ "nct210", nct210 },
-	{ "nct214", nct72 },
-	{ "nct218", nct72 },
-	{ "nct72", nct72 },
-	{ "ne1618", ne1618 },
-	{ "w83l771", w83l771 },
-	{ "sa56004", sa56004 },
-	{ "thmc10", max1617 },
-	{ "tmp451", tmp451 },
-	{ "tmp461", tmp461 },
+	{ .name = "adm1020", .driver_data = max1617 },
+	{ .name = "adm1021", .driver_data = max1617 },
+	{ .name = "adm1023", .driver_data = adm1023 },
+	{ .name = "adm1032", .driver_data = adm1032 },
+	{ .name = "adt7421", .driver_data = adt7461a },
+	{ .name = "adt7461", .driver_data = adt7461 },
+	{ .name = "adt7461a", .driver_data = adt7461a },
+	{ .name = "adt7481", .driver_data = adt7481 },
+	{ .name = "adt7482", .driver_data = adt7481 },
+	{ .name = "adt7483a", .driver_data = adt7481 },
+	{ .name = "g781", .driver_data = g781 },
+	{ .name = "gl523sm", .driver_data = max1617 },
+	{ .name = "lm84", .driver_data = lm84 },
+	{ .name = "lm86", .driver_data = lm90 },
+	{ .name = "lm89", .driver_data = lm90 },
+	{ .name = "lm90", .driver_data = lm90 },
+	{ .name = "lm99", .driver_data = lm99 },
+	{ .name = "max1617", .driver_data = max1617 },
+	{ .name = "max6642", .driver_data = max6642 },
+	{ .name = "max6646", .driver_data = max6646 },
+	{ .name = "max6647", .driver_data = max6646 },
+	{ .name = "max6648", .driver_data = max6648 },
+	{ .name = "max6649", .driver_data = max6646 },
+	{ .name = "max6654", .driver_data = max6654 },
+	{ .name = "max6657", .driver_data = max6657 },
+	{ .name = "max6658", .driver_data = max6657 },
+	{ .name = "max6659", .driver_data = max6659 },
+	{ .name = "max6680", .driver_data = max6680 },
+	{ .name = "max6681", .driver_data = max6680 },
+	{ .name = "max6690", .driver_data = max6654 },
+	{ .name = "max6692", .driver_data = max6648 },
+	{ .name = "max6695", .driver_data = max6696 },
+	{ .name = "max6696", .driver_data = max6696 },
+	{ .name = "mc1066", .driver_data = max1617 },
+	{ .name = "nct1008", .driver_data = adt7461a },
+	{ .name = "nct210", .driver_data = nct210 },
+	{ .name = "nct214", .driver_data = nct72 },
+	{ .name = "nct218", .driver_data = nct72 },
+	{ .name = "nct72", .driver_data = nct72 },
+	{ .name = "ne1618", .driver_data = ne1618 },
+	{ .name = "w83l771", .driver_data = w83l771 },
+	{ .name = "sa56004", .driver_data = sa56004 },
+	{ .name = "thmc10", .driver_data = max1617 },
+	{ .name = "tmp451", .driver_data = tmp451 },
+	{ .name = "tmp461", .driver_data = tmp461 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm90_id);
diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index 0be439b38ee1..e295b1c59abf 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -414,8 +414,8 @@ static int lm92_probe(struct i2c_client *client)
 
 /* .driver_data is limit register resolution */ 
 static const struct i2c_device_id lm92_id[] = {
-	{ "lm92", 13 },
-	{ "max6635", 9 },
+	{ .name = "lm92", .driver_data = 13 },
+	{ .name = "max6635", .driver_data = 9 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm92_id);
diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index 7da6c8f07332..9c2221b607e7 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -540,8 +540,8 @@ static int lm95234_probe(struct i2c_client *client)
 
 /* Driver data (common to all clients) */
 static const struct i2c_device_id lm95234_id[] = {
-	{ "lm95233", lm95233 },
-	{ "lm95234", lm95234 },
+	{ .name = "lm95233", .driver_data = lm95233 },
+	{ .name = "lm95234", .driver_data = lm95234 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm95234_id);
diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index 0ccb5eb596fc..6acc50a9100e 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -591,12 +591,12 @@ static int max16065_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max16065_id[] = {
-	{ "max16065", max16065 },
-	{ "max16066", max16066 },
-	{ "max16067", max16067 },
-	{ "max16068", max16068 },
-	{ "max16070", max16070 },
-	{ "max16071", max16071 },
+	{ .name = "max16065", .driver_data = max16065 },
+	{ .name = "max16066", .driver_data = max16066 },
+	{ .name = "max16067", .driver_data = max16067 },
+	{ .name = "max16068", .driver_data = max16068 },
+	{ .name = "max16070", .driver_data = max16070 },
+	{ .name = "max16071", .driver_data = max16071 },
 	{ }
 };
 
diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index a8197a86f559..32548f56409c 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -293,9 +293,9 @@ static int max1668_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max1668_id[] = {
-	{ "max1668", 5 },
-	{ "max1805", 3 },
-	{ "max1989", 5 },
+	{ .name = "max1668", .driver_data = 5 },
+	{ .name = "max1805", .driver_data = 3 },
+	{ .name = "max1989", .driver_data = 5 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max1668_id);
diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
index 48e8f8ba4d05..e20af617feef 100644
--- a/drivers/hwmon/max31827.c
+++ b/drivers/hwmon/max31827.c
@@ -493,9 +493,9 @@ static struct attribute *max31827_attrs[] = {
 ATTRIBUTE_GROUPS(max31827);
 
 static const struct i2c_device_id max31827_i2c_ids[] = {
-	{ "max31827", max31827 },
-	{ "max31828", max31828 },
-	{ "max31829", max31829 },
+	{ .name = "max31827", .driver_data = max31827 },
+	{ .name = "max31828", .driver_data = max31828 },
+	{ .name = "max31829", .driver_data = max31829 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max31827_i2c_ids);
diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 9649c6611d5f..dafec69bb119 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -806,8 +806,8 @@ static int max6650_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max6650_id[] = {
-	{ "max6650", 1 },
-	{ "max6651", 4 },
+	{ .name = "max6650", .driver_data = 1 },
+	{ .name = "max6651", .driver_data = 4 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max6650_id);
diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 0735a1d2c20f..def02ae9aab9 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -571,16 +571,16 @@ static int max6697_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max6697_id[] = {
-	{ "max6581", max6581 },
-	{ "max6602", max6602 },
-	{ "max6622", max6622 },
-	{ "max6636", max6636 },
-	{ "max6689", max6689 },
-	{ "max6693", max6693 },
-	{ "max6694", max6694 },
-	{ "max6697", max6697 },
-	{ "max6698", max6698 },
-	{ "max6699", max6699 },
+	{ .name = "max6581", .driver_data = max6581 },
+	{ .name = "max6602", .driver_data = max6602 },
+	{ .name = "max6622", .driver_data = max6622 },
+	{ .name = "max6636", .driver_data = max6636 },
+	{ .name = "max6689", .driver_data = max6689 },
+	{ .name = "max6693", .driver_data = max6693 },
+	{ .name = "max6694", .driver_data = max6694 },
+	{ .name = "max6697", .driver_data = max6697 },
+	{ .name = "max6698", .driver_data = max6698 },
+	{ .name = "max6699", .driver_data = max6699 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max6697_id);
diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
index bcddf6804d3a..d6b0ebf27941 100644
--- a/drivers/hwmon/mcp3021.c
+++ b/drivers/hwmon/mcp3021.c
@@ -177,8 +177,8 @@ static int mcp3021_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mcp3021_id[] = {
-	{ "mcp3021", mcp3021 },
-	{ "mcp3221", mcp3221 },
+	{ .name = "mcp3021", .driver_data = mcp3021 },
+	{ .name = "mcp3221", .driver_data = mcp3221 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mcp3021_id);
diff --git a/drivers/hwmon/nct6775-i2c.c b/drivers/hwmon/nct6775-i2c.c
index ba71d776a291..07783910c058 100644
--- a/drivers/hwmon/nct6775-i2c.c
+++ b/drivers/hwmon/nct6775-i2c.c
@@ -93,19 +93,19 @@ static const struct of_device_id __maybe_unused nct6775_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, nct6775_i2c_of_match);
 
 static const struct i2c_device_id nct6775_i2c_id[] = {
-	{ "nct6106", nct6106 },
-	{ "nct6116", nct6116 },
-	{ "nct6775", nct6775 },
-	{ "nct6776", nct6776 },
-	{ "nct6779", nct6779 },
-	{ "nct6791", nct6791 },
-	{ "nct6792", nct6792 },
-	{ "nct6793", nct6793 },
-	{ "nct6795", nct6795 },
-	{ "nct6796", nct6796 },
-	{ "nct6797", nct6797 },
-	{ "nct6798", nct6798 },
-	{ "nct6799", nct6799 },
+	{ .name = "nct6106", .driver_data = nct6106 },
+	{ .name = "nct6116", .driver_data = nct6116 },
+	{ .name = "nct6775", .driver_data = nct6775 },
+	{ .name = "nct6776", .driver_data = nct6776 },
+	{ .name = "nct6779", .driver_data = nct6779 },
+	{ .name = "nct6791", .driver_data = nct6791 },
+	{ .name = "nct6792", .driver_data = nct6792 },
+	{ .name = "nct6793", .driver_data = nct6793 },
+	{ .name = "nct6795", .driver_data = nct6795 },
+	{ .name = "nct6796", .driver_data = nct6796 },
+	{ .name = "nct6797", .driver_data = nct6797 },
+	{ .name = "nct6798", .driver_data = nct6798 },
+	{ .name = "nct6799", .driver_data = nct6799 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nct6775_i2c_id);
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 127593e10a03..a89c5557ed0c 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -477,14 +477,14 @@ static int adm1275_read_byte_data(struct i2c_client *client, int page, int reg)
 }
 
 static const struct i2c_device_id adm1275_id[] = {
-	{ "adm1075", adm1075 },
-	{ "adm1272", adm1272 },
-	{ "adm1275", adm1275 },
-	{ "adm1276", adm1276 },
-	{ "adm1278", adm1278 },
-	{ "adm1281", adm1281 },
-	{ "adm1293", adm1293 },
-	{ "adm1294", adm1294 },
+	{ .name = "adm1075", .driver_data = adm1075 },
+	{ .name = "adm1272", .driver_data = adm1272 },
+	{ .name = "adm1275", .driver_data = adm1275 },
+	{ .name = "adm1276", .driver_data = adm1276 },
+	{ .name = "adm1278", .driver_data = adm1278 },
+	{ .name = "adm1281", .driver_data = adm1281 },
+	{ .name = "adm1293", .driver_data = adm1293 },
+	{ .name = "adm1294", .driver_data = adm1294 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adm1275_id);
diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
index ddf9d9a2958c..f9ccee0eb391 100644
--- a/drivers/hwmon/pmbus/bel-pfe.c
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -109,8 +109,8 @@ static int pfe_pmbus_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pfe_device_id[] = {
-	{"pfe1100", pfe1100},
-	{"pfe3000", pfe3000},
+	{ .name = "pfe1100", .driver_data = pfe1100 },
+	{ .name = "pfe3000", .driver_data = pfe3000 },
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/bpa-rs600.c b/drivers/hwmon/pmbus/bpa-rs600.c
index 6c3875ba37a0..5ff3b2bb46f7 100644
--- a/drivers/hwmon/pmbus/bpa-rs600.c
+++ b/drivers/hwmon/pmbus/bpa-rs600.c
@@ -147,9 +147,9 @@ static struct pmbus_driver_info bpa_rs600_info = {
 };
 
 static const struct i2c_device_id bpa_rs600_id[] = {
-	{ "bpa-rs600", bpa_rs600 },
-	{ "bpd-rs600", bpd_rs600 },
-	{},
+	{ .name = "bpa-rs600", .driver_data = bpa_rs600 },
+	{ .name = "bpd-rs600", .driver_data = bpd_rs600 },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, bpa_rs600_id);
 
diff --git a/drivers/hwmon/pmbus/fsp-3y.c b/drivers/hwmon/pmbus/fsp-3y.c
index a4dc09e2ef75..04f5696670ea 100644
--- a/drivers/hwmon/pmbus/fsp-3y.c
+++ b/drivers/hwmon/pmbus/fsp-3y.c
@@ -223,8 +223,8 @@ static int fsp3y_detect(struct i2c_client *client)
 }
 
 static const struct i2c_device_id fsp3y_id[] = {
-	{"ym2151e", ym2151e},
-	{"yh5151e", yh5151e},
+	{ .name = "ym2151e", .driver_data = ym2151e },
+	{ .name = "yh5151e", .driver_data = yh5151e },
 	{ }
 };
 
diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index d05ef7a968a9..039418fd3b9b 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -472,9 +472,9 @@ static struct pmbus_platform_data ibm_cffps_pdata = {
 };
 
 static const struct i2c_device_id ibm_cffps_id[] = {
-	{ "ibm_cffps1", cffps1 },
-	{ "ibm_cffps2", cffps2 },
-	{ "ibm_cffps", cffps_unknown },
+	{ .name = "ibm_cffps1", .driver_data = cffps1 },
+	{ .name = "ibm_cffps2", .driver_data = cffps2 },
+	{ .name = "ibm_cffps", .driver_data = cffps_unknown },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2af921039309..dd71795cfa11 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -424,47 +424,47 @@ static int isl68137_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id raa_dmpvr_id[] = {
-	{"isl68137", raa_dmpvr1_2rail},
-	{"isl68220", raa_dmpvr2_2rail},
-	{"isl68221", raa_dmpvr2_3rail},
-	{"isl68222", raa_dmpvr2_2rail},
-	{"isl68223", raa_dmpvr2_2rail},
-	{"isl68224", raa_dmpvr2_3rail},
-	{"isl68225", raa_dmpvr2_2rail},
-	{"isl68226", raa_dmpvr2_3rail},
-	{"isl68227", raa_dmpvr2_1rail},
-	{"isl68229", raa_dmpvr2_3rail},
-	{"isl68233", raa_dmpvr2_2rail},
-	{"isl68239", raa_dmpvr2_3rail},
+	{ .name = "isl68137", .driver_data = raa_dmpvr1_2rail },
+	{ .name = "isl68220", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl68221", .driver_data = raa_dmpvr2_3rail },
+	{ .name = "isl68222", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl68223", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl68224", .driver_data = raa_dmpvr2_3rail },
+	{ .name = "isl68225", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl68226", .driver_data = raa_dmpvr2_3rail },
+	{ .name = "isl68227", .driver_data = raa_dmpvr2_1rail },
+	{ .name = "isl68229", .driver_data = raa_dmpvr2_3rail },
+	{ .name = "isl68233", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl68239", .driver_data = raa_dmpvr2_3rail },
 
-	{"isl69222", raa_dmpvr2_2rail},
-	{"isl69223", raa_dmpvr2_3rail},
-	{"isl69224", raa_dmpvr2_2rail},
-	{"isl69225", raa_dmpvr2_2rail},
-	{"isl69227", raa_dmpvr2_3rail},
-	{"isl69228", raa_dmpvr2_3rail},
-	{"isl69234", raa_dmpvr2_2rail},
-	{"isl69236", raa_dmpvr2_2rail},
-	{"isl69239", raa_dmpvr2_3rail},
-	{"isl69242", raa_dmpvr2_2rail},
-	{"isl69243", raa_dmpvr2_1rail},
-	{"isl69247", raa_dmpvr2_2rail},
-	{"isl69248", raa_dmpvr2_2rail},
-	{"isl69254", raa_dmpvr2_2rail},
-	{"isl69255", raa_dmpvr2_2rail},
-	{"isl69256", raa_dmpvr2_2rail},
-	{"isl69259", raa_dmpvr2_2rail},
-	{"isl69260", raa_dmpvr2_2rail},
-	{"isl69268", raa_dmpvr2_2rail},
-	{"isl69269", raa_dmpvr2_3rail},
-	{"isl69298", raa_dmpvr2_2rail},
+	{ .name = "isl69222", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69223", .driver_data = raa_dmpvr2_3rail },
+	{ .name = "isl69224", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69225", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69227", .driver_data = raa_dmpvr2_3rail },
+	{ .name = "isl69228", .driver_data = raa_dmpvr2_3rail },
+	{ .name = "isl69234", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69236", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69239", .driver_data = raa_dmpvr2_3rail },
+	{ .name = "isl69242", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69243", .driver_data = raa_dmpvr2_1rail },
+	{ .name = "isl69247", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69248", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69254", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69255", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69256", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69259", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69260", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69268", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "isl69269", .driver_data = raa_dmpvr2_3rail },
+	{ .name = "isl69298", .driver_data = raa_dmpvr2_2rail },
 
-	{"raa228000", raa_dmpvr2_hv},
-	{"raa228004", raa_dmpvr2_hv},
-	{"raa228006", raa_dmpvr2_hv},
-	{"raa228228", raa_dmpvr2_2rail_nontc},
-	{"raa229001", raa_dmpvr2_2rail},
-	{"raa229004", raa_dmpvr2_2rail},
+	{ .name = "raa228000", .driver_data = raa_dmpvr2_hv },
+	{ .name = "raa228004", .driver_data = raa_dmpvr2_hv },
+	{ .name = "raa228006", .driver_data = raa_dmpvr2_hv },
+	{ .name = "raa228228", .driver_data = raa_dmpvr2_2rail_nontc },
+	{ .name = "raa229001", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "raa229004", .driver_data = raa_dmpvr2_2rail },
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 40b0dda32ea6..38633b424c54 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -442,11 +442,11 @@ static const struct regulator_desc lm25066_reg_desc[] = {
 #endif
 
 static const struct i2c_device_id lm25066_id[] = {
-	{"lm25056", lm25056},
-	{"lm25066", lm25066},
-	{"lm5064", lm5064},
-	{"lm5066", lm5066},
-	{"lm5066i", lm5066i},
+	{ .name = "lm25056", .driver_data = lm25056 },
+	{ .name = "lm25066", .driver_data = lm25066 },
+	{ .name = "lm5064", .driver_data = lm5064 },
+	{ .name = "lm5066", .driver_data = lm5066 },
+	{ .name = "lm5066i", .driver_data = lm5066i },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm25066_id);
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 4c306943383a..503b64f741a5 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -535,32 +535,32 @@ static int ltc2978_write_word_data(struct i2c_client *client, int page,
 }
 
 static const struct i2c_device_id ltc2978_id[] = {
-	{"ltc2972", ltc2972},
-	{"ltc2974", ltc2974},
-	{"ltc2975", ltc2975},
-	{"ltc2977", ltc2977},
-	{"ltc2978", ltc2978},
-	{"ltc2979", ltc2979},
-	{"ltc2980", ltc2980},
-	{"ltc3880", ltc3880},
-	{"ltc3882", ltc3882},
-	{"ltc3883", ltc3883},
-	{"ltc3884", ltc3884},
-	{"ltc3886", ltc3886},
-	{"ltc3887", ltc3887},
-	{"ltc3889", ltc3889},
-	{"ltc7132", ltc7132},
-	{"ltc7841", ltc7841},
-	{"ltc7880", ltc7880},
-	{"ltm2987", ltm2987},
-	{"ltm4664", ltm4664},
-	{"ltm4675", ltm4675},
-	{"ltm4676", ltm4676},
-	{"ltm4677", ltm4677},
-	{"ltm4678", ltm4678},
-	{"ltm4680", ltm4680},
-	{"ltm4686", ltm4686},
-	{"ltm4700", ltm4700},
+	{ .name = "ltc2972", .driver_data = ltc2972 },
+	{ .name = "ltc2974", .driver_data = ltc2974 },
+	{ .name = "ltc2975", .driver_data = ltc2975 },
+	{ .name = "ltc2977", .driver_data = ltc2977 },
+	{ .name = "ltc2978", .driver_data = ltc2978 },
+	{ .name = "ltc2979", .driver_data = ltc2979 },
+	{ .name = "ltc2980", .driver_data = ltc2980 },
+	{ .name = "ltc3880", .driver_data = ltc3880 },
+	{ .name = "ltc3882", .driver_data = ltc3882 },
+	{ .name = "ltc3883", .driver_data = ltc3883 },
+	{ .name = "ltc3884", .driver_data = ltc3884 },
+	{ .name = "ltc3886", .driver_data = ltc3886 },
+	{ .name = "ltc3887", .driver_data = ltc3887 },
+	{ .name = "ltc3889", .driver_data = ltc3889 },
+	{ .name = "ltc7132", .driver_data = ltc7132 },
+	{ .name = "ltc7841", .driver_data = ltc7841 },
+	{ .name = "ltc7880", .driver_data = ltc7880 },
+	{ .name = "ltm2987", .driver_data = ltm2987 },
+	{ .name = "ltm4664", .driver_data = ltm4664 },
+	{ .name = "ltm4675", .driver_data = ltm4675 },
+	{ .name = "ltm4676", .driver_data = ltm4676 },
+	{ .name = "ltm4677", .driver_data = ltm4677 },
+	{ .name = "ltm4678", .driver_data = ltm4678 },
+	{ .name = "ltm4680", .driver_data = ltm4680 },
+	{ .name = "ltm4686", .driver_data = ltm4686 },
+	{ .name = "ltm4700", .driver_data = ltm4700 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ltc2978_id);
diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index d696e506aafb..079c71b04a52 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -263,10 +263,10 @@ static void max16601_remove(void *_data)
 }
 
 static const struct i2c_device_id max16601_id[] = {
-	{"max16508", max16508},
-	{"max16600", max16600},
-	{"max16601", max16601},
-	{"max16602", max16602},
+	{ .name = "max16508", .driver_data = max16508 },
+	{ .name = "max16600", .driver_data = max16600 },
+	{ .name = "max16601", .driver_data = max16601 },
+	{ .name = "max16602", .driver_data = max16602 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, max16601_id);
diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 95869d198ecf..55c3c55568b8 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -754,11 +754,11 @@ static int max20730_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max20730_id[] = {
-	{ "max20710", max20710 },
-	{ "max20730", max20730 },
-	{ "max20734", max20734 },
-	{ "max20743", max20743 },
-	{ },
+	{ .name = "max20710", .driver_data = max20710 },
+	{ .name = "max20730", .driver_data = max20730 },
+	{ .name = "max20734", .driver_data = max20734 },
+	{ .name = "max20743", .driver_data = max20743 },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, max20730_id);
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index c9dda33831ff..acd2fa0713ad 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -505,12 +505,12 @@ static int max34440_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max34440_id[] = {
-	{"max34440", max34440},
-	{"max34441", max34441},
-	{"max34446", max34446},
-	{"max34451", max34451},
-	{"max34460", max34460},
-	{"max34461", max34461},
+	{ .name = "max34440", .driver_data = max34440 },
+	{ .name = "max34441", .driver_data = max34441 },
+	{ .name = "max34446", .driver_data = max34446 },
+	{ .name = "max34451", .driver_data = max34451 },
+	{ .name = "max34460", .driver_data = max34460 },
+	{ .name = "max34461", .driver_data = max34461 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, max34440_id);
diff --git a/drivers/hwmon/pmbus/mp2856.c b/drivers/hwmon/pmbus/mp2856.c
index e83c70a3583f..8ded3e1920be 100644
--- a/drivers/hwmon/pmbus/mp2856.c
+++ b/drivers/hwmon/pmbus/mp2856.c
@@ -54,8 +54,8 @@ static const int mp2856_max_phases[][MP2856_PAGE_NUM] = {
 };
 
 static const struct i2c_device_id mp2856_id[] = {
-	{"mp2856", mp2856},
-	{"mp2857", mp2857},
+	{ .name = "mp2856", .driver_data = mp2856 },
+	{ .name = "mp2857", .driver_data = mp2857 },
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index c31982d85196..6ee70a7e8b04 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -1080,9 +1080,9 @@ static const struct of_device_id mp2975_of_match[] = {
 MODULE_DEVICE_TABLE(of, mp2975_of_match);
 
 static const struct i2c_device_id mp2975_id[] = {
-	{"mp2971", (kernel_ulong_t)&mp2975_ddinfo[mp2971]},
-	{"mp2973", (kernel_ulong_t)&mp2975_ddinfo[mp2973]},
-	{"mp2975", (kernel_ulong_t)&mp2975_ddinfo[mp2975]},
+	{ .name = "mp2971", .driver_data = (kernel_ulong_t)&mp2975_ddinfo[mp2971] },
+	{ .name = "mp2973", .driver_data = (kernel_ulong_t)&mp2975_ddinfo[mp2973] },
+	{ .name = "mp2975", .driver_data = (kernel_ulong_t)&mp2975_ddinfo[mp2975] },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, mp2975_id);
diff --git a/drivers/hwmon/pmbus/pim4328.c b/drivers/hwmon/pmbus/pim4328.c
index aa98284bbdd8..f9c0179c56cc 100644
--- a/drivers/hwmon/pmbus/pim4328.c
+++ b/drivers/hwmon/pmbus/pim4328.c
@@ -39,14 +39,14 @@ struct pim4328_data {
 #define PIM4328_MFR_READ_STATUS		0xd0
 
 static const struct i2c_device_id pim4328_id[] = {
-	{"bmr455", pim4328},
-	{"pim4006", pim4006},
-	{"pim4106", pim4006},
-	{"pim4206", pim4006},
-	{"pim4306", pim4006},
-	{"pim4328", pim4328},
-	{"pim4406", pim4006},
-	{"pim4820", pim4820},
+	{ .name = "bmr455", .driver_data = pim4328 },
+	{ .name = "pim4006", .driver_data = pim4006 },
+	{ .name = "pim4106", .driver_data = pim4006 },
+	{ .name = "pim4206", .driver_data = pim4006 },
+	{ .name = "pim4306", .driver_data = pim4006 },
+	{ .name = "pim4328", .driver_data = pim4328 },
+	{ .name = "pim4406", .driver_data = pim4006 },
+	{ .name = "pim4820", .driver_data = pim4820 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pim4328_id);
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 77cf268e7d2d..032522e72fe5 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -213,35 +213,35 @@ static const struct pmbus_device_info pmbus_info_one_status = {
  * Use driver_data to set the number of pages supported by the chip.
  */
 static const struct i2c_device_id pmbus_id[] = {
-	{"adp4000", (kernel_ulong_t)&pmbus_info_one},
-	{"bmr310", (kernel_ulong_t)&pmbus_info_one_status},
-	{"bmr453", (kernel_ulong_t)&pmbus_info_one},
-	{"bmr454", (kernel_ulong_t)&pmbus_info_one},
-	{"bmr456", (kernel_ulong_t)&pmbus_info_one},
-	{"bmr457", (kernel_ulong_t)&pmbus_info_one},
-	{"bmr458", (kernel_ulong_t)&pmbus_info_one_status},
-	{"bmr480", (kernel_ulong_t)&pmbus_info_one_status},
-	{"bmr490", (kernel_ulong_t)&pmbus_info_one_status},
-	{"bmr491", (kernel_ulong_t)&pmbus_info_one_status},
-	{"bmr492", (kernel_ulong_t)&pmbus_info_one},
-	{"dps460", (kernel_ulong_t)&pmbus_info_one_skip},
-	{"dps650ab", (kernel_ulong_t)&pmbus_info_one_skip},
-	{"dps800", (kernel_ulong_t)&pmbus_info_one_skip},
-	{"max20796", (kernel_ulong_t)&pmbus_info_one},
-	{"mdt040", (kernel_ulong_t)&pmbus_info_one},
-	{"ncp4200", (kernel_ulong_t)&pmbus_info_one},
-	{"ncp4208", (kernel_ulong_t)&pmbus_info_one},
-	{"pdt003", (kernel_ulong_t)&pmbus_info_one},
-	{"pdt006", (kernel_ulong_t)&pmbus_info_one},
-	{"pdt012", (kernel_ulong_t)&pmbus_info_one},
-	{"pmbus", (kernel_ulong_t)&pmbus_info_zero},
-	{"sgd009", (kernel_ulong_t)&pmbus_info_one_skip},
-	{"tps40400", (kernel_ulong_t)&pmbus_info_one},
-	{"tps544b20", (kernel_ulong_t)&pmbus_info_one},
-	{"tps544b25", (kernel_ulong_t)&pmbus_info_one},
-	{"tps544c20", (kernel_ulong_t)&pmbus_info_one},
-	{"tps544c25", (kernel_ulong_t)&pmbus_info_one},
-	{"udt020", (kernel_ulong_t)&pmbus_info_one},
+	{ .name = "adp4000", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "bmr310", .driver_data = (kernel_ulong_t)&pmbus_info_one_status },
+	{ .name = "bmr453", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "bmr454", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "bmr456", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "bmr457", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "bmr458", .driver_data = (kernel_ulong_t)&pmbus_info_one_status },
+	{ .name = "bmr480", .driver_data = (kernel_ulong_t)&pmbus_info_one_status },
+	{ .name = "bmr490", .driver_data = (kernel_ulong_t)&pmbus_info_one_status },
+	{ .name = "bmr491", .driver_data = (kernel_ulong_t)&pmbus_info_one_status },
+	{ .name = "bmr492", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "dps460", .driver_data = (kernel_ulong_t)&pmbus_info_one_skip },
+	{ .name = "dps650ab", .driver_data = (kernel_ulong_t)&pmbus_info_one_skip },
+	{ .name = "dps800", .driver_data = (kernel_ulong_t)&pmbus_info_one_skip },
+	{ .name = "max20796", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "mdt040", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "ncp4200", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "ncp4208", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "pdt003", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "pdt006", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "pdt012", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "pmbus", .driver_data = (kernel_ulong_t)&pmbus_info_zero },
+	{ .name = "sgd009", .driver_data = (kernel_ulong_t)&pmbus_info_one_skip },
+	{ .name = "tps40400", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "tps544b20", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "tps544b25", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "tps544c20", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "tps544c25", .driver_data = (kernel_ulong_t)&pmbus_info_one },
+	{ .name = "udt020", .driver_data = (kernel_ulong_t)&pmbus_info_one },
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index 4d7086d83aa3..650c67e95b0e 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -268,8 +268,8 @@ static const struct file_operations q54sj108a2_fops = {
 };
 
 static const struct i2c_device_id q54sj108a2_id[] = {
-	{ "q54sj108a2", q54sj108a2 },
-	{ },
+	{ .name = "q54sj108a2", .driver_data = q54sj108a2 },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, q54sj108a2_id);
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 63524dff5e75..065d17658331 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -271,13 +271,13 @@ static int tps53679_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tps53679_id[] = {
-	{"bmr474", tps53676},
-	{"tps53647", tps53647},
-	{"tps53667", tps53667},
-	{"tps53676", tps53676},
-	{"tps53679", tps53679},
-	{"tps53681", tps53681},
-	{"tps53688", tps53688},
+	{ .name = "bmr474", .driver_data = tps53676 },
+	{ .name = "tps53647", .driver_data = tps53647 },
+	{ .name = "tps53667", .driver_data = tps53667 },
+	{ .name = "tps53676", .driver_data = tps53676 },
+	{ .name = "tps53679", .driver_data = tps53679 },
+	{ .name = "tps53681", .driver_data = tps53681 },
+	{ .name = "tps53688", .driver_data = tps53688 },
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 9b0eadc81a2e..ca6b0b8e7ae1 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -142,13 +142,13 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
 }
 
 static const struct i2c_device_id ucd9000_id[] = {
-	{"ucd9000", ucd9000},
-	{"ucd90120", ucd90120},
-	{"ucd90124", ucd90124},
-	{"ucd90160", ucd90160},
-	{"ucd90320", ucd90320},
-	{"ucd9090", ucd9090},
-	{"ucd90910", ucd90910},
+	{ .name = "ucd9000", .driver_data = ucd9000 },
+	{ .name = "ucd90120", .driver_data = ucd90120 },
+	{ .name = "ucd90124", .driver_data = ucd90124 },
+	{ .name = "ucd90160", .driver_data = ucd90160 },
+	{ .name = "ucd90320", .driver_data = ucd90320 },
+	{ .name = "ucd9090", .driver_data = ucd9090 },
+	{ .name = "ucd90910", .driver_data = ucd90910 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index f68adaf4a110..4593dc31ff12 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -22,14 +22,14 @@ enum chips { ucd9200, ucd9220, ucd9222, ucd9224, ucd9240, ucd9244, ucd9246,
 	     ucd9248 };
 
 static const struct i2c_device_id ucd9200_id[] = {
-	{"ucd9200", ucd9200},
-	{"ucd9220", ucd9220},
-	{"ucd9222", ucd9222},
-	{"ucd9224", ucd9224},
-	{"ucd9240", ucd9240},
-	{"ucd9244", ucd9244},
-	{"ucd9246", ucd9246},
-	{"ucd9248", ucd9248},
+	{ .name = "ucd9200", .driver_data = ucd9200 },
+	{ .name = "ucd9220", .driver_data = ucd9220 },
+	{ .name = "ucd9222", .driver_data = ucd9222 },
+	{ .name = "ucd9224", .driver_data = ucd9224 },
+	{ .name = "ucd9240", .driver_data = ucd9240 },
+	{ .name = "ucd9244", .driver_data = ucd9244 },
+	{ .name = "ucd9246", .driver_data = ucd9246 },
+	{ .name = "ucd9248", .driver_data = ucd9248 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ucd9200_id);
diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index 97be69630cfb..5db2a7818d16 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -250,28 +250,28 @@ static int zl6100_write_word_data(struct i2c_client *client, int page, int reg,
 }
 
 static const struct i2c_device_id zl6100_id[] = {
-	{"bmr450", zl2005},
-	{"bmr451", zl2005},
-	{"bmr462", zl2008},
-	{"bmr463", zl2008},
-	{"bmr464", zl2008},
-	{"bmr465", zls4009},
-	{"bmr466", zls1003},
-	{"bmr467", zls4009},
-	{"bmr469", zl8802},
-	{"zl2004", zl2004},
-	{"zl2005", zl2005},
-	{"zl2006", zl2006},
-	{"zl2008", zl2008},
-	{"zl2105", zl2105},
-	{"zl2106", zl2106},
-	{"zl6100", zl6100},
-	{"zl6105", zl6105},
-	{"zl8802", zl8802},
-	{"zl9101", zl9101},
-	{"zl9117", zl9117},
-	{"zls1003", zls1003},
-	{"zls4009", zls4009},
+	{ .name = "bmr450", .driver_data = zl2005 },
+	{ .name = "bmr451", .driver_data = zl2005 },
+	{ .name = "bmr462", .driver_data = zl2008 },
+	{ .name = "bmr463", .driver_data = zl2008 },
+	{ .name = "bmr464", .driver_data = zl2008 },
+	{ .name = "bmr465", .driver_data = zls4009 },
+	{ .name = "bmr466", .driver_data = zls1003 },
+	{ .name = "bmr467", .driver_data = zls4009 },
+	{ .name = "bmr469", .driver_data = zl8802 },
+	{ .name = "zl2004", .driver_data = zl2004 },
+	{ .name = "zl2005", .driver_data = zl2005 },
+	{ .name = "zl2006", .driver_data = zl2006 },
+	{ .name = "zl2008", .driver_data = zl2008 },
+	{ .name = "zl2105", .driver_data = zl2105 },
+	{ .name = "zl2106", .driver_data = zl2106 },
+	{ .name = "zl6100", .driver_data = zl6100 },
+	{ .name = "zl6105", .driver_data = zl6105 },
+	{ .name = "zl8802", .driver_data = zl8802 },
+	{ .name = "zl9101", .driver_data = zl9101 },
+	{ .name = "zl9117", .driver_data = zl9117 },
+	{ .name = "zls1003", .driver_data = zls1003 },
+	{ .name = "zls4009", .driver_data = zls4009 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, zl6100_id);
diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 5f9ca6543530..d8d114e06da7 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -315,8 +315,8 @@ static int powr1220_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id powr1220_ids[] = {
-	{ "powr1014", powr1014, },
-	{ "powr1220", powr1220, },
+	{ .name = "powr1014", .driver_data = powr1014, },
+	{ .name = "powr1220", .driver_data = powr1220, },
 	{ }
 };
 
diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 650b0bcc2359..d227fd1451a6 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -956,8 +956,8 @@ static int sht3x_probe(struct i2c_client *client)
 
 /* device ID table */
 static const struct i2c_device_id sht3x_ids[] = {
-	{"sht3x", sht3x},
-	{"sts3x", sts3x},
+	{ .name = "sht3x", .driver_data = sht3x },
+	{ .name = "sts3x", .driver_data = sts3x },
 	{}
 };
 
diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
index 2ac906e8e173..362a73cf661b 100644
--- a/drivers/hwmon/shtc1.c
+++ b/drivers/hwmon/shtc1.c
@@ -257,9 +257,9 @@ static int shtc1_probe(struct i2c_client *client)
 
 /* device ID table */
 static const struct i2c_device_id shtc1_id[] = {
-	{ "shtc1", shtc1 },
-	{ "shtw1", shtc1 },
-	{ "shtc3", shtc3 },
+	{ .name = "shtc1", .driver_data = shtc1 },
+	{ .name = "shtw1", .driver_data = shtc1 },
+	{ .name = "shtc3", .driver_data = shtc3 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, shtc1_id);
diff --git a/drivers/hwmon/thmc50.c b/drivers/hwmon/thmc50.c
index 0cbdb91698b1..b385ef64af75 100644
--- a/drivers/hwmon/thmc50.c
+++ b/drivers/hwmon/thmc50.c
@@ -407,8 +407,8 @@ static int thmc50_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id thmc50_id[] = {
-	{ "adm1022", adm1022 },
-	{ "thmc50", thmc50 },
+	{ .name = "adm1022", .driver_data = adm1022 },
+	{ .name = "thmc50", .driver_data = thmc50 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, thmc50_id);
diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 02c5a3bb1071..d78b4ee7213f 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -91,11 +91,11 @@ static const u8 TMP432_STATUS_REG[] = {
  */
 
 static const struct i2c_device_id tmp401_id[] = {
-	{ "tmp401", tmp401 },
-	{ "tmp411", tmp411 },
-	{ "tmp431", tmp431 },
-	{ "tmp432", tmp432 },
-	{ "tmp435", tmp435 },
+	{ .name = "tmp401", .driver_data = tmp401 },
+	{ .name = "tmp411", .driver_data = tmp411 },
+	{ .name = "tmp431", .driver_data = tmp431 },
+	{ .name = "tmp432", .driver_data = tmp432 },
+	{ .name = "tmp435", .driver_data = tmp435 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp401_id);
diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 9537727aad9a..6fd667c26d80 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -57,11 +57,11 @@ static const u8 TMP421_TEMP_LSB[MAX_CHANNELS]	= { 0x10, 0x11, 0x12, 0x13 };
 #define TMP442_DEVICE_ID			0x42
 
 static const struct i2c_device_id tmp421_id[] = {
-	{ "tmp421", 2 },
-	{ "tmp422", 3 },
-	{ "tmp423", 4 },
-	{ "tmp441", 2 },
-	{ "tmp442", 3 },
+	{ .name = "tmp421", .driver_data = 2 },
+	{ .name = "tmp422", .driver_data = 3 },
+	{ .name = "tmp423", .driver_data = 4 },
+	{ .name = "tmp441", .driver_data = 2 },
+	{ .name = "tmp442", .driver_data = 3 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp421_id);
diff --git a/drivers/hwmon/tmp464.c b/drivers/hwmon/tmp464.c
index 0f629c6d7695..34dcaa705622 100644
--- a/drivers/hwmon/tmp464.c
+++ b/drivers/hwmon/tmp464.c
@@ -66,8 +66,8 @@ static const u8 TMP464_THERM2_LIMIT[MAX_CHANNELS] = {
 #define TMP468_DEVICE_ID			0x0468
 
 static const struct i2c_device_id tmp464_id[] = {
-	{ "tmp464", TMP464_NUM_CHANNELS },
-	{ "tmp468", TMP468_NUM_CHANNELS },
+	{ .name = "tmp464", .driver_data = TMP464_NUM_CHANNELS },
+	{ .name = "tmp468", .driver_data = TMP468_NUM_CHANNELS },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp464_id);
diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 926d28cd3fab..0a30bf44e466 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -608,8 +608,8 @@ static int tmp51x_init(struct tmp51x_data *data)
 }
 
 static const struct i2c_device_id tmp51x_id[] = {
-	{ "tmp512", TMP512_MAX_CHANNELS },
-	{ "tmp513", TMP513_MAX_CHANNELS },
+	{ .name = "tmp512", .driver_data = TMP512_MAX_CHANNELS },
+	{ .name = "tmp513", .driver_data = TMP513_MAX_CHANNELS },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp51x_id);
diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index 076200ed2ec9..9150ceef894c 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -1559,10 +1559,10 @@ static struct w83781d_data *w83781d_update_device(struct device *dev)
 }
 
 static const struct i2c_device_id w83781d_ids[] = {
-	{ "w83781d", w83781d, },
-	{ "w83782d", w83782d, },
-	{ "w83783s", w83783s, },
-	{ "as99127f", as99127f },
+	{ .name = "w83781d", .driver_data = w83781d, },
+	{ .name = "w83782d", .driver_data = w83782d, },
+	{ .name = "w83783s", .driver_data = w83783s, },
+	{ .name = "as99127f", .driver_data = as99127f, },
 	{ /* LIST END */ }
 };
 MODULE_DEVICE_TABLE(i2c, w83781d_ids);
diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
index 5174db69db5e..c5ce0bf1b08e 100644
--- a/drivers/hwmon/w83795.c
+++ b/drivers/hwmon/w83795.c
@@ -2243,8 +2243,8 @@ static void w83795_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id w83795_id[] = {
-	{ "w83795g", w83795g },
-	{ "w83795adg", w83795adg },
+	{ .name = "w83795g", .driver_data = w83795g },
+	{ .name = "w83795adg", .driver_data = w83795adg },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, w83795_id);

base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
-- 
2.45.2


