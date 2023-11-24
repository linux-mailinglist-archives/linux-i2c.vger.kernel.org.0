Return-Path: <linux-i2c+bounces-435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B737F70F1
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 11:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28145281B92
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FED171CE;
	Fri, 24 Nov 2023 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxzrDw4o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB93C172A;
	Fri, 24 Nov 2023 02:09:54 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-548a2c20f50so2369312a12.1;
        Fri, 24 Nov 2023 02:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820593; x=1701425393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m8w2rneZWk50Vwtyw8hi2nEgxF9wwtMPjBvhGMN8LSY=;
        b=DxzrDw4oE6wdVCydUtc4qHDQrAVPhnTuhV7IfIEj3gRNWY1sEykEPIYG63WTjdp/V1
         6njjt+6NnU+gg+8Cz3bShLmZZn3widYK8Yygj4EhggrqUEpyO0gLIhJF9aS4Qt1pcmuj
         pKGX/PJ3ma+I43FO50m6SMO/GCho4f43TU/zawjILpmHqd7vd1OS1N5u8wxGXE/TK2X+
         KIW4iC5RPQRulbxs2NKoCVFKCw+5wsRVkiwXkcqwV6OVbKa42CDEx1gIzqcI+zrMeGHk
         2fV33ywXXisQZ22kegTW+NEesWdk8woZjgaueyTNQgYpGqk/7qFJHkZN+54gZHWfB6pq
         mmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820593; x=1701425393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8w2rneZWk50Vwtyw8hi2nEgxF9wwtMPjBvhGMN8LSY=;
        b=noaWVVqBe0FQqNb++bbLhAQKkLko4zCia4NApTTaF/Qa5g29Vweh9wo2nEViab80BG
         74jdXCb4dVRkSlR89Ok3gDirV/RKGQ8Sx0ZnPnD0V7aGKSkmUOVUMff3YAY79jBKTHnq
         eqPWlwFUg3/G0ar03XRNAxCskCVio0L0L+C623BSO8S8n4+se/iyz/ip5NsezsBlp4Vy
         k4UKNCtgrPBlvbyfG6hAKye0SyyRnjPuLnufq74eaKNTfDptU9eX7ze9BxHDoNKH95M4
         09V9V3ufnJeBAlqUnnPcBHYbIpHsfuX3/a54VLFPs+vY6zKW68plJ8P84kAAx2uHBp4c
         ho/g==
X-Gm-Message-State: AOJu0YxKRJ4H+qvj39jmk+/z07RNCnwznB6MwpzxzCqq5gJErsFrVIIe
	tK66WHL9WMrWFOGnq1rT0GN1D/Vx8Ui77g==
X-Google-Smtp-Source: AGHT+IHbmSrZHLYpYV/fxcYSBbpGgcBecf9YXzxVjY/ahvMGyW0tbf8xJ1exeqv94Lcxie3mam9b7w==
X-Received: by 2002:a50:9fab:0:b0:54b:824:9ea2 with SMTP id c40-20020a509fab000000b0054b08249ea2mr172505edf.16.1700820592946;
        Fri, 24 Nov 2023 02:09:52 -0800 (PST)
Received: from ?IPV6:2a01:c22:72cf:8300:64ee:eefa:7128:3642? (dynamic-2a01-0c22-72cf-8300-64ee-eefa-7128-3642.c22.pool.telefonica.de. [2a01:c22:72cf:8300:64ee:eefa:7128:3642])
        by smtp.googlemail.com with ESMTPSA id t24-20020aa7d718000000b0053ff311f388sm1623563edq.23.2023.11.24.02.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 02:09:52 -0800 (PST)
Message-ID: <d12be9e6-e136-45fc-9d0e-dd290ef25277@gmail.com>
Date: Fri, 24 Nov 2023 11:09:53 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drivers/i2c/busses: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
To: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231118180504.1785-1-hkallweit1@gmail.com>
 <20231118180504.1785-6-hkallweit1@gmail.com>
 <0cee5543-711d-3d6e-f416-18889badff18@axentia.se>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <0cee5543-711d-3d6e-f416-18889badff18@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 00:10, Peter Rosin wrote:
> Hi!
> 
> 2023-11-18 at 19:04, Heiner Kallweit wrote:
>> diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
>> index e01d75308..9076ae4d7 100644
>> --- a/drivers/i2c/busses/i2c-kempld.c
>> +++ b/drivers/i2c/busses/i2c-kempld.c
>> @@ -283,8 +283,8 @@ static const struct i2c_algorithm kempld_i2c_algorithm = {
>>  static const struct i2c_adapter kempld_i2c_adapter = {
>>  	.owner		= THIS_MODULE,
>>  	.name		= "i2c-kempld",
>> -	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD |
>> -			  I2C_CLASS_DEPRECATED,
>> +	.class		= I2C_CLASS_HWMON |
>> +	I2C_CLASS_DEPRECATED,
> 
> The above is less than ideal...
> 
> It should obviously be:
> 
> -	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD |
> -			  I2C_CLASS_DEPRECATED,
> +	.class		= I2C_CLASS_HWMON | I2C_CLASS_DEPRECATED,
> 
Sure. Thanks for the hint.

> Cheers,
> Peter


