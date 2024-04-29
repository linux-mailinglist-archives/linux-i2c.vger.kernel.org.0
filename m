Return-Path: <linux-i2c+bounces-3285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039918B506E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 07:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2522A1C21C38
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 05:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411C7D26D;
	Mon, 29 Apr 2024 05:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+igdM2k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DDAD502;
	Mon, 29 Apr 2024 05:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714366809; cv=none; b=mF45Ys9XpsZl+ReuYlOunMig4davbicACjoxSWo6UD/IITtTNYuH9iQkLdcaU15hqkuF/I+0/KPV7Z61eYOeILSoY+SKZ/4g2pyRC1hAXyVbxBhnZFHfgfKqzbMsLCExrYUkab1ZTKsG1qvvJCIB2N2XQnvBhkdzVcGslpuqDD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714366809; c=relaxed/simple;
	bh=ubpPbaB5gFuQgSU/QjXWVly0Fm/2i98Jmufniy4ZEQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LUKAb3H8QXdE3FPCFHbTNSdMajcWpixoF4KhkcPOtCtEje9eitBswuUFAfczQ8J8c+glUxcVRSCaybQxTK/VN255pi9O7HnZ+sM68DyFa4yDiWiaoNLZ6usEuHUqoXmaD9zEdTW8JmGOkt/qRJeOqAGWhIR9+619WtUEG9EumhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+igdM2k; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so3871889b3a.0;
        Sun, 28 Apr 2024 22:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714366807; x=1714971607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+BHjMDjwGQMBCgXcVj84sl8EWdM9xQ9+9vBDGgGObeQ=;
        b=Z+igdM2k9APEBgDJtJ3f3QcoRtC2SxYxj5lbTbJ8vcnY81anEAfSI0O9UvNvo5MkI4
         D0OxpWcP6mMuTYwRWDgB4x+Ht9ytYPEtoAnFK2rgw16zhMjBfEush02zyOoFbnjuX4Pv
         s46IIq/cqOlwGdsIetw+5zFV6AiX7swBLUbaWa8LtTaHgvc7QV5kyAqIa3w07+ktImEp
         b8sCdldw0xLFUEmjvzWXKXJOnAeb5cV4F6zWY6P+2CbrX4/MR8xktwHoHdfWHHWqSa4l
         ZSxnFmuCWPyF02f17YuSDZx6GaRpdoW/3RE8GIVzMPZRNdm6gPEawL1vTEpbh1F84PVm
         ED0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714366807; x=1714971607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BHjMDjwGQMBCgXcVj84sl8EWdM9xQ9+9vBDGgGObeQ=;
        b=iNlRNUSy0Mh09+fYuvtI408typN5qk3s0nyomtle59ML3NYbXLFitgYO5EiDWFMbV0
         XNIyevWpGoHgim4nGoP1RTWaQMNf/zx3RvJSEt3eo/BilSyAcSViyOMuHrilkOTizRk9
         0WGfWEk5lflN3kXkU97Xhth3VIsCEe/sdnNUSJskhX1Q0JfGHS7+BQV6KLcR0D2dojUT
         oilzeXrd5mwyJsaXf040j2Mnmyr/Rnj3K/qUtKChAGCBfbeemwooEYFGIS7t4RlBN999
         zeop4ztsf5+Z0SuGzzmpLHnI7SakwB6W4B57FhrClj1E9GTXJi+FDparzw9o3saL+5Sp
         C8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyWpu04HfkuFwjkx60UsmtKgDm+/eWCTN1MwgA4cbDkDheccQeIDctK9OTDbiRKNuA9vO5UkuJqT8KA9cMTkXFQ0hlapxgsQ6NEHN6U+350iArvEOigVTY12rp4edpWgbdcjgDXoQ96ul3uMYbhGJLJ+PChIHJkN7Y8DYScf39GbUQphuDBHuc7an/F3WTUepQRy5y/wPbMYfEKvSLoBW4uibcU7x3hjaLE3gikZpLxE8U5EGwp+1kVV2T
X-Gm-Message-State: AOJu0YyAxMfNpLLZHe89gXn4Tffvgx0NvauJM5LuoyDmtomQ2vBr927A
	udEFWWBnx2Vlh8xW2z3vWeMQECDCochPb7zwuEaytatKgT5RsQId
X-Google-Smtp-Source: AGHT+IGBPSO/pJbvHG9V5LFLr3T+n+YkgftNpqoTr26/wld9HpnGDpgms2K0hQfxHKtqIhALtgS+iQ==
X-Received: by 2002:a05:6a20:6f8b:b0:1a7:4b40:96db with SMTP id gv11-20020a056a206f8b00b001a74b4096dbmr11260096pzb.10.1714366805643;
        Sun, 28 Apr 2024 22:00:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090a070900b002a4736f3566sm3491769pjl.0.2024.04.28.22.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Apr 2024 22:00:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e6ba7e83-0329-4fc8-a1d6-83a8683cc812@roeck-us.net>
Date: Sun, 28 Apr 2024 22:00:02 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] hwmon: (pmbus) Add support for Infineon XDP710
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Lukas Wunner <lukas@wunner.de>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240429033833.895122-1-peteryin.openbmc@gmail.com>
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
In-Reply-To: <20240429033833.895122-1-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/24 20:38, Peter Yin wrote:
> Add support for Infineon XDP710. This is a Hot-Swap Controller.
> 
> Change log:
> 
> v2 -> v3
>      - Fixed Ack quotes
>      - rename "microOhmRsense" to "micro_ohm_rsense"
> 
> v1 -> v2
>      - Merged patch 3 into patch 1.
>      - Modified comments.
>      - Fixed the microOhmRsense array.
>      - Improved operational accuracy.
> 
> v1
>      - Add support for xdp710 hot-swap device from Infineon vendor
> ---
> 
> Peter Yin (2):
>    hwmon: (pmbus) Add support for Infineon XDP710
>    dt-bindings: hwmon: Add infineon xdp710 driver bindings
> 
>   .../devicetree/bindings/trivial-devices.yaml  |   2 +
>   Documentation/hwmon/index.rst                 |   1 +
>   Documentation/hwmon/xdp710.rst                |  83 +++++++++++
>   drivers/hwmon/pmbus/Kconfig                   |   9 ++
>   drivers/hwmon/pmbus/Makefile                  |   1 +
>   drivers/hwmon/pmbus/xdp710.c                  | 132 ++++++++++++++++++
>   6 files changed, 228 insertions(+)
>   create mode 100644 Documentation/hwmon/xdp710.rst
>   create mode 100644 drivers/hwmon/pmbus/xdp710.c
> 

What is the point of resending this ? I said I applied the series.

Guenter


