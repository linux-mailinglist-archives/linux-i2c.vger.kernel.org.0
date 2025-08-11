Return-Path: <linux-i2c+bounces-12247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8BB215EA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 21:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DF48463C0F
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 19:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285732D97A0;
	Mon, 11 Aug 2025 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYgB9mik"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302AA26B770;
	Mon, 11 Aug 2025 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754941810; cv=none; b=rEgCWjvQ1RDnMVQF9YAF/n6DdhQ45ZS3zxDggDCUbIIib7+Z/yY29LoS25tb/6O8i0e1/ALx2+JPigiPKS7W594PF0Hr7d4PWp1uRI9qSwazjc1Fg9Au0VIuwzAWdVFaLZIuV+NTwlxSzUlJgv4aEpzQZT4indPRu/tyuGdfkSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754941810; c=relaxed/simple;
	bh=PH828i8F95x+IM7qH1JCu9X3cnVIzu8pZHAK1h7NpHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYA1Yt7OXAGr3th46Xj4kCCg4KGQK7JoF4+fdtEE6pGBb5MsA131uBRSPSZD3HGJxxvNd4mFpfn+a1E0Tv6KMEQMyWJ41qUIKQQAL//Z+1cIuDzcmc7zXwEIRFnUTa+UkbxcWCLvrv+4zTkYHnnWXQ5HO6UjzYFCluuWHMqJb4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYgB9mik; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b792b0b829so4557101f8f.3;
        Mon, 11 Aug 2025 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754941807; x=1755546607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A86eQzX7viGNjFU7NpXeyNyVEzQ5puYbkA22fGhwrf8=;
        b=cYgB9mikKSRipTY9P19qrg/BqJvzq6Fe/ZJMHpV2FgADmGvCBcBKUrTd353fzFAuF3
         zl2DGMCjlg/GnWAEG/F9Xu7OhlWtqDxQ6RhCgkWxtY1ZG1ODYyXPR4GafSd7zwjWmxIZ
         fR/uQHSizY8+IbcpPKZVgxh2CQjSiosqB3WR3y2Gk4xQfXvzYvmNHOrS78Sis7INNjoh
         3628ezmt8/+4c5LZDosdAZWEeqsdCzxWwdXkp0YYA9yaIiAnrt0HGU96SjFKltb7MuU4
         dY9wwnCY7ngRjm9VYJsf52lOYIJvxdwAUdTR1qTZ2eQQl/Ya+A+W33ANU7sZhfLf8UIs
         d+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754941807; x=1755546607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A86eQzX7viGNjFU7NpXeyNyVEzQ5puYbkA22fGhwrf8=;
        b=XK9yOxSsa6MuH79dTksmUuYMpRzWXFwm4/veHrTWima2hXoipjxFAwsJzS6C50JHXq
         51c1grnCCCNZ9KqAEDWsMIA2rovqXklvZOfgi2lKTzu22G+PHI2xCStYbvHTZWnggc3n
         FPC5Ilnmfn9OIZgoQfV6H0oAfp37YUJsK2H7ZDdqEAArZe6GcYxkG8PEEOONWTQTT4am
         v4lBD9S8KE7cg9I7MdZJoYxg5hqiu58USifRtLpMC1Ue0I+Cg3InFE4aa3aYmnpFrv64
         EbEyyd9NnA5ean6LTTndmRcWbTrjAhb9eNrj71qXDxgx5GnMpGGGNEd0AoY8fKg5kY0r
         iaFw==
X-Forwarded-Encrypted: i=1; AJvYcCW998cJ6B+/av9XNCKYT8vrQMpkTaLznOtQ4l2qJIaVw2UQ0PAv42ZrM6/8WUBBkqhqGddS6NxXQI8=@vger.kernel.org, AJvYcCWWFJT8BN4fjNAm7/kdeU7xLYKreQtRJdy6Fdq8XEoNtcR/mPvOfM42SzGnn6yDdwsOVS27IHqx@vger.kernel.org, AJvYcCWYrnnWEGRuQBqGj+jkGx0y5104bSFDa+NzC4lnwzsA0QluBXGbgGV92vJ2LndcPx0uvOfYAI97BmedafEs@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTk6ylVclbyUlubblk08ZOVjhDuGcmL5uCos97u1x4MPcVPzE
	oqgg4MLpfU9llO6g2c4lzgu0evK2QgI4PEGzU2f/kRXRySiC9Duifc44tfGG3w==
