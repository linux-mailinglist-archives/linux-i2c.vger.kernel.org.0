Return-Path: <linux-i2c+bounces-438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 527B97F711B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 11:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA7C1B2122F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 10:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C303C18636;
	Fri, 24 Nov 2023 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOQMh0vB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B271700;
	Fri, 24 Nov 2023 02:16:25 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a00ac0101d9so236176266b.0;
        Fri, 24 Nov 2023 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820984; x=1701425784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m823d+6CNTStctZTlRF6jC0ql5SePV7hnpsYwUIZVes=;
        b=bOQMh0vBV7Cy72C1+SvjVKLwAG4NgtV5+bnJeaNTUR00+RR0KFMlBq29s2a60AuAEs
         evNldDpndVV57Hq1ZkSgtD87eLfB/GKyLslUHjfVbXVqPeGBasC8nl2lUo3VyP9si9Nt
         Pdk743xcEJ/Qw1WufW9fovnIxHFacXK9vDxbbvlajN09tWpNHhgpotab3XjZykT+aTeS
         S6aa3sxBq/Vqj4MhErcF3JqShfaknxOOtO4DoMPj3fUnmU7Kv89C9dKz7EZvcaiIAFSN
         ZvqObLH7dYZZkrcKs9UUV5Rx+mZAysGwKIFZyE9VTs/P0SeGLYTdCCWixw5EP2Ifj6e9
         Cbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820984; x=1701425784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m823d+6CNTStctZTlRF6jC0ql5SePV7hnpsYwUIZVes=;
        b=S1Z16puPvAhheazWDJGNcxrEM2DsPtNUVppxx6o1XpDHPx4LOKfaBiGSyGvldR5agh
         i9MFO5k+dksd3QvBygiVKtN6gG0+vAUJ21fB1oesqh8KN7Og5PnHOnYsMMTcoZOqhcuR
         +CcwAAq1Tlcmd7zEaQ58RDTN9e9vBLndtFtSa6yIUmW/F17tUwp6UdqaPK+fk7nGOywK
         AipY3Zgq/xhpCo/7RH6QCE4hC27iluHUp3oMnnYhhBlkxR5JCh+LCF4ybqGqYHKIIOAi
         +oxaEfkxWMx8Piikec7OwJUpQbNCcoR31ofnLAL57/j7RVObapu0wYpiSvlVbvHZGyaP
         ssPA==
X-Gm-Message-State: AOJu0YwYa1hBdQCeleJCMtRs3rLqyOXANgVhbPn99RVnv+EGD3eYj4J/
	uY/pGTMt0C69Og9dTTMfMg4vhU2JjgOAdw==
X-Google-Smtp-Source: AGHT+IGg5MZOrWXoGyUwmugSU+IBs8d4v1nBWDffXy/biHSm8ycABmUsP64wovVQwV0+iyFMmimOdw==
X-Received: by 2002:a17:906:8916:b0:9e6:1dc9:9807 with SMTP id fr22-20020a170906891600b009e61dc99807mr1112285ejc.77.1700820984278;
        Fri, 24 Nov 2023 02:16:24 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:23 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] i2c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:10 +0100
Message-ID: <20231124101619.6470-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124101619.6470-1-hkallweit1@gmail.com>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
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
 


