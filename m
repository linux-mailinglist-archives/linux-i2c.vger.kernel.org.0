Return-Path: <linux-i2c+bounces-6450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 865AD97257B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 00:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01D68B230CA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 22:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FA118D65D;
	Mon,  9 Sep 2024 22:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeXp3wMd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6317912E4A;
	Mon,  9 Sep 2024 22:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725922369; cv=none; b=Jb2uSVXWRoP4/a+8ZgET5uoly5W6wKCWjS1DB6vjgPYeS9EsqHBO6PCAlKPpd/JkOBBWn5tN0VnF+o+fr4A0Iw+O4jrHp5jrvylGaoJie72CA4SfLKcNW74+XjMFTuGWIq3hJABhBPdfmrxryDlORc5qTixtfO39/VuGZy/wVic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725922369; c=relaxed/simple;
	bh=j9EFDV9sYrtEDiXVgpvtc94jXA3PjLoxr8RPArha1xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1Vp3pwc4aZKFARAT4XxKuVxBed4vpW6YQbUlDa952o9xwr0/fBYbtro3YnYWsmBKlB0QZuCdrLDzMK55LK9rfFB4wCDuDowc94dEmfwgX36Di+qTuB+Na+837SH0emYClsP7kmbwDOB1XalQbJn5WRaVTravF/+69xsrf/uW8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeXp3wMd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2057835395aso1378395ad.3;
        Mon, 09 Sep 2024 15:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725922367; x=1726527167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lpm3Ea7WR5yAtk5e1WXV8uahstI+kYpTWiYGmkEDFDY=;
        b=AeXp3wMdXITXPd2+oxj3ljXxDnD3vNGPyfMs3yuKNXTS59DojJFYEkkLuRIC1tac/E
         q3aRo1gB5FN7X6V97tXw+eK70o2szQcypsQpSV9Qg9VovToSUYkvRQSz3U6aTwjIUQWV
         tDpDtYQaryOpyTzTh+Tqwdoyd0It3pc3b3wLXzNK0BQ2nYtevqNVzJwndeC8NQzSX7Ke
         rt4XdjIQdWmTsdq2lMloJc/Ld0fblD1HoP/ZyCe1fTnIVxvxSHKqxEPdnzvP4j113rPk
         XN4irgnb1949L/l2tY1zCdzCoOyQx8tMSUCnoDG10Np3cOUZXfBLIVKgdVybSz5sjEZV
         fe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725922367; x=1726527167;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpm3Ea7WR5yAtk5e1WXV8uahstI+kYpTWiYGmkEDFDY=;
        b=HAVrl7xpRv7ghsABagcbGgpNdZKzCiCKpkJkX+mygILasM73mNbpKD9gqdu13nPyxy
         52wFbzO7wRDdvWuxp0ywH6xEafeWE4yUjWn12KZBaLstYBqV33dsvckCKYD39dNouCxo
         hfR2rlAdAyRG5lgQsuJlTlw3Rf9M5lsWDmD4kWpyj+DnuNfxVJFOiY7BSkGLfiWzT7Es
         YllwQwclxOA5M5w3ilMCpcvOdI9oa6OPfIpZtlnbg3jDapPb73nEBTlr0vTEJFTrKoZa
         /jFszZGW2wL0SB83sbJ4Ler+54WnCqI9iZbgw/oYC7moKgECdjTAEv2A3HiAN8ojIPFg
         BWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxQrBWjyP6/FWwffBkRXVPmnqkTBzC069zauiZiHftmwXbsn9oDTfKHn2vGZxLOghXqYRsk89OyH6P@vger.kernel.org, AJvYcCV5vSF+F2SHuvIpwjIVfhblXxIzmy1rS4t1ekSaHnh9pSWSdZZSXkKLaLS6a0FoVO3bCOpi79NiJFdkjrb3@vger.kernel.org, AJvYcCWJc0E3eA6+6cIKUqpZhcfKNzDIuO4PsQw7iF9siMIVozF3LQ8Q8FDJwt7JqfC66OLo/I3nb98K8qdy@vger.kernel.org, AJvYcCXrrQoWfGCe7WYs5kJYVsSAp5DuEvqBbMN9Ettpsj5kAL6TlizXVXKQBhLZGWz9aK97ZxoLXdyb6J4N@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl6/du+E2UPeB8atB8IA5qwg3mXyveSIw6y0w03oKQy0GQVfGa
	ONLIRh73fo2dPpp+NVWccVR8PQ0/++Lv8zkvMngNLvV3T9kHiNN5cPz+RA==
