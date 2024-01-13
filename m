Return-Path: <linux-i2c+bounces-1288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9882CC7B
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 12:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8EF7B2327E
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 11:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E83520DEA;
	Sat, 13 Jan 2024 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5iCttF7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1B51EF01
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-558b5f4cf29so2279010a12.3
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 03:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705145236; x=1705750036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4h2ApuHN7PhduW4r0qWjM+0dNAEk/aKHuCc90igY99Y=;
        b=J5iCttF7wiHst2TjqiD4XPs7tX125I29jxPLBE/bV89w+JUao/vkDdHzx1Phvqmfx6
         +Q2pNK9WrOUpAy23Wn58RFgw2ZazFgyOqmJmw4MJrnZYCcvKUexQGuvvfJZm3k6Gy0ze
         CiXH3kDYvpV7FV14E7LejSUV+KVQ69p8obvy7lUkttbzK1H41gWHrh706C4YOKjC4j+x
         kosmZkrLx0gqdOBFIubP6g+t5FCSW2IM0VZX6mCXv8qbAv9sS/F/BTplxbnTV58awQH1
         egXbBnK6WoGg8JRdwBNdATqB35p4MBRK4dBdgpM5XXgbI2NHEB7ck2uoEMn6BO5FEQNa
         DKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705145236; x=1705750036;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h2ApuHN7PhduW4r0qWjM+0dNAEk/aKHuCc90igY99Y=;
        b=T+Vt9Z/hGI+6qZZGzbcnhcWpdMFm1crFritaGK3vQfNWULN+dUDhGnkBvjBpAk16J3
         goWFKLq/MTxmk+CrkntS3UErjmCjwQbHEa+fxBOvrL9Yn830qMReT/pkzT8PDHma4Dzh
         qUrRYCg4+XjFpYZ/t7S3382E1C/MVuG1uSoICIYHOalx8MLwxDa74bS95FQ3FS9XV1AJ
         pvwCwQOFjEb/Hf0h4lYxO8bPIuYJm7T3QRLNCmeDIRo+ZzDEYWyvrEqWu0IW4lBqniDH
         5ybcRRewsnsXItEOOp1slzwSMziNRLV0GBNDqDSmqdVQ2lJIjI9C2HB8uiuOcNlvnDDg
         tgAA==
X-Gm-Message-State: AOJu0Yy+/3uee3op296QiiKuikapubLreCbkPL7uUkNDRtTXD5184K+f
	uROjY3g8VVrH+tJUjoaC8O4kpFpJuEA=
X-Google-Smtp-Source: AGHT+IHAJe18Jk5Fjdi8kvVQ7km2HqtFczsP0JlQkmkgCA0FyYp92yCXqr5W2abLFTGuZy15cNGYwA==
X-Received: by 2002:aa7:cccd:0:b0:557:523e:bd3a with SMTP id y13-20020aa7cccd000000b00557523ebd3amr1245524edt.2.1705145236260;
        Sat, 13 Jan 2024 03:27:16 -0800 (PST)
Received: from ?IPV6:2a01:c22:6f53:1400:a4e3:d977:260a:1bdd? (dynamic-2a01-0c22-6f53-1400-a4e3-d977-260a-1bdd.c22.pool.telefonica.de. [2a01:c22:6f53:1400:a4e3:d977:260a:1bdd])
        by smtp.googlemail.com with ESMTPSA id u23-20020a05640207d700b005573b375589sm2833313edy.96.2024.01.13.03.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 03:27:15 -0800 (PST)
Message-ID: <1fb4eb9e-6c7a-4c0c-b90e-4f53dc999b1c@gmail.com>
Date: Sat, 13 Jan 2024 12:27:16 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/4] i2c: mux: add basic support for calling
 i2c_register_spd on muxed bus segments
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This extension allows mux drivers to instruct i2c_mux_add_adapter to
call i2c_register_spd. First user of this feature will be gpio mux.

Note: In order to avoid a link error we have to ensure that I2C_SMBUS=y
if I2C_MUX=y.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- Select I2C_SMBUS to avoid a link error if I2C_MUX=y and I2C_SMBUS=m
---
 drivers/i2c/Kconfig     | 1 +
 drivers/i2c/i2c-mux.c   | 4 ++++
 include/linux/i2c-mux.h | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 9388823bb..f57a4d3fe 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -61,6 +61,7 @@ config I2C_CHARDEV
 
 config I2C_MUX
 	tristate "I2C bus multiplexing support"
+	select I2C_SMBUS
 	help
 	  Say Y here if you want the I2C core to support the ability to
 	  handle multiplexed I2C bus topologies, by presenting each
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 57ff09f18..ada9c764f 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -22,6 +22,7 @@
 #include <linux/acpi.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
+#include <linux/i2c-smbus.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -429,6 +430,9 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	dev_info(&parent->dev, "Added multiplexed i2c bus %d\n",
 		 i2c_adapter_id(&priv->adap));
 
+	if (muxc->register_spd)
+		i2c_register_spd(&priv->adap);
+
 	muxc->adapter[muxc->num_adapters++] = &priv->adap;
 	return 0;
 
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 98ef73b7c..ec51d9bc4 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -21,6 +21,7 @@ struct i2c_mux_core {
 	unsigned int mux_locked:1;
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
+	unsigned int register_spd:1;
 
 	void *priv;
 
-- 
2.43.0



