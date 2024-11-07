Return-Path: <linux-i2c+bounces-7867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653B9BFBEF
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 02:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BC531F22B70
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 01:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A20944E;
	Thu,  7 Nov 2024 01:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rLhPO/y4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52F51361
	for <linux-i2c@vger.kernel.org>; Thu,  7 Nov 2024 01:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730944114; cv=none; b=Q1DGwG0B3S2A0TVpBjnBhB0cIuwuHAeASf1D+tAPWtyvuEycHTkTvIEnlVKtJHVemtT2h4hZJgv3FqO+glSkAjhQG3C5WwesfkszHjBDQGJdto62ozDmYagujvKH98Yb9WLf5hgXVnYd2Rq5aHvwy1tM0UyDRLnrI5mheKs/Fqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730944114; c=relaxed/simple;
	bh=V10QHZfYVQD9HFzRtETykMtC4OBrdMMBil6kxYAZ6Tc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZGwYE3mSNBvT57kI2MfVGjGSItVKB6e3IUZhBbytvtCo6NM1OrvhBf/mHW9uclfw+9QsnpJ7/Rr4cSKXv4Ycl04MQjE6u8+3My+xUBFIrXuGQmT9cUKG0HdJaPVURV/MY9d4Q4cm5NdCteiOPHWW0xwSzAqcS8fyWnIuB8xT6D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rLhPO/y4; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e376aa4586so8882057b3.1
        for <linux-i2c@vger.kernel.org>; Wed, 06 Nov 2024 17:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730944111; x=1731548911; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gL8t9nFQsC/c96Z20xSFXHjy1Xqit+dwKJbQYn+hSkQ=;
        b=rLhPO/y4b8LGZ4XBgAVRdexrsvc2chYMesGpWLaPu81dB7z47zOgGWItHD/I3pedr2
         toRmKIqJoP21AZ4Z80gdoc7svw8B13PmczLebNvQPyikOn9n0ShRj+cEAxOzmlVcFN/Z
         RXTKVfxfQD1xmI3R8ZOwyWZ9sHc+ZitwvtYT/xiLtuLrDuh+Hjn+xIfA0kiujx0ciNCF
         5X5daO8sCjB1lxS5rSsxs2cmhBr5CEi6yRH7wXKfvBP+G6CVozSuKAJIpoIOS9vqDYMJ
         XK1wVgMGa2ECuoCpKcVclk+7HVkSIL6aGSya95XMGXr+1a6IBEyPgHuIeZITlysBaI/W
         zmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730944111; x=1731548911;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gL8t9nFQsC/c96Z20xSFXHjy1Xqit+dwKJbQYn+hSkQ=;
        b=AEwUcRVuK0OyLStnGURnCGHzwH693Gnrlfdbyft1KiD0DwBHDjviNm3vLie23jDklU
         Bh2gMbROVTGpjM8Mp1c5loswhWL84aiiwyUUpW+Fs5pIQ4c5ENGXNVVCCG3N80CaWcTl
         dMr00SPiT/3Q05Z5p23fN+F3IRJ5KWKGSNzaG4jdTRbH5N1TgO+gR4DK+GxpwM2bY3H8
         X9WdG7UxYD1CZaOUYO4YVWCn98IxmNQ0dNCNKdOeEym4yD87mpB9t4zKO3odJ7aK0f9B
         f7A7NEvWPghG4xZFKoI2nSiJ7atszGTVDIputp+b11qWcd9p6/ZKNcw/1Iyt0vIxGNxW
         pRug==
X-Gm-Message-State: AOJu0YwgGcK459CDc6Gp/5nScKziAD9IMS5xIRD86RxO63B1dVVeRIS8
	bEvQEnTebNd0ODKwkF5ERVmdJzVkrzGz5+egxoleFW/dLLPz7FNhZAN3EUlzjtaJuNKDeK0t5mO
	0VvzjnuCL0Q==
X-Google-Smtp-Source: AGHT+IH5q2CSopFJCMFNkDZJtYacCpApjZqhwnvyXYGycM9PriE3s7h0cVn2vA6Wb1UdS8o+oKwirsOazZ5VTA==
X-Received: from ip.c.googlers.com ([fda3:e722:ac3:cc00:ef:85c8:ac13:4138])
 (user=ipylypiv job=sendgmr) by 2002:a05:690c:6711:b0:6a9:3d52:79e9 with SMTP
 id 00721157ae682-6ead169d03fmr2637b3.4.1730944111724; Wed, 06 Nov 2024
 17:48:31 -0800 (PST)
Date: Thu,  7 Nov 2024 01:48:27 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107014827.3962940-1-ipylypiv@google.com>
Subject: [PATCH] i2c: dev: Fix memory leak when underlying adapter does not
 support I2C
From: Igor Pylypiv <ipylypiv@google.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Jean Delvare <jdelvare@suse.de>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Igor Pylypiv <ipylypiv@google.com>
Content-Type: text/plain; charset="UTF-8"

i2cdev_ioctl_rdwr() receives a buffer which is allocated by the caller.

Fixes: 97ca843f6ad3 ("i2c: dev: Check for I2C_FUNC_I2C before calling i2c_transfer")
Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
---
 drivers/i2c/i2c-dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 61f7c4003d2f..5d15519ef737 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -247,8 +247,10 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 	int i, res;
 
 	/* Adapter must support I2C transfers */
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		kfree(msgs);
 		return -EOPNOTSUPP;
+	}
 
 	data_ptrs = kmalloc_array(nmsgs, sizeof(u8 __user *), GFP_KERNEL);
 	if (data_ptrs == NULL) {
-- 
2.47.0.277.g8800431eea-goog