X-Google-Smtp-Source: AGHT+IFLXsnm5oeh9R4t8rL6BH2FtMB/1F7cwROgtTr2fc91uRPANpRJFI6B9dEHSTvx9HlDirzR/A==
X-Received: by 2002:a17:902:e54d:b0:207:15f4:2637 with SMTP id d9443c01a7336-20715f4264dmr103848225ad.12.1725922366252;
        Mon, 09 Sep 2024 15:52:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f3261esm38351205ad.272.2024.09.09.15.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 15:52:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d0d53027-8897-47c3-94fb-7e369bff8f18@roeck-us.net>
Date: Mon, 9 Sep 2024 15:52:43 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: (pmbus/tps25990): add initial support
To: Jerome Brunet <jbrunet@baylibre.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
 <20240909-tps25990-v1-3-39b37e43e795@baylibre.com>
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
In-Reply-To: <20240909-tps25990-v1-3-39b37e43e795@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/24 08:39, Jerome Brunet wrote:
> Add initial support for the Texas Instruments TPS25990 eFuse.
> This adds the basic PMBUS telemetry support for the device.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   Documentation/hwmon/tps25990.rst | 141 ++++++++++++
>   drivers/hwmon/pmbus/Kconfig      |  17 ++
>   drivers/hwmon/pmbus/Makefile     |   1 +
>   drivers/hwmon/pmbus/tps25990.c   | 474 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 633 insertions(+)
> 
> diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
> new file mode 100644
> index 000000000000..7b3ef724008a
> --- /dev/null
> +++ b/Documentation/hwmon/tps25990.rst
> @@ -0,0 +1,141 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver tps25990
> +======================
> +
> +Supported chips:
> +
> +  * TI TPS25990
> +
> +    Prefix: 'tps25990'
> +
> +  * Datasheet
> +
> +    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
> +
> +Author:
> +
> +	Jerome Brunet <jbrunet@baylibre.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for TI TPS25990 eFuse.
> +This is an integrated, high-current circuit protection and power
> +management device with PMBUS interface
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +Device supports direct format for reading input voltages,
> +output voltage, input current, input power and temperature.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input current:
> +
> +**curr1_average**
> +
> +**curr1_crit**
> +
> +**curr1_crit_alarm**
> +
> +**curr1_highest**
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +The driver provides the following attributes for main input voltage:
> +
> +**in1_average**
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +**in1_highest**
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_lcrit**
> +
> +**in1_lcrit_alarm**
> +
> +**in1_lowest**
> +
> +**in1_max**
> +
> +**in1_max_alarm**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +The driver provides the following attributes for auxiliary input voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in3_average**
> +
> +**in3_good_off**


As mentioned in the other patch, those mnon-standard attributes are not acceptable.

