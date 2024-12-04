Return-Path: <linux-i2c+bounces-8321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9829E3D84
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 16:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1025E164112
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 15:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4228F1B21BA;
	Wed,  4 Dec 2024 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QUWQ+MsB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7C20ADCE
	for <linux-i2c@vger.kernel.org>; Wed,  4 Dec 2024 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324454; cv=none; b=c9yvpKgTjMFj4UK86ZQI2M/J2/26WEcxl7FWL68oeJJdYk/Rks1eXEl3oNS0m/1Wd5ex9tHDAzPF19Jmgu+obg0KyAOEvd6WhncEEbCvFO7jyTuLMLCyc4k+4DNEJ0K9j9esFzBG228DJNz3iQoPTCjyUuTdYHUBeFAMdtQe9Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324454; c=relaxed/simple;
	bh=RZ1p2uqrd9mnpuE6IZJa3oBFsKLhp8T6wOqdR5Qx6xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F0ku4x1Pg8RPTMkio8AsmdjCAic7MyRVqN0lI+UrNsVq6LUBrN7aRzs4kFQDqb0TcrKh3bqpWtkydqINAKBMIfDhAloAYcJSvKFlkPfi/7CbbAGwHDtGg7YVjWl5wTsLl908SWqXP6BbpeeRPVZniKPGpkpTXKKFFYvmGIVoa7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QUWQ+MsB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a736518eso84387655e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 04 Dec 2024 07:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733324446; x=1733929246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kor1EJcVwsGt522C6tn9jh9h20DidrK8TYqm6gzlf/4=;
        b=QUWQ+MsBDD0C1ik4WAoNrYAwjAKcB8pMV1J2Ql8Cm224Em99pQjdQVdbSBAHixfGyM
         AWRhTznf2kpoHwkL+nxcAU0iO77j0nCUNfmAxL/7kXyoLckxVpASQvAFwO6PeMnBqFyY
         lsSJdWEGfE16i0Zp32wxVt0Dbqn0UPnZIf1kkF46jlKTGHQRAfC0cvhx3XexFCBTVXc3
         lKOT/5pkN32+LzMI6EJzmnWrfL3MYNK71yJgZ33ycegsjuPLtB2MlI5ueIkRm+YlYfVR
         y7elV5ixmq2beK4BPGlofKEhR/kuYvGTWTbGrV27unxPXAAWi7nJ8ZuQwdCrHEcsY8u0
         /dlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733324446; x=1733929246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kor1EJcVwsGt522C6tn9jh9h20DidrK8TYqm6gzlf/4=;
        b=Tln9CvIKQhB2+60cW83AyRPTYHrCjvDJT4BUYMb+8L5tILdfRgWJwBsBtGv6ekaxzQ
         zvo6fuLsggwUovNk4m3Hr2z47qfEXlFQHg50owVnKMVA2od8qKjazNZ+RsEslymHzMVV
         0rQNHN9HX4rppPFCp7BpZoQ7uHROd0LxoopjIiSglSS70Q0VSamHR9Yf7kCv2Hvg+IE0
         R2PBQPC1hYax3etwoSSIgXhPS0Q6UAGjrz6BAYSHd7smuQaGJacOanXz3YJrQwQfuNVl
         LJ7g36GFas5hItxMoq1XA683bHLXP6fwpK/nnd/zILy48u8Q1px3z35572EMUE/9WUHY
         msQA==
X-Forwarded-Encrypted: i=1; AJvYcCW2XH5X4KBZg52hGI4RY/yCQuPo6gWK+jPMiIxABJG6o8dHHyQ5m2SzStMEgbO0vJqreXH9nfBabGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YypKkYuWkW6r8huLnzDchrVgSXaSi4Iax5QNdOngCnKtBUfMNk5
	ZsM1Xyxer879D3e9vKu8jvsu/3pwuPNW71+8CHinOfTDJuLIMeLwDSTY+090N18=
X-Gm-Gg: ASbGncsQdx1HffQSGcyzOL7mxX9isui+aamBEmjDhVt2O5CZRI5FxNL/LOhCO8OBCR/
	o3v4L8EPBdOzNtnWVIQ1stEZSG+sroI0Jn0+5Rkv21kpFKOqn34gaN1SAh0BaHHvkofzzWg0uaG
	Rmk9m0wvvmHFYCbZejO4gbhzFBlWfC+53qwd6FILjb0+THpy55OXwU4cbtPUeDxj2XJdHSJAB5t
	CnkOdz5n6oIinY8UYg3e9KxunBYFDasFA2eBjFVCwLA8OacdBdxDX8=
X-Google-Smtp-Source: AGHT+IEVpmmp5GtWJJxQ0tCH90jWNz+aCqq/V/bQ9QDYR0c3G6GpHxcGaK2z63XopJc+NDnmwBjHJg==
X-Received: by 2002:a05:600c:3ca7:b0:434:a923:9321 with SMTP id 5b1f17b1804b1-434d09b2e5emr66485425e9.5.1733324444887;
        Wed, 04 Dec 2024 07:00:44 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dd99504csm16621078f8f.85.2024.12.04.07.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:00:44 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-iio@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH] iio: Initialize i2c_device_id structures by name
Date: Wed,  4 Dec 2024 16:00:36 +0100
Message-ID: <20241204150036.1695824-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=75802; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=RZ1p2uqrd9mnpuE6IZJa3oBFsKLhp8T6wOqdR5Qx6xk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnUG6Vx+W/XlyvyVoqZlD2Hqq8YEURLq03lu9Od b3yTEaR3V2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ1BulQAKCRCPgPtYfRL+ Tg9cB/9lil/+jy21miEt3k0nz3metqHRfRjDtqzHkp7fSpOLDp6r+KaNBTzy9uKuYCPIyosL0Sj EVVjXqT1aRjEkdI0jsteKgqX8R4rKSGhcIZVpQok904yr/X1Q87cwswM0H3QVUIPcVSOglE+voS RMNZVHHJngYBEUyztKV5MMUZt8ZhVRn1iDlZcl2bsosJgF72ZDquWGKsqsL/BWpqhcWK1b5M1+d Ys0HbB8LKYbVYqLNRvOgTwe92ML+N8/OUpUMC61uSNbYXtSHmTgq/fZcnx3k7DBKVAtzWOkxhnv PADrBt4cc5eWlG1xY01JMCT3mzF8YL35ZH/ZzU42ojABjCSm
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

	{ "fxls8471", (kernel_ulong_t)&mma_chip_info_table[fxls8471], },

or

	{ .name = "fxls8471", .driver_data = (kernel_ulong_t)&mma_chip_info_table[fxls8471], },

can be changed to

	{ .name = "fxls8471", .driver_data_ptr = &mma_chip_info_table[fxls8471], }

and some more casts when the driver data is used can be dropped, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

note I didn't add all individual maintainers to Cc to not hit sending
limits and spam filters.

Other *_device_id will be converted accordingly once I'm done with
i2c_device_id.

Best regards
Uwe

 drivers/iio/accel/adxl345_i2c.c               |  4 +-
 drivers/iio/accel/adxl355_i2c.c               |  4 +-
 drivers/iio/accel/adxl380_i2c.c               |  4 +-
 drivers/iio/accel/bma180.c                    | 10 +-
 drivers/iio/accel/bmc150-accel-i2c.c          |  2 +-
 drivers/iio/accel/bmi088-accel-i2c.c          |  6 +-
 drivers/iio/accel/da280.c                     |  6 +-
 drivers/iio/accel/fxls8962af-i2c.c            |  4 +-
 drivers/iio/accel/kxcjk-1013.c                | 10 +-
 drivers/iio/accel/mma8452.c                   | 12 +--
 drivers/iio/adc/ad7091r5.c                    |  2 +-
 drivers/iio/adc/ad799x.c                      | 16 ++--
 drivers/iio/adc/ina2xx-adc.c                  | 10 +-
 drivers/iio/adc/ltc2471.c                     |  4 +-
 drivers/iio/adc/ltc2497.c                     |  4 +-
 drivers/iio/adc/max34408.c                    |  4 +-
 drivers/iio/adc/mcp3422.c                     | 16 ++--
 drivers/iio/adc/ti-adc081c.c                  |  6 +-
 drivers/iio/adc/ti-ads1015.c                  |  6 +-
 drivers/iio/cdc/ad7150.c                      |  6 +-
 drivers/iio/cdc/ad7746.c                      |  6 +-
 drivers/iio/chemical/atlas-ezo-sensor.c       |  6 +-
 drivers/iio/chemical/atlas-sensor.c           | 10 +-
 drivers/iio/chemical/sgp30.c                  |  4 +-
 drivers/iio/chemical/vz89x.c                  |  4 +-
 drivers/iio/dac/ad5064.c                      | 94 +++++++++----------
 drivers/iio/dac/ad5380.c                      | 32 +++----
 drivers/iio/dac/ad5446.c                      | 12 +--
 drivers/iio/dac/ad5696-i2c.c                  | 32 +++----
 drivers/iio/dac/ds4424.c                      |  4 +-
 drivers/iio/dac/max517.c                      | 10 +-
 drivers/iio/dac/max5821.c                     |  2 +-
 drivers/iio/dac/mcp4725.c                     |  4 +-
 drivers/iio/dac/ti-dac5571.c                  | 22 ++---
 drivers/iio/health/max30102.c                 |  6 +-
 drivers/iio/humidity/ens210.c                 | 12 +--
 drivers/iio/humidity/htu21.c                  |  4 +-
 drivers/iio/imu/bmi270/bmi270_i2c.c           |  4 +-
 .../iio/imu/inv_icm42600/inv_icm42600_i2c.c   | 14 +--
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c     | 34 +++----
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c   | 50 +++++-----
 drivers/iio/light/as73211.c                   |  4 +-
 drivers/iio/light/bh1750.c                    | 10 +-
 drivers/iio/light/isl29018.c                  |  6 +-
 drivers/iio/light/ltr501.c                    |  8 +-
 drivers/iio/light/opt3001.c                   |  4 +-
 drivers/iio/light/opt4001.c                   |  4 +-
 drivers/iio/light/si1145.c                    | 14 +--
 drivers/iio/light/tsl2563.c                   |  8 +-
 drivers/iio/light/tsl2583.c                   |  6 +-
 drivers/iio/light/tsl2772.c                   | 22 ++---
 drivers/iio/light/vcnl4000.c                  | 10 +-
 drivers/iio/light/veml6030.c                  |  6 +-
 drivers/iio/magnetometer/ak8975.c             | 16 ++--
 drivers/iio/magnetometer/hmc5843_i2c.c        |  8 +-
 drivers/iio/magnetometer/yamaha-yas530.c      |  8 +-
 drivers/iio/potentiometer/ad5272.c            | 10 +-
 drivers/iio/potentiometer/ds1803.c            |  8 +-
 drivers/iio/potentiometer/tpl0102.c           |  8 +-
 drivers/iio/pressure/abp060mg.c               | 70 +++++++-------
 drivers/iio/pressure/bmp280-i2c.c             | 14 +--
 drivers/iio/pressure/dlhl60d.c                |  4 +-
 drivers/iio/pressure/ms5611_i2c.c             |  4 +-
 drivers/iio/pressure/ms5637.c                 |  8 +-
 drivers/iio/pressure/st_pressure_i2c.c        | 18 ++--
 drivers/iio/proximity/aw96103.c               |  4 +-
 drivers/iio/proximity/srf08.c                 |  6 +-
 drivers/iio/proximity/sx9310.c                |  4 +-
 drivers/iio/proximity/sx9324.c                |  2 +-
 drivers/iio/proximity/sx9360.c                |  2 +-
 drivers/iio/temperature/tmp117.c              |  4 +-
 71 files changed, 401 insertions(+), 401 deletions(-)