X-Gm-Gg: ASbGnculqBc66Sy4+IkFAi7sXaR4QshUoUdztMu+6TwxNBOVuFNGautkVqjszqPXjqa
	3KFN51+CmTiEbff81xFb2Ft6vAkznHAsr7ifHyLdehFYxNRG+bEC0buSSx9o9epMLtfi035+4hk
	ZoSLANspaZ7K2CIuCQDfZ6TuWLGLfxSyPgb2Tg3yDqiyz1UG5AAW77aBDkPrGuGo9bnplv01dTz
	EmWBrRDQ/VMd98KpoTk45+axDPMDiWrUBYv/mQ/jmOBZhW6loWDA2emEOdTbFQcl+jkcB0XygFd
	PR2KA+tVnX3MJ30r9+zZPWcKmoSjfvPdaAO4Vrynemf9NdGirf67kHHNcUZSZ7dhgWNKWgqgnqQ
	L3Rce48KcQE1royyYiBfnLURsHPjeztT2r4HSXcuKN5aLRYFfWPc=
X-Google-Smtp-Source: AGHT+IFvzbFGti/zNFzqyikNiwvAvCk3OD9a3dG0vzUTIRLJMIn1arvJwDoou4hVVuywAjgs4uvv6w==
X-Received: by 2002:a05:6000:2287:b0:3b8:f2f1:728c with SMTP id ffacd0b85a97d-3b900b74b3dmr11151929f8f.34.1754941807310;
        Mon, 11 Aug 2025 12:50:07 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm41709246f8f.22.2025.08.11.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:50:06 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 11 Aug 2025 21:49:55 +0200
Subject: [PATCH v2 1/3] i2c: add init_recovery() callback
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Imre Kaloz <kaloz@openwrt.org>, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
and modify the i2c_init_recovery() function to call that if specified
instead of the generic i2c_gpio_init_recovery() function.

This allows controller drivers to skip calling the generic code by
implementing a dummy callback function, or alternatively to run a
fine tuned custom implementation.

This is needed for the 'i2c-pxa' driver in order to be able to fix
a long standing bug for which the fix will be implemented in a
followup patch.

Cc: stable@vger.kernel.org # 6.3+
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add 'Reviewed-by' tag from Linus Walleij
  - rebase on tip of i2c/for-current
---
 drivers/i2c/i2c-core-base.c | 8 +++++++-
 include/linux/i2c.h         | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ecca8c006b020379fb53293b20ab09ba25314609..e38be81dbcc17dd15947a189fd3b89def8529d1e 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -427,12 +427,18 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	bool is_error_level = true;
 	char *err_str;
+	int ret;
 
 	if (!bri)
 		return 0;
 
-	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
+	if (bri->init_recovery) {
+		ret = bri->init_recovery(adap);
+		if (ret)
+			return ret;
+	} else if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
+	}
 
 	if (!bri->recover_bus) {
 		err_str = "no suitable method provided";
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..4cefdd4c730fc9dc4655f6581f3dea64435d7124 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -636,6 +636,9 @@ struct i2c_timings {
  *	for generic GPIO recovery.
  * @get_bus_free: Returns the bus free state as seen from the IP core in case it
  *	has a more complex internal logic than just reading SDA. Optional.
+ * @init_recovery: If specified, it will be called instead of the generic GPIO
+ *	recovery initialization code. Platform may use a dummy callback to skip
+ *	calling the generic code, or it may use a custom implementation.
  * @prepare_recovery: This will be called before starting recovery. Platform may
  *	configure padmux here for SDA/SCL line or something else they want.
  * @unprepare_recovery: This will be called after completing recovery. Platform
@@ -660,6 +663,7 @@ struct i2c_bus_recovery_info {
 	void (*set_sda)(struct i2c_adapter *adap, int val);
 	int (*get_bus_free)(struct i2c_adapter *adap);
 
+	int (*init_recovery)(struct i2c_adapter *adap);
 	void (*prepare_recovery)(struct i2c_adapter *adap);
 	void (*unprepare_recovery)(struct i2c_adapter *adap);
 

-- 
2.50.1


