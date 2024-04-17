Return-Path: <linux-i2c+bounces-3003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3208A8F1C
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 01:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8486DB22409
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 23:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B079385260;
	Wed, 17 Apr 2024 23:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dFo5v/8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA79481B5
	for <linux-i2c@vger.kernel.org>; Wed, 17 Apr 2024 23:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713395225; cv=none; b=eeV2hI0fIR9cQLeZH5U6rIe3mpzqRnGcCJJMlH06kth2aPGP9IF0xCD7zX/aXfjytpOql6CktDfdd9laSiAK+QJe20bHm3hkXgMddsIhSsjBoL2/Xvwcv65rIz7eQD7Jk3U2mcl5HM56/WgS5LoAsvUDR9rNXvdVTALWRcomxBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713395225; c=relaxed/simple;
	bh=HOqShe5yeUWnPhZuqFM8RSUH+/kbodWzz7HN7N/L39s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EBzJuM71SWt/gZELzw1RzL/PlbNmG8ewHOIvJ6XqUleZk7Y8iXO7pzvBts/Mg0+4GUEIv3ffs0ZwqE3JlidMblVV8oav0ifBarkaVhbNvjDcfw5EA8FygstKi5I5G6zLe5pTHDz01gRwLlo5Eij9r32Ty4I5zUPu/dRcqGmZpPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dFo5v/8m; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de4645bee83so247650276.3
        for <linux-i2c@vger.kernel.org>; Wed, 17 Apr 2024 16:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713395223; x=1714000023; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ESREvptBFDtywOEXVmXxmfhUoPX5JiubFR54p3zkXt8=;
        b=dFo5v/8mnwluqRKc11dgyzr00/r5T10/jqnYUjRHZQiRYIw5o/3LcMRNDBLcih5Z4v
         9vPRogsNA/G9VdalfkAm6tICr0JFhIQ0KpUOHq4O9IHHUy2npj0A5ofVjB4vU9TZvDSW
         M/Sxr8Fu+D9TALp3h3sAFoGjTkGh8yy3PCCXw6SbYs+3RID64OY6832czwKskAImmPY5
         sJfX3zRL1Bdx5kLXycbi1o5B1G4HNaSU1VygOJ9qrfvm3K3ljIzvxjeFVm8IizuyeHI6
         xNyTx8Q7UeFzBHp4jLvBSRvIqWILV/VkcVP8IZ0jM0xDpR1P7ud1Uo8+ZcAfj2+Grswf
         FYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713395223; x=1714000023;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ESREvptBFDtywOEXVmXxmfhUoPX5JiubFR54p3zkXt8=;
        b=BjeRCdsbZpTiMNiD1iUtCixBP8vyfX+TyJYGyUDAlmkp9+1EmiPiSfTEFxQVQmDiUX
         6ovwJmcELtmg564Qa5Nz9BnPTZGx0I5ViYy7B2NKBYoYOTnedx3zYvkOsm3Q0/Ubd9CM
         Xf2vqMyT1ULyUu/WUpQq4LMNMwVJSl0V7yY0H9Lp1ppyInTO6pJ7Re0u+OxbuMaMepqb
         PYEoAYYqIst9DVLu4svqgnZaOaNGcFxVvQiX7fv9KFuxpkCTxcG+z5IZetpOshz3RiCN
         oQWnnl4r36qDF5yxeZvv7phSaLacDkh1t7uxtDK3fgT86iA5FaxyUDo3wFkEV9makbGJ
         qh9g==
X-Forwarded-Encrypted: i=1; AJvYcCUvjhLqJ7rCb2j/Me/1GZNZXcuKX+TtaezCmXtj/Ls612cxkIaQoYv3Issx8nBGRDX8ww9V05Iu2KSMjdVZSuOhigUW3OpaPkWR
X-Gm-Message-State: AOJu0Ywi5PeTCjoa28JkqvSlpZXKcEwbplfkt1bvUgYUXv4YCrQVSmFk
	BhXVl9MRNBC4A0ZBjjN7CIsT2qfKsnGrKdUMbYDmPQWUPA96v54zsX9tcxlzALl1qagYMQZMC1T
	Bpzt/iunJQGaDjA==
X-Google-Smtp-Source: AGHT+IGGsP/v0b31hwVFbOVuj7xjAQQur1JVUVq8/Z6h8KToJPaV1mBk8qXmfn6bjBb9KyeSVufWf3nDl3XHdLE=
X-Received: from dtokazaki-pixel.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1a03])
 (user=dtokazaki job=sendgmr) by 2002:a05:6902:1005:b0:dc2:5456:d9ac with SMTP
 id w5-20020a056902100500b00dc25456d9acmr106101ybt.5.1713395223203; Wed, 17
 Apr 2024 16:07:03 -0700 (PDT)
Date: Wed, 17 Apr 2024 23:06:36 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Message-ID: <20240417230637.2592473-1-dtokazaki@google.com>
Subject: [PATCH v1] at24: fix memory corruption race condition
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
2.44.0.683.g7961c838ac-goog


