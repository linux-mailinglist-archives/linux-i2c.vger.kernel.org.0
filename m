Return-Path: <linux-i2c+bounces-4101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C313790DC72
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 21:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A7E6286AF6
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 19:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C0A16CD04;
	Tue, 18 Jun 2024 19:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5/DoLR+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939E383A9;
	Tue, 18 Jun 2024 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718739109; cv=none; b=B3SZCjaCkraxvyO7I+lUdAB1rKjJjj2rYx8lYvkP7yTCgA6tiFJDCcJSUyjo0XU4jHJSw+K2JEgVhUCVPgv6M2RWxqfE4oV0viDc+qdmRKW0uGampLncXEbdBTFJkBgA6Hk9FC+ehjEYMoYLGz2V0VU+1YYu391qzsb5QnGYcO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718739109; c=relaxed/simple;
	bh=9XNJU5dq29M1PPKaVt+6kRpA3+3bzw3uOrKrA3giA2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYr7XNfqEUZq6aXgXhhsKukX/gu43iN1VRRGUloaPbDqL3qz8qnIO7Wx67lT6bjnYX2dPIHhZqHeLb2pZ4bgJP7mJ9iCX7VOlV1zWWJpMtm7uZJQju8ru/tC2aEB7XuOJv8KHutCYx61xp3e3ZozW6KLxDqtcvqVzPOzTAn5iT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5/DoLR+; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-70df2135439so987394a12.1;
        Tue, 18 Jun 2024 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718739107; x=1719343907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=snDV6ppP6jN/LfMajoNt+Bchw1Qq+5Hrnx+Ibczj7lo=;
        b=M5/DoLR+JsEZp5PhEvVKycUcm57arzsFyZ64xCW54Wkx1J54aLzvuPCVv2Hi5YpU5s
         OQe7zwWxt+u7kULBiPqriUIn1yGajoxmyZ29Z/x7wAW5/LgQJcpp3uxvPdUC7ws/iSR2
         hEUQs3n4NGjImGAYwylnkI0goyiM3w87CA7Lq5N+c+cdW99QKKwnqhL23lIfX9va49OR
         SJE3qL+YdPxIp3FgLsAHWawTtcXgxXnl/2b+sqkE2zcomhARXdseQENjj/cN7Z43vSDf
         u6OLsYXk/1FQHl8tI1DU+4k/DVlmT5zxNyS4RNegq99b6uPjmVFMtkYhb9EJQ+O/M8vo
         bcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718739107; x=1719343907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snDV6ppP6jN/LfMajoNt+Bchw1Qq+5Hrnx+Ibczj7lo=;
        b=nQEvS9VCS9cPMFQZC5gGgMmUaJYZWiSSDndmxWt0rTUCsyQbGmpEMvG6Kv3EVxZUvs
         y9jhtoJGTa2XM0wo4ceJ0PzuXnZkWsZTZGFNYN6J6Ha8WyJsAxVma3aGNVYr9IoOfjze
         f++K9puJHK0t2T/JFtwoZfuxwQYYbfz/nMdrxZWSAhj1CdmLE8EyejvHTOsvQ/81+ILi
         9Ilfn1kJwWKUAIVbU6/RP8GAOxIE2UokTtexQFgMhla101GLvmSRpVrBLYa0VvIqGXTc
         33KTiJArDyN27AWOcBLVMgHKI9fvUTyTuvJsPWqvRHmV5hSyHq1aGw7L5iSeq5x6v1gn
         WPBw==
X-Forwarded-Encrypted: i=1; AJvYcCUpy/EBLJZz8VfA1YeGMWaVndrXaI+SWRFf3WHI1fmAc9VahCY5D9DcOGMasTMDectRLqkpHL4NB+8xYgZL7enm/+WwWOP6e1zA3drj/XGZA+JceM+MKytuZ2++AltH5L67XZ1kK3FCo8E5dsmGb6P6cefBig9Y9L2DbZYKfdfK9H4zIA==
X-Gm-Message-State: AOJu0YwUWPhcb6J1vPSUvNWfFGDIgV3cMHSxb+pO2DSlsj/PAveojwIl
	LqVWNwvylvbD2+Z7zRoR8hfRWBy3OdUXZXYuB3wC227xPaGpO85f
X-Google-Smtp-Source: AGHT+IGJF1o6h2LfLWrzY9ps3szStReldQpmflhU3VxZmVxFH8i+xCrLghV4ON4gb005PZSOJRbZAw==
X-Received: by 2002:a17:902:76c6:b0:1f6:89b1:a419 with SMTP id d9443c01a7336-1f9aa3d09cemr5271835ad.17.1718739106702;
        Tue, 18 Jun 2024 12:31:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855eff755sm100920345ad.184.2024.06.18.12.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 12:31:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <342dae24-56c5-4b81-9591-dc23ddbb2806@roeck-us.net>
