Return-Path: <linux-i2c+bounces-3025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 552D68AB516
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 20:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12A5A281FF4
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 18:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA57CC2C6;
	Fri, 19 Apr 2024 18:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n/+doOgA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D07A23
	for <linux-i2c@vger.kernel.org>; Fri, 19 Apr 2024 18:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713551521; cv=none; b=MkHA0GzR/xfVdxhkPFKdAWVxSQdNLbVyJ+MAMZNum68XkcZruA/VU6td+LF8CJQIUBkQz0nDfdQqOQA53A6JvJpFIhQ/4iVsnehbQg3UERLOXO/M8uvX5lCfWmSSqtKv9n9xu9aq+qLWQt/0/090tQl++/60drzVRr7iBOholUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713551521; c=relaxed/simple;
	bh=JRt4Lm5ijonc81uaOCYMEVQeoylykPHN4N8OAuA84c8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qSJhKm1ehaB9lIm5LcsgDBe48aiWMp/PTANAsGHdYr2XufMU2MVrZKeDMn8PM/0XEmQNJSNjNisYtdShAjCmJ0PIAaB+JUMV43YWN8HDcTnw9dJ6Qk9jKw5rOV+ImcjlAFombqrVdNTkOs5WyI7GrCoT9e5jbvV2vAT1h6vGTZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n/+doOgA; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbe9e13775aso4437483276.1
        for <linux-i2c@vger.kernel.org>; Fri, 19 Apr 2024 11:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713551519; x=1714156319; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LAJdb3eo33tTVB58hEyGtBn/dOgeujKwWfoeVeHgqQo=;
        b=n/+doOgAv0wagV3viCNegky/qsYg4haiWyNUv4m9GKxGaWhgta42RzKDXCo44FMzsv
         jXRRMeBTugphfLpTZs9+BcgkuvgnYffCoCTW+94hvOAKbS8ZMfLkg2qO3atD13fr1QyY
         l1Bq4lZU7Kh90q1ACU4ho9AdKYOo2HZtcFsUk/U2lGEABf8kqk9RKi9TDnsxna5NSzF9
         Lz7jTtPJI0ajutBLqm875ruvy+jMcMdRsBpjxGsXzRFOkKu6Bd2pUITgpyNkHUguRpN8
         jSlp2z8Zhjc5zV4zj0XvXvr78XOU2/2fgtYShJi4jfvlWUsCbmvVpTeRI60iBSpRua8B
         a+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713551519; x=1714156319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAJdb3eo33tTVB58hEyGtBn/dOgeujKwWfoeVeHgqQo=;
        b=TRi8xllik6ySQIJ1y3ekjrk+JyujDoUVQpAbDtsJh67hVK3LWPF1db5t0KW+lSKBmS
         myIE/plijYdd2ycc1H4GXdsevTcRovgRpFBZbw0fRp8ec0HBJwFqfBzrI+jqp4vrvIrv
         aiPq1farbn9ZCRfIiOZySODlz/AF/a1B6EFXBZoAVeY96tUIbymxVICkN06V3XQ8Y5+U
         JvB8jvgvN4DhhM+x+x6QOrdtwmelc0/BEsZvTJVpL5/arbOyfNcbcV0SQRTl4CQQf/kG
         HZpgH5DQw6D+UjfQneVEghnQY51UMscaD1YAa2RM9LhJPMKhUKOyXr/Wnq+Ke1XAacn7
         2GHw==
X-Forwarded-Encrypted: i=1; AJvYcCV0m94M/S25sddhxhnxMbndmmbsASg5eAuC37kgImbnJOn+3UAs+/sheyop0HgRT5jFORv5Tbl5BfYCSRLgzBSferq5UxPHWOt0
X-Gm-Message-State: AOJu0YwsW6rlBkwpqVkILIGc8zjo5PBQJS7L3lxvH3uVz0jnchLeTXo7
	WVoncgwX8lL0SS/3qfLNjqEAUOcIKYWitG2PlFxRNMkBmUnn1V4PqIjxnXmgUeP+kc7jKkHhIrk
	42TxKOgG+PBw7vw==
X-Google-Smtp-Source: AGHT+IH5CvUvdzIhwaJXD/StoRkGTbe4OvjJqoxUYPbnzdoniCeR6wNeea2/WyC8WEAYTC9DbFYXBcOHLQnz1Vg=
X-Received: from dtokazaki-pixel.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1a03])
 (user=dtokazaki job=sendgmr) by 2002:a05:6902:2b88:b0:dd9:1db5:8348 with SMTP
 id fj8-20020a0569022b8800b00dd91db58348mr804205ybb.8.1713551519146; Fri, 19
 Apr 2024 11:31:59 -0700 (PDT)
Date: Fri, 19 Apr 2024 18:31:41 +0000
In-Reply-To: <CAMRc=Mcb0uAjUBOKraLaev_xU+3OObj9YJm1Yq2A2s2bZOViiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAMRc=Mcb0uAjUBOKraLaev_xU+3OObj9YJm1Yq2A2s2bZOViiQ@mail.gmail.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240419183142.169963-1-dtokazaki@google.com>
Subject: [PATCH v2] eeprom: at24: fix memory corruption race condition
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
Fixes: b20eb4c1 ("eeprom: at24: drop unnecessary label")
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


