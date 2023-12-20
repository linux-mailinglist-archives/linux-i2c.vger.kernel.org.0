Return-Path: <linux-i2c+bounces-906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45332819F5D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 13:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C42D528276D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 12:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E610250F2;
	Wed, 20 Dec 2023 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUoSf9T7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A506124B4C
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d38f03712so2500025e9.2
        for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 04:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703076920; x=1703681720; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:autocrypt:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5Hooxsqh0YEcABqdO6mBOk4KRlr4/vkcAX+yKb8SpE=;
        b=NUoSf9T7DaL+fCTScjf/J9g4E2s25iBAeV3k6WxZtE0KaFvdH53OL+qitHGdet9jGr
         FqmJXh3bciPEPekSY3B7bjY2ACLrdXtAfMFBSWBvUV8uvKCy6syX3nfMnMbX3qr1mwNy
         dHRmt1BCv1utOpuNd3xoxYC08qUzQikHq0QmLUeVFK+5/CAWNhVj24t/z14g64mIWMoZ
         ch+erMqbXWYi4+cO+63ck2VlbivxmNa/nroUNLNCIPCtwJiX9xUlcOrk2TRtcoCH12AZ
         9DphmScUIjW3/bhF2MfL32UucyAk4qtAHNxHmUG7rkWhVaTS7l8konRW6vse1U5exi72
         e6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703076920; x=1703681720;
        h=content-transfer-encoding:subject:autocrypt:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5Hooxsqh0YEcABqdO6mBOk4KRlr4/vkcAX+yKb8SpE=;
        b=oVlsSSf4ZYwy5CLNZMniis2mnlG9hN6gRVp/kABZRJO55J14e0eDm6x0oTYI+uRnHn
         jeAxWurzJ23OZlYUWROgXkeZCMKkq+mgZjKAcJr00IfHamKtyJLuiZ0smVtvBfoIgEWG
         UrMghK2c3aGXyKiKZ7pLyVkbEtzQVLpIbar7WIZl5UkNcaoTQXzMAQCCutkrZsO8e9ZQ
         CN/BPIKONoSEavilJf9kWLDoCniaxibXxh7PPjRtBB/lmJcyvBbwkZAOdt3h5d5UVov8
         SAPO0+VlgjDwJxLgbKctSntpQCXf+ZHZJTd12MCyfBnHPaeWyUdlIibkujWiWzwO9PSQ
         JvEw==
X-Gm-Message-State: AOJu0YxYx/kh0KuwIAm5NUMwDt0/EiI992vPANvjcnEI1yByhEOh75E0
	ZQ2fwaoOSEsxhzFbCs0cQAc=
X-Google-Smtp-Source: AGHT+IH5NFSqg9GDS8Vh8f/y8W35v9zsMWk3uY1jSUxYzRM5Fe0xiBkwbYHrzvDMUQKHdxaSxkpQJg==
X-Received: by 2002:a05:600c:600d:b0:40d:2f6f:8f09 with SMTP id az13-20020a05600c600d00b0040d2f6f8f09mr988179wmb.80.1703076919579;
        Wed, 20 Dec 2023 04:55:19 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0e1:2b00:cc8d:2472:9da4:1ff3? (dynamic-2a01-0c23-c0e1-2b00-cc8d-2472-9da4-1ff3.c23.pool.telefonica.de. [2a01:c23:c0e1:2b00:cc8d:2472:9da4:1ff3])
        by smtp.googlemail.com with ESMTPSA id g7-20020a170906348700b00a23359868b1sm4766084ejb.76.2023.12.20.04.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 04:55:19 -0800 (PST)
Message-ID: <acda79c4-f477-4a35-9f7c-16ef0b665db3@gmail.com>
Date: Wed, 20 Dec 2023 13:55:18 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Subject: eeprom: at24: Probe for DDR3 thermal sensor in the SPD case
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The DDR3 SPD data structure advertises the presence of a thermal
sensor on a DDR3 module in byte 32, bit 7. Let's use this information
to explicitly instantiate the thermal sensor I2C client instead of
having to rely on class-based I2C probing.

The temp sensor i2c address can be derived from the SPD i2c address,
so we can directly instantiate the device and don't have to probe
for it. If the temp sensor has been instantiated already by other
means (e.g. class-based auto-detection), then the busy-check in 
i2c_new_client_device will detect this.

Note: Thermal sensors on DDR4 DIMM's are instantiated from the
      ee1004 driver.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/misc/eeprom/at24.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index f61a80597..1a35e3a64 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -563,6 +563,31 @@ static unsigned int at24_get_offset_adj(u8 flags, unsigned int byte_len)
 	}
 }
 
+static void at24_probe_temp_sensor(struct i2c_client *client)
+{
+	struct at24_data *at24 = i2c_get_clientdata(client);
+	struct i2c_board_info info = { .type = "jc42" };
+	int ret;
+	u8 val;
+
+	/*
+	 * Byte 2 has value 11 for DDR3, earlier versions don't
+	 * support the thermal sensor present flag
+	 */
+	ret = at24_read(at24, 2, &val, 1);
+	if (ret || val != 11)
+		return;
+
+	/* Byte 32, bit 7 is set if temp sensor is present */
+	ret = at24_read(at24, 32, &val, 1);
+	if (ret || !(val & BIT(7)))
+		return;
+
+	info.addr = 0x18 | (client->addr & 7);
+
+	i2c_new_client_device(client->adapter, &info);
+}
+
 static int at24_probe(struct i2c_client *client)
 {
 	struct regmap_config regmap_config = { };
@@ -762,6 +787,10 @@ static int at24_probe(struct i2c_client *client)
 		}
 	}
 
+	/* If this a SPD EEPROM, probe for DDR3 thermal sensor */
+	if (cdata == &at24_data_spd)
+		at24_probe_temp_sensor(client);
+
 	pm_runtime_idle(dev);
 
 	if (writable)
-- 
2.42.1