> +
> +**in3_input**
> +
> +**in3_label**
> +
> +**in3_lowest**
> +
> +**in3_min**
> +
> +**in3_min_alarm**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_alarm**
> +
> +**power1_average**
> +
> +**power1_input**
> +
> +**power1_input_highest**
> +
> +**power1_label**
> +
> +**power1_max**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_average**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_highest**
> +
> +**temp1_input**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> +
> +The driver provides the following attributes for history:
> +
> +**samples**
> +
> +**average_history_reset**
> +
> +**highest_history_reset**
> +
> +**lowest_history_reset**
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index a4f02cad92fd..3559864e232d 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -510,6 +510,23 @@ config SENSORS_TDA38640_REGULATOR
>   	  If you say yes here you get regulator support for Infineon
>   	  TDA38640 as regulator.
>   
> +config SENSORS_TPS25990
> +	tristate "TI TPS25990"
> +	help
> +	  If you say yes here you get hardware monitoring support for TI
> +	  TPS25990.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called tps25990.
> +
> +config SENSORS_TPS25990_REGULATOR
> +	bool "Regulator support for TPS25990 and compatibles"
> +	depends on SENSORS_TPS25990 && REGULATOR
> +	default SENSORS_TPS2599
> +	help
> +	  If you say yes here you get regulator support for Texas Instruments
> +	  TPS25990.
> +
>   config SENSORS_TPS40422
>   	tristate "TI TPS40422"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d00bcc758b97..3d3183f8d2a7 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>   obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
>   obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
>   obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
> +obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
>   obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>   obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>   obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
> new file mode 100644
> index 000000000000..14290c4c71dd
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tps25990.c
> @@ -0,0 +1,474 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2024 BayLibre, SAS.
> +// Author: Jerome Brunet <jbrunet@baylibre.com>
> +
> +#include <linux/debugfs.h>
> +#include <linux/err.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include "pmbus.h"
> +
> +#define TPS25990_READ_VAUX		0xd0
> +#define TPS25990_READ_VIN_MIN		0xd1
> +#define TPS25990_READ_VIN_PEAK		0xd2
> +#define TPS25990_READ_IIN_PEAK		0xd4
> +#define TPS25990_READ_PIN_PEAK		0xd5
> +#define TPS25990_READ_TEMP_AVG		0xd6
> +#define TPS25990_READ_TEMP_PEAK		0xd7
> +#define TPS25990_READ_VOUT_MIN		0xda
> +#define TPS25990_READ_VIN_AVG		0xdc
> +#define TPS25990_READ_VOUT_AVG		0xdd
> +#define TPS25990_READ_IIN_AVG		0xde
> +#define TPS25990_READ_PIN_AVG		0xdf
> +#define TPS25990_VIREF			0xe0
> +#define TPS25990_PK_MIN_AVG		0xea
> +#define  PK_MIN_AVG_RST_PEAK		BIT(7)
> +#define  PK_MIN_AVG_RST_AVG		BIT(6)
> +#define  PK_MIN_AVG_RST_MIN		BIT(5)
> +#define  PK_MIN_AVG_AVG_CNT		GENMASK(2, 0)
> +#define TPS25990_MFR_WRITE_PROTECT	0xf8
> +#define  TPS25990_UNLOCKED		BIT(7)
> +
> +#define TPS25990_8B_SHIFT		2
> +#define TPS25990_VIN_OVF_NUM		525100
> +#define TPS25990_VIN_OVF_DIV		10163
> +#define TPS25990_VIN_OVF_OFF		155
> +#define TPS25990_IIN_OCF_NUM		953800
> +#define TPS25990_IIN_OCF_DIV		129278
> +#define TPS25990_IIN_OCF_OFF		157
> +
> +#define TPS25990_DEFAULT_RIMON		910000

