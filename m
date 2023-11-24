Return-Path: <linux-i2c+bounces-436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 330867F7108
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 11:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C84BEB20C78
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 10:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD36B18B00;
	Fri, 24 Nov 2023 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="la5zgSjV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01726BB;
	Fri, 24 Nov 2023 02:15:17 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a03a900956dso332385266b.1;
        Fri, 24 Nov 2023 02:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820915; x=1701425715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmH0U+ykva3wvuaL+4MoLBzeoUW8RNObes6nQ8E7/J8=;
        b=la5zgSjVmhrxvY9lH7vFHSm7zaORIkJ7RbvsNInVzSmeLsvPu6w7aHCp9Uvjzmqtth
         Lk3+Ufy9tUUa0pclkDL2CA63G8WKH9o4vCk8JVYE51I6Tg0LnRawMDlNeZ+SNvvQpEVQ
         vX4JJqgRs+cwsKrs1zPlmN6KwUdE3wdTLStHhhR9sUhbPSrUmn7CjlZ4ZIVu22izMt8V
         NZs23xijzDqp8TsmG0CMgS6AaEZasQXe3aNtD8cutwrm6gdlXvqVckYDDJF/6jk9UTU9
         KneWKYcsbNHu8Naed6wBJ0mjLOz3s3mzffbg2ex1cbENn9Rgo6vOFXzs8fxkF2TamPpF
         cM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820915; x=1701425715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmH0U+ykva3wvuaL+4MoLBzeoUW8RNObes6nQ8E7/J8=;
        b=w5K45bIbdZ2upyYg39v14poMu08ZgaKzlAuA4WAsz7DBe43dilFo4MS9sVGNDiVOum
         FOu9r+kjB1/lkXaT39yGhWGoUHcuNnU2Cpw2xV9t4SCOyiyD3ftnWhUkYhOu2II03t3m
         M/kC1VfHIRAxiLDx83L3512igCiJK+qBUGVSA58GFCwqCi2sv5N0EbVKkUDkQ93PjsB9
         589KAqE1Du/O9/NL09PZOKqo/HykByF9EIQoTt1mu1L86oVOTtEBzoKn3LimJowkm5e3
         O0jgllfJYPAlW0wusvHDi9EWQ0CinaYAClxKE/khf10xheTj90D55/CId3JZnhey1iIR
         v8iw==
X-Gm-Message-State: AOJu0YwWqnyBdPj5G557fPOh6a0YAusQbxyq2obN/g/dsdBLZFhhp9Nw
	PppHq7eTlYztiuu7jE28r9PILCdJ8HCRig==
X-Google-Smtp-Source: AGHT+IEF7LefNEKlJGkVHIBFnfdLmxNer5uS1gnjQFAPzzj7PsOQFEdSAuI0L6JOhkGa3rWeMPlYVQ==
X-Received: by 2002:a17:906:410d:b0:a00:ab1a:c81 with SMTP id j13-20020a170906410d00b00a00ab1a0c81mr1973811ejk.22.1700820915337;
        Fri, 24 Nov 2023 02:15:15 -0800 (PST)
Received: from ?IPV6:2a01:c22:72cf:8300:64ee:eefa:7128:3642? (dynamic-2a01-0c22-72cf-8300-64ee-eefa-7128-3642.c22.pool.telefonica.de. [2a01:c22:72cf:8300:64ee:eefa:7128:3642])
        by smtp.googlemail.com with ESMTPSA id j10-20020a170906050a00b009fc54390966sm1891674eja.145.2023.11.24.02.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 02:15:14 -0800 (PST)
Message-ID: <6bb4d6bb-3857-4ad3-b0a3-498a8950305e@gmail.com>
Date: Fri, 24 Nov 2023 11:15:15 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c:
 Don't let i2c adapters declare I2C_CLASS_SPD support if they support
 I2C_CLASS_HWMON
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Sergey Kozlov <serjk@netup.ru>,
 linux-i2c@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231118180504.1785-1-hkallweit1@gmail.com>
 <20231118180504.1785-9-hkallweit1@gmail.com> <ZV+8WZk5ZKAmroED@ninjato>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZV+8WZk5ZKAmroED@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2023 21:55, Wolfram Sang wrote:
> On Sat, Nov 18, 2023 at 07:05:02PM +0100, Heiner Kallweit wrote:
>> After removal of the legacy eeprom driver the only remaining I2C
>> client device driver supporting I2C_CLASS_SPD is jc42. Because this
>> driver also supports I2C_CLASS_HWMON, adapters don't have to
>> declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
>> It's one step towards getting rid of I2C_CLASS_SPD mid-term.
>>
>> Series was created supported by Coccinelle and its splitpatch.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> As I want to apply this cleanup early in the cycle, could we have an ack
> for me to modify this subsystem, please?
> 
Looking at the git history for this driver, there has been no sign of
life from the official maintainers for years. Hopefully Mauro can ack this.

>>
>> ---
>>  drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
>> index bd38ce444..46676f2c8 100644
>> --- a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
>> +++ b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
>> @@ -289,7 +289,7 @@ static const struct i2c_algorithm netup_i2c_algorithm = {
>>  static const struct i2c_adapter netup_i2c_adapter = {
>>  	.owner		= THIS_MODULE,
>>  	.name		= NETUP_UNIDVB_NAME,
>> -	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
>> +	.class		= I2C_CLASS_HWMON,
>>  	.algo		= &netup_i2c_algorithm,
>>  };
>>  
>>


