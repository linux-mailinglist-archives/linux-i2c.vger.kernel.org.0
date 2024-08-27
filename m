Return-Path: <linux-i2c+bounces-5834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C710896181C
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 21:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E6FB284A82
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 19:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3950C1D3622;
	Tue, 27 Aug 2024 19:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUeOSPql"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595881D31A0;
	Tue, 27 Aug 2024 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724787522; cv=none; b=pEsQxX17KzliVtO2HNYq2zgBeHFiJpK4a+oBDfQ8wW4MvQOCQSn1qQjiW5NEivQiMCBO/JlZHJwrOXCcRXQ8chjvxFo09d/dnlThL4yC3fy6jPYakcfLAMFph5zKKM6oIhrA31O5lgwFwvx7Y1HCzQvNo9KGwbF5RyOSQRu+qr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724787522; c=relaxed/simple;
	bh=yFZuU75O2a3XWtAo8iThaGrJalFhpiVVScFMeOOAXcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpLak7s4D8INWFWO6gpkWc+CaKiTOAiId9xWaE98gGoh5CwvNb/p/NP99NIOF51T0JGnzE1oOzJM8HS865Oxf2oieMVMc6T1rlC6F1YN2njqsP0dZUSauKDpaHsVY7fSeozmvRFMCv0VCmGnkiPQjlwngFVuxMuEXCzfVPQ48NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUeOSPql; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d3c9a67eaeso4333729a91.2;
        Tue, 27 Aug 2024 12:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724787519; x=1725392319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oVOXvpyxwdjOnesfGfT0Q7QN6OLcbJzHuSO6UMrackY=;
        b=SUeOSPqlnLjgTgD2pJqKA+eBCyH/AGc3zqLQAR70697wg0eZH/UIvpO6yNK0iAqqFY
         45kzcFlqt6o8qRGi2UiRNs5afb49sVZwxOrIXnt2NwuKFgUQjv9nCh/eutnhuonRFJEe
         q+S64auGUGwcCiPEwPH1SEL855Vy8ZH79K5GWxpsq8G2ZkZNfKJuKNA4cAxlCEFLU+NQ
         tfmTUdKSmcw2JuXNFLKLqf3yR/SMvvUWWEUaSDZRnLe/T48DiXUAhL7Qyr9C9uH+VcRy
         4hUfKcW2aZpOO1l2IMPMhW13/bFtdc7CkZ4iw5XYbiKaW9pc7PXUvpIXh88r6po6hGn0
         Jh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724787519; x=1725392319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVOXvpyxwdjOnesfGfT0Q7QN6OLcbJzHuSO6UMrackY=;
        b=DcU4f9RzPnWn+IOz7RJop97hbQZKGfuWJTz+yQN7zyTP1524gS7RbKXyE2khS2E4hn
         QtftSUJNtaUmT5hbLj/CghO3xPFHLz0KU+ySVGwgFV99wCPtMTIACP2rdQejeyJ7aea8
         W81TUcZJ9oZzBbMfG5brkMVUA+2p0uk8mfK/0sulhpGObn9B8yUVPJ3zS/0x7bpXn1DD
         3PJmbNIqPAB+bf8tORvKLzVDCCBcfeD0rcyJOuq3C56gCpoYFiiNefwqS77437XOhjXf
         RLx1N8bVvfqO7qfW2HpxNw9mifYUEDdonYyzuTDdRTGtOGnGJ637hnILHfLAXWujenPx
         KtZg==
X-Forwarded-Encrypted: i=1; AJvYcCU9s7AJumj3oqdsgMxbrnD8durJji+wDoK+VILM5WiGQsqVF+lI7jYhFgaYwM4eSFFD+sg6FB/IVkbU@vger.kernel.org, AJvYcCUPr7iS4+N7LJiqRuJDJYdGzTQkZRdOm505//ATdV4KXzF+r+B7mZswla8OJHYL31MOLvwuC6zZCeghwLJwQMk=@vger.kernel.org, AJvYcCV+Ho+sDEuKKmfX0PnSF6rGrTi79HmpyTtNtyezGh6IuUDa2XdrWGUrK1DQyBDfX+qf3QzYY5lRbt9S@vger.kernel.org, AJvYcCV4RaveAVDoxYkDujP16WIooh+xSP3e/2axdCeyYrRhsirXFwOlHKBYamO+DnPded2lyHKnWoHNrvEu@vger.kernel.org, AJvYcCWCIE54qVI32zOGzVMSde0ffuViKTuhX5rS9Yf/w0lRpd4asnZ6CSMyU6pvwm7zBvklWpSQGyGwIYth@vger.kernel.org, AJvYcCWEEgiaM472iCBK1TBn8GI8Cx47jn7bez/w+4GLQhKY78kv7/qTeGFhc7xUwZ+2Awb5i4/ZtPBmJiAw@vger.kernel.org, AJvYcCXvD5di5VknW6nn29J7nmTXkQkORm7+IBEpHZ/QZt+jNpnDEX4bOUrWag2eu2KEhVdNKds/5YHJbvyLhJ8G@vger.kernel.org
X-Gm-Message-State: AOJu0YzaF5WwU9grZH0zwWo3wkZjx5WNWZvRZzRVGg/Y4rx4VWpF64JS
	wrcsJWN1B0FcYAlX/aB3iL+TbYJHqCwq9iAl9nXl7ypvGpKyOPfv
X-Google-Smtp-Source: AGHT+IFjNqODR2yVRuTuQyHMcuWfTgB8LTsosBTWw0X6poYpFrx4jThi3iXVZldpKoOk5Dlv8j+37w==
X-Received: by 2002:a17:90a:564c:b0:2d8:40be:263a with SMTP id 98e67ed59e1d1-2d840be26b5mr824041a91.34.1724787519426;
        Tue, 27 Aug 2024 12:38:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb8cf61bsm15010475a91.9.2024.08.27.12.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 12:38:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5254cf14-65d1-4ffa-a1fb-265a51dda37d@roeck-us.net>
Date: Tue, 27 Aug 2024 12:38:35 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] dt-bindings: watchdog: Add rockchip,rk3576-wdt
 compatible
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andi Shyti <andi.shyti@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Lunn <tim@feathertop.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Elon Zhang <zhangzj@rock-chips.com>, Elaine Zhang
 <zhangqing@rock-chips.com>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@collabora.com
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <20240823150057.56141-10-detlev.casanova@collabora.com>
 <612a447c-8a74-48c1-8470-280dddca8d19@roeck-us.net>
 <3262963.l52yBJDM9G@diego>
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
In-Reply-To: <3262963.l52yBJDM9G@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/27/24 00:20, Heiko Stübner wrote:
> Hi Guenter,
> 
> Am Samstag, 24. August 2024, 18:44:29 CEST schrieb Guenter Roeck:
>> On Fri, Aug 23, 2024 at 10:52:36AM -0400, Detlev Casanova wrote:
>>> It is compatible with the other rockchip SoCs.
>>>
>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> For my understanding, does this Ack mean you expect the patch to go in
> with the other patches?
> 
Yes

> Because in theory this patch could also be picked and go through the
> watchdog tree, similar to how the saradc binding went into the
> iio tree already.
> 

I thought it was all supposed to be pushed together.

Guenter