If this is the default, why would it make sense to even specify the
property in milli-ohm ? I mean, sure, the devices can be stacked,
but it seems unrealistic to assume that there are hundreds or even
dozens of devices in parallel.
> +
> +static int tps25990_mfr_write_protect(struct i2c_client *client, bool protect)
> +{
> +	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
> +				     protect ? 0x0 : 0xa2);
> +}
> +
> +static int tps25990_mfr_write_protect_active(struct i2c_client *client)
> +{
> +	int ret = pmbus_read_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return !(ret & TPS25990_UNLOCKED);
> +}
> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static int tps25990_write_protect_get(void *data, u64 *val)
> +{
> +	struct i2c_client *client = data;
> +
> +	return tps25990_mfr_write_protect_active(client);
> +}
> +
> +static int tps25990_write_protect_set(void *data, u64 val)
> +{
> +	struct i2c_client *client = data;
> +
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	return tps25990_mfr_write_protect(client, val);
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(tps25990_write_protect_fops,
> +			 tps25990_write_protect_get,
> +			 tps25990_write_protect_set,
> +			 "%llu\n");
> +
> +static int tps25990_init_debugfs(struct i2c_client *client)
> +{
> +	struct dentry *dir;
> +
> +	dir = pmbus_get_debugfs_dir(client);
> +	if (!dir)
> +		return -ENOENT;
> +
> +	debugfs_create_file("write_protect", 0644, dir,
> +			    client, &tps25990_write_protect_fops);
> +
> +	return 0;
> +}
> +
> +#else
> +static inline int tps25990_init_debugfs(struct i2c_client *client)
> +{
> +	return 0;
> +}
> +#endif
> +

In general it is extremely undesirable to overwrite write protection.
Many chips support such attributes. If write protection is enabled,
it means that the board vendor does not want to have them changed.
Granted, that can be overwritten with direct i2c commands, but that
is what it should be. Anyone who really wants to disable write protection
should have to dig deeper than just writing into a debugfs or sysfs attribute.
Otherwise the protection becomes worthless. If this is, for example, needed
for production to write initial settings, the production scripts should
disable (or enable) write protection by writing directly into command
registers.

> +/*
> + * TPS25990 has history reset based on MIN/AVG/PEAK instead of per sensor type
> + * Emulate the behaviour a pmbus limit_attr would have for consistency
> + *  - Read: Do nothing and emit 0
> + *  - Write: Check the input is a number and reset
> + */
> +static ssize_t tps25990_history_reset_show(struct device *dev,
> +					   struct device_attribute *devattr,
> +					   char *buf)
> +{
> +	return sysfs_emit(buf, "0\n");
> +}
> +
> +static ssize_t tps25990_history_reset_store(struct device *dev,
> +					    struct device_attribute *devattr,
> +					    const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	s64 val;
> +	int ret;
> +
> +	if (kstrtos64(buf, 10, &val) < 0)
> +		return -EINVAL;
> +
> +	ret = pmbus_update_byte_data(client, 0, TPS25990_PK_MIN_AVG,
> +				     BIT(attr->index), BIT(attr->index));
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR_RW(highest_history_reset, tps25990_history_reset, 7);
> +static SENSOR_DEVICE_ATTR_RW(average_history_reset, tps25990_history_reset, 6);
> +static SENSOR_DEVICE_ATTR_RW(lowest_history_reset,  tps25990_history_reset, 5);

That is not a unique problem, and not a reason to introduce non-standard attributes.
Just attach the attribute to the first channel and document that it resets all
channels.

> +
> +static struct attribute *tps25990_attrs[] = {
> +	&sensor_dev_attr_highest_history_reset.dev_attr.attr,
> +	&sensor_dev_attr_average_history_reset.dev_attr.attr,
> +	&sensor_dev_attr_lowest_history_reset.dev_attr.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(tps25990);
> +
> +static int tps25990_get_addr(int reg)
> +{
> +	switch (reg) {
> +	case PMBUS_SMBALERT_MASK:
> +		/*
> +		 * Note: PMBUS_SMBALERT_MASK is not implemented on this chip
> +		 * Writing to this address raises CML errors.
> +		 * Instead it provides ALERT_MASK which allows to set the mask
> +		 * for each of the status registers, but not the specific bits
> +		 * in them.
> +		 * The default setup assert SMBA# if any bit is set in any of the
> +		 * status registers the chip has. This is as close as we can get
> +		 * to what pmbus_irq_setup() would set, sooo ... do nothing.
> +		 */
> +		return -ENXIO;

Many chips have that problem. The core code ignores errors, and attempts to write
the command are limited to initialization. This is not a reason to overwrite
the command like this. If this does cause a real a problem wit hthe chip (other
than setting CML errors, which many chips not supporting the command do),
we should define a flag in include/linux/pmbus.h and explain its need.

> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		/*
> +		 * VIREF directly sets the over-current limit at which the eFuse
> +		 * will turn the FET off and trigger a fault. Expose it through
> +		 * this generic property instead of a manufacturer specific one.
> +		 */
> +		return TPS25990_VIREF;

I don't see the value in this override. See below.

> +	case PMBUS_VIRT_READ_VIN_MAX:
> +		return TPS25990_READ_VIN_PEAK;
> +	case PMBUS_VIRT_READ_VIN_MIN:
> +		return TPS25990_READ_VIN_MIN;
> +	case PMBUS_VIRT_READ_VIN_AVG:
> +		return TPS25990_READ_VIN_AVG;
> +	case PMBUS_VIRT_READ_VOUT_MIN:
> +		return TPS25990_READ_VOUT_MIN;
> +	case PMBUS_VIRT_READ_VOUT_AVG:
> +		return TPS25990_READ_VOUT_AVG;
> +	case PMBUS_VIRT_READ_IIN_AVG:
> +		return TPS25990_READ_IIN_AVG;
> +	case PMBUS_VIRT_READ_IIN_MAX:
> +		return TPS25990_READ_IIN_PEAK;
> +	case PMBUS_VIRT_READ_TEMP_AVG:
> +		return TPS25990_READ_TEMP_AVG;
> +	case PMBUS_VIRT_READ_TEMP_MAX:
> +		return TPS25990_READ_TEMP_PEAK;
> +	case PMBUS_VIRT_READ_PIN_AVG:
> +		return TPS25990_READ_PIN_AVG;
> +	case PMBUS_VIRT_READ_PIN_MAX:
> +		return TPS25990_READ_PIN_PEAK;
> +	case PMBUS_VIRT_READ_VMON:
> +		return TPS25990_READ_VAUX;
> +	case PMBUS_VIRT_SAMPLES:
> +		return TPS25990_PK_MIN_AVG;

default: missing.

> +	}
> +
> +	/* Let the register check do its job */
> +	if (reg < PMBUS_VIRT_BASE)
> +		return reg;
> +
> +	return -ENXIO;

This needs to be more specific: The code should only return -ENXIO
if auto-detection can not handle the case. "Return -ENXIO for all
unsupported virtual registers" is unexpected. That situation should
be handled by the PMBus core.

> +}
> +
> +/*
> + * Some registers use a different scale than the one registered with
> + * pmbus_driver_info. An extra conversion step is necessary to adapt
> + * the register value to the conversion on the sensor type
> + */
> +static int tps25990_read_adapt_value(int reg, int val)
> +{
> +	switch (reg) {
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +	case PMBUS_POWER_GOOD_OFF:
> +		/*
> +		 * These registers provide an 8 bits value instead of a
> +		 * 10bits one. Just shifting twice the register value is
> +		 * enough to make the sensor type conversion work, even
> +		 * if the datasheet provides different m, b and R for
> +		 * those.
> +		 */
> +		val <<= TPS25990_8B_SHIFT;
> +		break;
> +
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +		val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_NUM, TPS25990_VIN_OVF_DIV);
> +		val += TPS25990_VIN_OVF_OFF;
> +		break;
> +
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_NUM, TPS25990_IIN_OCF_DIV);
> +		val += TPS25990_IIN_OCF_OFF;
> +		break;
> +
> +	case PMBUS_VIRT_SAMPLES:
> +		val = 1 << val;
> +		break;

default case missing.

> +	}
> +
> +	return val;
> +}
> +
> +static int tps25990_read_word(struct i2c_client *client,
> +			      int page, int phase, int reg)
> +{
> +	int ret, addr;
> +
> +	addr = tps25990_get_addr(reg);
> +	if (addr < 0)
> +		return addr;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_SAMPLES:
> +		ret = pmbus_read_byte_data(client, page, addr);

Mapping the register name in tps25990_get_addr() is unnecessary
and misleading. It is well known that TPS25990_PK_MIN_AVG is to be
used. Do it here.

> +		ret = FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
> +		break;
> +
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		ret = pmbus_read_byte_data(client, page, addr);
> +		break;
> +
Same here.

> +	default:
> +		ret = pmbus_read_word_data(client, page, -1, addr);

This is unexpected for registers not handled locally. Expectation is
that -ENODATA is returned for those, to be handled in the core.

> +		break;
> +	}
> +
> +	if (ret >= 0)
> +		ret = tps25990_read_adapt_value(reg, ret);
> +
> +	return ret;
> +}
> +
> +static int tps25990_write_adapt_value(int reg, int val)
> +{
> +	switch (reg) {
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +	case PMBUS_POWER_GOOD_OFF:
> +		val >>= TPS25990_8B_SHIFT;
> +		val = clamp(val, 0, 0xff);

Why clamp() here but clamp_val() elsewhere ?

> +		break;
> +
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +		val -= TPS25990_VIN_OVF_OFF;
> +		val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_DIV, TPS25990_VIN_OVF_NUM);
> +		val = clamp_val(val, 0, 0xf);
> +		break;
> +
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		val -= TPS25990_IIN_OCF_OFF;
> +		val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_DIV, TPS25990_IIN_OCF_NUM);
> +		val = clamp_val(val, 0, 0x3f);
> +		break;
> +
> +	case PMBUS_VIRT_SAMPLES:
> +		val = clamp_val(val, 1, 1 << PK_MIN_AVG_AVG_CNT);
> +		val = ilog2(val);
> +		break;

