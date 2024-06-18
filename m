Return-Path: <linux-i2c+bounces-4079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7190D593
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7431C24AB2
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 14:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7504316CD17;
	Tue, 18 Jun 2024 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cd97st6u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66F16B390;
	Tue, 18 Jun 2024 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720616; cv=none; b=NQrFUuk0IWlLGw7e+GqiHvn4gBSLfwfs92dNDMzFrghzoP5D16kZlXcUHVXHxCdmJZZia4HH+mJq9Fv2pEivnBiLxca4Fd35eJdyXQMNWiJBSDELHHz18ZIgaWp10O4XLRVG+mWM0+8BpND/AvAiypvN8oRPlDPobU+4Iv9EIYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720616; c=relaxed/simple;
	bh=qCQwFAbk5X6AaIM8Rw60RpbD1XKKZqe9wFk+I1QPAHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=av6BUqhSdxhxvHIJOYPpJme9qxALsT5YBXlolpQlk4UWnYkfs5k63eHv0KJJ1HvTi3aEku4YhEdrJQnxQGLdQswK7PO/YG5u3DLzY0g00P++yoq+c2x0h5DkYmJUCIg9fiiVBVDW5/G/sZDUsDbG6+QCeh9rZTR1kTdO7oyJvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cd97st6u; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70413de08c7so4022235b3a.0;
        Tue, 18 Jun 2024 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718720614; x=1719325414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc7pdm16K3UIZRC2KPnB92NqmQSvXr6CaVx5/deUuec=;
        b=Cd97st6uIpOix+D/gN/jpxl2T579rJgAEKQzJBLW3dg8qqI/d2lfjlS88EWE5IRFye
         b96SiJmoONeC6U+XZxe3T083b4lH5EYy1iUV5j5cJpnV+MEzyragggMFHhXN1rHpaVml
         5pxvDoSAoifGo6gIO8dtpZSD1V5b+CJNqVV0dOgrdvbahzDj8QSt9xyQyO7g/RO1Stnn
         P1yj/PVAKXs4IU2EbZvplo9Z0hPGudSjsqYTX1/VNYezaHw8qBNHuX/NvXKcQtU1v8rd
         Maz63VrO1oRvYQhPrZFa1LxvGYsR0YRtrNKXMCoBrhInbbWek4seArhZDOgwthNja8vP
         G+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718720614; x=1719325414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc7pdm16K3UIZRC2KPnB92NqmQSvXr6CaVx5/deUuec=;
        b=J7vZmTV371f861kRl0NL4nLTsPHfLYWZZwEv9Ef7OsGRZFd5BGekiZyqFfpo1HUMo5
         ch7iVxALlzdJxmb4ASC5U8B5z5Ebly1FOyJfWZsdenCp7MjgDaXyVfzfmvnQFL1/rySD
         7FzhXQPYSnHDE95/jugBMnaXqSF9QctZwTln+rwzX1V6blHG7zcvbc0KgNArlsqbzP2U
         tYROF4Q+1uPNGC737PikY+fVJ1JtpURImXF29NhY8+z2tMgP/D4NC5pulgJSLAXzLOGi
         lT2Rs42DjasnCDNXsHCyGy4Wu5S5EaUc7MCldiz80aAVrXrVOE4t1O5AGlVygNh3vk+2
         5W5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaJNbTU1OSNHjMASG9t0uLGo/eTft5We0Ab3lFboJM+O/rWMSxU4JNQtl34FtgGl23qg/nT6U6Mu6NkRyjhN4de0CE+NswKkVdUXZ51q8W5xEmKp6kpa0Ixs08j72UhQJ/SpWxkFRgg64aQbGLMZ4VDDFMPpiQT5n4WgfyFaoQgs3eLw==
X-Gm-Message-State: AOJu0Yx6bLAI6D3p7vd530JXVGlD6hN7/zpUKWXKyM+Ih2wzkfV9vu7K
	SvuyEuP9tHwmjJp2Achg/fY+J4VHviCOqNQ71PzfDdleFS/jThg9
