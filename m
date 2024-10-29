Return-Path: <linux-i2c+bounces-7647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 288709B4814
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 12:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2FED1F236CC
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 11:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B395203715;
	Tue, 29 Oct 2024 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEKh4s5x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8781DEFE2;
	Tue, 29 Oct 2024 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200532; cv=none; b=nvcuIv8jTGrVmuiF6y76uKRQFE4JrD16HmUNd2mEmrMkmIgGevCSCMRyYKLHxXvrtIaBURlzAdXCa0BF9o+A6Xt99LGmMV/f3FikqF7oIt+pL1vqOWwi6e5y4E1KB5CCr9L08w48KeH4Aq5SHlCasFM4c/8eJMYvxgdEJBc+tts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200532; c=relaxed/simple;
	bh=Qm1SvuTouZbA1KB/4nlKtjP9hezckri+4YLCg3jq9os=;
	h=From:Message-ID:Subject:To:Cc:Date:Content-Type:MIME-Version; b=lnep0Cl6+tYMhvCEgDhRMfJbR9354dcnrc/2erQAKCLLspuS9AjA2FC/Ji6+3ptj5kvCV0liHlSbEDFDFli17Cj8hH7HPnXId0hvWQmg53Q1gZUj+xs7Qk5xiS96/0QEKN/dlGyhHDavEwj5SgDq07VP1x9prTNqwUAGQo7pLoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEKh4s5x; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9abe139088so783676466b.1;
        Tue, 29 Oct 2024 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730200528; x=1730805328; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :subject:message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhqvAiUNzRvD/II9xf+29SDbuvoVtnnw6tqLR/pkTds=;
        b=iEKh4s5xZPFllMZf0iH/P+zLT0TQV/wjAakYjpZIhs7PAJiUEzgrLxqucZ41qsAscL
         4SCejGl6S652kkl2YCJIkjfgsWcbc5FwcNMDhvP1Z4AipAmmvIIjTS0HTlJF44I+mEZH
         mVj5HspsNMZtj+tpKSax9VWMXhzJ20zsQYw1HVfKtOb9SjI5Y9x5ZuQsy7NmBSt3+IUp
         Lu9A/5Q7balJb4WR9k0MFRwvMaKvA4bsr9eFjfKZogIKtJYgn0Q0POSw1bU+F5qe+Ywn
         tUZFEgfcqqJGezZY2ye0g1eYHdHjSeICoCAuBq82yXAF282YEmQd6zDdKUDLppXEcgDp
         wTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730200528; x=1730805328;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :subject:message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhqvAiUNzRvD/II9xf+29SDbuvoVtnnw6tqLR/pkTds=;
        b=L9ZBHUCXGxygLXwFYzO5C1PnbanQWOqFC7snGkDN/bVMM419JKxpDHgkwABg+qi0XU
         DfDzV6PB5YUc7Yzcqyd++2ZI8OqXJ4FnkviFnBOSwLrE2n6+5w0vGbJUnrXDNPNf6CYg
         jpbpE5R8jdnqktaZNSisCJloi6+pbnxkuKsFeYvAUAjbcC6cvdvNMHYxWzWyCnfe5D97
         vKBPwJcCp7OQtbNslD6TaNMwZAwYBMGW/3Z92rDy3mFTv6fIz5JzW9BffO2qbYVIIyGM
         Um06JicODYLj/XNU2xf2MJBvyV9n1OUkqbzoL0mBvbHA4PF264PItKBAxBF9SPgXl3zW
         83Jg==
X-Forwarded-Encrypted: i=1; AJvYcCULFmNDI7o8E6aumEoGcvLs5H44UhFZQcRWLUBQvfj+PPDTtApVxCZwn3dsi8baw0rQOtNND6nScSfPHPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHd5wYNeatcaq3W71YFhk0Y4z2CD+GC4O0nG1xfYGHorvyhrqq
	jFm6dfJSxjH2ERNLwEVs3eoEmRTepVFJxOq/sDUkmK5myi9dE5AOYglQnW06NVM=
X-Google-Smtp-Source: AGHT+IHM+d47Tp74ACPIjB6YYlHaE/2OVLCc9tzuBuclzUx+/9zzqSXJz7Br+A5qYg1gMNtH3xAwMQ==
X-Received: by 2002:a17:906:6a1d:b0:a9a:18ee:5106 with SMTP id a640c23a62f3a-a9de61e95a5mr1031043566b.65.1730200527763;
        Tue, 29 Oct 2024 04:15:27 -0700 (PDT)
Received: from [10.0.2.15] (23-152-178-143.ftth.glasoperator.nl. [143.178.152.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec7d69sm464670966b.7.2024.10.29.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 04:15:27 -0700 (PDT)
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
X-Google-Original-From: Liam Zuiderhoek <Zuiderhoekl@gmail.com>
Message-ID: <ad659d817d2003d7e6309203c5982bf645f9c25c.camel@gmail.com>
Subject: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Oct 2024 12:14:54 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From 214adebf7cf37be941f208124fac9ea6bec0f1d2 Mon Sep 17 00:00:00 2001
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
Date: Tue, 22 Oct 2024 20:46:59 +0200
Subject: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue

Fixing a coding style issue.

Signed-off-by: Liam Zuiderhoek <zuiderhoekl@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-
smbus.c
index e3b96fc53b5c..6829def15933 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -122,7 +122,7 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
 {
 	return i2c_smbus_xfer(client->adapter, client->addr, client-
>flags,
-	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE,
NULL);
+				I2C_SMBUS_WRITE, value,
I2C_SMBUS_BYTE, NULL);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte);
=20
--=20
2.43.0