default: missing.

> +	}
> +
> +	return val;
> +}
> +
> +static int tps25990_write_word(struct i2c_client *client,
> +			       int page, int reg, u16 value)
> +{
> +	int addr, ret;
> +
> +	addr = tps25990_get_addr(reg);
> +	if (addr < 0)
> +		return addr;
> +
> +	value = tps25990_write_adapt_value(reg, value);
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_SAMPLES:
> +		ret = pmbus_update_byte_data(client, page, addr,
> +					     PK_MIN_AVG_AVG_CNT,
> +					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
> +		break;
> +
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		ret = pmbus_write_byte_data(client, page, addr,
> +					    value);
> +		break;
> +
> +	default:
> +		ret = pmbus_write_word_data(client, page, addr, value);
> +		break;

Same comments as for read functions.

> +	}
> +
> +	return ret;
> +}
> +
> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> +static const struct regulator_desc tps25990_reg_desc[] = {
> +	PMBUS_REGULATOR_ONE("vout"),
> +};
> +#endif
> +
> +static const struct pmbus_driver_info tps25990_base_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.m[PSC_VOLTAGE_IN] = 5251,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = -2,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.m[PSC_VOLTAGE_OUT] = 5251,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = -2,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_TEMPERATURE] = 140,
> +	.b[PSC_TEMPERATURE] = 32100,
> +	.R[PSC_TEMPERATURE] = -2,
> +	/*
> +	 * Current and Power measurement depends on the ohm value
> +	 * of Rimon. m is multiplied by 1000 below to have an integer
> +	 * and -3 is added to R to compensate.
> +	 */
> +	.format[PSC_CURRENT_IN] = direct,
> +	.m[PSC_CURRENT_IN] = 9538,
> +	.b[PSC_CURRENT_IN] = 0,
> +	.R[PSC_CURRENT_IN] = -6,
> +	.format[PSC_POWER] = direct,
> +	.m[PSC_POWER] = 4901,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -7,
> +	.func[0] = (PMBUS_HAVE_VIN |
> +		    PMBUS_HAVE_VOUT |
> +		    PMBUS_HAVE_VMON |
> +		    PMBUS_HAVE_IIN |
> +		    PMBUS_HAVE_PIN |
> +		    PMBUS_HAVE_TEMP |
> +		    PMBUS_HAVE_STATUS_VOUT |
> +		    PMBUS_HAVE_STATUS_IOUT |
> +		    PMBUS_HAVE_STATUS_INPUT |
> +		    PMBUS_HAVE_STATUS_TEMP |
> +		    PMBUS_HAVE_SAMPLES),
> +	.read_word_data = tps25990_read_word,
> +	.write_word_data = tps25990_write_word,
> +	.groups = tps25990_groups,
> +
> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> +	.reg_desc = tps25990_reg_desc,
> +	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
> +#endif
> +};
> +
> +static const struct i2c_device_id tps25990_i2c_id[] = {
> +	{ "tps25990" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
> +
> +static const struct of_device_id tps25990_of_match[] = {
> +	{ .compatible = "ti,tps25990" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tps25990_of_match);
> +
> +static int tps25990_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct pmbus_driver_info *info;
> +	u32 rimon = TPS25990_DEFAULT_RIMON;
> +	int ret;
> +
> +	ret = device_property_read_u32(dev, "ti,rimon-milli-ohms", &rimon);
> +	if (ret == -EINVAL) {
> +		dev_warn(dev,
> +			 "using default rimon: current and power scale possibly wrong\n");

This is not an appropriate warning. It is perfectly fine to load the driver
if there is no ti,rimon-milli-ohms property.

> +	} else if (ret < 0) {
> +		return dev_err_probe(dev, ret, "failed get rimon\n");
> +	}
> +
> +	/*
> +	 * TPS25990 may be stacked with several TPS25895, allowing a higher
> +	 * current. The higher the allowed current is, the lower rimon
> +	 * will be. How low it can realistically get is unknown.
> +	 * To avoid problems with precision later on, rimon is provided in
> +	 * milli Ohms. This is a precaution to keep a stable ABI.
> +	 * At the moment, doing the calculation with rimon in milli Ohms
> +	 * would overflow the s32 'm' in the direct conversion. Convert it
> +	 * back to Ohms until greater precision is actually needed.
> +	 */
> +	rimon /= 1000;
> +

Seems to me it would make more sense to limit the valid range of ti,rimon-milli-ohms
to avoid the overflow. But then I really don't understand the reasoning to provide
the property in milli-ohm, given the default value of 910 Ohm. What is a realistic
lowest value that would make sense ? But even if it is less than 1 Ohm I don't
understand why it would make sense to completely ignore it.

> +	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	/* Adapt the current and power scale for each instance */
> +	info->m[PSC_CURRENT_IN] *= rimon;
> +	info->m[PSC_POWER] *= rimon;

Any rimon value < 1000 mOhm will result in m values of 0.

> +
> +	ret = pmbus_do_probe(client, info);
> +	if (ret < 0)
> +		return ret;
> +
> +	return tps25990_init_debugfs(client);

debugfs initialization is not expected to fail.

> +}
> +
> +static struct i2c_driver tps25990_driver = {
> +	.driver = {
> +		.name = "tps25990",
> +		.of_match_table = tps25990_of_match,
> +	},
> +	.probe = tps25990_probe,
> +	.id_table = tps25990_i2c_id,
> +};
> +module_i2c_driver(tps25990_driver);
> +
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
> +MODULE_DESCRIPTION("PMBUS driver for TPS25990 eFuse");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);
> 


