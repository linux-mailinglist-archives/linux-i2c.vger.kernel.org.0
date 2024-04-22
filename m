Return-Path: <linux-i2c+bounces-3043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA57E8AD36D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 19:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43AD6B23388
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 17:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D40153BEC;
	Mon, 22 Apr 2024 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gul4CsuP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E524146A6A
	for <linux-i2c@vger.kernel.org>; Mon, 22 Apr 2024 17:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713807823; cv=none; b=M2zg6npaTpsDz67Y6yRzSWSXNYQyPQo1j2MwH+QmMm5gkbWh5LIkopDOjm55WrW9/kQwjFDVKJb0xoollYcjley3tf/fXRd83LNDbfAov3rGwF0uPPHI1rnbqO5+k/rymrCFXDcZ0KBCi9MHIH8sD0NbAa0OHE5UWxMfsYQq7sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713807823; c=relaxed/simple;
	bh=Q0xqpWxTXYdH3SX1/MqeJ3/kDT5iZSBWsXkiUBJBGp0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=N8OCCeERsH5wT9xpmNza2ohn8NiCtDMzAEqYyrix1sa5DXx+niLu9nW86b2HJxxC1+m9TAEgUbZugnAL+VzXj5VHvXgL4OMqh3IqQVu7SNB9bvtiR2q1uhhBTsAeraBI1klQ/ddwEIOlIf31cbeeEUSh3EFKNO7yfpV8LsvulKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gul4CsuP; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61b36187e6bso44282497b3.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Apr 2024 10:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713807821; x=1714412621; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T0VSzHwGHOz5OGuxpcZUIi3ZbES2QXe0izyLeD5/pVs=;
        b=Gul4CsuPq05ynGsJoc3tyTEqnqXT0b0BjIDtrL31THLjNwBRJYkD9Nn8FQd8M07W0K
         zRxuEQF7nvUXS1a+MfU4mNacxD7vLLHOfwAokr03IOrZ3fLkga1hLf5jQmrNmhamhTUb
         KwL2XdKlKOFx3iyIdQ+oTUeirW3AT06BdcDOAl+1XaA9IaMnkzssbLK5JQMAqusohk4c
         MI0vFw2sxtMzQpQdUs7fAx32YHlKK9dY9GRJ7XmmxPQY3rMyZPqAO/MeR34U9cjWXbXt
         ggghqCRhM5uZygq9eIzZ+yG83YHGlnYxsfcPMacxj+cVPJMpuzJyQnMyfxuWRGbDqfRN
         4XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713807821; x=1714412621;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0VSzHwGHOz5OGuxpcZUIi3ZbES2QXe0izyLeD5/pVs=;
        b=a7PFfBrqC7sMD2I8254KBacOIvy6wp6e8cz2HSoTLs+F7dbY2UFVtQ9I5/OGK0gfeF
         ViSztme53N7DdOpImN0HH4BurQynoDZZW8CLbCz2jRo2LFqA4s1fVJOv7n3V/0fJx0u/
         BpVIdQ88WJL5kDjT6SAiB+y8rKSEqWc8vSBIys58ltlNCsYb0c12UW8/V/gyLteecF0P
         9lkfxF0Y/qmaJBgWYQQsX19CXqyYJDbwxk32UUKOSBAOoNw+N6u6wztL1nr6f+g931ue
         76ouKDnvv3N2fUYIO0jn6PmFQgQ5seyAh0Wxcbu9saTYyUBZn1jGT4g09zP2u0df6IrQ
         7nTw==
X-Forwarded-Encrypted: i=1; AJvYcCUeHs7Zr/bdavmeVckDC1XSPWTVWW5g1PFxm/w6OyKa7/FdnbhJd/fGVVu51469FFoRtLYdkVlKF2mpiq3P4AA7EPjqtnwLQ/mU
X-Gm-Message-State: AOJu0YwvDrz/XGi8VwEZDJmBArfbDYt4x/epMu8NzOYv986DWwexUJc1
	3/ViX0HVM2bpN5DwszNVs1Tsc2DtvAQdV3T1HJkotPb5uMUYUqxzNWYD2aNaa1eqDdPu2THARIP
	l6au/LGLdWY/9eg==
X-Google-Smtp-Source: AGHT+IG873NiegqSmeP4wPl3e92ztZssjt4EKyf75LdosVkpqBxQnI+LaxxN12ECzIHuqDWk9LGrFCJ7JsiiSCE=
X-Received: from dtokazaki-pixel.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1a03])
 (user=dtokazaki job=sendgmr) by 2002:a05:6902:1023:b0:dda:c4ec:7db5 with SMTP
 id x3-20020a056902102300b00ddac4ec7db5mr88799ybt.4.1713807821159; Mon, 22 Apr
 2024 10:43:41 -0700 (PDT)
Date: Mon, 22 Apr 2024 17:43:36 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240422174337.2487142-1-dtokazaki@google.com>
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
Changed sha length to 12 in description
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


