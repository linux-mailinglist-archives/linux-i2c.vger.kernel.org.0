Return-Path: <linux-i2c+bounces-3027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41C8AB570
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 21:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E03E21C20A64
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 19:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60D713C688;
	Fri, 19 Apr 2024 19:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WsY9X5WO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB4013B284
	for <linux-i2c@vger.kernel.org>; Fri, 19 Apr 2024 19:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713553936; cv=none; b=nRMhVbnhoJcvCYimpk446RYaAxRiC72zj4janwshPc3CVaxJaq4y8LIGVKGC9kSb4wyIY6Ye7CgPueT+yaLPJFvurSq7Tiag9Y1NnoE1pDfGsDIOuP4vZRZ6MfmfxCKody+nx31xykMaKPjxPGhBCQVE+4g0lcT5J8h7CEo9kYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713553936; c=relaxed/simple;
	bh=0BdrZ3xw4Yg9KU1Jb5k96XvpBhEfUhYdRlzZJRoScYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JQUI1iiYtJbY0msReTh04L8/68ddQNaQsVtsYP+mQGNYjmzH4K/DjXa3pkxIaWIlaJJB7n/tnQMqfOtwelhNrtf8iN7MihUg6Nw91FNDO59WaTUFzk7Vx6Um4MfYZsPsBHCy0lLmvmDKUS/I4H3ibZObpXEVpSjqhRCAdneIMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WsY9X5WO; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6b26ce0bbso5076316276.1
        for <linux-i2c@vger.kernel.org>; Fri, 19 Apr 2024 12:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713553934; x=1714158734; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S3nn0uxGKg2XiHfenj6FC27XZwwqUuZAKVQOuRIbTsY=;
        b=WsY9X5WOjLsKbNtGBbCKP9yo4UEXSzOcch7/yA1JuSXzZ50JjOp5SNiYemXfkMnh6F
         DDswJTf2fSYip6jwACsHWBTGvcoKF+tXhJO7Kyq2Yppszz6u0Igtnd3X/jeha4wQVLBU
         xRrWmJLPQyBdXV5cE+dh8qBnLmijS+5cz2UNIlnt6T3IAoCL5rBPLIg2+ZmoWJc65Mkq
         aRMTysgzXp9wtTbRITVhsPG3WRZbe+uQ/m0dr/s+Ig45qRJ0LxXOOBDkvqwKxn/bLonT
         ztFJizr50/GwkYP1B9OMkHqAEz6mGDl5QLSkKLcQ/Htn5z/zQXcrEjLjrKepuRO+WzWJ
         EaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713553934; x=1714158734;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3nn0uxGKg2XiHfenj6FC27XZwwqUuZAKVQOuRIbTsY=;
        b=aHcGBNeRcjIxM2+y6a0wBRbTCOhyT0LOb7uPffvziwPMk702nKaUJaMMzpWzJC+lcH
         t3ezHu6hSft37vAv0xJO2thkogMLRGzWjWjBUVr61L21bgHPT1kJjrzSRcRYmOqIbRsO
         NkSHfy/ouM8UsdIz02zeQSs1/tbuKa/vjxdJKX++S8ED18l7564bgVwwwhVLm9W3/zRL
         2WFDvoRC/dLj9YjLoHrvVILZSDRwDqNFZ21HAPgH8QM2mLXSg9GhCa5NaZS7RyoQlvHe
         MGooQkAj9rV9EVJDxzb0QOwbntZ5h5Y0y2+y7BF6IsTNy9/6gdVMA5Ebqhgl11rTBzUY
         /Q6w==
X-Forwarded-Encrypted: i=1; AJvYcCWnnpEpNXBPizgje8wNI0s5MkTHOlAkYa5anJmptt5JI2MZ+8idsIqJ+AVniNKxQ9ZrBgJBMgOHbLw8/Qd55oOuHKrRr10tk6zK
X-Gm-Message-State: AOJu0Yzqyj1ne7qHdM9WSgQHAhxrD83tTYJcOLYqe2a5+OpvKnEUYEFG
	TQKkHMs1720OocvXISA8jRMsbQezRcv8T3gNhaEQZgVYX7xMdSMR+g9cULwUzvOIjVlcx3NIt3F
	rpNTyzkUwicjSdA==
X-Google-Smtp-Source: AGHT+IHj6eljA4uiwvsWvXU1nqdzDaAjyxYm04dHEC2MitRGBMqDA0aouZ+8aEII49bUkpOJNBfyhLBrhL5qAeE=
X-Received: from dtokazaki-pixel.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1a03])
 (user=dtokazaki job=sendgmr) by 2002:a05:6902:709:b0:dcc:c57c:8873 with SMTP
 id k9-20020a056902070900b00dccc57c8873mr895580ybt.9.1713553934410; Fri, 19
 Apr 2024 12:12:14 -0700 (PDT)
Date: Fri, 19 Apr 2024 19:12:00 +0000
In-Reply-To: <cd8ff4fc-f6bd-4834-b837-2a0d59c93648@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cd8ff4fc-f6bd-4834-b837-2a0d59c93648@web.de>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240419191200.219548-1-dtokazaki@google.com>
Subject: [PATCH v3] eeprom: at24: fix memory corruption race condition
From: Daniel Okazaki <dtokazaki@google.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Okazaki <dtokazaki@google.com>, kernel-team@android.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If the eeprom is not accessible, an nvmem device will be registered, the
read will fail, and the device will be torn down. If another driver
accesses the nvmem device after the teardown, it will reference
invalid memory.

Move the failure point before registering the nvmem device.

Signed-off-by: Daniel Okazaki <dtokazaki@google.com>
Fixes: b20eb4c1f026 ("eeprom: at24: drop unnecessary label")
---
 drivers/misc/eeprom/at24.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 572333ead5fb..4bd4f32bcdab 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -758,15 +758,6 @@ static int at24_probe(struct i2c_client *client)
 	}
 	pm_runtime_enable(dev);
 
-	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
-	if (IS_ERR(at24->nvmem)) {
-		pm_runtime_disable(dev);
-		if (!pm_runtime_status_suspended(dev))
-			regulator_disable(at24->vcc_reg);
-		return dev_err_probe(dev, PTR_ERR(at24->nvmem),
-				     "failed to register nvmem\n");
-	}
-
 	/*
 	 * Perform a one-byte test read to verify that the chip is functional,
 	 * unless powering on the device is to be avoided during probe (i.e.
@@ -782,6 +773,15 @@ static int at24_probe(struct i2c_client *client)
 		}
 	}
 
+	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
+	if (IS_ERR(at24->nvmem)) {
+		pm_runtime_disable(dev);
+		if (!pm_runtime_status_suspended(dev))
+			regulator_disable(at24->vcc_reg);
+		return dev_err_probe(dev, PTR_ERR(at24->nvmem),
+				     "failed to register nvmem\n");
+	}
+
 	/* If this a SPD EEPROM, probe for DDR3 thermal sensor */
 	if (cdata == &at24_data_spd)
 		at24_probe_temp_sensor(client);
-- 
2.44.0.769.g3c40516874-goog