X-Google-Smtp-Source: AGHT+IGPaMC0XhHsHhwnptYSy+Mok0UKBczZ6xj1o78WdsEI02e2cl95s18p8gldwOHqx5zFwwyGgw==
X-Received: by 2002:aa7:8b4e:0:b0:705:bd3f:1bc2 with SMTP id d2e1a72fcca58-705d71559c8mr11240347b3a.11.1718720613642;
        Tue, 18 Jun 2024 07:23:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b9c9sm9016435b3a.160.2024.06.18.07.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:23:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f76a4d07-887b-4efb-b20e-52979db31216@roeck-us.net>
Date: Tue, 18 Jun 2024 07:23:31 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <8719fc64-2b51-4b79-ba52-0a3b9216f2db@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/18/24 06:51, Paul Menzel wrote:
> Dear Guenter,
> 
> 
> Am 18.06.24 um 15:32 schrieb Guenter Roeck:
> 
>> On 6/18/24 03:25, Paul Menzel wrote:
>> [ ... ]
>>>
>>>      $ ls -l /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>>>      -r--r--r-- 1 root root 1024 Jun 18 12:17 /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>>>      $ cp /sys/bus/i2c/drivers/spd5118/0-0050/eeprom /tmp
>>>      cp: error reading '/sys/bus/i2c/drivers/spd5118/0-0050/eeprom': No such device or address
>>
>> That suggests that the i801 driver got an error when trying some chip operation.
>> Unfortunately I have no idea what that error or the failed operation might be.
>>
>>>      $ od -t x1 /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>>>      od: /sys/bus/i2c/drivers/spd5118/0-0050/eeprom: read error: No such device or address
>>>      0000000
>>>
>>>> sudo i2cdump -y -f 0 0x50
>>>
>>>      $ sudo LD_LIBRARY_PATH=~/src/i2c-tools/lib tools/i2cdump -y -f 0 0x50
>>>      No size specified (using byte-data access)
>>>      Error: Could not open file `/dev/i2c-0' or `/dev/i2c/0': No such file or directory
>>>
>> This should work after you load the "i2c-dev" module.
> 
> Silly me. Thank you.
> 
>> If you get it to work, please provide the output. Maybe it helps tracking down the problem.
> 
> ```
> $ sudo LD_LIBRARY_PATH=~/src/i2c-tools/lib tools/i2cdump -y -f 0 0x50
> No size specified (using byte-data access)
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: 51 18 0a 86 32 03 32 00 00 00 00 00 ff 01 00 00    Q???2?2......?..
> 10: 00 00 00 00 00 00 00 00 00 00 00 00 70 03 00 00    ............p?..
> 20: 50 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00    P?..............
> 30: 00 58 01 00 00 00 00 00 00 00 00 00 00 00 00 00    .X?.............
> 40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 80: 30 10 12 02 04 00 20 62 00 00 00 00 90 02 00 00    0????. b....??..
> 90: 00 00 00 00 a0 01 f2 03 7a 0d 00 00 00 00 80 3e    ....????z?....?>
> a0: 80 3e 80 3e 00 7d 80 bb 30 75 27 01 a0 00 82 00    ?>?>.}??0u'??.?.
> b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> c0: 00 00 00 00 00 00 88 13 08 88 13 08 20 4e 20 10    ......?????? N ?
> d0: 27 10 15 34 20 10 27 10 c4 09 04 4c 1d 0c 00 00    '??4 ?'????L??..
> e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> ```
> 
> So (00,b) = 0x00 opposed to 0x07 in your example output.
> 

Yes, that assumed that reading the nvram/eeprom succeeded, which it didn't.
The value might also be 7 directly after booting and before loading
the spd5118 driver.

Anyway, it almost looks like setting the page doesn't work, or maybe write
operations in general.

Can you try the following ?

dd if=/sys/bus/i2c/drivers/spd5118/0-0050/eeprom of=/tmp/eeprom count=64 bs=1

and

dd if=/sys/bus/i2c/drivers/spd5118/0-0050/eeprom of=/tmp/eeprom count=1 bs=64

That should only try to read from page 0.

Also, please try to set a temperature limit, either temp1_max
or temp1_crit. Setting temp1_max to, say, 56000, or temp1_crit
to 84000 should do.

Thanks,
Guenter


