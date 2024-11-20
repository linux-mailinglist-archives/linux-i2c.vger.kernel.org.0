Return-Path: <linux-i2c+bounces-8089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFD99D3DC2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 15:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B557AB2A8D4
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 14:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E3B1BBBD8;
	Wed, 20 Nov 2024 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hod7eXOf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97CD1A9B20;
	Wed, 20 Nov 2024 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732113584; cv=none; b=TDdV1jeH0tBjenImpHy35MuO73QXga5p4Jcr0DGBOxpUKY2Cm/Xb/0OyUNgrJSSXAAwQiM44zXAf5viOXB8vu0fx6AmJlcwg4AGwPSswsAJk97K9ysQYEyDjjLNoUKs2f4EH1WL01yHYxsHM2AiZbpd3FZu+lMqbBiVTm9Yl4Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732113584; c=relaxed/simple;
	bh=jCOqnJI1jSfMbdikbviwyyXbQRNLkjTouIoyWIbfo1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmEojRS1qI/B+82qZ1ERiszHcQcSzOT3MRh22rS47JsDqwHERT6H0InxvqMoWDb1CFbvawYizYREwpMyjfhymv2YT+DkEoAg+yuaHGBrJegrJT7wn9bk1xSRizJwtWOxFUejrIgwWiGpRYIjFCumaDYj+90cV7c5KPtxduRCgHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hod7eXOf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21207f0d949so42397885ad.2;
        Wed, 20 Nov 2024 06:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732113581; x=1732718381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zabGifVxpVy+avsG3rCPsHo6MQzgl8H9BAM18fNKYAU=;
        b=hod7eXOf930nJiau4zfm8AMUEribF5ND0eWAOBK73GrLhOgiGkui2LzdQcNWsCro2S
         9rub3BaTUZ6NBlkBVbiVLgoUmx3sP2AhV4GHab4Xq2T/CPZndX9AUgdo9ZoceQk9va/x
         BxS/DRQtkfM8hc1A30ogMLAfBiUCGkxZXIHIFBS5ENgkd8NoUROfHlNeyXfE0F2tHjLR
         VEax5722Ih4TqlYUR7KHZabfcA+8y3cngV5npfuPT9IaZCG0VAKiCTZ5FZ2Joz+aBH2U
         ha6Ukc7Y6xxEtrGHTaNHAg7gefm1jgxX6MvcVffOPPZ6Q9h7TEgDjzCzV5n/eztL+YrE
         hgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732113581; x=1732718381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zabGifVxpVy+avsG3rCPsHo6MQzgl8H9BAM18fNKYAU=;
        b=vNinHtGuaFX+HQNEiqp/hCbzRHHjhPi8WvoSV6jbeCRmc4sdj6mdPlBjAZRWVTMMPh
         cTCsfqeQWbPQUdrYjRuc2/xBFVsQDMtqH/nLlafEsMZjRPUpgGpXKMX99LQ6jxGe0e0b
         lAL4C8TSkTYJJfsX+y+iW+VdP51JuHP6NFBNpH69CuMn6Lf/93BK5kwFj/GkQT4D5zbT
         UJ767YBk7rVRyZf/mpy0P4wOyOgpMT1KTHXKfvlfJbIFprg+Uj3a9D1DUqjlgoOTRRfl
         ROwJJXQPl7ll9Cegem23eklp/2pIEadU7dX5XJ/NGY9jG21igqJhEw9Z5S3AnqMWcO42
         fkgw==
