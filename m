Return-Path: <linux-i2c+bounces-892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C429E81935F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 23:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799271F26405
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 22:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89B940C1F;
	Tue, 19 Dec 2023 22:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDalUKlG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732154CB34
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40d2e56f3a6so696575e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 14:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703023789; x=1703628589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPF+4pppHAMie2j6BnijrfEybpf5e11aaKiCT0gYa0g=;
        b=SDalUKlGWSmhiFWTB1ut2RrgPSB3g7a+U24deoGCzCzNQ9LWiSW2t87jEsEl4f5KC7
         EoV9rGEl4h2t9liOeSg0owy/AeAyNMnnDNDLvaqprJHRz75SUvxDi8MkihMErqSFdvO9
         r3hGGE/ya5DLo0B75KxsTw9JgiA+ckxg5ZJtgzV89cBcgIpngvo73zSIywa+ssv339sJ
         atK0heRf/SvYc8ocY5j2tFf/HvS5diQaBS5HvKFYkhLxycEmK326pVQvmQsbXwYxXzti
         DCin21jP2wJO9cUOY/GXOrHDZ0f0XD3mR+bfwI/BojaSQLaaKSfI4jU49SRp3UmAccDS
         E3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703023789; x=1703628589;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPF+4pppHAMie2j6BnijrfEybpf5e11aaKiCT0gYa0g=;
        b=l2bVNJfHmdruesvHq8vHIaTn1pz0G06cVWoDWz558EHRQOGSZt6ElCcFvBn8CAAInQ
         MmRy/yQmx9HhyUzGf0K/BdyCOBqjgDIduVByid4MyKylbomdwNfuSpkGTykJh0oahCkM
         T4MOwmxWxf/G+kAqtTsUu6FPRgTWs0BuuwzyvovkQocc6CTJgP+91ZOdyt3b5KIcYHRC
         sQr2q/bOpprIFSnW9JKee/fyQTbrzyR8TBhpBC1tEw/EQR1KvFHcobsTtOOtvv2A7NnZ
         TWupwTyCWkbjtsqSXJ6lmjST4NgNeX3fISm6nLUYyGQdgqk20GjAE0e6Xu/z6CwDqBt7
         fAQg==
X-Gm-Message-State: AOJu0YxJuRNR7DsMwC9j4yAuPjoJW0mU3ssJWeQFzLJbpoSIbQ65ZWiR
	a+PaTVBRCgRS90FjT5nW4svQheYBYNI=
X-Google-Smtp-Source: AGHT+IExeQC5/HCzIfc8kwltKZ43By8G5TbM195cXGqdkRU4PX4STrwEj70KkyZUJXpttzdXIoCwig==
X-Received: by 2002:a7b:c7cf:0:b0:40c:6d33:d4d3 with SMTP id z15-20020a7bc7cf000000b0040c6d33d4d3mr967645wmk.59.1703023789277;
        Tue, 19 Dec 2023 14:09:49 -0800 (PST)
Received: from ?IPV6:2a01:c23:b834:3300:1863:dc87:812:137a? (dynamic-2a01-0c23-b834-3300-1863-dc87-0812-137a.c23.pool.telefonica.de. [2a01:c23:b834:3300:1863:dc87:812:137a])
        by smtp.googlemail.com with ESMTPSA id v4-20020a05600c470400b0040b37f107c4sm4695813wmo.16.2023.12.19.14.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 14:09:48 -0800 (PST)
Message-ID: <aa063dfb-2a92-40ba-bdab-e972781ae84b@gmail.com>
Date: Tue, 19 Dec 2023 23:09:48 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] eeprom: ee1004: add support for temperature sensor
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The EE1004 SPD data structure advertises the presence of a thermal
sensor on a DDR4 module in byte 14, bit 7. Let's use this information
to explicitly instantiate the thermal sensor I2C client instead of
having to rely on class-based I2C probing.

The temp sensor i2c address can be derived from the SPD i2c address,
so we can directly instantiate the device and don't have to probe
for it. If the temp sensor has been instantiated already by other
means (e.g. class-based auto-detection), then the busy-check in 
i2c_new_client_device will detect this.

Patch was successfully tested with a Corsair Vengeance RGB PRO
DDR4 module which comes with a thermal sensor.

Link: https://www.spinics.net/lists/linux-i2c/msg65963.html
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
Patch is the same as the RFC version, it's just re-based.
---
 drivers/misc/eeprom/ee1004.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
index fd12ce06a..21feebc30 100644
--- a/drivers/misc/eeprom/ee1004.c
+++ b/drivers/misc/eeprom/ee1004.c
@@ -182,6 +182,22 @@ static struct bin_attribute *ee1004_attrs[] = {
 
 BIN_ATTRIBUTE_GROUPS(ee1004);
 
+static void ee1004_probe_temp_sensor(struct i2c_client *client)
+{
+	struct i2c_board_info info = { .type = "jc42" };
+	u8 byte14;
+	int ret;
+
+	/* byte 14, bit 7 is set if temp sensor is present */
+	ret = ee1004_eeprom_read(client, &byte14, 14, 1);
+	if (ret != 1 || !(byte14 & BIT(7)))
+		return;
+
+	info.addr = 0x18 | (client->addr & 7);
+
+	i2c_new_client_device(client->adapter, &info);
+}
+
 static void ee1004_cleanup(int idx, struct ee1004_bus_data *bd)
 {
 	if (--bd->dev_count == 0) {
@@ -234,6 +250,9 @@ static int ee1004_probe(struct i2c_client *client)
 		dev_dbg(&client->dev, "Currently selected page: %d\n", err);
 		bd->current_page = err;
 	}
+
+	ee1004_probe_temp_sensor(client);
+
 	mutex_unlock(&ee1004_bus_lock);
 
 	dev_info(&client->dev,
-- 
2.43.0


