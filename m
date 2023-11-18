Return-Path: <linux-i2c+bounces-242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3797F01D5
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF2E11C20904
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212731C688;
	Sat, 18 Nov 2023 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fck8uCd0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD57D5;
	Sat, 18 Nov 2023 10:05:11 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507a55302e0so4478341e87.0;
        Sat, 18 Nov 2023 10:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330710; x=1700935510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m823d+6CNTStctZTlRF6jC0ql5SePV7hnpsYwUIZVes=;
        b=fck8uCd08+QY15tjX0829cssiL6fl8beopVa0m6+LIRApg2iN1Xtk8bxahGcIW+cSt
         FPzrCdUW1DpVNzAX6qN0288+FYGzvMwAjz6iuDYxmV+EeIG34ORCpJp35VBw9hSPE48p
         Iyph66NftfA9S7I4hiC2DOaXqlQblEQqXrcxSkSr2AlTVWL9ESv3468K75kt35mEMbRa
         oXtTAzIVUBHrHuqsFNRNG/oOU7BZI9ttCxzR8p8hWKEzbmDvsSL1SbSiS4ZYML7+De1F
         DPM5bIoLdLHctkyAspUCyAl/1rD5MxSmnMMxwOVIGRaAU2PinpgoYBqajY8zBGofOjCI
         8eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330710; x=1700935510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m823d+6CNTStctZTlRF6jC0ql5SePV7hnpsYwUIZVes=;
        b=UJ5Vw2rsEDqTrwFNGKPSYnPca5t3w5x8OqGuFYhH4npe+7MwkjH2fFHhw4Umz9bVuX
         9ka9VgjRLXRqmcixD6j39Q2mCmGvA56HZcq+L6HkjyTOna3Jsru32VT7QjUXIchX60vr
         /DYmB2vkdtdj6OaPFVVxCAp4thq61j5HeGH1IWbXJLcEI+izh+oTxtTJJlmGd5EWCqyf
         7q+FKkmdjqHs4wd9Cfc2vMG67qBDscnJfNvMEWZ72LYGuCUSWBI4YS/qS+htcalTLK2y
         0y9JpkNb0pPtAkow6XXeYV5GVf6wULdylA612T1o5FbKUS9AHyp5RHfdM24cXBD4LUrx
         4ZOQ==
X-Gm-Message-State: AOJu0YyW3gfxWfpImOAq0r1EalHLoDfq9tAa/nn99eWaOmSa03mh0Ndi
	QVC1Bd8Xp1m/s3GqWlFIlJM=
X-Google-Smtp-Source: AGHT+IFROdg7gPmlIFCPse42v7vDQFPS0hPiJBsGanKEvSk5SpE6uuegk9VurbWaA5W951lqH1JOYg==
X-Received: by 2002:ac2:554f:0:b0:509:4adb:1dd3 with SMTP id l15-20020ac2554f000000b005094adb1dd3mr2004957lfk.56.1700330709801;
        Sat, 18 Nov 2023 10:05:09 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:09 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] drivers/i2c/busses: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:55 +0100
Message-ID: <20231118180504.1785-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118180504.1785-1-hkallweit1@gmail.com>
References: <20231118180504.1785-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/i2c/busses/i2c-ali1535.c |    2 +-
 drivers/i2c/busses/i2c-ali15x3.c |    2 +-
 drivers/i2c/busses/i2c-amd756.c  |    2 +-
 drivers/i2c/busses/i2c-amd8111.c |    2 +-
 drivers/i2c/busses/i2c-isch.c    |    2 +-
 drivers/i2c/busses/i2c-nforce2.c |    2 +-
 drivers/i2c/busses/i2c-piix4.c   |    2 +-
 drivers/i2c/busses/i2c-sis5595.c |    2 +-
 drivers/i2c/busses/i2c-sis630.c  |    2 +-
 drivers/i2c/busses/i2c-sis96x.c  |    2 +-
 drivers/i2c/busses/i2c-via.c     |    2 +-
 drivers/i2c/busses/i2c-viapro.c  |    2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index ee83c4581..461eb23f9 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -477,7 +477,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 
 static struct i2c_adapter ali1535_adapter = {
 	.owner		= THIS_MODULE,
-	.class          = I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class          = I2C_CLASS_HWMON,
 	.algo		= &smbus_algorithm,
 };
 
diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 0231c5be6..d2fa30deb 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -461,7 +461,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 
 static struct i2c_adapter ali15x3_adapter = {
 	.owner		= THIS_MODULE,
-	.class          = I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class          = I2C_CLASS_HWMON,
 	.algo		= &smbus_algorithm,
 };
 
diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index ef1307a25..208310db9 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -285,7 +285,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 
 struct i2c_adapter amd756_smbus = {
 	.owner		= THIS_MODULE,
-	.class          = I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class          = I2C_CLASS_HWMON,
 	.algo		= &smbus_algorithm,
 };
 
diff --git a/drivers/i2c/busses/i2c-amd8111.c b/drivers/i2c/busses/i2c-amd8111.c
index 1ed7e945b..42a9b1221 100644
--- a/drivers/i2c/busses/i2c-amd8111.c
+++ b/drivers/i2c/busses/i2c-amd8111.c
@@ -449,7 +449,7 @@ static int amd8111_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	smbus->adapter.owner = THIS_MODULE;
 	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
 		"SMBus2 AMD8111 adapter at %04x", smbus->base);
-	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	smbus->adapter.class = I2C_CLASS_HWMON;
 	smbus->adapter.algo = &smbus_algorithm;
 	smbus->adapter.algo_data = smbus;
 
diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 1dc1ceaa4..416a9968e 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -249,7 +249,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 
 static struct i2c_adapter sch_adapter = {
 	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class		= I2C_CLASS_HWMON,
 	.algo		= &smbus_algorithm,
 };
 
diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 38d203d93..fab662e6b 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -349,7 +349,7 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
 		return -EBUSY;
 	}
 	smbus->adapter.owner = THIS_MODULE;
-	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	smbus->adapter.class = I2C_CLASS_HWMON;
 	smbus->adapter.algo = &smbus_algorithm;
 	smbus->adapter.algo_data = smbus;
 	smbus->adapter.dev.parent = &dev->dev;
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 809fbd014..6a0392172 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -943,7 +943,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	}
 
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adap->class = I2C_CLASS_HWMON;
 	adap->algo = sb800_main ? &piix4_smbus_algorithm_sb800
 				: &smbus_algorithm;
 
diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index 486f1e9df..32476dc10 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -353,7 +353,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 
 static struct i2c_adapter sis5595_adapter = {
 	.owner		= THIS_MODULE,
-	.class          = I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class          = I2C_CLASS_HWMON,
 	.algo		= &smbus_algorithm,
 };
 
diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index 87d56250d..3505cf29c 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -493,7 +493,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 
 static struct i2c_adapter sis630_adapter = {
 	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class		= I2C_CLASS_HWMON,
 	.algo		= &smbus_algorithm,
 	.retries	= 3
 };
diff --git a/drivers/i2c/busses/i2c-sis96x.c b/drivers/i2c/busses/i2c-sis96x.c
index cde800398..77529dda6 100644
--- a/drivers/i2c/busses/i2c-sis96x.c
+++ b/drivers/i2c/busses/i2c-sis96x.c
@@ -228,7 +228,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 
 static struct i2c_adapter sis96x_adapter = {
 	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class		= I2C_CLASS_HWMON,
 	.algo		= &smbus_algorithm,
 };
 
diff --git a/drivers/i2c/busses/i2c-via.c b/drivers/i2c/busses/i2c-via.c
index ad4f09c7f..7ed29992a 100644
--- a/drivers/i2c/busses/i2c-via.c
+++ b/drivers/i2c/busses/i2c-via.c
@@ -70,7 +70,7 @@ static struct i2c_algo_bit_data bit_data = {
 
 static struct i2c_adapter vt586b_adapter = {
 	.owner		= THIS_MODULE,
-	.class          = I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class          = I2C_CLASS_HWMON,
 	.name		= "VIA i2c",
 	.algo_data	= &bit_data,
 };
diff --git a/drivers/i2c/busses/i2c-viapro.c b/drivers/i2c/busses/i2c-viapro.c
index 970ccdcbb..2cc7bba3b 100644
--- a/drivers/i2c/busses/i2c-viapro.c
+++ b/drivers/i2c/busses/i2c-viapro.c
@@ -304,7 +304,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 
 static struct i2c_adapter vt596_adapter = {
 	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class		= I2C_CLASS_HWMON,
 	.algo		= &smbus_algorithm,
 };
 


