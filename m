Return-Path: <linux-i2c+bounces-245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C57F01DB
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73994B20ABD
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DC41C6B4;
	Sat, 18 Nov 2023 18:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrsSZN3v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B18F2;
	Sat, 18 Nov 2023 10:05:15 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9e1fb7faa9dso421269566b.2;
        Sat, 18 Nov 2023 10:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330714; x=1700935514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0nkqP7LXHiV+g9f41wgueZKbqep4eUIQUImirIqSFg=;
        b=LrsSZN3vxvkQeerPA3NlzAqSqwVMYsbrB2l0FVo/YRqbnobJnV3coUUpp31K47z5Mz
         cIL+IzG8swqNWo4qRRKxsgLbUaCTpcYXa3qBHaE4lIQ2SA6l0GuSq+Y5YUqDO5CG3UPD
         3y+5oGFWsZEfj6dn/rwgjwhpBz0c5Yy1miA3LznBoOQo0aG4Ev7AZ7sQx8+4D2Vn1jLH
         51nbcT2h7j6H0Yv9fq77cRbeQFTxeEdWHwhYJThu4nH7flTHgsEbIIWUXOJoZdl+80qQ
         sEH++kMS8cjBGKH8vCqN0VFpAClY1XgJbacP88vtSAyKKB58t9Ch2fmXD6N6sstJX8DQ
         Mu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330714; x=1700935514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0nkqP7LXHiV+g9f41wgueZKbqep4eUIQUImirIqSFg=;
        b=O/I145edKI8Ik765xg5v7BSwGDcEblLVgblVCO9jG5U5Bd1AbOhQO/rO+I9Q+GyHgv
         SiTzH/DLEOGd8JRANkrL5EtBPSP71w0574/nN6KWAoU2xidZfDjE/TGLFCg0NN+6V3iG
         iu2iw+ltRRFCBgxlUGGt7UtVT6iosB8Y7W6BmrKfZPENoRuMj3+xFcThUaw/PRvtFoaB
         Fv5R6BQEOzJZ2EybrVJzOxPt9YHTXw4Zxdao3Thb3knnWYhIUep/LrmclTdtMF7LzB0N
         7Rs+uvhmqDUk8chbizrSBst38NoOQTVlvDoLkInNBohSsVyw6vmDfr4z8Fi55Ry4ze+m
         tpAQ==
X-Gm-Message-State: AOJu0YzRzlWEEfE9UyQkluGiVE7u/xK5AgKyefmiJhYDIOfcXQumHLsC
	945HeKoqsCrtV0p+0YtSD0o=
X-Google-Smtp-Source: AGHT+IGc1Lhv5vOR+zZnoqj7DqNkOev67YpQf9qVG5MQIhiUY9p2ksLWef843+8jpvkwafhfYgty3Q==
X-Received: by 2002:a17:906:3799:b0:9e6:59d5:80c5 with SMTP id n25-20020a170906379900b009e659d580c5mr1924503ejc.23.1700330713839;
        Sat, 18 Nov 2023 10:05:13 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:13 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] drivers/i2c/busses: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:59 +0100
Message-ID: <20231118180504.1785-6-hkallweit1@gmail.com>
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
 drivers/i2c/busses/i2c-elektor.c |    2 +-
 drivers/i2c/busses/i2c-ibm_iic.c |    2 +-
 drivers/i2c/busses/i2c-iop3xx.c  |    2 +-
 drivers/i2c/busses/i2c-kempld.c  |    4 ++--
 drivers/i2c/busses/i2c-scmi.c    |    2 +-
 drivers/i2c/busses/i2c-sh7760.c  |    2 +-
 drivers/i2c/busses/i2c-sibyte.c  |    4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-elektor.c b/drivers/i2c/busses/i2c-elektor.c
