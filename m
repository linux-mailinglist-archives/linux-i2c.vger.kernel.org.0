Return-Path: <linux-i2c+bounces-171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C587EC128
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 12:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04FE028112A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 11:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652C9156EB;
	Wed, 15 Nov 2023 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPBZb6K2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216A156DE
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 11:17:41 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81042E6
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 03:17:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507bd644a96so9539255e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700047059; x=1700651859; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMSqgFo9P/Z32BQRecgFOY4b+NErZ6PscZbfo3hgN7Q=;
        b=SPBZb6K2iCq1eM0fD8Tmg5ZttYsPTPg/ywoWaP/HeJotMwNSHuCswPGamvyNOi0wpf
         cfS+zTxV+uegjNGRLOai2ki54ggcPFh2jmBXDgyPyzKiGItb3ZoSZGEBpzSv+fXjN8AV
         kI5BGS7A5YKKSatE/iw8xqfNTQ8rPuF7tYGB53+aXCSnFbrOaB6HWysLs7sR6wxz3RrC
         dazPEpFBrxY54TR5OitwF9vjWulTjI3ltJKuGctyZm9lxUtrLFZK/yZn/ibd4zSACL4+
         DNFqqe74/E7qRPT3UJDJXBLTUoYXUP7QTY51CAJFl0AGs370jZtgGMu0iJeN0AzOZjoR
         x47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700047059; x=1700651859;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMSqgFo9P/Z32BQRecgFOY4b+NErZ6PscZbfo3hgN7Q=;
        b=eDwzLaC4NbsvRvjGbPf/JSwD5HM+a5QpXtpHQ5lr81jlS4cjHlex2UB8urWfn44nt2
         dGfvvJj7eOoNiy3JxHqg7ZeSul5P7Riwvfv9tIDc4H7dCWlQSknO+ugUaKBPcCpMb60X
         LiaKJg9mTtOmbC4lngLNrrR7RBLaQVU5UHyXpZDXpBKRe6a2wtCapy/ok3lgTRkst2F5
         GAN7BDzj8jJrax1D68ANzgD0Y9XU98wMJT0iwqIEdHV/4ZDz40roUCdeBwtIpcIyRqzr
         hFxIWcjoJSFyyG5T734Ya0o0PmlCr4PTvtfWwToxtnlCrkxateLhWiyOoCyN1yGuCzrq
         TI7Q==
X-Gm-Message-State: AOJu0YwEHxiW4cpg0Gts2kqvGx2PR7TN6tYH57HMRh4CfBx3PUlE2JR/
	nHv7676aetHEomtyBhv6UrKwoZRSDoI=
X-Google-Smtp-Source: AGHT+IEO8jy5enfArIxC9JfAl7KhACkDDk6k+hj87Ga8V31uZo0Nxt4oETKHdCTTD7xp770m8xgQjw==
X-Received: by 2002:a19:2d04:0:b0:508:1aa7:dfeb with SMTP id k4-20020a192d04000000b005081aa7dfebmr7922980lfj.27.1700047058364;
        Wed, 15 Nov 2023 03:17:38 -0800 (PST)
Received: from ?IPV6:2a01:c23:c03b:7100:5444:6587:8982:6a4d? (dynamic-2a01-0c23-c03b-7100-5444-6587-8982-6a4d.c23.pool.telefonica.de. [2a01:c23:c03b:7100:5444:6587:8982:6a4d])
        by smtp.googlemail.com with ESMTPSA id n11-20020a50934b000000b00540e894609dsm6484851eda.17.2023.11.15.03.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 03:17:37 -0800 (PST)
Message-ID: <c295881f-77aa-4f54-b06c-d48031d76339@gmail.com>
Date: Wed, 15 Nov 2023 12:17:39 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RFC] eeprom: ee1004: add support for temperature sensor
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Jean and me are discussing how to best instantiate temperature sensors
that can be found on RAM modules. First idea was to extend
i2c_register_spd() but I think reading the "temp sensor present" flag
from SPD can't be properly done from an i2c core level.
Therefore, for DDR4, do it from the ee1004 driver.

The temp sensor i2c address can be derived from the SPD i2c address,
so I think we can directly instantiate the device and don't have to
probe for it.
If the temp sensor has been instantiated already by other means
(e.g. class-based auto-detection), then the busy-check in 
i2c_new_client_device will detect this.

Link: https://www.spinics.net/lists/linux-i2c/msg65963.html
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/misc/eeprom/ee1004.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
index a1acd7713..4bce8f9d9 100644
--- a/drivers/misc/eeprom/ee1004.c
+++ b/drivers/misc/eeprom/ee1004.c
@@ -158,6 +158,22 @@ static struct bin_attribute *ee1004_attrs[] = {
 
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
 static void ee1004_cleanup(int idx)
 {
 	if (--ee1004_dev_count == 0)
@@ -204,6 +220,9 @@ static int ee1004_probe(struct i2c_client *client)
 		err = -EOPNOTSUPP;
 		goto err_clients;
 	}
+
+	ee1004_probe_temp_sensor(client);
+
 	mutex_unlock(&ee1004_bus_lock);
 
 	dev_info(&client->dev,
-- 
2.42.1