Date: Tue, 18 Jun 2024 12:31:44 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <a5aa120d-8497-4ca8-9752-7d800240b999@molgen.mpg.de>
 <efb77b37-30e5-48a8-b4af-eb9995a2882b@roeck-us.net>
 <33f369c1-1098-458e-9398-30037bd8c5aa@molgen.mpg.de>
 <4e09b843-3d2d-46d7-a8e1-2eabc4382dc7@roeck-us.net>
 <f20ea816-5165-401e-948f-6e77682a2d1b@molgen.mpg.de>
 <975af7e5-b1b0-400e-a1c3-6d9140421f25@roeck-us.net>
 <8719fc64-2b51-4b79-ba52-0a3b9216f2db@molgen.mpg.de>
 <f76a4d07-887b-4efb-b20e-52979db31216@roeck-us.net>
 <fd8868ef-6179-45a7-8249-ee17994a8e78@molgen.mpg.de>
 <dc73070a-d266-47ca-bb11-77c2d9d6dece@roeck-us.net>
 <5b9379f4-5ccd-402c-8502-8895acc0cdb8@molgen.mpg.de>
 <b2fe83e6-8ebc-42f7-ba14-fbc1806a90f9@roeck-us.net>
 <0f18ac68-97b5-4834-987c-6d86ebb49e94@molgen.mpg.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <0f18ac68-97b5-4834-987c-6d86ebb49e94@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/18/24 11:59, Paul Menzel wrote:
> Dear Guenter,
> 
> 
> Am 18.06.24 um 20:16 schrieb Guenter Roeck:
>> On 6/18/24 08:25, Paul Menzel wrote:
> 
>>> Am 18.06.24 um 17:10 schrieb Guenter Roeck:
>>>> On 6/18/24 07:59, Paul Menzel wrote:
>>>> [ ... ]
>>>>
>>>>> I did
>>>>>
>>>>>      $ tail -3 /etc/sensors3.conf
>>>>>      chip "spd5118-*"
>>>>>          set temp1_max 56000
>>>>>          set temp1_crit 84000
>>>>>
>>>>> but it stays with the defaults:
>>>>>
>>>>> ```
>>>>> $ sensors
>>>>> spd5118-i2c-0-53
>>>>> Adapter: SMBus I801 adapter at efa0
>>>>> temp1:        +20.8°C  (low  =  +0.0°C, high = +55.0°C)
>>>>>                         (crit low =  +0.0°C, crit = +85.0°C)
>>>>>
>>>>
>>>> You'd have to write directly into the attribute files.
>>>> For example, if you have
>>>>
>>>> $ grep . /sys/class/hwmon/*/name
>>>> /sys/class/hwmon/hwmon0/name:nvme
>>>> /sys/class/hwmon/hwmon1/name:nct6687
>>>> /sys/class/hwmon/hwmon2/name:k10temp
>>>> /sys/class/hwmon/hwmon3/name:spd5118
>>>> /sys/class/hwmon/hwmon4/name:spd5118
>>>> /sys/class/hwmon/hwmon5/name:spd5118
>>>> /sys/class/hwmon/hwmon6/name:spd5118
>>>> /sys/class/hwmon/hwmon7/name:mt7921_phy0
>>>> /sys/class/hwmon/hwmon8/name:amdgpu
>>>>
>>>> you could run
>>>>
>>>> sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'
>>>
>>>      $ sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'
>>>      bash: line 1: echo: write error: No such device or address
>>>
>>
>> Please add
>>
>>      .use_single_write = true,
>>
>> to the regmap configuration (spd5118_regmap_config) to see if it helps.
> 
> Unfortunately, it does not:
> 
>      $ git log --no-decorate -p -1
>      commit c27ae51b689d7bdb7baf10c434438d501bd384aa
>      Author: Paul Menzel <pmenzel@molgen.mpg.de>
>      Date:   Tue Jun 18 20:26:17 2024 +0200
> 
>          hwmon: spd5118: Use .use_single_write = true,
> 
>      diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>      index ac94a67793605..33a628840597e 100644
>      --- a/drivers/hwmon/spd5118.c
>      +++ b/drivers/hwmon/spd5118.c
>      @@ -522,6 +522,7 @@ static const struct regmap_config spd5118_regmap_config = {
>              .writeable_reg = spd5118_writeable_reg,
>              .volatile_reg = spd5118_volatile_reg,
>              .cache_type = REGCACHE_MAPLE,
>      +       .use_single_write = true,
>       };
> 
>       static int spd5118_probe(struct i2c_client *client)
> 
>      $ uname -r
>      6.10.0-rc4.mx64.461-00048-gc27ae51b689d
>      $ sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'
>      bash: line 1: echo: write error: No such device or address
> 
> 

Too bad. Still, thanks for trying!

I have a more comprehensive patch series which I think _should_ work.
I'll send it out for testing shortly.

Thanks,
Guenter


