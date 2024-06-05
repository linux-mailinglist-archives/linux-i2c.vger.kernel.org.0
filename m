Return-Path: <linux-i2c+bounces-3832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA498FD547
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 20:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A17BB2282A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 18:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D13515381A;
	Wed,  5 Jun 2024 18:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XH5mJeVg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C20153810
	for <linux-i2c@vger.kernel.org>; Wed,  5 Jun 2024 18:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610593; cv=none; b=G/nje13WrJgrYSXGq7wEJeSXAvP+ChZJsiF7hfntMXR0p3mR2L7lerGwUJY/uTzirHBT72YHSb1s1SueRIJbIjd8kc6pNmaqcVngXKlT7zEmNG+Roc2ubNJ9Ar0FqwhRgME1JpGy9jvSP2VW31L35ihjUYkLdhfEDcT2O9amO6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610593; c=relaxed/simple;
	bh=e26lRTuAGuJgmNX9Kn+IMmOklmBtw9bMfbnFAWkr9AI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nel2HyZryX2pW7XoUAmJEtGeQjaH4qLzlcrPBs+6N1OY/64IAP04vV14/JMHv6Tz+esjDFHjAWZ5khRXsD0COSzW6OS7QQh9pYjAB3mqHo3DnHh5c4oSberHjC8qGDQtc1YrCekHQ2ku/fepa1m6lUJE9qeGBZ6fggLdSi4b/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XH5mJeVg; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-df4da3446beso231545276.1
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2024 11:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610590; x=1718215390; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=XH5mJeVgmcHl8j+yAfDOF16fwTYZtKejt7N1AtlCr+jCLGqcaGoPbC1Z1OtBWbLeqR
         qu79bjTNXUQMB96hPCihyWcQ7C6/Xdw+CBz8yYYRpPef1O1wHiiuWHHNBbDn6basncKb
         feIXaxtnwyQFOXnN4GFHve22CLjHAlNw4tytPP/A1BS6KFsL/yDzrPALUUPMTBYiZfhz
         /ryZI+W919gn4EVH3x641KfCaNVJQjgsw4/EZWvrftTVoVBJm8vaVE+cvQcDoqWXj/KX
         CClLti2T1o6M0md9Eq1LS/CykQoF/EIHK2zXiNh5MwW8WJgwpltYQmZp/slPCc7x/UQZ
         lGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610590; x=1718215390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=d3rUnynfYcj13BbfkH5r3EZS/MSxhNXV8M6/msCOEVVLYfpMQ5bmV7LFCADYKYJDD/
         OEsBZUC0QbAi3NJ4boPHu2tdB0kjhcvsu3R9hIho1+9v0v4pgSY2m8vtnLdKnlrSMUIQ
         +nJxluQ04X56RSgSRrmVdemqBYnLumW/jrufzN4lQ5KSGuiOnGcmMBt/9wrIgjnavF4S
         DZSGylNqJ6Dgn6+Ja7Ta+WeW0b1SF97hDpgrLIWTC7toTtNRV0rprykM8fClIcK0T06D
         h69peZj4So8/sErcmFghfez8Xmnks+6gQMg6V3KjrsDxGs1X/MF3UJUMf4sL2YnzUuNK
         5PuA==
X-Forwarded-Encrypted: i=1; AJvYcCWryakjoRboUhC0cOuwmUSAph/DDYsaYuE1lZAENnowEpbL9d23EQWqIuSmdiebmbLoOos9wuOw8HxUtMR/GyIk9AQIY37xkMSE
X-Gm-Message-State: AOJu0Yz8uX0qQBsY7N7xVwjQ5KPG6sJb4cAIByyDjaoHGnAuWpRS9LvF
	yK8sv1l/jmyTelqrrxAbFa3hoDrYLtoAdWwbbebR6DGPridxC/AgDBkMUVnA78/+5SUXeiF6taD
	6hh4q+IknSQ==
X-Google-Smtp-Source: AGHT+IFarMTHRQyaGAXOhvjvZC3Ev9S2zTS3Kvs5hpqZrMnxro2/BzrazXCSnRirdCi4qPaGa/c0QONTMKwCWA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:d608:0:b0:df7:d31b:7a29 with SMTP id
 3f1490d57ef6-dfacad1dc1amr763889276.12.1717610590398; Wed, 05 Jun 2024
 11:03:10 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:37 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-7-joychakr@google.com>
Subject: [PATCH v1 16/17] soc: tegra: fuse: Change nvmem reg_read/write return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index b6bfd6729df3..1b067dd8a585 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -96,8 +96,8 @@ static const struct of_device_id tegra_fuse_match[] = {
 	{ /* sentinel */ }
 };
 
-static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
-			   size_t bytes)
+static ssize_t tegra_fuse_read(void *priv, unsigned int offset, void *value,
+			       size_t bytes)
 {
 	unsigned int count = bytes / 4, i;
 	struct tegra_fuse *fuse = priv;
@@ -106,7 +106,7 @@ static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
 	for (i = 0; i < count; i++)
 		buffer[i] = fuse->read(fuse, offset + i * 4);
 
-	return 0;
+	return bytes;
 }
 
 static void tegra_fuse_restore(void *base)
-- 
2.45.1.467.gbab1589fc0-goog


