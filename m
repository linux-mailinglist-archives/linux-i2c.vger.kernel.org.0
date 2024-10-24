Return-Path: <linux-i2c+bounces-7551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 268059AEB7A
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 18:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC8DF1F218E6
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 16:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF861F80A2;
	Thu, 24 Oct 2024 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nonI6kIS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B24139578;
	Thu, 24 Oct 2024 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729786013; cv=none; b=lDrlsnqgRfJwczUDW+AnxO+99Bzc7Vtv8bbtWZVUV5f/QFVp9ufnOzI/A7lJi+1rgv4r7ZH+I3XC5XnMDRbKatJsWBtgS88F5Ba+CnTh1L3pHGERCd6mqqsWYeY9NIprA9CF+X3wTlaodIk3bmZCM1INt44tbOp5AnsZu1YcOdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729786013; c=relaxed/simple;
	bh=/kwiBkUdrwk/ft8X37mw8OAYaR+w559zlg+w6Nu5+Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqp5+/Dlt/jXJMjcN2AGuqh9r8pPp/fpM/aROMXjE8iSyzGJLiZX6t0MDfc0S+p6ZIPc+6uXqN3paZCh6ufhyqWzF+qRulxZRd1mCBCY5/9xpr3mBRiEZ23pTBzAP49+XL+evjJ4h2BxdgMuxQ41mZsRU5UjaK7qj4hJH3pk7f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nonI6kIS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c714cd9c8so10330225ad.0;
        Thu, 24 Oct 2024 09:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729786011; x=1730390811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RMpYMGB8pLXbWeaijOZtSy80NUgHC2RS6rF8BuCiCr0=;
        b=nonI6kIS6pn3+C8nAn4mWFqxhLaUrTzJkuID9j4xUo6IzTxJLylJeUuc/OYioeoIHC
         A2VNVbVVMX7DEA1oF0i1OmV4sEeOl9v3Lq8L+Dl75a2RqaNOy2bkt8m4fPyd0ah9qLJA
         ZB4VpjFMc/YUeUy39hh+bkrHBZmjmVyOqJQ01aiXI+ytHnZZV3LPpXTCXfWYjhPpETeE
         SPidtFfVrzCez2XUqVpw7p9f7QtohfdGLm8GzvQZNqzvkhbzT8l92gcmVQ1+nJa1NwnL
         WXNGmKO8SvExzW2yhk7FeHze7Waw5Az99NiMg3LDyqrCZ5AWn9HB8gtgEyOVEU5areJ2
         gmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729786011; x=1730390811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMpYMGB8pLXbWeaijOZtSy80NUgHC2RS6rF8BuCiCr0=;
        b=aRIlzxe6FZgX1TwE2ca86ptMlmlaqg6RZvZHBGLkYvUlH4X8UJK/E5uLYX5IpUlCag
         Hw+jRJnCtXaBkTig10vNB3bqP5j0A3bqMMgdkKWwbLSUZfbm8LGcSNUP5L4TXqb/QJLz
         enO13rk/xYyjCICFvuqqOFjNClNNxiKyqhTULZgN7XRIMeNubhGn8EPHIpgnMmzKm+dU
         xKV5Se++Hdp9AWje0sJ5JSU1a85NKqn4qe03gWUL1kDZBwLosQyWVwt/ImgVv7kBUD2X
         BYWN7xLHTddS81g72pRurD7aknUxNXt7mkQnY5mnACuGzad+ydk2NxjlNqQaJviS36LK
         IcvA==
X-Forwarded-Encrypted: i=1; AJvYcCUHeI+XNMNWUxjPJb9BBNSl/K3ChNyEz8vlMIGHC3Uae7nGPdr2K3tserNgucAtA71dsOGI4tQYI+I=@vger.kernel.org, AJvYcCVNPjDzmMR+M/bmGApuoZbvxsYlhWDNRCWMIEcB5UXJvIrwE6NcqzxaVSDSMWbcOoFmgSMOpOlgju6c@vger.kernel.org, AJvYcCVy219ZuJoBza1OTSteR86OIwVMh6jkJ52tQH05TGm9uWZc7v/t3xtWGey3jkADevhwweIuLGMKrxhOCg==@vger.kernel.org, AJvYcCW1QVbur8twbHD+mXpxb/mRnRMdQmiJ00TGhONVhomqCRgjqFT1ugQ7j2uUKwQni/yPfUzdRLMmNStr@vger.kernel.org, AJvYcCW4v6sfGOkp03uiq/s3WcWJPxuxAszIDTqQeCEKVX2w9avjldvWnY/ZH3CtlzyQkbpv75fYbm8J@vger.kernel.org, AJvYcCWB62CW1uTIbf1wPNVoQnutOOevdxdEFykD9vM6lROCeqCiZmhCGj2YGSjuAgJ+uyHlklTfH/LlOKfO@vger.kernel.org, AJvYcCWwu8+YKT1HurfZiIV+cGHwd7ZtUnckbB+Hn5x3N05a8BaXbNT8pZjWsPZVQTpSGRJ3S0aA2jeIzJwFuE8zFBo=@vger.kernel.org, AJvYcCX0hHn0La0OjwBOjXvlo9osZ/Qa7fCUy0AhCWFRWuoSg/YpLUapUDV6olDSlI3NfJxuzuLXqtDhhTLY/s4=@vger.kernel.org, AJvYcCXBHs4zfEzsLgIpw6P9w+Bmw8QvHWvLhKQkEQUn8j5tdtxIT0CFiU+OWWQS+HZsIeZFmgh9OTMpIZXx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzihd3vDCKoB6N80ej+sq9qTMJygJLTL6Qrobgx26J+Nkvt3USo
	/M4PDR4gGDOBcJDxZIr2QOFEzPoSXR2scp5Qcl1yME/TUyqayaLL
X-Google-Smtp-Source: AGHT+IFVaoS0y1PnVxdLbIxOvUdsHIL8kzqzLHIcf0Zoa5OMyMBmDSTAU8jwn0PXfyPZekS3A5U/2w==
X-Received: by 2002:a17:902:ea08:b0:20e:55b0:3607 with SMTP id d9443c01a7336-20fa9deaa86mr94235495ad.2.1729786010468;
        Thu, 24 Oct 2024 09:06:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eeecf1csm74256945ad.17.2024.10.24.09.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 09:06:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <daab0b5d-8877-46ce-8ffb-0602164be5ca@roeck-us.net>
Date: Thu, 24 Oct 2024 09:06:46 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] watchdog: Add Nuvoton NCT6694 WDT support
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com,
 jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org,
 alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-6-tmyu0@nuvoton.com>
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
In-Reply-To: <20241024085922.133071-6-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/24 01:59, Ming Yu wrote:
> This driver supports Watchdog timer functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
[ ... ]

> +
> +static int nct6694_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
> +
> +	pr_debug("%s: WDT(%d) Start\n", __func__, data->wdev_idx);
> +
> +	return 0;
> +}
> +

That doesn't make sense. How is the watchdog started if not here ?
Something is conceptually wrong.

Guenter


