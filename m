Return-Path: <linux-i2c+bounces-3795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5527E8FB55F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 16:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5AF81F222E2
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 14:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE98143C6B;
	Tue,  4 Jun 2024 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO4ZL1q5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A97113B5B7;
	Tue,  4 Jun 2024 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511512; cv=none; b=N/Td9l/n/pLDJD9tU5+2RoM2Cc59zB4L8+D3rXGmrNSPTN0/OtHQFWVoAHxvUobXkDduoAoLytZxk/akMyxs88+AQrn0/jt8P2JoI+zXYgFKlHIJSHWhxNksV/TECP2YZRUIubr/B+Ax18omrdBz80t6EVdzc4ELVD+WJwjo//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511512; c=relaxed/simple;
	bh=RM+SjVMkg/K7DFppKMcbKWOM/ucNqttsWoRCyloK3M0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuOKF9oFTKkOOZ2+95Mfl+y/2dXYBl9VQAy6bvPuxkS3aNJzbAep5iB/kJn6mTlgkFbmsFW9a7ThlpHQnWQuGf4HWLrUkimhJQIhK0XrWIuyK6iwqzA1kHuWfNt+plpP+1TBjOhEPH1xxahan0/W/kJa/TexAAkF+5UZkiO5XMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO4ZL1q5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f44b5d0c50so42498165ad.2;
        Tue, 04 Jun 2024 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717511510; x=1718116310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=btxrm+NJ1/xNKhjXV8pJNpI5p98TsdjFZzhEY1yUR+o=;
        b=XO4ZL1q5Ew+X4qTeHyOhMulVEyE9bRGiut1mkP/abZj2XR9OLrjeuDgdTJQo1iwyYb
         qE8I5yU7M8iT6N0cMRKjNFESEOZao9vPpBbE+kiRYpaKvLV5jboypWfzYwwGL8tstHLL
         3HJKwzftJLAlpH6Fn3wwgpolUudMjbEWVsnYYy3MsX6NCBO1j/2OPtu1aRYoKngjY0Wp
         v7vhkKNNNIHdzYEs8qS0XjNVkjPW5u3d55rh9JCAzsWnkH5Ndv6SLoSRzzy6e9RIs4JY
         qEv/Dv1OROq8fRAudY3BsJfsb3fwauoFn8HTnnDsdqBtyr6l01j/qAG7QnBm9rKMw7I6
         jj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717511510; x=1718116310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btxrm+NJ1/xNKhjXV8pJNpI5p98TsdjFZzhEY1yUR+o=;
        b=pt2WqIMr45y5JKU20ZxyhDv2bzCwnoqM6GRwnCsVYfbc30Ec2CYnSBzuEzCgTP5U/k
         w3aIXia12VJooypwxyHLrEaJaihAtHnQt/RmuLmuM3fG0ATZXcBCEgEo0UNuA6qG6K3M
         n+Hcdj0LnD7+ivh6LxzjCyp3GBCO227IOCd0izISmTjsVpSVHI2CpokVEyPqMZPpG0OF
         +C55v1XaNAfkrVY2G0HOjLDbT981u2j5TNWazFqV5WSYVuFAnu1lMbekoMgKN+n2kx3R
         gV475asx1WraRRaNJpXPNtizoWeu3Xg9zq9ypcw2osucTtddqzpVpnLgXHRwApWpAmcl
         GXCA==
X-Forwarded-Encrypted: i=1; AJvYcCUKuckHThmOua+rI8RbLf0zei5GFttQCQ+HlR1HZU5fEg77902WKKDLANmzA86u6UcD6i17g5RGG3b62R3EclmysfVZNCDZH1Y81Sd6mTK8WS1bwDkKjvqhfE/DbP5xjWG+yYc2daBmVUDPyr6DXGg2tduxgTr3kIsdmIWFfFFG9wh0MX5a
X-Gm-Message-State: AOJu0Yx7YrA1iR+edfz8afguLZZModdTU/ywk437J9jpvi3WXOhv65BN
	/wKFxMtCg9+vnMb8+g8w9FJwCfPYsxmB6OGiSB3JYP8hyvSOw4Of
X-Google-Smtp-Source: AGHT+IGfgO9f/KQcrZNeBmHYEnduCT8loWCjHxpEbGwARcRqv9BttQMFRx9GiCUS8Qh+vo45YcDpSA==
X-Received: by 2002:a17:902:fc48:b0:1f6:792c:6372 with SMTP id d9443c01a7336-1f6792c66e0mr70220135ad.47.1717511509717;
        Tue, 04 Jun 2024 07:31:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dde56sm86252335ad.165.2024.06.04.07.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 07:31:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c25ff311-7742-46b3-a2f3-77d7b6a37ab7@roeck-us.net>
Date: Tue, 4 Jun 2024 07:31:48 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] hwmon: Add support for SPD5118 compliant
 temperature sensors
To: Stephen Horvath <s.horvath@outlook.com.au>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-3-linux@roeck-us.net>
 <SY4P282MB30639393B10CC313292C936BC5F82@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <SY4P282MB30639393B10CC313292C936BC5F82@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/4/24 01:48, Stephen Horvath wrote:
> Hi,
> 
> On 4/6/24 14:02, Guenter Roeck wrote:
>> Add support for SPD5118 (Jedec JESD300) compliant temperature
>> sensors. Such sensors are typically found on DDR5 memory modules.
>>
>> Cc: René Rebe <rene@exactcode.de>
>> Cc: Thomas Weißschuh <linux@weissschuh.net>
>> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
>> Tested-by: Thomas Weißschuh <linux@weissschuh.net>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v4: No change
>>
>> v3: Shorten JESD300-5B.01 to JESD300; 5B.01 refers to the version
>>      of the standard
>>      Drop unnecessary 'attr' parameter from spd5118_{read,write}_enable()
>>
>> v2: Drop PEC property documentation
>>      Add note indicating that alarm attributes are sticky until read
>>      to documentation
>>      Fix detect function
>>      Fix misspelling in Makefile (CONFIG_SENSORS_SPD5118->CONFIG_SENSORS_SPD5118)
>>
>>   Documentation/hwmon/index.rst   |   1 +
>>   Documentation/hwmon/spd5118.rst |  55 ++++
>>   drivers/hwmon/Kconfig           |  12 +
>>   drivers/hwmon/Makefile          |   1 +
>>   drivers/hwmon/spd5118.c         | 481 ++++++++++++++++++++++++++++++++
>>   5 files changed, 550 insertions(+)
>>   create mode 100644 Documentation/hwmon/spd5118.rst
>>   create mode 100644 drivers/hwmon/spd5118.c
>>
> 
> It seems to report correct temperatures for my sticks, so I guess:
> 
> Tested-by: Stephen Horvath <s.horvath@outlook.com.au>
> 

Thanks!

Guenter



