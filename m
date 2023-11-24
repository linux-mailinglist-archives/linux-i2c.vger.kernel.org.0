Return-Path: <linux-i2c+bounces-442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2BE7F711D
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 11:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 024CD281AB4
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 10:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553A119BD1;
	Fri, 24 Nov 2023 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O72hV4Pd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E03171A;
	Fri, 24 Nov 2023 02:16:29 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a049d19b63bso241275866b.2;
        Fri, 24 Nov 2023 02:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820988; x=1701425788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDYlMPRSk7TY9iyl3ZjO9NBO1F64RbMOjWU8YityecA=;
        b=O72hV4PdXyYpM6QyVOrvRtXirpczUOJ3VolPct2ekkNjYhACzQnmJ9t1BEO9gUTKm4
         1D5jMaaTL/wfAa2oOgMOcON756/IdvjVfp2/f/g4Myei7ooVKH5yQTUli4RFwokoIBJF
         7oB/TxKqh6+UJ7PdD6DDm+BGE9MNVp46ZCoZjdJmPiaNiiNYuLB3XPXdd0jLs3yz5ZSe
         rnSIJK+mWn4g5THlJeGTRM+GSzVC2+zkYFuiokvStmAU9WKMBEcjSms11TBgwf/E0qlR
         ZHAy28GcD5vtjqBFFyR1pqAKI+NjX6XZyMucGKUxpJpJBz3VzNpmvVMl41LIj5hMXPix
         gAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820988; x=1701425788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDYlMPRSk7TY9iyl3ZjO9NBO1F64RbMOjWU8YityecA=;
        b=Cy5toECMguAKNuhyY5cjpOYq2C/cbXhiVXuaUG5zFmcAzpsUiMaPE8EZ2/oSfcAOx8
         X0eywF2oXjyXy8kMkeCCP7HbEOfI0mP2fB704ePlGtKszEJ4A1Yx3DPUJIsiSb/PVvO5
         3AH/HR41ZKoVrHeRLyuiGALuVoLZLd3LNWQfmg28kjf06a3Dsq/EpYcBx2r5cjiDzhlR
         610P9AN0Kmo3yZYPtV6phong3+3LWVllkOVddbS3D3m8X4QjUAzl7uussX7s0b38wkM5
         kqI8G+e2EQjZQncELcxnUgCxc0dAgnt9aLbscwMcTUsQb6IMZAvto0rRwEdn5Oa1bbIN
         0kQw==
X-Gm-Message-State: AOJu0YzLHA5OMk05x6vb6SR0ogHcX61b3ii6raG0amLG1RPNx0VxKGSg
	Zy3PLPT0UYnZJDPpXzsP55KrZOyaHVATAg==
X-Google-Smtp-Source: AGHT+IHOUEf5tXdquHAKGk0N5FQ5hk39DWYdbiI5Z+4To5F6Q0O0PTL6wCNI/AVvKa0MD8LI2UxacQ==
X-Received: by 2002:a17:906:684a:b0:9a5:9f3c:9615 with SMTP id a10-20020a170906684a00b009a59f3c9615mr1492325ejs.63.1700820987729;
        Fri, 24 Nov 2023 02:16:27 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:27 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] i2c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:13 +0100
Message-ID: <20231124101619.6470-5-hkallweit1@gmail.com>
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
v2:
- fix style issue in i2c-kempld.c
---
 drivers/i2c/busses/i2c-elektor.c |    2 +-
 drivers/i2c/busses/i2c-ibm_iic.c |    2 +-
 drivers/i2c/busses/i2c-iop3xx.c  |    2 +-
 drivers/i2c/busses/i2c-kempld.c  |    3 +--
 drivers/i2c/busses/i2c-scmi.c    |    2 +-
 drivers/i2c/busses/i2c-sh7760.c  |    2 +-
 drivers/i2c/busses/i2c-sibyte.c  |    4 ++--
 7 files changed, 8 insertions(+), 9 deletions(-)

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
index e01d75308..c3a529a73 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -283,8 +283,7 @@ static const struct i2c_algorithm kempld_i2c_algorithm = {
 static const struct i2c_adapter kempld_i2c_adapter = {
 	.owner		= THIS_MODULE,
 	.name		= "i2c-kempld",
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD |
-			  I2C_CLASS_DEPRECATED,
+	.class		= I2C_CLASS_HWMON | I2C_CLASS_DEPRECATED,
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


