Return-Path: <linux-i2c+bounces-3719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1560E8D560B
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 01:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 932111F27022
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 23:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BD018399D;
	Thu, 30 May 2024 23:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnrSDldG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E959374042;
	Thu, 30 May 2024 23:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717110656; cv=none; b=ul/uKCyyTj62jvSzJ5SFaWjaI4S+Ue+9R6uzLA/CtEkGL9wMVlGvBw9nkedc23UZojplThGasth0r5D0Hc0KAN9T0reMDprPeF7wOiCi1pyNI5mKMQ2jNQlRZNaXhNh7HDNMcfhtLDMdGoWqBHxfIDYePBGtLBuUyEgr37QwdFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717110656; c=relaxed/simple;
	bh=YNalXi1tlMIwiWUtgeVlV33Nwzp4FhDLUFPpBV//veI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prxiRI8Q3k1o5WAcdFKTS5bPCLI5hZnO3KcImzyOpbqdjgyVeq7P3uqnv8xtduJ4+gE8/02c74/SuryJaYb8JLudzk5EXfqS50UqBnZEGYDyXDehZAxtlFBAdTQzRf8SBj2lENPY2L9qJAz8EYzw8T5LgTJVnV2+ef17oIcm77g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnrSDldG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c1b9152848so696011a91.1;
        Thu, 30 May 2024 16:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717110654; x=1717715454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iuYDubQbfgS6ImA1IZHh/wPkk8r2wQoxsv5vRntBlN4=;
        b=BnrSDldG7BT6RseaxWTz/b8o+t6VmuNNXL0cXKFkPfevyLDLfH33nq5DLZAajN/NWs
         PqcfQIKvaFQNk49eximeg6sPkarSavnKEKqnIU90x2Q6FGFJB5/vSMpQ1/T2Sx9Xc9vS
         2wenDFebRES++T6zo0TFYwfuGDjONYk/gxb0K19yC8pouoA6KS5Kv5+0jK2IYlgMD9yT
         ONbe0IL/8FWXk8fO161XEHdiEt0KI+cq2qqdsDfyKCXMeYp2DZVaQfYp25EXEQ5yZGP/
         10MDwQSgGaSJ5e/7ZnmHmyE3sA3ofic18T9tnIFtRJrAB/AavuKe/Wtfzr1HiucC71lf
         qi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717110654; x=1717715454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuYDubQbfgS6ImA1IZHh/wPkk8r2wQoxsv5vRntBlN4=;
        b=eXdlFukB1cVFFE0yaR4lI3gpkyhHKB+f+bitfU7nNEKdWvxKW2dEC4Fx/n0PCnBVJY
         r8HiG6s8fZsUGgkFggnR21J0ILhXppZD3OVwR/gX/HGON8MRQF+ddqdo4n8gZlp/RCzO
         IblW+1C/kZ12q8G2mvXAgGk16MazZtAVVCfwFublic3HFF2Rp+HweiftITsY0myfgoEN
         EjNWu1MHIhH42WXYzjcExpI7UOFo1cAjUau//fEm0JIc651k3OBW8eN0aHIaI04hGBBm
         JeGxL9NyIdqMNRlD4wVoNkLZ3xG2f4G5dOjgvSoEI8r87WPMtSc7h5FwCqvsegaUu+FQ
         kQDA==
X-Forwarded-Encrypted: i=1; AJvYcCXaVoKQBn9XnrxK15bgPJeWGOSSTAB20ZvC8XQFFzM68exUIxKuhZKk/IUsVD7vnKw3shwvf8rXPrqQQg0vR76aHfM2oGlCqI6MB6YH
X-Gm-Message-State: AOJu0Ywt5pULllEZCYFLgSgdqj+ArlwpNNoBs858ng8XY0JCz9tdL87i
	A/n5FWgeLG7GuloxHbfccos8CEjm5oIZNThsMniKMyWKYHpaH9ByWSStNw==
X-Google-Smtp-Source: AGHT+IGBT+UgqcOvSiVj0Yr/nBYWvgHyWVtyNRNzJkL9IRXCU8N6xhpTn7uk37i6a2qtz5X2enjFMQ==
X-Received: by 2002:a17:90a:7e13:b0:2bd:efad:88d with SMTP id 98e67ed59e1d1-2c1dc587db7mr160665a91.28.1717110654213;
        Thu, 30 May 2024 16:10:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1ac24c02dsm1831528a91.33.2024.05.30.16.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 16:10:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c9de8d07-90dc-496a-9d7f-e7f0c00a934e@roeck-us.net>
Date: Thu, 30 May 2024 16:10:52 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: piix4: Register SPDs
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240530-piix4-spd-v1-1-9cbf1abebf41@weissschuh.net>
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
In-Reply-To: <20240530-piix4-spd-v1-1-9cbf1abebf41@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/24 14:49, Thomas Weißschuh wrote:
> The piix4 I2C bus can carry SPDs, register them if present.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> For my test setup see [0].
> While the spd5118 driver in that form shouldn't be probed this way, the
> general principle holds true for the other SPD drivers.
> 
> Guenter offered to test it, too.
> 

Perfect. With this patch in place, I see:

[    6.679772] i2c i2c-0: Successfully instantiated SPD at 0x50
[    6.680341] i2c i2c-0: Successfully instantiated SPD at 0x51
[    6.680905] i2c i2c-0: Successfully instantiated SPD at 0x52
[    6.681466] i2c i2c-0: Successfully instantiated SPD at 0x53

on multiple AMD based systems with DDR4.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks!

Guenter