index b0f50dce9..cfe8665ca 100644
--- a/drivers/i2c/busses/i2c-elektor.c
+++ b/drivers/i2c/busses/i2c-elektor.c
@@ -188,7 +188,7 @@ static struct i2c_algo_pcf_data pcf_isa_data = {
 
 static struct i2c_adapter pcf_isa_ops = {
 	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class		= I2C_CLASS_HWMON,
 	.algo_data	= &pcf_isa_data,
 	.name		= "i2c-elektor",
 };
diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index 408820319..7fb87b789 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -739,7 +739,7 @@ static int iic_probe(struct platform_device *ofdev)
 	adap->dev.of_node = of_node_get(np);
 	strscpy(adap->name, "IBM IIC", sizeof(adap->name));
 	i2c_set_adapdata(adap, dev);
-	adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adap->class = I2C_CLASS_HWMON;
 	adap->algo = &iic_algo;
 	adap->timeout = HZ;
 
diff --git a/drivers/i2c/busses/i2c-iop3xx.c b/drivers/i2c/busses/i2c-iop3xx.c
index f2f7ebeea..2e5f0165c 100644
--- a/drivers/i2c/busses/i2c-iop3xx.c
+++ b/drivers/i2c/busses/i2c-iop3xx.c
@@ -478,7 +478,7 @@ iop3xx_i2c_probe(struct platform_device *pdev)
 
 	memcpy(new_adapter->name, pdev->name, strlen(pdev->name));
 	new_adapter->owner = THIS_MODULE;
-	new_adapter->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	new_adapter->class = I2C_CLASS_HWMON;
 	new_adapter->dev.parent = &pdev->dev;
 	new_adapter->dev.of_node = pdev->dev.of_node;
 	new_adapter->nr = pdev->id;
diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index e01d75308..9076ae4d7 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -283,8 +283,8 @@ static const struct i2c_algorithm kempld_i2c_algorithm = {
 static const struct i2c_adapter kempld_i2c_adapter = {
 	.owner		= THIS_MODULE,
 	.name		= "i2c-kempld",
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD |
-			  I2C_CLASS_DEPRECATED,
+	.class		= I2C_CLASS_HWMON |
+	I2C_CLASS_DEPRECATED,
 	.algo		= &kempld_i2c_algorithm,
 };
 
diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 421735acf..d7af8e0d7 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -385,7 +385,7 @@ static int smbus_cmi_probe(struct platform_device *device)
 	smbus_cmi->adapter.owner = THIS_MODULE;
 	smbus_cmi->adapter.algo = &acpi_smbus_cmi_algorithm;
 	smbus_cmi->adapter.algo_data = smbus_cmi;
-	smbus_cmi->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	smbus_cmi->adapter.class = I2C_CLASS_HWMON;
 	smbus_cmi->adapter.dev.parent = &device->dev;
 
 	ret = i2c_add_adapter(&smbus_cmi->adapter);
diff --git a/drivers/i2c/busses/i2c-sh7760.c b/drivers/i2c/busses/i2c-sh7760.c
index 1ad2a2615..8a043f5fc 100644
--- a/drivers/i2c/busses/i2c-sh7760.c
+++ b/drivers/i2c/busses/i2c-sh7760.c
@@ -477,7 +477,7 @@ static int sh7760_i2c_probe(struct platform_device *pdev)
 
 	id->adap.nr = pdev->id;
 	id->adap.algo = &sh7760_i2c_algo;
-	id->adap.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	id->adap.class = I2C_CLASS_HWMON;
 	id->adap.retries = 3;
 	id->adap.algo_data = id;
 	id->adap.dev.parent = &pdev->dev;
diff --git a/drivers/i2c/busses/i2c-sibyte.c b/drivers/i2c/busses/i2c-sibyte.c
index 8f71f01cb..49f8f4f1b 100644
--- a/drivers/i2c/busses/i2c-sibyte.c
+++ b/drivers/i2c/busses/i2c-sibyte.c
@@ -142,7 +142,7 @@ static struct i2c_algo_sibyte_data sibyte_board_data[2] = {
 static struct i2c_adapter sibyte_board_adapter[2] = {
 	{
 		.owner		= THIS_MODULE,
-		.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+		.class		= I2C_CLASS_HWMON,
 		.algo		= NULL,
 		.algo_data	= &sibyte_board_data[0],
 		.nr		= 0,
@@ -150,7 +150,7 @@ static struct i2c_adapter sibyte_board_adapter[2] = {
 	},
 	{
 		.owner		= THIS_MODULE,
-		.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+		.class		= I2C_CLASS_HWMON,
 		.algo		= NULL,
 		.algo_data	= &sibyte_board_data[1],
 		.nr		= 1,


