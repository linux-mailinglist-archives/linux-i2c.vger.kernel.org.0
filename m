Return-Path: <linux-i2c+bounces-10511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C641FA95194
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 15:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A033172D61
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 13:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AD1266B5A;
	Mon, 21 Apr 2025 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IauRvjVK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC26266B4B;
	Mon, 21 Apr 2025 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241762; cv=none; b=V9EvNxiv2tCVyZIppABnIUsupGCKIwiwOMWKscmYvcumMUezRh5dU6NmNBUeIm+agRh/l6NfQvTyeHUnB/EF3NHvrDGUVlErWpOrIJ7GINAE3KYr+vY6FVnD6nW1g3/p+jHfJATkrh/mQO+v6J2nnIsgHa36NBROjutjwqdI07I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241762; c=relaxed/simple;
	bh=qJqWayuNZmpDePvEoRWuFnlufN8ZpxE55HSp0B/rJkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDMhkGmmLK96OEwjMgUuB8SijDVoEonuaArQ9UUfpT4UkqwpIxn7/QhtQ7ssYj07X3X38CKc5G4zxEoB7uPVduEuM/qzTdbbwzrk8jnxSF7AbpbggwOEioWpsRTXUIqNy/vcH+m+Ca36LMNoRRrwDKXam4/0p6itUxm51NMkvlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IauRvjVK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223fd89d036so47668825ad.1;
        Mon, 21 Apr 2025 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745241760; x=1745846560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ph+HDWMuvWPZ+Mu4ZnMsCnDl7N32cOkdGDUFRXpgug=;
        b=IauRvjVKJdgnFYh4fTG0nbrFet61eZSpyRAdcR+ECtBhzjDUuT6QAKNbt54jJtmK8V
         60sYoa7eniMCcftFJsHNnSDBxfvVlOc1lxcJCDErOpO+HcVM+N2B9O9gS+D+hkbcSWu8
         edc7JRmLgHGGrDLqCeN+2JMYiQ/HjcrRr7o3ofnrsGzvb1Ynh4dv+g0cYEutxQGgNCNz
         1kS8IqtIavxr0qhpm22PUH+6hKSzfrlYdBdxj+XKqgHWOT9m0Fmhgu2V2bzxnKuEhotI
         L3GrR1nKQSfEVQNdHNRTUeigrj+aaOJDJCdwvMEnlKcB1FrxbEiuFxX26iO4v5yxRKwk
         5HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745241760; x=1745846560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ph+HDWMuvWPZ+Mu4ZnMsCnDl7N32cOkdGDUFRXpgug=;
        b=Ck1+Bb9s8TrDWqiqGaC6B80eWY8GaUnEEsxUbb2VRTxe+THRG5/OeJUwhCzRh1PlCk
         Z7eQjngbBFn4aLI5Wu2VjsVecegjjKpmMNyKmo8sVHSWVUQeKTpzNmW8DCeBB+PWfjdf
         OVbGEnmaTfl0s18QRbdKMzgSg2ZWBcQhWcuFJjdXuTRQnbQ6641lGYlBxus7Q5mruqae
         E77IqAjB4kCHXZgKrP+viCxgyEvUNCLaVqEIA5wpkZjbiGCLw8XFhUvkQ7tl9ZxhS24Y
         XZgSWkoGOchJD2w8MiOp4hrdFgYOpvi0FhVSw6Dp+2nuZ8FfL/o74l6Sc9/ZlNz+PsaG
         eE2w==
X-Forwarded-Encrypted: i=1; AJvYcCUONKnGGj2bu2VJLe9V9E9p5c712I8eKlliOe7pl0SofsFLRWao38TEXvy2zhPCVbFXbY463+ug4pU=@vger.kernel.org, AJvYcCUeK5NjgPrFAYCcw5Ib4HIKPtvSA6ghwz/k1xzKzmql26jLzWY0cezzu45O/lDIJDTPwoIseha6X40p@vger.kernel.org, AJvYcCW1KjXWi5teaGpqV+ukXBFtX+QXE5x+UZr40RlQFmNpJmMbaP5UrRoK9O4OKPqgFo/hRxpP7NMlngH+zpA=@vger.kernel.org, AJvYcCWf0vDHCgcdVYi9cWHJb6JPpoTUlk+i+yooqdgmdRvdVLi3BYHgySq5SrWUZ4EW5np32KCpaHDJgLnKRnrL@vger.kernel.org
X-Gm-Message-State: AOJu0YyZM1d0mPYATvKoFKSNrjFCF2hJ63QLBnd35Hjx2dc9jO3kWqfx
	75eym7t+pi/+lNZXVwlK9Z8jxidEOqw6omzRJ10AJxuDwYELzk9M
