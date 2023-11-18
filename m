Return-Path: <linux-i2c+bounces-246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 127107F01DA
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C82280C62
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EC710A20;
	Sat, 18 Nov 2023 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MW0MBr+g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4200130;
	Sat, 18 Nov 2023 10:05:16 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9e28724ac88so418370066b.2;
        Sat, 18 Nov 2023 10:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330715; x=1700935515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StehfMdN64OqQSfteMU1WHeQbOvnHJtoyvxwinO8ko0=;
        b=MW0MBr+gVctwGbvP0/np911QdoIkjwoaRJHqWs+519WubkRGrns3XuX6iWyoxrN9zW
         aRw4r7heaSuZ0CqLW1fyOaxMNO3mKemlmL/DLGLi8MfxDbAdkZEy8Vam72UJf7/+CS3s
         SN4StERQdRlJBdJWJDjq6YUoLmNEJ7Mm+Ydupod/NggtvNDapEguvbI1JkidUaj3VEUr
         yLuF4V4fLUqoDO5lui9uBF32R8kbKR6rFND4F4aNoPGYrNjy7hYBYHsrOSBAUduKMGAj
         Es6zcSZ4AlNIl57PoOdvqt9gaGCK5z+4A2wrIt4ANHNFPlNEKZfNH7D+vZQ4uCc3zDYp
         uDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330715; x=1700935515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StehfMdN64OqQSfteMU1WHeQbOvnHJtoyvxwinO8ko0=;
        b=SP2Z6jRJPUb/pbLRwH5JRd2vckZ7DKJKcsArYTM3fGqZGGeMzkLZpzB+XdXsZ2vmg5
         6X4eQHrYaBuzUQOnP0TKO2PST5FsGzwI3AhAmSKqztGzybLYCMIeNWoy304b70Ff5rZr
         8GTuKXJga61ffjESbU2kFkA9ydMmBidJ/8mzOEvhfAbvx8vqecvvYxGtIzGdvGvJov8z
         dJqBo5HIPehjpeAWLByN5+99I+g7uTp+Ix9In8muaoN7P5PVvU7/T/xLA2laK7sZcfIi
         ZOd3esgtjrhMYBsE1D3wBllOTNeDCJ+DyOVO3Uu75Z8KOzcBKo/3UPcrYjpx7bOjWTU8
         N7CA==
X-Gm-Message-State: AOJu0YwmApl/YGLlCjiJCNm76RlXvsw5+MJ9K7MtUb8CDfvST4stH6uc
	qI+JNnMjgT8OqUc/SDNtZIBwKGJOgzRT1Q==
X-Google-Smtp-Source: AGHT+IG4cOA1GuvjI/7QuVvjlkBUgRgdx2J0Y9YKZ/6BZo6MS1IgJBQw5UKODgCuwBBp7khWNiT7nQ==
X-Received: by 2002:a17:906:2748:b0:9d4:84b6:8715 with SMTP id a8-20020a170906274800b009d484b68715mr2218532ejd.52.1700330715006;
        Sat, 18 Nov 2023 10:05:15 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:14 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] drivers/i2c/busses/i2c-gpio.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:05:00 +0100
Message-ID: <20231118180504.1785-7-hkallweit1@gmail.com>
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
 drivers/i2c/busses/i2c-gpio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index fb35a75fe..df2b183ca 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -444,7 +444,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 		snprintf(adap->name, sizeof(adap->name), "i2c-gpio%d", pdev->id);
 
 	adap->algo_data = bit_data;
-	adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adap->class = I2C_CLASS_HWMON;
 	adap->dev.parent = dev;
 	device_set_node(&adap->dev, fwnode);
 