diff --git a/drivers/iio/accel/adxl345_i2c.c b/drivers/iio/accel/adxl345_i2c.c
index cb23fb11fcd7..ed717a94fa27 100644
--- a/drivers/iio/accel/adxl345_i2c.c
+++ b/drivers/iio/accel/adxl345_i2c.c
@@ -41,8 +41,8 @@ static const struct adxl345_chip_info adxl375_i2c_info = {
 };
 
 static const struct i2c_device_id adxl345_i2c_id[] = {
-	{ "adxl345", (kernel_ulong_t)&adxl345_i2c_info },
-	{ "adxl375", (kernel_ulong_t)&adxl375_i2c_info },
+	{ .name = "adxl345", .driver_data = (kernel_ulong_t)&adxl345_i2c_info, },
+	{ .name = "adxl375", .driver_data = (kernel_ulong_t)&adxl375_i2c_info, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adxl345_i2c_id);
diff --git a/drivers/iio/accel/adxl355_i2c.c b/drivers/iio/accel/adxl355_i2c.c
index 1a512c7b792b..331e59d6cdca 100644
--- a/drivers/iio/accel/adxl355_i2c.c
+++ b/drivers/iio/accel/adxl355_i2c.c
@@ -41,8 +41,8 @@ static int adxl355_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adxl355_i2c_id[] = {
-	{ "adxl355", (kernel_ulong_t)&adxl35x_chip_info[ADXL355] },
-	{ "adxl359", (kernel_ulong_t)&adxl35x_chip_info[ADXL359] },
+	{ .name = "adxl355", .driver_data = (kernel_ulong_t)&adxl35x_chip_info[ADXL355], },
+	{ .name = "adxl359", .driver_data = (kernel_ulong_t)&adxl35x_chip_info[ADXL359], },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adxl355_i2c_id);
diff --git a/drivers/iio/accel/adxl380_i2c.c b/drivers/iio/accel/adxl380_i2c.c
index b4f86f972361..b82c6fe6a780 100644
--- a/drivers/iio/accel/adxl380_i2c.c
+++ b/drivers/iio/accel/adxl380_i2c.c
@@ -33,8 +33,8 @@ static int adxl380_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adxl380_i2c_id[] = {
-	{ "adxl380", (kernel_ulong_t)&adxl380_chip_info },
-	{ "adxl382", (kernel_ulong_t)&adxl382_chip_info },
+	{ .name = "adxl380", .driver_data = (kernel_ulong_t)&adxl380_chip_info, },
+	{ .name = "adxl382", .driver_data = (kernel_ulong_t)&adxl382_chip_info, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adxl380_i2c_id);
diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
index 128db14ba726..d8ab9b4ab829 100644
--- a/drivers/iio/accel/bma180.c
+++ b/drivers/iio/accel/bma180.c
@@ -1087,11 +1087,11 @@ static int bma180_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(bma180_pm_ops, bma180_suspend, bma180_resume);
 
 static const struct i2c_device_id bma180_ids[] = {
-	{ "bma023", (kernel_ulong_t)&bma180_part_info[BMA023] },
-	{ "bma150", (kernel_ulong_t)&bma180_part_info[BMA150] },
-	{ "bma180", (kernel_ulong_t)&bma180_part_info[BMA180] },
-	{ "bma250", (kernel_ulong_t)&bma180_part_info[BMA250] },
-	{ "smb380", (kernel_ulong_t)&bma180_part_info[BMA150] },
+	{ .name = "bma023", .driver_data = (kernel_ulong_t)&bma180_part_info[BMA023], },
+	{ .name = "bma150", .driver_data = (kernel_ulong_t)&bma180_part_info[BMA150], },
+	{ .name = "bma180", .driver_data = (kernel_ulong_t)&bma180_part_info[BMA180], },
+	{ .name = "bma250", .driver_data = (kernel_ulong_t)&bma180_part_info[BMA250], },
+	{ .name = "smb380", .driver_data = (kernel_ulong_t)&bma180_part_info[BMA150], },
 	{ }
 };
 
diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
index 0d4ce6c38931..52cb252b9661 100644
--- a/drivers/iio/accel/bmc150-accel-i2c.c
+++ b/drivers/iio/accel/bmc150-accel-i2c.c
@@ -253,7 +253,7 @@ static const struct i2c_device_id bmc150_accel_id[] = {
 	{"bma255"},
 	{"bma280"},
 	{"bmc150_accel"},
-	{"bmc156_accel", BOSCH_BMC156},
+	{ .name = "bmc156_accel", .driver_data = BOSCH_BMC156, },
 	{"bmi055_accel"},
 	{}
 };
diff --git a/drivers/iio/accel/bmi088-accel-i2c.c b/drivers/iio/accel/bmi088-accel-i2c.c
index bd22bd0d3c25..c269d398d503 100644
--- a/drivers/iio/accel/bmi088-accel-i2c.c
+++ b/drivers/iio/accel/bmi088-accel-i2c.c
@@ -45,9 +45,9 @@ static const struct of_device_id bmi088_of_match[] = {
 MODULE_DEVICE_TABLE(of, bmi088_of_match);
 
 static const struct i2c_device_id bmi088_accel_id[] = {
-	{ "bmi085-accel",  BOSCH_BMI085 },
-	{ "bmi088-accel",  BOSCH_BMI088 },
-	{ "bmi090l-accel", BOSCH_BMI090L },
+	{ .name = "bmi085-accel", .driver_data = BOSCH_BMI085, },
+	{ .name = "bmi088-accel", .driver_data = BOSCH_BMI088, },
+	{ .name = "bmi090l-accel", .driver_data = BOSCH_BMI090L, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, bmi088_accel_id);
diff --git a/drivers/iio/accel/da280.c b/drivers/iio/accel/da280.c
index 992286828844..218cac46a345 100644
--- a/drivers/iio/accel/da280.c
+++ b/drivers/iio/accel/da280.c
@@ -162,9 +162,9 @@ static const struct acpi_device_id da280_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, da280_acpi_match);
 
 static const struct i2c_device_id da280_i2c_id[] = {
-	{ "da217", (kernel_ulong_t)&da217_match_data },
-	{ "da226", (kernel_ulong_t)&da226_match_data },
-	{ "da280", (kernel_ulong_t)&da280_match_data },
+	{ .name = "da217", .driver_data = (kernel_ulong_t)&da217_match_data, },
+	{ .name = "da226", .driver_data = (kernel_ulong_t)&da226_match_data, },
+	{ .name = "da280", .driver_data = (kernel_ulong_t)&da280_match_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, da280_i2c_id);
diff --git a/drivers/iio/accel/fxls8962af-i2c.c b/drivers/iio/accel/fxls8962af-i2c.c
index 2e1bb43ef2a1..4e5f81d1b8e4 100644
--- a/drivers/iio/accel/fxls8962af-i2c.c
+++ b/drivers/iio/accel/fxls8962af-i2c.c
@@ -28,8 +28,8 @@ static int fxls8962af_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id fxls8962af_id[] = {
-	{ "fxls8962af", fxls8962af },
-	{ "fxls8964af", fxls8964af },
+	{ .name = "fxls8962af", .driver_data = fxls8962af, },
+	{ .name = "fxls8964af", .driver_data = fxls8964af, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, fxls8962af_id);
diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
index f2496cad8ec2..ffc9c3ea9651 100644
--- a/drivers/iio/accel/kxcjk-1013.c
+++ b/drivers/iio/accel/kxcjk-1013.c
@@ -1688,11 +1688,11 @@ static const struct dev_pm_ops kxcjk1013_pm_ops = {
 };
 
 static const struct i2c_device_id kxcjk1013_id[] = {
-	{ "kxcjk1013",  (kernel_ulong_t)&kxcjk1013_info },
-	{ "kxcj91008",  (kernel_ulong_t)&kxcj91008_info },
-	{ "kxtj21009",  (kernel_ulong_t)&kxtj21009_info },
-	{ "kxtf9", (kernel_ulong_t)&kxtf9_info },
-	{ "kx023-1025", (kernel_ulong_t)&kx0231025_info },
+	{ .name = "kxcjk1013", .driver_data = (kernel_ulong_t)&kxcjk1013_info },
+	{ .name = "kxcj91008", .driver_data = (kernel_ulong_t)&kxcj91008_info },
+	{ .name = "kxtj21009", .driver_data = (kernel_ulong_t)&kxtj21009_info },
+	{ .name = "kxtf9", .driver_data = (kernel_ulong_t)&kxtf9_info },
+	{ .name = "kx023-1025", .driver_data = (kernel_ulong_t)&kx0231025_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, kxcjk1013_id);
diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index 962d289065ab..59b5fa7dc105 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -1825,12 +1825,12 @@ static const struct dev_pm_ops mma8452_pm_ops = {
 };
 
 static const struct i2c_device_id mma8452_id[] = {
-	{ "fxls8471", (kernel_ulong_t)&mma_chip_info_table[fxls8471] },
-	{ "mma8451", (kernel_ulong_t)&mma_chip_info_table[mma8451] },
-	{ "mma8452", (kernel_ulong_t)&mma_chip_info_table[mma8452] },
-	{ "mma8453", (kernel_ulong_t)&mma_chip_info_table[mma8453] },
-	{ "mma8652", (kernel_ulong_t)&mma_chip_info_table[mma8652] },
-	{ "mma8653", (kernel_ulong_t)&mma_chip_info_table[mma8653] },
+	{ .name = "fxls8471", .driver_data = (kernel_ulong_t)&mma_chip_info_table[fxls8471], },
+	{ .name = "mma8451", .driver_data = (kernel_ulong_t)&mma_chip_info_table[mma8451], },
+	{ .name = "mma8452", .driver_data = (kernel_ulong_t)&mma_chip_info_table[mma8452], },
+	{ .name = "mma8453", .driver_data = (kernel_ulong_t)&mma_chip_info_table[mma8453], },
+	{ .name = "mma8652", .driver_data = (kernel_ulong_t)&mma_chip_info_table[mma8652], },
+	{ .name = "mma8653", .driver_data = (kernel_ulong_t)&mma_chip_info_table[mma8653], },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mma8452_id);
diff --git a/drivers/iio/adc/ad7091r5.c b/drivers/iio/adc/ad7091r5.c
index b472b9498fd1..5a2d78f4996f 100644
--- a/drivers/iio/adc/ad7091r5.c
+++ b/drivers/iio/adc/ad7091r5.c
@@ -117,7 +117,7 @@ static const struct of_device_id ad7091r5_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ad7091r5_dt_ids);
 
 static const struct i2c_device_id ad7091r5_i2c_ids[] = {
-	{ "ad7091r5", (kernel_ulong_t)&ad7091r5_init_info },
+	{ .name = "ad7091r5", .driver_data = (kernel_ulong_t)&ad7091r5_init_info, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad7091r5_i2c_ids);
diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
index aa44b4e2542b..971cade80c7e 100644
--- a/drivers/iio/adc/ad799x.c
+++ b/drivers/iio/adc/ad799x.c
@@ -952,14 +952,14 @@ static int ad799x_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(ad799x_pm_ops, ad799x_suspend, ad799x_resume);
 
 static const struct i2c_device_id ad799x_id[] = {
-	{ "ad7991", ad7991 },
-	{ "ad7995", ad7995 },
-	{ "ad7999", ad7999 },
-	{ "ad7992", ad7992 },
-	{ "ad7993", ad7993 },
-	{ "ad7994", ad7994 },
-	{ "ad7997", ad7997 },
-	{ "ad7998", ad7998 },
+	{ .name = "ad7991", .driver_data = ad7991, },
+	{ .name = "ad7995", .driver_data = ad7995, },
+	{ .name = "ad7999", .driver_data = ad7999, },
+	{ .name = "ad7992", .driver_data = ad7992, },
+	{ .name = "ad7993", .driver_data = ad7993, },
+	{ .name = "ad7994", .driver_data = ad7994, },
+	{ .name = "ad7997", .driver_data = ad7997, },
+	{ .name = "ad7998", .driver_data = ad7998, },
 	{}
 };
 
diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
index 48c95e12e791..04b209a35ee2 100644
--- a/drivers/iio/adc/ina2xx-adc.c
+++ b/drivers/iio/adc/ina2xx-adc.c
@@ -1052,11 +1052,11 @@ static void ina2xx_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ina2xx_id[] = {
-	{ "ina219", ina219 },
-	{ "ina220", ina219 },
-	{ "ina226", ina226 },
-	{ "ina230", ina226 },
-	{ "ina231", ina226 },
+	{ .name = "ina219", .driver_data = ina219, },
+	{ .name = "ina220", .driver_data = ina219, },
+	{ .name = "ina226", .driver_data = ina226, },
+	{ .name = "ina230", .driver_data = ina226, },
+	{ .name = "ina231", .driver_data = ina226, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina2xx_id);
diff --git a/drivers/iio/adc/ltc2471.c b/drivers/iio/adc/ltc2471.c
index 97c417c3a4eb..9312f6b9ebfc 100644
--- a/drivers/iio/adc/ltc2471.c
+++ b/drivers/iio/adc/ltc2471.c
@@ -136,8 +136,8 @@ static int ltc2471_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ltc2471_i2c_id[] = {
-	{ "ltc2471", ltc2471 },
-	{ "ltc2473", ltc2473 },
+	{ .name = "ltc2471", .driver_data = ltc2471, },
+	{ .name = "ltc2473", .driver_data = ltc2473, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ltc2471_i2c_id);
diff --git a/drivers/iio/adc/ltc2497.c b/drivers/iio/adc/ltc2497.c
index eb9d521e86e5..3214eb19c968 100644
--- a/drivers/iio/adc/ltc2497.c
+++ b/drivers/iio/adc/ltc2497.c
@@ -142,8 +142,8 @@ static const struct ltc2497_chip_info ltc2497_info[] = {
 };
 
 static const struct i2c_device_id ltc2497_id[] = {
-	{ "ltc2497", (kernel_ulong_t)&ltc2497_info[TYPE_LTC2497] },
-	{ "ltc2499", (kernel_ulong_t)&ltc2497_info[TYPE_LTC2499] },
+	{ .name = "ltc2497", .driver_data = (kernel_ulong_t)&ltc2497_info[TYPE_LTC2497], },
+	{ .name = "ltc2499", .driver_data = (kernel_ulong_t)&ltc2497_info[TYPE_LTC2499], },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc2497_id);
diff --git a/drivers/iio/adc/max34408.c b/drivers/iio/adc/max34408.c
index 971e6e5dee9b..03ba856532dc 100644
--- a/drivers/iio/adc/max34408.c
+++ b/drivers/iio/adc/max34408.c
@@ -255,8 +255,8 @@ static const struct of_device_id max34408_of_match[] = {
 MODULE_DEVICE_TABLE(of, max34408_of_match);
 
 static const struct i2c_device_id max34408_id[] = {
-	{ "max34408", (kernel_ulong_t)&max34408_model_data },
-	{ "max34409", (kernel_ulong_t)&max34409_model_data },
+	{ .name = "max34408", .driver_data = (kernel_ulong_t)&max34408_model_data, },
+	{ .name = "max34409", .driver_data = (kernel_ulong_t)&max34409_model_data, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max34408_id);
diff --git a/drivers/iio/adc/mcp3422.c b/drivers/iio/adc/mcp3422.c
index 50834fdcf738..8bc69b00e968 100644
--- a/drivers/iio/adc/mcp3422.c
+++ b/drivers/iio/adc/mcp3422.c
@@ -394,14 +394,14 @@ static int mcp3422_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mcp3422_id[] = {
-	{ "mcp3421", 1 },
-	{ "mcp3422", 2 },
-	{ "mcp3423", 3 },
-	{ "mcp3424", 4 },
-	{ "mcp3425", 5 },
-	{ "mcp3426", 6 },
-	{ "mcp3427", 7 },
-	{ "mcp3428", 8 },
+	{ .name = "mcp3421", .driver_data = 1, },
+	{ .name = "mcp3422", .driver_data = 2, },
+	{ .name = "mcp3423", .driver_data = 3, },
+	{ .name = "mcp3424", .driver_data = 4, },
+	{ .name = "mcp3425", .driver_data = 5, },
+	{ .name = "mcp3426", .driver_data = 6, },
+	{ .name = "mcp3427", .driver_data = 7, },
+	{ .name = "mcp3428", .driver_data = 8, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mcp3422_id);
diff --git a/drivers/iio/adc/ti-adc081c.c b/drivers/iio/adc/ti-adc081c.c
index 6c2cb3dabbbf..5a27f7b26652 100644
--- a/drivers/iio/adc/ti-adc081c.c
+++ b/drivers/iio/adc/ti-adc081c.c
@@ -203,9 +203,9 @@ static int adc081c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adc081c_id[] = {
-	{ "adc081c", (kernel_ulong_t)&adcxx1c_models[ADC081C] },
-	{ "adc101c", (kernel_ulong_t)&adcxx1c_models[ADC101C] },
-	{ "adc121c", (kernel_ulong_t)&adcxx1c_models[ADC121C] },
+	{ .name = "adc081c", .driver_data = (kernel_ulong_t)&adcxx1c_models[ADC081C], },
+	{ .name = "adc101c", .driver_data = (kernel_ulong_t)&adcxx1c_models[ADC101C], },
+	{ .name = "adc121c", .driver_data = (kernel_ulong_t)&adcxx1c_models[ADC121C], },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adc081c_id);
diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 47fe8e16aee4..713f8de87ed3 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -1169,9 +1169,9 @@ static const struct ads1015_chip_data tla2024_data = {
 };
 
 static const struct i2c_device_id ads1015_id[] = {
-	{ "ads1015", (kernel_ulong_t)&ads1015_data },
-	{ "ads1115", (kernel_ulong_t)&ads1115_data },
-	{ "tla2024", (kernel_ulong_t)&tla2024_data },
+	{ .name = "ads1015", .driver_data = (kernel_ulong_t)&ads1015_data, },
+	{ .name = "ads1115", .driver_data = (kernel_ulong_t)&ads1115_data, },
+	{ .name = "tla2024", .driver_data = (kernel_ulong_t)&tla2024_data, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ads1015_id);
diff --git a/drivers/iio/cdc/ad7150.c b/drivers/iio/cdc/ad7150.c
index e64a41bae32c..115212770ce1 100644
--- a/drivers/iio/cdc/ad7150.c
+++ b/drivers/iio/cdc/ad7150.c
@@ -628,9 +628,9 @@ static int ad7150_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad7150_id[] = {
-	{ "ad7150", AD7150 },
-	{ "ad7151", AD7151 },
-	{ "ad7156", AD7150 },
+	{ .name = "ad7150", .driver_data = AD7150, },
+	{ .name = "ad7151", .driver_data = AD7151, },
+	{ .name = "ad7156", .driver_data = AD7150, },
 	{}
 };
 
diff --git a/drivers/iio/cdc/ad7746.c b/drivers/iio/cdc/ad7746.c
index ba18dbbe0940..3c0f87f70826 100644
--- a/drivers/iio/cdc/ad7746.c
+++ b/drivers/iio/cdc/ad7746.c
@@ -789,9 +789,9 @@ static int ad7746_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad7746_id[] = {
-	{ "ad7745", 7745 },
-	{ "ad7746", 7746 },
-	{ "ad7747", 7747 },
+	{ .name = "ad7745", .driver_data = 7745, },
+	{ .name = "ad7746", .driver_data = 7746, },
+	{ .name = "ad7747", .driver_data = 7747, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ad7746_id);
diff --git a/drivers/iio/chemical/atlas-ezo-sensor.c b/drivers/iio/chemical/atlas-ezo-sensor.c
index 761a853a4d17..0243068f16ab 100644
--- a/drivers/iio/chemical/atlas-ezo-sensor.c
+++ b/drivers/iio/chemical/atlas-ezo-sensor.c
@@ -186,9 +186,9 @@ static const struct iio_info atlas_info = {
 };
 
 static const struct i2c_device_id atlas_ezo_id[] = {
-	{ "atlas-co2-ezo", (kernel_ulong_t)&atlas_ezo_devices[ATLAS_CO2_EZO] },
-	{ "atlas-o2-ezo", (kernel_ulong_t)&atlas_ezo_devices[ATLAS_O2_EZO] },
-	{ "atlas-hum-ezo", (kernel_ulong_t)&atlas_ezo_devices[ATLAS_HUM_EZO] },
+	{ .name = "atlas-co2-ezo", .driver_data = (kernel_ulong_t)&atlas_ezo_devices[ATLAS_CO2_EZO], },
+	{ .name = "atlas-o2-ezo", .driver_data = (kernel_ulong_t)&atlas_ezo_devices[ATLAS_O2_EZO], },
+	{ .name = "atlas-hum-ezo", .driver_data = (kernel_ulong_t)&atlas_ezo_devices[ATLAS_HUM_EZO], },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, atlas_ezo_id);
diff --git a/drivers/iio/chemical/atlas-sensor.c b/drivers/iio/chemical/atlas-sensor.c
index baf93e5e3ca7..0e007972a547 100644
--- a/drivers/iio/chemical/atlas-sensor.c
+++ b/drivers/iio/chemical/atlas-sensor.c
@@ -589,11 +589,11 @@ static const struct iio_info atlas_info = {
 };
 
 static const struct i2c_device_id atlas_id[] = {
-	{ "atlas-ph-sm", (kernel_ulong_t)&atlas_devices[ATLAS_PH_SM] },
-	{ "atlas-ec-sm", (kernel_ulong_t)&atlas_devices[ATLAS_EC_SM] },
-	{ "atlas-orp-sm", (kernel_ulong_t)&atlas_devices[ATLAS_ORP_SM] },
-	{ "atlas-do-sm", (kernel_ulong_t)&atlas_devices[ATLAS_DO_SM] },
-	{ "atlas-rtd-sm", (kernel_ulong_t)&atlas_devices[ATLAS_RTD_SM] },
+	{ .name = "atlas-ph-sm", .driver_data = (kernel_ulong_t)&atlas_devices[ATLAS_PH_SM], },
+	{ .name = "atlas-ec-sm", .driver_data = (kernel_ulong_t)&atlas_devices[ATLAS_EC_SM], },
+	{ .name = "atlas-orp-sm", .driver_data = (kernel_ulong_t)&atlas_devices[ATLAS_ORP_SM], },
+	{ .name = "atlas-do-sm", .driver_data = (kernel_ulong_t)&atlas_devices[ATLAS_DO_SM], },
+	{ .name = "atlas-rtd-sm", .driver_data = (kernel_ulong_t)&atlas_devices[ATLAS_RTD_SM], },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, atlas_id);
diff --git a/drivers/iio/chemical/sgp30.c b/drivers/iio/chemical/sgp30.c
index 21730d62b5c8..7611a1d32d87 100644
--- a/drivers/iio/chemical/sgp30.c
+++ b/drivers/iio/chemical/sgp30.c
@@ -562,8 +562,8 @@ static void sgp_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sgp_id[] = {
-	{ "sgp30", (kernel_ulong_t)&sgp_devices[SGP30] },
-	{ "sgpc3", (kernel_ulong_t)&sgp_devices[SGPC3] },
+	{ .name = "sgp30", .driver_data = (kernel_ulong_t)&sgp_devices[SGP30], },
+	{ .name = "sgpc3", .driver_data = (kernel_ulong_t)&sgp_devices[SGPC3], },
 	{ }
 };
 
diff --git a/drivers/iio/chemical/vz89x.c b/drivers/iio/chemical/vz89x.c
index 5b358bcd311b..f648be84efc9 100644
--- a/drivers/iio/chemical/vz89x.c
+++ b/drivers/iio/chemical/vz89x.c
@@ -385,8 +385,8 @@ static int vz89x_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id vz89x_id[] = {
-	{ "vz89x", (kernel_ulong_t)&vz89x_chips[VZ89X] },
-	{ "vz89te", (kernel_ulong_t)&vz89x_chips[VZ89TE] },
+	{ .name = "vz89x", .driver_data = (kernel_ulong_t)&vz89x_chips[VZ89X], },
+	{ .name = "vz89te", .driver_data = (kernel_ulong_t)&vz89x_chips[VZ89TE], },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vz89x_id);
diff --git a/drivers/iio/dac/ad5064.c b/drivers/iio/dac/ad5064.c
index 905988724f27..a13cce02340c 100644
--- a/drivers/iio/dac/ad5064.c
+++ b/drivers/iio/dac/ad5064.c
@@ -1001,53 +1001,53 @@ static int ad5064_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ad5064_i2c_ids[] = {
-	{"ad5625", ID_AD5625 },
-	{"ad5625r-1v25", ID_AD5625R_1V25 },
-	{"ad5625r-2v5", ID_AD5625R_2V5 },
-	{"ad5627", ID_AD5627 },
-	{"ad5627r-1v25", ID_AD5627R_1V25 },
-	{"ad5627r-2v5", ID_AD5627R_2V5 },
-	{"ad5629-1", ID_AD5629_1},
-	{"ad5629-2", ID_AD5629_2},
-	{"ad5629-3", ID_AD5629_2}, /* similar enough to ad5629-2 */
-	{"ad5645r-1v25", ID_AD5645R_1V25 },
-	{"ad5645r-2v5", ID_AD5645R_2V5 },
-	{"ad5665", ID_AD5665 },
-	{"ad5665r-1v25", ID_AD5665R_1V25 },
-	{"ad5665r-2v5", ID_AD5665R_2V5 },
-	{"ad5667", ID_AD5667 },
-	{"ad5667r-1v25", ID_AD5667R_1V25 },
-	{"ad5667r-2v5", ID_AD5667R_2V5 },
-	{"ad5669-1", ID_AD5669_1},
-	{"ad5669-2", ID_AD5669_2},
-	{"ad5669-3", ID_AD5669_2}, /* similar enough to ad5669-2 */
-	{"ltc2606", ID_LTC2606},
-	{"ltc2607", ID_LTC2607},
-	{"ltc2609", ID_LTC2609},
-	{"ltc2616", ID_LTC2616},
-	{"ltc2617", ID_LTC2617},
-	{"ltc2619", ID_LTC2619},
-	{"ltc2626", ID_LTC2626},
-	{"ltc2627", ID_LTC2627},
-	{"ltc2629", ID_LTC2629},
-	{"ltc2631-l12", ID_LTC2631_L12},
-	{"ltc2631-h12", ID_LTC2631_H12},
-	{"ltc2631-l10", ID_LTC2631_L10},
-	{"ltc2631-h10", ID_LTC2631_H10},
-	{"ltc2631-l8", ID_LTC2631_L8},
-	{"ltc2631-h8", ID_LTC2631_H8},
-	{"ltc2633-l12", ID_LTC2633_L12},
-	{"ltc2633-h12", ID_LTC2633_H12},
-	{"ltc2633-l10", ID_LTC2633_L10},
-	{"ltc2633-h10", ID_LTC2633_H10},
-	{"ltc2633-l8", ID_LTC2633_L8},
-	{"ltc2633-h8", ID_LTC2633_H8},
-	{"ltc2635-l12", ID_LTC2635_L12},
-	{"ltc2635-h12", ID_LTC2635_H12},
-	{"ltc2635-l10", ID_LTC2635_L10},
-	{"ltc2635-h10", ID_LTC2635_H10},
-	{"ltc2635-l8", ID_LTC2635_L8},
-	{"ltc2635-h8", ID_LTC2635_H8},
+	{ .name = "ad5625", .driver_data = ID_AD5625, },
+	{ .name = "ad5625r-1v25", .driver_data = ID_AD5625R_1V25, },
+	{ .name = "ad5625r-2v5", .driver_data = ID_AD5625R_2V5, },
+	{ .name = "ad5627", .driver_data = ID_AD5627, },
+	{ .name = "ad5627r-1v25", .driver_data = ID_AD5627R_1V25, },
+	{ .name = "ad5627r-2v5", .driver_data = ID_AD5627R_2V5, },
+	{ .name = "ad5629-1", .driver_data = ID_AD5629_1, },
+	{ .name = "ad5629-2", .driver_data = ID_AD5629_2, },
+	{ .name = "ad5629-3", .driver_data = ID_AD5629_2, }, /* similar enough to ad5629-2 */
+	{ .name = "ad5645r-1v25", .driver_data = ID_AD5645R_1V25, },
+	{ .name = "ad5645r-2v5", .driver_data = ID_AD5645R_2V5, },
+	{ .name = "ad5665", .driver_data = ID_AD5665, },
+	{ .name = "ad5665r-1v25", .driver_data = ID_AD5665R_1V25, },
+	{ .name = "ad5665r-2v5", .driver_data = ID_AD5665R_2V5, },
+	{ .name = "ad5667", .driver_data = ID_AD5667, },
+	{ .name = "ad5667r-1v25", .driver_data = ID_AD5667R_1V25, },
+	{ .name = "ad5667r-2v5", .driver_data = ID_AD5667R_2V5, },
+	{ .name = "ad5669-1", .driver_data = ID_AD5669_1, },
+	{ .name = "ad5669-2", .driver_data = ID_AD5669_2, },
+	{ .name = "ad5669-3", .driver_data = ID_AD5669_2, }, /* similar enough to ad5669-2 */
+	{ .name = "ltc2606", .driver_data = ID_LTC2606, },
+	{ .name = "ltc2607", .driver_data = ID_LTC2607, },
+	{ .name = "ltc2609", .driver_data = ID_LTC2609, },
+	{ .name = "ltc2616", .driver_data = ID_LTC2616, },
+	{ .name = "ltc2617", .driver_data = ID_LTC2617, },
+	{ .name = "ltc2619", .driver_data = ID_LTC2619, },
+	{ .name = "ltc2626", .driver_data = ID_LTC2626, },
+	{ .name = "ltc2627", .driver_data = ID_LTC2627, },
+	{ .name = "ltc2629", .driver_data = ID_LTC2629, },
+	{ .name = "ltc2631-l12", .driver_data = ID_LTC2631_L12, },
+	{ .name = "ltc2631-h12", .driver_data = ID_LTC2631_H12, },
+	{ .name = "ltc2631-l10", .driver_data = ID_LTC2631_L10, },
+	{ .name = "ltc2631-h10", .driver_data = ID_LTC2631_H10, },
+	{ .name = "ltc2631-l8", .driver_data = ID_LTC2631_L8, },
+	{ .name = "ltc2631-h8", .driver_data = ID_LTC2631_H8, },
+	{ .name = "ltc2633-l12", .driver_data = ID_LTC2633_L12, },
+	{ .name = "ltc2633-h12", .driver_data = ID_LTC2633_H12, },
+	{ .name = "ltc2633-l10", .driver_data = ID_LTC2633_L10, },
+	{ .name = "ltc2633-h10", .driver_data = ID_LTC2633_H10, },
+	{ .name = "ltc2633-l8", .driver_data = ID_LTC2633_L8, },
+	{ .name = "ltc2633-h8", .driver_data = ID_LTC2633_H8, },
+	{ .name = "ltc2635-l12", .driver_data = ID_LTC2635_L12, },
+	{ .name = "ltc2635-h12", .driver_data = ID_LTC2635_H12, },
+	{ .name = "ltc2635-l10", .driver_data = ID_LTC2635_L10, },
+	{ .name = "ltc2635-h10", .driver_data = ID_LTC2635_H10, },
+	{ .name = "ltc2635-l8", .driver_data = ID_LTC2635_L8, },
+	{ .name = "ltc2635-h8", .driver_data = ID_LTC2635_H8, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ad5064_i2c_ids);
diff --git a/drivers/iio/dac/ad5380.c b/drivers/iio/dac/ad5380.c
index 392a1c7aee03..160297b9dbc3 100644
--- a/drivers/iio/dac/ad5380.c
+++ b/drivers/iio/dac/ad5380.c
@@ -515,22 +515,22 @@ static int ad5380_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ad5380_i2c_ids[] = {
-	{ "ad5380-3", ID_AD5380_3 },
-	{ "ad5380-5", ID_AD5380_5 },
-	{ "ad5381-3", ID_AD5381_3 },
-	{ "ad5381-5", ID_AD5381_5 },
-	{ "ad5382-3", ID_AD5382_3 },
-	{ "ad5382-5", ID_AD5382_5 },
-	{ "ad5383-3", ID_AD5383_3 },
-	{ "ad5383-5", ID_AD5383_5 },
-	{ "ad5384-3", ID_AD5380_3 },
-	{ "ad5384-5", ID_AD5380_5 },
-	{ "ad5390-3", ID_AD5390_3 },
-	{ "ad5390-5", ID_AD5390_5 },
-	{ "ad5391-3", ID_AD5391_3 },
-	{ "ad5391-5", ID_AD5391_5 },
-	{ "ad5392-3", ID_AD5392_3 },
-	{ "ad5392-5", ID_AD5392_5 },
+	{ .name = "ad5380-3", .driver_data = ID_AD5380_3, },
+	{ .name = "ad5380-5", .driver_data = ID_AD5380_5, },
+	{ .name = "ad5381-3", .driver_data = ID_AD5381_3, },
+	{ .name = "ad5381-5", .driver_data = ID_AD5381_5, },
+	{ .name = "ad5382-3", .driver_data = ID_AD5382_3, },
+	{ .name = "ad5382-5", .driver_data = ID_AD5382_5, },
+	{ .name = "ad5383-3", .driver_data = ID_AD5383_3, },
+	{ .name = "ad5383-5", .driver_data = ID_AD5383_5, },
+	{ .name = "ad5384-3", .driver_data = ID_AD5380_3, },
+	{ .name = "ad5384-5", .driver_data = ID_AD5380_5, },
+	{ .name = "ad5390-3", .driver_data = ID_AD5390_3, },
+	{ .name = "ad5390-5", .driver_data = ID_AD5390_5, },
+	{ .name = "ad5391-3", .driver_data = ID_AD5391_3, },
+	{ .name = "ad5391-5", .driver_data = ID_AD5391_5, },
+	{ .name = "ad5392-3", .driver_data = ID_AD5392_3, },
+	{ .name = "ad5392-5", .driver_data = ID_AD5392_5, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad5380_i2c_ids);
diff --git a/drivers/iio/dac/ad5446.c b/drivers/iio/dac/ad5446.c
index 6ad99f97eed5..6fc695f91df9 100644
--- a/drivers/iio/dac/ad5446.c
+++ b/drivers/iio/dac/ad5446.c
@@ -537,12 +537,12 @@ static int ad5446_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ad5446_i2c_ids[] = {
-	{"ad5301", ID_AD5602},
-	{"ad5311", ID_AD5612},
-	{"ad5321", ID_AD5622},
-	{"ad5602", ID_AD5602},
-	{"ad5612", ID_AD5612},
-	{"ad5622", ID_AD5622},
+	{ .name = "ad5301", .driver_data = ID_AD5602, },
+	{ .name = "ad5311", .driver_data = ID_AD5612, },
+	{ .name = "ad5321", .driver_data = ID_AD5622, },
+	{ .name = "ad5602", .driver_data = ID_AD5602, },
+	{ .name = "ad5612", .driver_data = ID_AD5612, },
+	{ .name = "ad5622", .driver_data = ID_AD5622, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ad5446_i2c_ids);
diff --git a/drivers/iio/dac/ad5696-i2c.c b/drivers/iio/dac/ad5696-i2c.c
index bbcda246c547..96b0cd048449 100644
--- a/drivers/iio/dac/ad5696-i2c.c
+++ b/drivers/iio/dac/ad5696-i2c.c
@@ -71,22 +71,22 @@ static void ad5686_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ad5686_i2c_id[] = {
-	{"ad5311r", ID_AD5311R},
-	{"ad5337r", ID_AD5337R},
-	{"ad5338r", ID_AD5338R},
-	{"ad5671r", ID_AD5671R},
-	{"ad5673r", ID_AD5673R},
-	{"ad5675r", ID_AD5675R},
-	{"ad5677r", ID_AD5677R},
-	{"ad5691r", ID_AD5691R},
-	{"ad5692r", ID_AD5692R},
-	{"ad5693", ID_AD5693},
-	{"ad5693r", ID_AD5693R},
-	{"ad5694", ID_AD5694},
-	{"ad5694r", ID_AD5694R},
-	{"ad5695r", ID_AD5695R},
-	{"ad5696", ID_AD5696},
-	{"ad5696r", ID_AD5696R},
+	{ .name = "ad5311r", .driver_data = ID_AD5311R, },
+	{ .name = "ad5337r", .driver_data = ID_AD5337R, },
+	{ .name = "ad5338r", .driver_data = ID_AD5338R, },
+	{ .name = "ad5671r", .driver_data = ID_AD5671R, },
+	{ .name = "ad5673r", .driver_data = ID_AD5673R, },
+	{ .name = "ad5675r", .driver_data = ID_AD5675R, },
+	{ .name = "ad5677r", .driver_data = ID_AD5677R, },
+	{ .name = "ad5691r", .driver_data = ID_AD5691R, },
+	{ .name = "ad5692r", .driver_data = ID_AD5692R, },
+	{ .name = "ad5693", .driver_data = ID_AD5693, },
+	{ .name = "ad5693r", .driver_data = ID_AD5693R, },
+	{ .name = "ad5694", .driver_data = ID_AD5694, },
+	{ .name = "ad5694r", .driver_data = ID_AD5694R, },
+	{ .name = "ad5695r", .driver_data = ID_AD5695R, },
+	{ .name = "ad5696", .driver_data = ID_AD5696, },
+	{ .name = "ad5696r", .driver_data = ID_AD5696R, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ad5686_i2c_id);
diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
index e89e4c054653..737e08cf102d 100644
--- a/drivers/iio/dac/ds4424.c
+++ b/drivers/iio/dac/ds4424.c
@@ -291,8 +291,8 @@ static void ds4424_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ds4424_id[] = {
-	{ "ds4422", ID_DS4422 },
-	{ "ds4424", ID_DS4424 },
+	{ .name = "ds4422", .driver_data = ID_DS4422, },
+	{ .name = "ds4424", .driver_data = ID_DS4424, },
 	{ }
 };
 
diff --git a/drivers/iio/dac/max517.c b/drivers/iio/dac/max517.c
index 84336736a47b..18797e6949b5 100644
--- a/drivers/iio/dac/max517.c
+++ b/drivers/iio/dac/max517.c
@@ -189,11 +189,11 @@ static int max517_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max517_id[] = {
-	{ "max517", ID_MAX517 },
-	{ "max518", ID_MAX518 },
-	{ "max519", ID_MAX519 },
-	{ "max520", ID_MAX520 },
-	{ "max521", ID_MAX521 },
+	{ .name = "max517", .driver_data = ID_MAX517, },
+	{ .name = "max518", .driver_data = ID_MAX518, },
+	{ .name = "max519", .driver_data = ID_MAX519, },
+	{ .name = "max520", .driver_data = ID_MAX520, },
+	{ .name = "max521", .driver_data = ID_MAX521, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max517_id);
diff --git a/drivers/iio/dac/max5821.c b/drivers/iio/dac/max5821.c
index 18ba3eaaad75..ad4b9a7c761d 100644
--- a/drivers/iio/dac/max5821.c
+++ b/drivers/iio/dac/max5821.c
@@ -360,7 +360,7 @@ static int max5821_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max5821_id[] = {
-	{ "max5821", ID_MAX5821 },
+	{ .name = "max5821", .driver_data = ID_MAX5821, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max5821_id);
diff --git a/drivers/iio/dac/mcp4725.c b/drivers/iio/dac/mcp4725.c
index 25bb1c0490af..f8b14c2c6fda 100644
--- a/drivers/iio/dac/mcp4725.c
+++ b/drivers/iio/dac/mcp4725.c
@@ -525,8 +525,8 @@ static const struct mcp4725_chip_info mcp4726 = {
 };
 
 static const struct i2c_device_id mcp4725_id[] = {
-	{ "mcp4725", (kernel_ulong_t)&mcp4725 },
-	{ "mcp4726", (kernel_ulong_t)&mcp4726 },
+	{ .name = "mcp4725", .driver_data = (kernel_ulong_t)&mcp4725, },
+	{ .name = "mcp4726", .driver_data = (kernel_ulong_t)&mcp4726, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mcp4725_id);
diff --git a/drivers/iio/dac/ti-dac5571.c b/drivers/iio/dac/ti-dac5571.c
index c5162b72951a..e8e520d216e9 100644
--- a/drivers/iio/dac/ti-dac5571.c
+++ b/drivers/iio/dac/ti-dac5571.c
@@ -403,17 +403,17 @@ static const struct of_device_id dac5571_of_id[] = {
 MODULE_DEVICE_TABLE(of, dac5571_of_id);
 
 static const struct i2c_device_id dac5571_id[] = {
-	{"dac081c081", (kernel_ulong_t)&dac5571_spec[single_8bit] },
-	{"dac121c081", (kernel_ulong_t)&dac5571_spec[single_12bit] },
-	{"dac5571", (kernel_ulong_t)&dac5571_spec[single_8bit] },
-	{"dac6571", (kernel_ulong_t)&dac5571_spec[single_10bit] },
-	{"dac7571", (kernel_ulong_t)&dac5571_spec[single_12bit] },
-	{"dac5574", (kernel_ulong_t)&dac5571_spec[quad_8bit] },
-	{"dac6574", (kernel_ulong_t)&dac5571_spec[quad_10bit] },
-	{"dac7574", (kernel_ulong_t)&dac5571_spec[quad_12bit] },
-	{"dac5573", (kernel_ulong_t)&dac5571_spec[quad_8bit] },
-	{"dac6573", (kernel_ulong_t)&dac5571_spec[quad_10bit] },
-	{"dac7573", (kernel_ulong_t)&dac5571_spec[quad_12bit] },
+	{ .name = "dac081c081", .driver_data = (kernel_ulong_t)&dac5571_spec[single_8bit], },
+	{ .name = "dac121c081", .driver_data = (kernel_ulong_t)&dac5571_spec[single_12bit], },
+	{ .name = "dac5571", .driver_data = (kernel_ulong_t)&dac5571_spec[single_8bit], },
+	{ .name = "dac6571", .driver_data = (kernel_ulong_t)&dac5571_spec[single_10bit], },
+	{ .name = "dac7571", .driver_data = (kernel_ulong_t)&dac5571_spec[single_12bit], },
+	{ .name = "dac5574", .driver_data = (kernel_ulong_t)&dac5571_spec[quad_8bit], },
+	{ .name = "dac6574", .driver_data = (kernel_ulong_t)&dac5571_spec[quad_10bit], },
+	{ .name = "dac7574", .driver_data = (kernel_ulong_t)&dac5571_spec[quad_12bit], },
+	{ .name = "dac5573", .driver_data = (kernel_ulong_t)&dac5571_spec[quad_8bit], },
+	{ .name = "dac6573", .driver_data = (kernel_ulong_t)&dac5571_spec[quad_10bit], },
+	{ .name = "dac7573", .driver_data = (kernel_ulong_t)&dac5571_spec[quad_12bit], },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, dac5571_id);
diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index 1d074eb6a8c5..13b769f629e6 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -612,9 +612,9 @@ static void max30102_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max30102_id[] = {
-	{ "max30101", max30105 },
-	{ "max30102", max30102 },
-	{ "max30105", max30105 },
+	{ .name = "max30101", .driver_data = max30105, },
+	{ .name = "max30102", .driver_data = max30102, },
+	{ .name = "max30105", .driver_data = max30105, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, max30102_id);
diff --git a/drivers/iio/humidity/ens210.c b/drivers/iio/humidity/ens210.c
index 77418d97f30d..fbdc72568624 100644
--- a/drivers/iio/humidity/ens210.c
+++ b/drivers/iio/humidity/ens210.c
@@ -314,12 +314,12 @@ static const struct of_device_id ens210_of_match[] = {
 MODULE_DEVICE_TABLE(of, ens210_of_match);
 
 static const struct i2c_device_id ens210_id_table[] = {
-	{ "ens210", (kernel_ulong_t)&ens210_chip_info_data },
-	{ "ens210a", (kernel_ulong_t)&ens210a_chip_info_data },
-	{ "ens211", (kernel_ulong_t)&ens211_chip_info_data },
-	{ "ens212", (kernel_ulong_t)&ens212_chip_info_data },
-	{ "ens213a", (kernel_ulong_t)&ens213a_chip_info_data },
-	{ "ens215", (kernel_ulong_t)&ens215_chip_info_data },
+	{ .name = "ens210", .driver_data = (kernel_ulong_t)&ens210_chip_info_data, },
+	{ .name = "ens210a", .driver_data = (kernel_ulong_t)&ens210a_chip_info_data, },
+	{ .name = "ens211", .driver_data = (kernel_ulong_t)&ens211_chip_info_data, },
+	{ .name = "ens212", .driver_data = (kernel_ulong_t)&ens212_chip_info_data, },
+	{ .name = "ens213a", .driver_data = (kernel_ulong_t)&ens213a_chip_info_data, },
+	{ .name = "ens215", .driver_data = (kernel_ulong_t)&ens215_chip_info_data, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ens210_id_table);
diff --git a/drivers/iio/humidity/htu21.c b/drivers/iio/humidity/htu21.c
index 6402e393edb8..c4ae3b1deace 100644
--- a/drivers/iio/humidity/htu21.c
+++ b/drivers/iio/humidity/htu21.c
@@ -230,8 +230,8 @@ static int htu21_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id htu21_id[] = {
-	{"htu21", HTU21},
-	{"ms8607-humidity", MS8607},
+	{ .name = "htu21", .driver_data = HTU21, },
+	{ .name = "ms8607-humidity", .driver_data = MS8607, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, htu21_id);
diff --git a/drivers/iio/imu/bmi270/bmi270_i2c.c b/drivers/iio/imu/bmi270/bmi270_i2c.c
index 44699ab58909..db959c87d8a8 100644
--- a/drivers/iio/imu/bmi270/bmi270_i2c.c
+++ b/drivers/iio/imu/bmi270/bmi270_i2c.c
@@ -32,8 +32,8 @@ static int bmi270_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bmi270_i2c_id[] = {
-	{ "bmi260", (kernel_ulong_t)&bmi260_chip_info },
-	{ "bmi270", (kernel_ulong_t)&bmi270_chip_info },
+	{ .name = "bmi260", .driver_data = (kernel_ulong_t)&bmi260_chip_info, },
+	{ .name = "bmi270", .driver_data = (kernel_ulong_t)&bmi270_chip_info, },
 	{ }
 };
 
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c
index 04e440fe023a..a6eefc8ca9b9 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c
@@ -76,13 +76,13 @@ static int inv_icm42600_probe(struct i2c_client *client)
  * supported by this driver
  */
 static const struct i2c_device_id inv_icm42600_id[] = {
-	{ "icm42600", INV_CHIP_ICM42600 },
-	{ "icm42602", INV_CHIP_ICM42602 },
-	{ "icm42605", INV_CHIP_ICM42605 },
-	{ "icm42686", INV_CHIP_ICM42686 },
-	{ "icm42622", INV_CHIP_ICM42622 },
-	{ "icm42688", INV_CHIP_ICM42688 },
-	{ "icm42631", INV_CHIP_ICM42631 },
+	{ .name = "icm42600", .driver_data = INV_CHIP_ICM42600, },
+	{ .name = "icm42602", .driver_data = INV_CHIP_ICM42602, },
+	{ .name = "icm42605", .driver_data = INV_CHIP_ICM42605, },
+	{ .name = "icm42686", .driver_data = INV_CHIP_ICM42686, },
+	{ .name = "icm42622", .driver_data = INV_CHIP_ICM42622, },
+	{ .name = "icm42688", .driver_data = INV_CHIP_ICM42688, },
+	{ .name = "icm42631", .driver_data = INV_CHIP_ICM42631, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, inv_icm42600_id);
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
index 307a06f4df2e..ff08a95aa75a 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
@@ -173,23 +173,23 @@ static void inv_mpu_remove(struct i2c_client *client)
  * supported by this driver
  */
 static const struct i2c_device_id inv_mpu_id[] = {
-	{"mpu6050", INV_MPU6050},
-	{"mpu6500", INV_MPU6500},
-	{"mpu6515", INV_MPU6515},
-	{"mpu6880", INV_MPU6880},
-	{"mpu9150", INV_MPU9150},
-	{"mpu9250", INV_MPU9250},
-	{"mpu9255", INV_MPU9255},
-	{"icm20608", INV_ICM20608},
-	{"icm20608d", INV_ICM20608D},
-	{"icm20609", INV_ICM20609},
-	{"icm20689", INV_ICM20689},
-	{"icm20600", INV_ICM20600},
-	{"icm20602", INV_ICM20602},
-	{"icm20690", INV_ICM20690},
-	{"iam20680", INV_IAM20680},
-	{"iam20680hp", INV_IAM20680HP},
-	{"iam20680ht", INV_IAM20680HT},
+	{ .name = "mpu6050", .driver_data = INV_MPU6050, },
+	{ .name = "mpu6500", .driver_data = INV_MPU6500, },
+	{ .name = "mpu6515", .driver_data = INV_MPU6515, },
+	{ .name = "mpu6880", .driver_data = INV_MPU6880, },
+	{ .name = "mpu9150", .driver_data = INV_MPU9150, },
+	{ .name = "mpu9250", .driver_data = INV_MPU9250, },
+	{ .name = "mpu9255", .driver_data = INV_MPU9255, },
+	{ .name = "icm20608", .driver_data = INV_ICM20608, },
+	{ .name = "icm20608d", .driver_data = INV_ICM20608D, },
+	{ .name = "icm20609", .driver_data = INV_ICM20609, },
+	{ .name = "icm20689", .driver_data = INV_ICM20689, },
+	{ .name = "icm20600", .driver_data = INV_ICM20600, },
+	{ .name = "icm20602", .driver_data = INV_ICM20602, },
+	{ .name = "icm20690", .driver_data = INV_ICM20690, },
+	{ .name = "iam20680", .driver_data = INV_IAM20680, },
+	{ .name = "iam20680hp", .driver_data = INV_IAM20680HP, },
+	{ .name = "iam20680ht", .driver_data = INV_IAM20680HT, },
 	{}
 };
 
diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
index 25e1de89b6e4..3e7893667c04 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
@@ -149,31 +149,31 @@ static const struct acpi_device_id st_lsm6dsx_i2c_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, st_lsm6dsx_i2c_acpi_match);
 
 static const struct i2c_device_id st_lsm6dsx_i2c_id_table[] = {
-	{ ST_LSM6DS3_DEV_NAME, ST_LSM6DS3_ID },
-	{ ST_LSM6DS3H_DEV_NAME, ST_LSM6DS3H_ID },
-	{ ST_LSM6DSL_DEV_NAME, ST_LSM6DSL_ID },
-	{ ST_LSM6DSM_DEV_NAME, ST_LSM6DSM_ID },
-	{ ST_ISM330DLC_DEV_NAME, ST_ISM330DLC_ID },
-	{ ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
-	{ ST_ASM330LHH_DEV_NAME, ST_ASM330LHH_ID },
-	{ ST_LSM6DSOX_DEV_NAME, ST_LSM6DSOX_ID },
-	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
-	{ ST_LSM6DS3TRC_DEV_NAME, ST_LSM6DS3TRC_ID },
-	{ ST_ISM330DHCX_DEV_NAME, ST_ISM330DHCX_ID },
-	{ ST_LSM9DS1_DEV_NAME, ST_LSM9DS1_ID },
-	{ ST_LSM6DS0_DEV_NAME, ST_LSM6DS0_ID },
-	{ ST_LSM6DSRX_DEV_NAME, ST_LSM6DSRX_ID },
-	{ ST_LSM6DST_DEV_NAME, ST_LSM6DST_ID },
-	{ ST_LSM6DSOP_DEV_NAME, ST_LSM6DSOP_ID },
-	{ ST_ASM330LHHX_DEV_NAME, ST_ASM330LHHX_ID },
-	{ ST_LSM6DSTX_DEV_NAME, ST_LSM6DSTX_ID },
-	{ ST_LSM6DSV_DEV_NAME, ST_LSM6DSV_ID },
-	{ ST_LSM6DSV16X_DEV_NAME, ST_LSM6DSV16X_ID },
-	{ ST_LSM6DSO16IS_DEV_NAME, ST_LSM6DSO16IS_ID },
-	{ ST_ISM330IS_DEV_NAME, ST_ISM330IS_ID },
-	{ ST_ASM330LHB_DEV_NAME, ST_ASM330LHB_ID },
-	{ ST_ASM330LHHXG1_DEV_NAME, ST_ASM330LHHXG1_ID },
-	{},
+	{ .name = ST_LSM6DS3_DEV_NAME, .driver_data = ST_LSM6DS3_ID, },
+	{ .name = ST_LSM6DS3H_DEV_NAME, .driver_data = ST_LSM6DS3H_ID, },
+	{ .name = ST_LSM6DSL_DEV_NAME, .driver_data = ST_LSM6DSL_ID, },
+	{ .name = ST_LSM6DSM_DEV_NAME, .driver_data = ST_LSM6DSM_ID, },
+	{ .name = ST_ISM330DLC_DEV_NAME, .driver_data = ST_ISM330DLC_ID, },
+	{ .name = ST_LSM6DSO_DEV_NAME, .driver_data = ST_LSM6DSO_ID, },
+	{ .name = ST_ASM330LHH_DEV_NAME, .driver_data = ST_ASM330LHH_ID, },
+	{ .name = ST_LSM6DSOX_DEV_NAME, .driver_data = ST_LSM6DSOX_ID, },
+	{ .name = ST_LSM6DSR_DEV_NAME, .driver_data = ST_LSM6DSR_ID, },
+	{ .name = ST_LSM6DS3TRC_DEV_NAME, .driver_data = ST_LSM6DS3TRC_ID, },
+	{ .name = ST_ISM330DHCX_DEV_NAME, .driver_data = ST_ISM330DHCX_ID, },
+	{ .name = ST_LSM9DS1_DEV_NAME, .driver_data = ST_LSM9DS1_ID, },
+	{ .name = ST_LSM6DS0_DEV_NAME, .driver_data = ST_LSM6DS0_ID, },
+	{ .name = ST_LSM6DSRX_DEV_NAME, .driver_data = ST_LSM6DSRX_ID, },
+	{ .name = ST_LSM6DST_DEV_NAME, .driver_data = ST_LSM6DST_ID, },
+	{ .name = ST_LSM6DSOP_DEV_NAME, .driver_data = ST_LSM6DSOP_ID, },
+	{ .name = ST_ASM330LHHX_DEV_NAME, .driver_data = ST_ASM330LHHX_ID, },
+	{ .name = ST_LSM6DSTX_DEV_NAME, .driver_data = ST_LSM6DSTX_ID, },
+	{ .name = ST_LSM6DSV_DEV_NAME, .driver_data = ST_LSM6DSV_ID, },
+	{ .name = ST_LSM6DSV16X_DEV_NAME, .driver_data = ST_LSM6DSV16X_ID, },
+	{ .name = ST_LSM6DSO16IS_DEV_NAME, .driver_data = ST_LSM6DSO16IS_ID, },
+	{ .name = ST_ISM330IS_DEV_NAME, .driver_data = ST_ISM330IS_ID, },
+	{ .name = ST_ASM330LHB_DEV_NAME, .driver_data = ST_ASM330LHB_ID, },
+	{ .name = ST_ASM330LHHXG1_DEV_NAME, .driver_data = ST_ASM330LHHXG1_ID, },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, st_lsm6dsx_i2c_id_table);
 
diff --git a/drivers/iio/light/as73211.c b/drivers/iio/light/as73211.c
index be0068081ebb..52f81e41be12 100644
--- a/drivers/iio/light/as73211.c
+++ b/drivers/iio/light/as73211.c
@@ -866,8 +866,8 @@ static const struct of_device_id as73211_of_match[] = {
 MODULE_DEVICE_TABLE(of, as73211_of_match);
 
 static const struct i2c_device_id as73211_id[] = {
-	{ "as73211", (kernel_ulong_t)&as73211_spec },
-	{ "as7331", (kernel_ulong_t)&as7331_spec },
+	{ .name = "as73211", .driver_data = (kernel_ulong_t)&as73211_spec, },
+	{ .name = "as7331", .driver_data = (kernel_ulong_t)&as7331_spec, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, as73211_id);
diff --git a/drivers/iio/light/bh1750.c b/drivers/iio/light/bh1750.c
index 4b869fa9e5b1..3940c4c236ee 100644
--- a/drivers/iio/light/bh1750.c
+++ b/drivers/iio/light/bh1750.c
@@ -295,11 +295,11 @@ static int bh1750_suspend(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(bh1750_pm_ops, bh1750_suspend, NULL);
 
 static const struct i2c_device_id bh1750_id[] = {
-	{ "bh1710", BH1710 },
-	{ "bh1715", BH1750 },
-	{ "bh1721", BH1721 },
-	{ "bh1750", BH1750 },
-	{ "bh1751", BH1750 },
+	{ .name = "bh1710", .driver_data = BH1710, },
+	{ .name = "bh1715", .driver_data = BH1750, },
+	{ .name = "bh1721", .driver_data = BH1721, },
+	{ .name = "bh1750", .driver_data = BH1750, },
+	{ .name = "bh1751", .driver_data = BH1750, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bh1750_id);
diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
index 201eae1c4589..b96d8aaf99d3 100644
--- a/drivers/iio/light/isl29018.c
+++ b/drivers/iio/light/isl29018.c
@@ -829,9 +829,9 @@ static const struct acpi_device_id isl29018_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, isl29018_acpi_match);
 
 static const struct i2c_device_id isl29018_id[] = {
-	{"isl29018", isl29018},
-	{"isl29023", isl29023},
-	{"isl29035", isl29035},
+	{ .name = "isl29018", .driver_data = isl29018, },
+	{ .name = "isl29023", .driver_data = isl29023, },
+	{ .name = "isl29035", .driver_data = isl29035, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, isl29018_id);
diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 604f5f900a2e..540e6a90a9f4 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -1605,10 +1605,10 @@ static const struct acpi_device_id ltr_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, ltr_acpi_match);
 
 static const struct i2c_device_id ltr501_id[] = {
-	{ "ltr501", ltr501 },
-	{ "ltr559", ltr559 },
-	{ "ltr301", ltr301 },
-	{ "ltr303", ltr303 },
+	{ .name = "ltr501", .driver_data = ltr501, },
+	{ .name = "ltr559", .driver_data = ltr559, },
+	{ .name = "ltr301", .driver_data = ltr301, },
+	{ .name = "ltr303", .driver_data = ltr303, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltr501_id);
diff --git a/drivers/iio/light/opt3001.c b/drivers/iio/light/opt3001.c
index 65b295877b41..e68d4a058c2d 100644
--- a/drivers/iio/light/opt3001.c
+++ b/drivers/iio/light/opt3001.c
@@ -947,8 +947,8 @@ static const struct opt3001_chip_info opt3002_chip_information = {
 };
 
 static const struct i2c_device_id opt3001_id[] = {
-	{ "opt3001", (kernel_ulong_t)&opt3001_chip_information },
-	{ "opt3002", (kernel_ulong_t)&opt3002_chip_information },
+	{ .name = "opt3001", .driver_data = (kernel_ulong_t)&opt3001_chip_information, },
+	{ .name = "opt3002", .driver_data = (kernel_ulong_t)&opt3002_chip_information, },
 	{ } /* Terminating Entry */
 };
 MODULE_DEVICE_TABLE(i2c, opt3001_id);
diff --git a/drivers/iio/light/opt4001.c b/drivers/iio/light/opt4001.c
index 6cf60151b3d8..dee28178d0d5 100644
--- a/drivers/iio/light/opt4001.c
+++ b/drivers/iio/light/opt4001.c
@@ -439,8 +439,8 @@ static int opt4001_probe(struct i2c_client *client)
  * opt4001 packaging
  */
 static const struct i2c_device_id opt4001_id[] = {
-	{ "opt4001-sot-5x3", (kernel_ulong_t)&opt4001_sot_5x3_info },
-	{ "opt4001-picostar", (kernel_ulong_t)&opt4001_picostar_info },
+	{ .name = "opt4001-sot-5x3", .driver_data = (kernel_ulong_t)&opt4001_sot_5x3_info, },
+	{ .name = "opt4001-picostar", .driver_data = (kernel_ulong_t)&opt4001_picostar_info, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, opt4001_id);
diff --git a/drivers/iio/light/si1145.c b/drivers/iio/light/si1145.c
index 66abda021696..b95c56b7afad 100644
--- a/drivers/iio/light/si1145.c
+++ b/drivers/iio/light/si1145.c
@@ -1336,13 +1336,13 @@ static int si1145_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id si1145_ids[] = {
-	{ "si1132", SI1132 },
-	{ "si1141", SI1141 },
-	{ "si1142", SI1142 },
-	{ "si1143", SI1143 },
-	{ "si1145", SI1145 },
-	{ "si1146", SI1146 },
-	{ "si1147", SI1147 },
+	{ .name = "si1132", .driver_data = SI1132, },
+	{ .name = "si1141", .driver_data = SI1141, },
+	{ .name = "si1142", .driver_data = SI1142, },
+	{ .name = "si1143", .driver_data = SI1143, },
+	{ .name = "si1145", .driver_data = SI1145, },
+	{ .name = "si1146", .driver_data = SI1146, },
+	{ .name = "si1147", .driver_data = SI1147, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si1145_ids);
diff --git a/drivers/iio/light/tsl2563.c b/drivers/iio/light/tsl2563.c
index f1fe7640fce6..5eeeef176c5b 100644
--- a/drivers/iio/light/tsl2563.c
+++ b/drivers/iio/light/tsl2563.c
@@ -839,10 +839,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tsl2563_pm_ops, tsl2563_suspend,
 				tsl2563_resume);
 
 static const struct i2c_device_id tsl2563_id[] = {
-	{ "tsl2560", 0 },
-	{ "tsl2561", 1 },
-	{ "tsl2562", 2 },
-	{ "tsl2563", 3 },
+	{ .name = "tsl2560", .driver_data = 0, },
+	{ .name = "tsl2561", .driver_data = 1, },
+	{ .name = "tsl2562", .driver_data = 2, },
+	{ .name = "tsl2563", .driver_data = 3, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tsl2563_id);
diff --git a/drivers/iio/light/tsl2583.c b/drivers/iio/light/tsl2583.c
index 02ad11611b9c..7d17ee019e3c 100644
--- a/drivers/iio/light/tsl2583.c
+++ b/drivers/iio/light/tsl2583.c
@@ -919,9 +919,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(tsl2583_pm_ops, tsl2583_suspend,
 				 tsl2583_resume, NULL);
 
 static const struct i2c_device_id tsl2583_idtable[] = {
-	{ "tsl2580", 0 },
-	{ "tsl2581", 1 },
-	{ "tsl2583", 2 },
+	{ .name = "tsl2580", .driver_data = 0, },
+	{ .name = "tsl2581", .driver_data = 1, },
+	{ .name = "tsl2583", .driver_data = 2, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tsl2583_idtable);
diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
index 349afdcbe30d..5182ce4b71e6 100644
--- a/drivers/iio/light/tsl2772.c
+++ b/drivers/iio/light/tsl2772.c
@@ -1888,17 +1888,17 @@ static int tsl2772_resume(struct device *dev)
 }
 
 static const struct i2c_device_id tsl2772_idtable[] = {
-	{ "tsl2571", tsl2571 },
-	{ "tsl2671", tsl2671 },
-	{ "tmd2671", tmd2671 },
-	{ "tsl2771", tsl2771 },
-	{ "tmd2771", tmd2771 },
-	{ "tsl2572", tsl2572 },
-	{ "tsl2672", tsl2672 },
-	{ "tmd2672", tmd2672 },
-	{ "tsl2772", tsl2772 },
-	{ "tmd2772", tmd2772 },
-	{ "apds9930", apds9930 },
+	{ .name = "tsl2571", .driver_data = tsl2571, },
+	{ .name = "tsl2671", .driver_data = tsl2671, },
+	{ .name = "tmd2671", .driver_data = tmd2671, },
+	{ .name = "tsl2771", .driver_data = tsl2771, },
+	{ .name = "tmd2771", .driver_data = tmd2771, },
+	{ .name = "tsl2572", .driver_data = tsl2572, },
+	{ .name = "tsl2672", .driver_data = tsl2672, },
+	{ .name = "tmd2672", .driver_data = tmd2672, },
+	{ .name = "tsl2772", .driver_data = tsl2772, },
+	{ .name = "tmd2772", .driver_data = tmd2772, },
+	{ .name = "apds9930", .driver_data = apds9930, },
 	{}
 };
 
diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index e19199b17f2e..dff414983fd4 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -235,11 +235,11 @@ struct vcnl4000_chip_spec {
 };
 
 static const struct i2c_device_id vcnl4000_id[] = {
-	{ "vcnl4000", VCNL4000 },
-	{ "vcnl4010", VCNL4010 },
-	{ "vcnl4020", VCNL4010 },
-	{ "vcnl4040", VCNL4040 },
-	{ "vcnl4200", VCNL4200 },
+	{ .name = "vcnl4000", .driver_data = VCNL4000, },
+	{ .name = "vcnl4010", .driver_data = VCNL4010, },
+	{ .name = "vcnl4020", .driver_data = VCNL4010, },
+	{ .name = "vcnl4040", .driver_data = VCNL4040, },
+	{ .name = "vcnl4200", .driver_data = VCNL4200, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vcnl4000_id);
diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
index ccb43dfd5cf7..81fbd2676933 100644
--- a/drivers/iio/light/veml6030.c
+++ b/drivers/iio/light/veml6030.c
@@ -1163,9 +1163,9 @@ static const struct of_device_id veml6030_of_match[] = {
 MODULE_DEVICE_TABLE(of, veml6030_of_match);
 
 static const struct i2c_device_id veml6030_id[] = {
-	{ "veml6030", (kernel_ulong_t)&veml6030_chip},
-	{ "veml6035", (kernel_ulong_t)&veml6035_chip},
-	{ "veml7700", (kernel_ulong_t)&veml7700_chip},
+	{ .name = "veml6030", .driver_data = (kernel_ulong_t)&veml6030_chip, },
+	{ .name = "veml6035", .driver_data = (kernel_ulong_t)&veml6035_chip, },
+	{ .name = "veml7700", .driver_data = (kernel_ulong_t)&veml7700_chip, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, veml6030_id);
diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer/ak8975.c
index 18077fb463a9..571207b64679 100644
--- a/drivers/iio/magnetometer/ak8975.c
+++ b/drivers/iio/magnetometer/ak8975.c
@@ -1100,14 +1100,14 @@ static const struct acpi_device_id ak_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, ak_acpi_match);
 
 static const struct i2c_device_id ak8975_id[] = {
-	{"AK8963", (kernel_ulong_t)&ak_def_array[AK8963] },
-	{"ak8963", (kernel_ulong_t)&ak_def_array[AK8963] },
-	{"ak8975", (kernel_ulong_t)&ak_def_array[AK8975] },
-	{"ak09911", (kernel_ulong_t)&ak_def_array[AK09911] },
-	{"ak09912", (kernel_ulong_t)&ak_def_array[AK09912] },
-	{"ak09916", (kernel_ulong_t)&ak_def_array[AK09916] },
-	{"ak09918", (kernel_ulong_t)&ak_def_array[AK09918] },
-	{}
+	{ .name = "AK8963", .driver_data = (kernel_ulong_t)&ak_def_array[AK8963], },
+	{ .name = "ak8963", .driver_data = (kernel_ulong_t)&ak_def_array[AK8963], },
+	{ .name = "ak8975", .driver_data = (kernel_ulong_t)&ak_def_array[AK8975], },
+	{ .name = "ak09911", .driver_data = (kernel_ulong_t)&ak_def_array[AK09911], },
+	{ .name = "ak09912", .driver_data = (kernel_ulong_t)&ak_def_array[AK09912], },
+	{ .name = "ak09916", .driver_data = (kernel_ulong_t)&ak_def_array[AK09916], },
+	{ .name = "ak09918", .driver_data = (kernel_ulong_t)&ak_def_array[AK09918], },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ak8975_id);
 
diff --git a/drivers/iio/magnetometer/hmc5843_i2c.c b/drivers/iio/magnetometer/hmc5843_i2c.c
index 657a309e2bd5..0b40cd95b1fa 100644
--- a/drivers/iio/magnetometer/hmc5843_i2c.c
+++ b/drivers/iio/magnetometer/hmc5843_i2c.c
@@ -71,10 +71,10 @@ static void hmc5843_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id hmc5843_id[] = {
-	{ "hmc5843", HMC5843_ID },
-	{ "hmc5883", HMC5883_ID },
-	{ "hmc5883l", HMC5883L_ID },
-	{ "hmc5983", HMC5983_ID },
+	{ .name = "hmc5843", .driver_data = HMC5843_ID, },
+	{ .name = "hmc5883", .driver_data = HMC5883_ID, },
+	{ .name = "hmc5883l", .driver_data = HMC5883L_ID, },
+	{ .name = "hmc5983", .driver_data = HMC5983_ID, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, hmc5843_id);
diff --git a/drivers/iio/magnetometer/yamaha-yas530.c b/drivers/iio/magnetometer/yamaha-yas530.c
index c55a38650c0d..aaa144f20f82 100644
--- a/drivers/iio/magnetometer/yamaha-yas530.c
+++ b/drivers/iio/magnetometer/yamaha-yas530.c
@@ -1581,10 +1581,10 @@ static DEFINE_RUNTIME_DEV_PM_OPS(yas5xx_dev_pm_ops, yas5xx_runtime_suspend,
 				 yas5xx_runtime_resume, NULL);
 
 static const struct i2c_device_id yas5xx_id[] = {
-	{"yas530", (kernel_ulong_t)&yas5xx_chip_info_tbl[yas530] },
-	{"yas532", (kernel_ulong_t)&yas5xx_chip_info_tbl[yas532] },
-	{"yas533", (kernel_ulong_t)&yas5xx_chip_info_tbl[yas533] },
-	{"yas537", (kernel_ulong_t)&yas5xx_chip_info_tbl[yas537] },
+	{ .name = "yas530", .driver_data = (kernel_ulong_t)&yas5xx_chip_info_tbl[yas530], },
+	{ .name = "yas532", .driver_data = (kernel_ulong_t)&yas5xx_chip_info_tbl[yas532], },
+	{ .name = "yas533", .driver_data = (kernel_ulong_t)&yas5xx_chip_info_tbl[yas533], },
+	{ .name = "yas537", .driver_data = (kernel_ulong_t)&yas5xx_chip_info_tbl[yas537], },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, yas5xx_id);
diff --git a/drivers/iio/potentiometer/ad5272.c b/drivers/iio/potentiometer/ad5272.c
index b17941e4c2f7..732ab538b5be 100644
--- a/drivers/iio/potentiometer/ad5272.c
+++ b/drivers/iio/potentiometer/ad5272.c
@@ -204,11 +204,11 @@ static const struct of_device_id ad5272_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ad5272_dt_ids);
 
 static const struct i2c_device_id ad5272_id[] = {
-	{ "ad5272-020", AD5272_020 },
-	{ "ad5272-050", AD5272_050 },
-	{ "ad5272-100", AD5272_100 },
-	{ "ad5274-020", AD5274_020 },
-	{ "ad5274-100", AD5274_100 },
+	{ .name = "ad5272-020", .driver_data = AD5272_020, },
+	{ .name = "ad5272-050", .driver_data = AD5272_050, },
+	{ .name = "ad5272-100", .driver_data = AD5272_100, },
+	{ .name = "ad5274-020", .driver_data = AD5274_020, },
+	{ .name = "ad5274-100", .driver_data = AD5274_100, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ad5272_id);
diff --git a/drivers/iio/potentiometer/ds1803.c b/drivers/iio/potentiometer/ds1803.c
index e0526dd0e3cb..cf1adfe3d571 100644
--- a/drivers/iio/potentiometer/ds1803.c
+++ b/drivers/iio/potentiometer/ds1803.c
@@ -236,10 +236,10 @@ static const struct of_device_id ds1803_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ds1803_dt_ids);
 
 static const struct i2c_device_id ds1803_id[] = {
-	{ "ds1803-010", (kernel_ulong_t)&ds1803_cfg[DS1803_010] },
-	{ "ds1803-050", (kernel_ulong_t)&ds1803_cfg[DS1803_050] },
-	{ "ds1803-100", (kernel_ulong_t)&ds1803_cfg[DS1803_100] },
-	{ "ds3502", (kernel_ulong_t)&ds1803_cfg[DS3502] },
+	{ .name = "ds1803-010", .driver_data = (kernel_ulong_t)&ds1803_cfg[DS1803_010], },
+	{ .name = "ds1803-050", .driver_data = (kernel_ulong_t)&ds1803_cfg[DS1803_050], },
+	{ .name = "ds1803-100", .driver_data = (kernel_ulong_t)&ds1803_cfg[DS1803_100], },
+	{ .name = "ds3502", .driver_data = (kernel_ulong_t)&ds1803_cfg[DS3502], },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ds1803_id);
diff --git a/drivers/iio/potentiometer/tpl0102.c b/drivers/iio/potentiometer/tpl0102.c
index 8923ccb0fc4f..f90085907d05 100644
--- a/drivers/iio/potentiometer/tpl0102.c
+++ b/drivers/iio/potentiometer/tpl0102.c
@@ -149,10 +149,10 @@ static int tpl0102_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tpl0102_id[] = {
-	{ "cat5140-503", CAT5140_503 },
-	{ "cat5140-104", CAT5140_104 },
-	{ "tpl0102-104", TPL0102_104 },
-	{ "tpl0401-103", TPL0401_103 },
+	{ .name = "cat5140-503", .driver_data = CAT5140_503, },
+	{ .name = "cat5140-104", .driver_data = CAT5140_104, },
+	{ .name = "tpl0102-104", .driver_data = TPL0102_104, },
+	{ .name = "tpl0401-103", .driver_data = TPL0401_103, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tpl0102_id);
diff --git a/drivers/iio/pressure/abp060mg.c b/drivers/iio/pressure/abp060mg.c
index 752a63c06b44..c508cd6ea577 100644
--- a/drivers/iio/pressure/abp060mg.c
+++ b/drivers/iio/pressure/abp060mg.c
@@ -209,45 +209,45 @@ static int abp060mg_probe(struct i2c_client *client)
 static const struct i2c_device_id abp060mg_id_table[] = {
 	/* mbar & kPa variants (abp060m [60 mbar] == abp006k [6 kPa]) */
 	/*    gage: */
-	{ "abp060mg", ABP006KG }, { "abp006kg", ABP006KG },
-	{ "abp100mg", ABP010KG }, { "abp010kg", ABP010KG },
-	{ "abp160mg", ABP016KG }, { "abp016kg", ABP016KG },
-	{ "abp250mg", ABP025KG }, { "abp025kg", ABP025KG },
-	{ "abp400mg", ABP040KG }, { "abp040kg", ABP040KG },
-	{ "abp600mg", ABP060KG }, { "abp060kg", ABP060KG },
-	{ "abp001bg", ABP100KG }, { "abp100kg", ABP100KG },
-	{ "abp1_6bg", ABP160KG }, { "abp160kg", ABP160KG },
-	{ "abp2_5bg", ABP250KG }, { "abp250kg", ABP250KG },
-	{ "abp004bg", ABP400KG }, { "abp400kg", ABP400KG },
-	{ "abp006bg", ABP600KG }, { "abp600kg", ABP600KG },
-	{ "abp010bg", ABP001GG }, { "abp001gg", ABP001GG },
+	{ .name = "abp060mg", .driver_data = ABP006KG, }, { .name = "abp006kg", .driver_data = ABP006KG, },
+	{ .name = "abp100mg", .driver_data = ABP010KG, }, { .name = "abp010kg", .driver_data = ABP010KG, },
+	{ .name = "abp160mg", .driver_data = ABP016KG, }, { .name = "abp016kg", .driver_data = ABP016KG, },
+	{ .name = "abp250mg", .driver_data = ABP025KG, }, { .name = "abp025kg", .driver_data = ABP025KG, },
+	{ .name = "abp400mg", .driver_data = ABP040KG, }, { .name = "abp040kg", .driver_data = ABP040KG, },
+	{ .name = "abp600mg", .driver_data = ABP060KG, }, { .name = "abp060kg", .driver_data = ABP060KG, },
+	{ .name = "abp001bg", .driver_data = ABP100KG, }, { .name = "abp100kg", .driver_data = ABP100KG, },
+	{ .name = "abp1_6bg", .driver_data = ABP160KG, }, { .name = "abp160kg", .driver_data = ABP160KG, },
+	{ .name = "abp2_5bg", .driver_data = ABP250KG, }, { .name = "abp250kg", .driver_data = ABP250KG, },
+	{ .name = "abp004bg", .driver_data = ABP400KG, }, { .name = "abp400kg", .driver_data = ABP400KG, },
+	{ .name = "abp006bg", .driver_data = ABP600KG, }, { .name = "abp600kg", .driver_data = ABP600KG, },
+	{ .name = "abp010bg", .driver_data = ABP001GG, }, { .name = "abp001gg", .driver_data = ABP001GG, },
 	/*    differential: */
-	{ "abp060md", ABP006KD }, { "abp006kd", ABP006KD },
-	{ "abp100md", ABP010KD }, { "abp010kd", ABP010KD },
-	{ "abp160md", ABP016KD }, { "abp016kd", ABP016KD },
-	{ "abp250md", ABP025KD }, { "abp025kd", ABP025KD },
-	{ "abp400md", ABP040KD }, { "abp040kd", ABP040KD },
-	{ "abp600md", ABP060KD }, { "abp060kd", ABP060KD },
-	{ "abp001bd", ABP100KD }, { "abp100kd", ABP100KD },
-	{ "abp1_6bd", ABP160KD }, { "abp160kd", ABP160KD },
-	{ "abp2_5bd", ABP250KD }, { "abp250kd", ABP250KD },
-	{ "abp004bd", ABP400KD }, { "abp400kd", ABP400KD },
+	{ .name = "abp060md", .driver_data = ABP006KD, }, { .name = "abp006kd", .driver_data = ABP006KD, },
+	{ .name = "abp100md", .driver_data = ABP010KD, }, { .name = "abp010kd", .driver_data = ABP010KD, },
+	{ .name = "abp160md", .driver_data = ABP016KD, }, { .name = "abp016kd", .driver_data = ABP016KD, },
+	{ .name = "abp250md", .driver_data = ABP025KD, }, { .name = "abp025kd", .driver_data = ABP025KD, },
+	{ .name = "abp400md", .driver_data = ABP040KD, }, { .name = "abp040kd", .driver_data = ABP040KD, },
+	{ .name = "abp600md", .driver_data = ABP060KD, }, { .name = "abp060kd", .driver_data = ABP060KD, },
+	{ .name = "abp001bd", .driver_data = ABP100KD, }, { .name = "abp100kd", .driver_data = ABP100KD, },
+	{ .name = "abp1_6bd", .driver_data = ABP160KD, }, { .name = "abp160kd", .driver_data = ABP160KD, },
+	{ .name = "abp2_5bd", .driver_data = ABP250KD, }, { .name = "abp250kd", .driver_data = ABP250KD, },
+	{ .name = "abp004bd", .driver_data = ABP400KD, }, { .name = "abp400kd", .driver_data = ABP400KD, },
 	/* psi variants */
 	/*    gage: */
-	{ "abp001pg", ABP001PG },
-	{ "abp005pg", ABP005PG },
-	{ "abp015pg", ABP015PG },
-	{ "abp030pg", ABP030PG },
-	{ "abp060pg", ABP060PG },
-	{ "abp100pg", ABP100PG },
-	{ "abp150pg", ABP150PG },
+	{ .name = "abp001pg", .driver_data = ABP001PG, },
+	{ .name = "abp005pg", .driver_data = ABP005PG, },
+	{ .name = "abp015pg", .driver_data = ABP015PG, },
+	{ .name = "abp030pg", .driver_data = ABP030PG, },
+	{ .name = "abp060pg", .driver_data = ABP060PG, },
+	{ .name = "abp100pg", .driver_data = ABP100PG, },
+	{ .name = "abp150pg", .driver_data = ABP150PG, },
 	/*    differential: */
-	{ "abp001pd", ABP001PD },
-	{ "abp005pd", ABP005PD },
-	{ "abp015pd", ABP015PD },
-	{ "abp030pd", ABP030PD },
-	{ "abp060pd", ABP060PD },
-	{ /* empty */ },
+	{ .name = "abp001pd", .driver_data = ABP001PD, },
+	{ .name = "abp005pd", .driver_data = ABP005PD, },
+	{ .name = "abp015pd", .driver_data = ABP015PD, },
+	{ .name = "abp030pd", .driver_data = ABP030PD, },
+	{ .name = "abp060pd", .driver_data = ABP060PD, },
+	{ /* empty */ }
 };
 MODULE_DEVICE_TABLE(i2c, abp060mg_id_table);
 
diff --git a/drivers/iio/pressure/bmp280-i2c.c b/drivers/iio/pressure/bmp280-i2c.c
index 868e1b2ec711..c13ba2286608 100644
--- a/drivers/iio/pressure/bmp280-i2c.c
+++ b/drivers/iio/pressure/bmp280-i2c.c
@@ -38,13 +38,13 @@ static const struct of_device_id bmp280_of_i2c_match[] = {
 MODULE_DEVICE_TABLE(of, bmp280_of_i2c_match);
 
 static const struct i2c_device_id bmp280_i2c_id[] = {
-	{"bmp085", (kernel_ulong_t)&bmp085_chip_info },
-	{"bmp180", (kernel_ulong_t)&bmp180_chip_info },
-	{"bmp280", (kernel_ulong_t)&bmp280_chip_info },
-	{"bme280", (kernel_ulong_t)&bme280_chip_info },
-	{"bmp380", (kernel_ulong_t)&bmp380_chip_info },
-	{"bmp580", (kernel_ulong_t)&bmp580_chip_info },
-	{ },
+	{ .name = "bmp085", .driver_data = (kernel_ulong_t)&bmp085_chip_info, },
+	{ .name = "bmp180", .driver_data = (kernel_ulong_t)&bmp180_chip_info, },
+	{ .name = "bmp280", .driver_data = (kernel_ulong_t)&bmp280_chip_info, },
+	{ .name = "bme280", .driver_data = (kernel_ulong_t)&bme280_chip_info, },
+	{ .name = "bmp380", .driver_data = (kernel_ulong_t)&bmp380_chip_info, },
+	{ .name = "bmp580", .driver_data = (kernel_ulong_t)&bmp580_chip_info, },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bmp280_i2c_id);
 
diff --git a/drivers/iio/pressure/dlhl60d.c b/drivers/iio/pressure/dlhl60d.c
index e99e97ea6300..02d2ec698c0d 100644
--- a/drivers/iio/pressure/dlhl60d.c
+++ b/drivers/iio/pressure/dlhl60d.c
@@ -349,8 +349,8 @@ static const struct of_device_id dlh_of_match[] = {
 MODULE_DEVICE_TABLE(of, dlh_of_match);
 
 static const struct i2c_device_id dlh_id[] = {
-	{ "dlhl60d",    dlhl60d },
-	{ "dlhl60g",    dlhl60g },
+	{ .name = "dlhl60d", .driver_data = dlhl60d, },
+	{ .name = "dlhl60g", .driver_data = dlhl60g, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, dlh_id);
diff --git a/drivers/iio/pressure/ms5611_i2c.c b/drivers/iio/pressure/ms5611_i2c.c
index 1c041b9085fb..11662e38addc 100644
--- a/drivers/iio/pressure/ms5611_i2c.c
+++ b/drivers/iio/pressure/ms5611_i2c.c
@@ -113,8 +113,8 @@ static const struct of_device_id ms5611_i2c_matches[] = {
 MODULE_DEVICE_TABLE(of, ms5611_i2c_matches);
 
 static const struct i2c_device_id ms5611_id[] = {
-	{ "ms5611", MS5611 },
-	{ "ms5607", MS5607 },
+	{ .name = "ms5611", .driver_data = MS5611, },
+	{ .name = "ms5607", .driver_data = MS5607, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ms5611_id);
diff --git a/drivers/iio/pressure/ms5637.c b/drivers/iio/pressure/ms5637.c
index a1767a17fdce..3df079966279 100644
--- a/drivers/iio/pressure/ms5637.c
+++ b/drivers/iio/pressure/ms5637.c
@@ -215,10 +215,10 @@ static const struct ms_tp_data ms8607_data = {
 };
 
 static const struct i2c_device_id ms5637_id[] = {
-	{"ms5637", (kernel_ulong_t)&ms5637_data },
-	{"ms5805", (kernel_ulong_t)&ms5805_data },
-	{"ms5837", (kernel_ulong_t)&ms5837_data },
-	{"ms8607-temppressure", (kernel_ulong_t)&ms8607_data },
+	{ .name = "ms5637", .driver_data = (kernel_ulong_t)&ms5637_data, },
+	{ .name = "ms5805", .driver_data = (kernel_ulong_t)&ms5805_data, },
+	{ .name = "ms5837", .driver_data = (kernel_ulong_t)&ms5837_data, },
+	{ .name = "ms8607-temppressure", .driver_data = (kernel_ulong_t)&ms8607_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ms5637_id);
diff --git a/drivers/iio/pressure/st_pressure_i2c.c b/drivers/iio/pressure/st_pressure_i2c.c
index b7b66ddc3a73..f4fc71aee5b1 100644
--- a/drivers/iio/pressure/st_pressure_i2c.c
+++ b/drivers/iio/pressure/st_pressure_i2c.c
@@ -61,15 +61,15 @@ static const struct acpi_device_id st_press_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, st_press_acpi_match);
 
 static const struct i2c_device_id st_press_id_table[] = {
-	{ LPS001WP_PRESS_DEV_NAME, LPS001WP },
-	{ LPS25H_PRESS_DEV_NAME,  LPS25H },
-	{ LPS331AP_PRESS_DEV_NAME, LPS331AP },
-	{ LPS22HB_PRESS_DEV_NAME, LPS22HB },
-	{ LPS33HW_PRESS_DEV_NAME, LPS33HW },
-	{ LPS35HW_PRESS_DEV_NAME, LPS35HW },
-	{ LPS22HH_PRESS_DEV_NAME, LPS22HH },
-	{ LPS22DF_PRESS_DEV_NAME, LPS22DF },
-	{},
+	{ .name = LPS001WP_PRESS_DEV_NAME, .driver_data = LPS001WP, },
+	{ .name = LPS25H_PRESS_DEV_NAME, .driver_data = LPS25H, },
+	{ .name = LPS331AP_PRESS_DEV_NAME, .driver_data = LPS331AP, },
+	{ .name = LPS22HB_PRESS_DEV_NAME, .driver_data = LPS22HB, },
+	{ .name = LPS33HW_PRESS_DEV_NAME, .driver_data = LPS33HW, },
+	{ .name = LPS35HW_PRESS_DEV_NAME, .driver_data = LPS35HW, },
+	{ .name = LPS22HH_PRESS_DEV_NAME, .driver_data = LPS22HH, },
+	{ .name = LPS22DF_PRESS_DEV_NAME, .driver_data = LPS22DF, },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, st_press_id_table);
 
diff --git a/drivers/iio/proximity/aw96103.c b/drivers/iio/proximity/aw96103.c
index cdd254da9e50..19bce4e9ea24 100644
--- a/drivers/iio/proximity/aw96103.c
+++ b/drivers/iio/proximity/aw96103.c
@@ -825,8 +825,8 @@ static const struct of_device_id aw96103_dt_match[] = {
 MODULE_DEVICE_TABLE(of, aw96103_dt_match);
 
 static const struct i2c_device_id aw96103_i2c_id[] = {
-	{ "aw96103", (kernel_ulong_t)&aw_chip_info_tbl[AW96103_VAL] },
-	{ "aw96105", (kernel_ulong_t)&aw_chip_info_tbl[AW96105_VAL] },
+	{ .name = "aw96103", .driver_data = (kernel_ulong_t)&aw_chip_info_tbl[AW96103_VAL], },
+	{ .name = "aw96105", .driver_data = (kernel_ulong_t)&aw_chip_info_tbl[AW96105_VAL], },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw96103_i2c_id);
diff --git a/drivers/iio/proximity/srf08.c b/drivers/iio/proximity/srf08.c
index a75ea5042876..af7fa877778f 100644
--- a/drivers/iio/proximity/srf08.c
+++ b/drivers/iio/proximity/srf08.c
@@ -537,9 +537,9 @@ static const struct of_device_id of_srf08_match[] = {
 MODULE_DEVICE_TABLE(of, of_srf08_match);
 
 static const struct i2c_device_id srf08_id[] = {
-	{ "srf02", SRF02 },
-	{ "srf08", SRF08 },
-	{ "srf10", SRF10 },
+	{ .name = "srf02", .driver_data = SRF02, },
+	{ .name = "srf08", .driver_data = SRF08, },
+	{ .name = "srf10", .driver_data = SRF10, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, srf08_id);
diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 0d7f0518d4fb..b8e412c7a6c2 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -1000,8 +1000,8 @@ static const struct of_device_id sx9310_of_match[] = {
 MODULE_DEVICE_TABLE(of, sx9310_of_match);
 
 static const struct i2c_device_id sx9310_id[] = {
-	{ "sx9310", (kernel_ulong_t)&sx9310_info },
-	{ "sx9311", (kernel_ulong_t)&sx9311_info },
+	{ .name = "sx9310", .driver_data = (kernel_ulong_t)&sx9310_info, },
+	{ .name = "sx9311", .driver_data = (kernel_ulong_t)&sx9311_info, },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, sx9310_id);
diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index f7819dd2775c..dcd9a12d8d55 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -1128,7 +1128,7 @@ static const struct of_device_id sx9324_of_match[] = {
 MODULE_DEVICE_TABLE(of, sx9324_of_match);
 
 static const struct i2c_device_id sx9324_id[] = {
-	{ "sx9324", SX9324_WHOAMI_VALUE },
+	{ .name = "sx9324", .driver_data = SX9324_WHOAMI_VALUE, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sx9324_id);
diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index a6ff16e33c1e..70a6f18b5b83 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -838,7 +838,7 @@ static const struct of_device_id sx9360_of_match[] = {
 MODULE_DEVICE_TABLE(of, sx9360_of_match);
 
 static const struct i2c_device_id sx9360_id[] = {
-	{"sx9360", SX9360_WHOAMI_VALUE },
+	{ .name = "sx9360", .driver_data = SX9360_WHOAMI_VALUE, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sx9360_id);
diff --git a/drivers/iio/temperature/tmp117.c b/drivers/iio/temperature/tmp117.c
index 8972083d903a..129d8aa59f13 100644
--- a/drivers/iio/temperature/tmp117.c
+++ b/drivers/iio/temperature/tmp117.c
@@ -209,8 +209,8 @@ static const struct of_device_id tmp117_of_match[] = {
 MODULE_DEVICE_TABLE(of, tmp117_of_match);
 
 static const struct i2c_device_id tmp117_id[] = {
-	{ "tmp116", (kernel_ulong_t)&tmp116_channels_info },
-	{ "tmp117", (kernel_ulong_t)&tmp117_channels_info },
+	{ .name = "tmp116", .driver_data = (kernel_ulong_t)&tmp116_channels_info, },
+	{ .name = "tmp117", .driver_data = (kernel_ulong_t)&tmp117_channels_info, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp117_id);

base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
-- 
2.45.2