X-Gm-Gg: ASbGncuxjB5zCqXTMg2v+s6TNZuIi9uTxRYOr7a45KcH5I1rDfWjEgruxJRGmQN01zc
	uzqwhRhppAH6yKvOcWodvaG6oE70R2medaRIfThgqvP9OXv1z/3VzA5b4bbCp8HdKI2sFE5DDyh
	GfnkmG1J+sHPxUvvXIKc9U89YdhSMc6+axue940qCw58H3pGx3dAmSphc/D4ZLJi6VGloguLNnG
	EsEczjQH6ezxyEyay7hej3/ecZDNlxqpSsdlzr6OmMq5dTM8lB7+eUEKR5XGuGSls8jwZTWpvDX
	r0sdzwD64KO5PKpZl86SpyOlFsUWKN6NztC9WYH+pRv9Cw33PadOr+tcbKJP9sSo85j2/1nTV9Y
	4FhHURuzkaojwpw==
X-Google-Smtp-Source: AGHT+IFhGa7InPePWyZVNQoA9yhk+Gh5gK+jirkNokgaiLnPGgg29mXIPs2bswYRCr0oV9QW9ScPXQ==
X-Received: by 2002:a17:903:1aa8:b0:225:ac99:ae0d with SMTP id d9443c01a7336-22c53285c0amr196728555ad.10.1745241759905;
        Mon, 21 Apr 2025 06:22:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fdb805sm65167725ad.216.2025.04.21.06.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 06:22:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a10230ba-1ffd-4dc2-96ce-3aaee2e30015@roeck-us.net>
Date: Mon, 21 Apr 2025 06:22:37 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add support for LT3074 low voltage linear
 regulator
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
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
In-Reply-To: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/21/25 05:18, Cedric Encarnacion wrote:
> Introduce hardware monitoring and regulator support for LT3074. The
> component is an ultrafast, ultralow noise 3A, 5.5V dropout linear
> regulator with a PMBus serial interface that allows telemetry for
> input/output voltage, output current, and die temperature. It has a
> single channel and requires a bias voltage which can be monitored via
> manufacturer-specific registers.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
> Changes in v3:
> -
>   * Non-nested dt-binding regulator support.
>   * PMBUS_REGULATOR_ONE("vout") -> PMBUS_REGULATOR_ONE("regulator").
>     New macro needs node-name to be matched.
> 

Does that mean we can (and maybe should) drop the name parameter
of that macro ?

This isn't affecting this patch. If needed I'll do that separately.
Just asking.

Thanks,
Guenter

> - Link to v2: https://lore.kernel.org/r/20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com
> 
> Changes in v2:
>   * Separated dt-binding for LT3074.
>   * Added __maybe_unused attribute to of_device_id. This addresses kernel
>     test robot warning.
>   * Added entry to MAINTAINERS.
> 
> - Link to v1: https://lore.kernel.org/r/20250124-upstream-lt3074-v1-0-7603f346433e@analog.com
> 
> ---
> Cedric Encarnacion (2):
>        dt-bindings: hwmon: pmbus: add lt3074
>        hwmon: (pmbus/lt3074): add support for lt3074
> 
>   .../bindings/hwmon/pmbus/adi,lt3074.yaml           |  50 +++++++++
>   Documentation/hwmon/index.rst                      |   1 +
>   Documentation/hwmon/lt3074.rst                     |  72 ++++++++++++
>   MAINTAINERS                                        |   9 ++
>   drivers/hwmon/pmbus/Kconfig                        |  18 +++
>   drivers/hwmon/pmbus/Makefile                       |   1 +
>   drivers/hwmon/pmbus/lt3074.c                       | 122 +++++++++++++++++++++
>   7 files changed, 273 insertions(+)
> ---
> base-commit: 86d264b68309d9f9804db4079642b98104ca15df
> change-id: 20250124-upstream-lt3074-123384246e0b
> 
> Best regards,