X-Forwarded-Encrypted: i=1; AJvYcCU6GbcHQku7IY4ZAeV1I0BuuBl7BC3WF8nQDIVU39PZFsB7KG9vC+qj3EKR1VZT1kbL9stnuekLTaZU@vger.kernel.org, AJvYcCVXxm3wwvdHDQjfWFVH52mKGiF8GdcNr0n1ponBqi6sTVyoIte/p1OBBC31BbnCWocnggR0XJ/qSYoP194l@vger.kernel.org, AJvYcCVsowFz3B7gKy5C7JTynrXoMsUprjHAYtybvMPxczRCFO4ynPzJw6c7NAQcJV3FXe+0HJlyI7ko2fze@vger.kernel.org, AJvYcCVyGHIjPeDjh9iff5rxtXK+MMFct+YNSCikYjy5evGDX90Ovdqee5jSdR67E2/54bvGoWWz8Tkg92wD@vger.kernel.org, AJvYcCW+zCXjUYTQwdIpctE0nQyhCJFsFz+KQd11iX8Pgz1wtHkMOupmxDbWiS2qJduGy7wMWWwRehCMu11VBKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjay+rJPRB51VCxYPJmr91PxhhyM5ONAb0rScrSPWafLo/ZxPm
	4BGR5lGkQRDrPngZThyVC/ZbmyDs3p4KvvxDTF2zgNz//3UiTuq+
X-Google-Smtp-Source: AGHT+IHRii0hD75xSkktHp2W+X5T+R33piATj8nmXJpALNeeMbH64uAdw6Rbga1ucavvsOxTjAgFvQ==
X-Received: by 2002:a17:902:ccc9:b0:20c:8dff:b4ed with SMTP id d9443c01a7336-2126fb34cabmr25636265ad.16.1732113580802;
        Wed, 20 Nov 2024 06:39:40 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212037e004asm65327835ad.205.2024.11.20.06.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 06:39:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f1b338a0-fe51-48a1-a35e-41041df79b63@roeck-us.net>
Date: Wed, 20 Nov 2024 06:39:38 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Radu Sabau <radu.sabau@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
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
In-Reply-To: <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/24 19:58, Cedric Encarnacion wrote:
>      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator
> 
> The LTP8800 is a family of step-down μModule regulators that provides
> microprocessor core voltage from 54V power distribution architecture.
> LTP8800 features telemetry monitoring of input/output voltage, input
> current, output power, and temperature over PMBus.
> 
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
>   Documentation/hwmon/adp1050.rst | 63 +++++++++++++++++++++++++++--
>   drivers/hwmon/pmbus/Kconfig     |  9 +++++
>   drivers/hwmon/pmbus/adp1050.c   | 72 +++++++++++++++++++++++++++++++--
>   3 files changed, 137 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/hwmon/adp1050.rst b/Documentation/hwmon/adp1050.rst
> index 8fa937064886..1692373ee5af 100644
> --- a/Documentation/hwmon/adp1050.rst
> +++ b/Documentation/hwmon/adp1050.rst
> @@ -13,18 +13,43 @@ Supported chips:
>   
>       Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADP1050.pdf
>   
> +  * Analog Devices ADP1051
> +
> +    Prefix: 'adp1051'
> +
> +    Addresses scanned: I2C 0x70 - 0x77
> +
> +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADP1051.pdf
> +
> +  * Analog Devices ADP1055
> +
> +    Prefix: 'adp1055'
> +
> +    Addresses scanned: I2C 0x4B - 0x77
> +
> +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADP1055.pdf
> +
> +  * Analog Devices LTP8800-1A/-2/-4A
> +
> +    Prefix: 'ltp8800'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/LTP8800-1A.pdf
> +         https://www.analog.com/media/en/technical-documentation/data-sheets/LTP8800-2.pdf
> +         https://www.analog.com/media/en/technical-documentation/data-sheets/LTP8800-4A.pdf
> +
>   Authors:
>   
>     - Radu Sabau <radu.sabau@analog.com>
>   
> -

Unrelated

>   Description
>   -----------
>   
> -This driver supprts hardware monitoring for Analog Devices ADP1050 Digital
> -Controller for Isolated Power Supply with PMBus interface.
> +This driver supports hardware monitoring for Analog Devices ADP1050, ADP1051, and
> +ADP1055 Digital Controller for Isolated Power Supply with PMBus interface.
>   
> -The ADP1050 is an advanced digital controller with a PMBus™
> +The ADP105X is an advanced digital controller with a PMBus™

Please refrain from using device name wildcards, There is no guarantee that
all chips in the name range of ADP105[0-9] will have the same functionality.
Either name the chips, or say something like "The supported chips are ...".

Guenter


