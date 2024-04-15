Return-Path: <linux-i2c+bounces-2948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55C8A5C73
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 22:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758C72818E0
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 20:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF8A156971;
	Mon, 15 Apr 2024 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agEUURmy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662D415696C;
	Mon, 15 Apr 2024 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713214232; cv=none; b=Hh4rslVQ+BTX7UF0VFYdNAV7XXbJ2Ahw+97t5m+cqeC6SNkmlC8gyYDkPba07uVLxOGK3I+Sh5dh+qo9av4Z9kYLzwXVPC7hizKZWpNWwEvc9lX5UkJoJMoa5UQLJEJC13yVUNeZ/e8D8bzoDDDzkvbE36ybrDF3ImYhr1Zm/Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713214232; c=relaxed/simple;
	bh=aCsSUaXExGwsi0F2yU1z/Bg65Y1Z30tf8DdKd6YUTaY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ujX7FkQE1ufP5OsNu1v6SMEb74QU4/jKUhdAWliRHvta1+X7Hi5vad27/6jFghl2FPAVOBnhYZQgOIgrbtKFIiywKx6PNTqoW014Uw+G/aZPNzrggUCFJA2esjrCPSg3UYBc+Esvf3rdd2UhqCPel0K5XXa3gionotL6xRzxcms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agEUURmy; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5200afe39eso458114266b.1;
        Mon, 15 Apr 2024 13:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713214229; x=1713819029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl5zn6bqDXb4QeGfV8Ldkwez/E7mmwfjuysQiWvQafM=;
        b=agEUURmyA7zZpX2qavz2CyDaNUplYRrQt+vnKMvkT4ezA7HQWpkHKcjTZ7c+JuKwHU
         PvdJCdOF9rdDWjnPaqgcugiCPMs3v44XEYGzceqTWdlrm6iGyVZ9useitL9Mcgqg9lFf
         bPc+lXMcN1hO1DYBs3pmM8OyC/GszmZLoETf39HEqwTJ+YsL/IgK4lRam9bhZWEfD07Q
         U9P9Q3GtzlN/YFmS4TtOEd/3TJh64XxHEgBmGB5jmcgR9Zc4qO94d4LRi3hIpzOg9EXW
         nbrhMMn31Ig3OBwzLy1RTLingdl1nae39POYAeRMmiDDkEb06WzBRU95Lwm0keuYOyXS
         k0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713214229; x=1713819029;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vl5zn6bqDXb4QeGfV8Ldkwez/E7mmwfjuysQiWvQafM=;
        b=iskPOQZGnYwYNWrOwK1kvNP3p8wMZNKgFR55KMOX7EBU4ydifgT2blqaU/AnQVdtuH
         X9nMYJycUC5niEW92ko4cOF2XSxxW+msNWNyg6/PBF1mkFEPzSqzZMsSLvuYqriKfvnU
         ipih2mj8ixp24ZL0P588aPyS0z7bosZc3vnCIIrNtkBgYgm8OA1aGYzXcdWhCCP/1X69
         dDOmliqXgcfAddxHMrq2JVKJYpZIOgGwJ7+Xacmzi4C+DLEy2bfkh9s2Wq63zRwokpqn
         uZvgM4esaxFyejgTfkUBUoAfCQnsZSkjMn4rhLT59nyMZEjnH3rHacUt9djHz56JHFGh
         YQaA==
X-Forwarded-Encrypted: i=1; AJvYcCVa6FRA0T0lsu00d/Eq76s1xrLocYZrU76vKxph85LdZzytPm/uLSSS9dOHua2G7Ba6K51k4l8eo7j/t3g/fcAhRMfjQo1zX8FKGpo=
X-Gm-Message-State: AOJu0YzwCG2eAlsyTEh7LYqMiHdERpmG9qk8N5viRymURCuSsMk5IRG8
	KeQJe6i1hEA61nP5ieb1HkIw5KSjYiGcLaTh/60/aQOclcH2pXql
X-Google-Smtp-Source: AGHT+IEgQOMbLv7xsXLFqd5FBus/Lt3khMb/zVji8A++qdnSujkGGP5L/lWpJcWNUesthGg7T1z44g==
X-Received: by 2002:a17:907:6e87:b0:a52:401c:472b with SMTP id sh7-20020a1709076e8700b00a52401c472bmr9423039ejc.73.1713214228942;
        Mon, 15 Apr 2024 13:50:28 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f? (dynamic-2a01-0c22-6fba-a100-05c1-bdd1-c074-ea9f.c22.pool.telefonica.de. [2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f])
        by smtp.googlemail.com with ESMTPSA id b9-20020a1709063f8900b00a522e8740ecsm5094456ejj.139.2024.04.15.13.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 13:50:28 -0700 (PDT)
Message-ID: <951819eb-aa65-4e39-a60e-62886759e524@gmail.com>
Date: Mon, 15 Apr 2024 22:50:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] i2c: Remove I2C_CLASS_SPD
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Wolfram Sang <wsa@the-dreams.de>, Peter Korsgaard
 <peter.korsgaard@barco.com>, Peter Rosin <peda@axentia.se>,
 Guenter Roeck <linux@roeck-us.net>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Remove this class after all users have been gone.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/i2c.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 5e6cd43a6..970953737 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -852,7 +852,6 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
 
 /* i2c adapter classes (bitmask) */
 #define I2C_CLASS_HWMON		(1<<0)	/* lm_sensors, ... */
-#define I2C_CLASS_SPD		(1<<7)	/* Memory modules */
 /* Warn users that the adapter doesn't support classes anymore */
 #define I2C_CLASS_DEPRECATED	(1<<8)
 
-- 
2.44.0



