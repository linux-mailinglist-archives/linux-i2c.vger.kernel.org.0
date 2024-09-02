Return-Path: <linux-i2c+bounces-6010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3809A968E14
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 21:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C2411C22403
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 19:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F19824A3;
	Mon,  2 Sep 2024 19:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCu3TNqP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2991910F1;
	Mon,  2 Sep 2024 19:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725303739; cv=none; b=dcdS35jf+YWrOhJ2hTg863NssOciCXyUMlQe9JTddyzDkWOGcU4PwJ5vdszoWTwvlkMgA1dREUWC7H/4C2Z5YVd/Tuk3kKwI2zzL51fHQVb2WNeQQYE123j6/Rcj8KirwM+bB4YYA8/ukSf9NvgqiJCpuUaeHiaZZpcDsSZQBEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725303739; c=relaxed/simple;
	bh=jekyBicoxy1Sag1smlQITxm5LeUKfGARjH0XCeFmKGQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XnJvKp0TPjmve0EmWYdn4q2Z4KriCDtWMLF+fDx24hMnVGptAw911SYqhvH3WQlqECue/nUFCWJCjzkNX0B/espdqg5NxVYgsxU0xb/mluHvyl5aABegGkriRKZiBSC+KStrmNXczqdYIVtfrQD2yM17gHjUjmqk0BLF0gVCqj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCu3TNqP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so5698260a12.0;
        Mon, 02 Sep 2024 12:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725303736; x=1725908536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JE8tjaYrPRmC/St8nENnImiGEh7cqqSlFkiE3QRB/jw=;
        b=fCu3TNqPnAIt9Hu7YmnI9/3TdPPMAPvPh+Na1GSvX+qtwg2j44C0lxh+kMAguMftYK
         TcswUf+wF05H885CvfIiEVSNv8BxxVwxhnD/J7lqYKg3ypKuy/+yl2zJ8qRHm4OFireG
         Jxp3a5jC4wQ7oGPEBD/rGetJi/6+VV4IevS4NwuP9VkrrjCUfGYxTcb8oa2NZwUfricQ
         MAmP1UCnI6NvI4AoudlJXF9Z3T5H1C70lEOLA3jCflLq9JiuaKrGaYhM6CDkv+siWCEb
         ZduQuF9AgOx/1Msrk+Bdt18yVP0QKpfVdAhvSiNOTOS8n7tiDzFKW34MyOtwJbKfMrQL
         zQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725303736; x=1725908536;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JE8tjaYrPRmC/St8nENnImiGEh7cqqSlFkiE3QRB/jw=;
        b=iEYORqgs3CMpQNk2gQoHGzcZW8cCCOO3NMZy3TqssTt4tvD+ioGmhH27RA7y9kTECp
         No1Lc1o1VK/6wVfSIBqZ9Q3dBdgE5lVG5Tm5sgx9kJ4P1ERs4/g3ag7xA/YF9GSvgDfH
         qeQWuUJzwJMn4m4ejbt3PjAOfK7xfHJcZHeOhc3E5LLNfTg+iLRjwd+BJYuOs/omuR8S
         e/j//6Ffo/fg+FXRXKrQ9aEc+IztlZWklAAZnDmAP5g5QYMnQEiGEs07pNAJ+rgs/SiF
         aLL5BgODH7TAGtDgpxw/sd0/SySKET3r2673tMclci8rg36cdqIZgylv6pkN821W6SV2
         2OZA==
X-Forwarded-Encrypted: i=1; AJvYcCWRFFYCTBWtdEhbBbTcmeKzKHBfk1esnnm9jkHc7LFBRVJ48+c5DAuCaAfiXIoGVKJGVyWwtuJfoT9YDLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAFUSBU4qXzUZliHDizVQz566vs53/Y7No/f/xZHrHcddlf48P
	RE8oBllo2V6RPbb25O7tKeqPYNooE8daMrMVENPE3m03A/WnQtuS9ZOPmYD1
X-Google-Smtp-Source: AGHT+IFlUDCPuDLUJkOxbrN4p+zfJsGWppwL3n71jzaRP7czEyeky2vaV1rtIUMra8mQm7lgsUKHaA==
X-Received: by 2002:a50:8d8c:0:b0:5c2:43bd:8ce8 with SMTP id 4fb4d7f45d1cf-5c243bd9034mr4521493a12.21.1725303736215;
        Mon, 02 Sep 2024 12:02:16 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bc00:6b00:fd2d:3fc2:a936:4a81? (dynamic-2a01-0c23-bc00-6b00-fd2d-3fc2-a936-4a81.c23.pool.telefonica.de. [2a01:c23:bc00:6b00:fd2d:3fc2:a936:4a81])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccff17sm5469626a12.73.2024.09.02.12.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 12:02:15 -0700 (PDT)
Message-ID: <7bc5fa50-59f6-4455-8f77-1c89f1e17d0b@gmail.com>
Date: Mon, 2 Sep 2024 21:02:17 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] driver core: class: warn if a compatibility class is
 registered
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Kernel doc for this function states:
"Compatibility class are meant as a temporary user-space compatibility
workaround when converting a family of class devices to a bus devices."

Therefore remind any potential user of the old ABI that support for it
will be dropped soon.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/base/class.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/class.c b/drivers/base/class.c
index 7b38fdf8e..f12a43736 100644
--- a/drivers/base/class.c
+++ b/drivers/base/class.c
@@ -556,6 +556,9 @@ struct class_compat *class_compat_register(const char *name)
 {
 	struct class_compat *cls;
 
+	pr_warn("Compatibility class %s will go away soon, please migrate userspace tools to use bus devices\n",
+		name);
+
 	cls = kmalloc(sizeof(struct class_compat), GFP_KERNEL);
 	if (!cls)
 		return NULL;
-- 
2.46.0



