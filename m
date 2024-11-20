Return-Path: <linux-i2c+bounces-8095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238B9D41CF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 19:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAC381F23082
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 18:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D614C1AA1D6;
	Wed, 20 Nov 2024 18:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhBjjdQt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9E1E489;
	Wed, 20 Nov 2024 18:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732126049; cv=none; b=TtXpd1lHDypP6leDszhoDvXpoUTDRhLxHUJdAUkrugUXvw4p9df64yCTAg9T2UW5cJjiIokS8lOwazRL+aXzzUOcfP+k/qegPy4jNoKXW5OvMKy8oZke/SHoSEgw7u5f9L3BgbvoouiDHF6pbykzf3p6qyJRtRUFmICua3jq6Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732126049; c=relaxed/simple;
	bh=fC0a0dcffjP8d0yxp5ThNzmgwtjg0ZK+4idfGdgNdcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/9k9kvMIuL2MB8Il3NMFDyexB1HLaiQHh2SM+3v+Sj/5r4YUIs1wXpLs8tV6uewBbDtq+QCELTu3dFfGjvIAd/sC4yJCyUihEP42kAsZE/9In+UsDC6ZhnaLNZEHFQKCQrQK3YmYANYoKQdMBaBGn+fyat8+9C1LtcAqjoKr2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhBjjdQt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-212581a0b33so21955605ad.0;
        Wed, 20 Nov 2024 10:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732126047; x=1732730847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oCD9jqN15ZFMZzQekYM10Jocq9g8TJDb85MimZfpYhQ=;
        b=RhBjjdQtmCoFFGXeJHUrJFAmAtGPCyTcCYf0ksghPmvuqRN6v07f2gS2MJEzyIwzRJ
         FX7GuIk5X798Cg5MW7wBjKWTprN6Cx1h8duCjRxEPfgef6gDOQhA7yR1IvEBfJgC72LE
         rWEOzxfyK1FQHNeI+1dIS5L6gEEBueULWajrdSf8f1AJeysTLp9frUVN8aoL3kYRUX19
         49TaG9HWDO/PSsUBOS3CTrYPC8gNhLhQnpCJcZN0rgcozEqTwElryWCnnNxJ8DmFeYyj
         XaHDnOqbfR1sf08V8FB+fN0hZ41ySEh+aHPtaJAiOT7W5g8k0pPYIPcUSVXha9YTo4MN
         g3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732126047; x=1732730847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCD9jqN15ZFMZzQekYM10Jocq9g8TJDb85MimZfpYhQ=;
        b=UcmRR/BU4hfJSNeykuKcN0SDDvnXdjwtOyTAcTYkMDV63d9OEoYrGUv7DLFHbWHp6g
         blZ74BdokqfM1GPYTxk1zue7mOWagQxOfv9GFG3HJzmp+FBEHduBC0MjtOBsMLtykdj0
         TUKQwlQSvrLC6RgpS1bUn3hdN0NPlMAXG2C7wGfhgxxi0Nbn7vp6INwncEb/qhkiseLo
         DtTHcX24sROtTWPr3VuPHYVUYTTLm5JlfQJv+/WAlMGnJjpAsgeyHWLIyc5MMhpn+6Hf
         gq1Gte87NXJo0/KcpSg7opJG+JujOJPwC0WNuosfXb18xVJ3cA8D+dlyrRZOMAekkPMX
         rD9g==
X-Forwarded-Encrypted: i=1; AJvYcCUNfmQpzC4GYpVrx62SoNZ0i3nC7g+yMMZ9lgqLo7x6fctrfDXiTMoHTI7aWQ/VBrp2wV0BAX0rKrrc/YU=@vger.kernel.org, AJvYcCVUp/k0rSuv4k/XrP/RXZJleiSFx1LhVP0dsuFAqOF2zFIDOkkihT5PzsbU2EzmVpIiU4Dzxu14mp85@vger.kernel.org, AJvYcCVeTZnt6ie6nYo4q7VfORVPe7VS3hFJF7pJgpDyLIQ6oYJs1d7dnypZR0my0OrygY9hKSRzOsRAiTcy1Yyz@vger.kernel.org, AJvYcCXhgMs+80sxfTJzgnPCowF0kMVuv7AOEO4uDLD/2LNJJYzQdF/mxrLcnieE6vGEMOmKIyCf9t2HTlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3wJZhr+O7suE37UmnPcXthTEabi7j4Xn7FI0ImV9r6WR4+E5I
	yur06TxFRHb/oJAdJTPXZ7FTrOFU23r6ygE7CBy7JFKqEv/Eywl5
X-Google-Smtp-Source: AGHT+IEwiDtnSAxEOk/AeSg1QOgAISxDY3a8s/vd75HOZF7OG4Cyqd/uUg4tGRHsf0HmRkc2OfjoXQ==
X-Received: by 2002:a17:902:d2cf:b0:212:6187:6a76 with SMTP id d9443c01a7336-2126a3a43e4mr41756665ad.14.1732126047311;
        Wed, 20 Nov 2024 10:07:27 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb83easm1961536b3a.16.2024.11.20.10.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 10:07:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7e55a403-eb1c-4369-8180-1639b50cc9b1@roeck-us.net>
Date: Wed, 20 Nov 2024 10:07:24 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings for
 adp1051, adp1055 and ltp8800
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Radu Sabau <radu.sabau@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
 <20241120-process-hulk-ecedcbf088f7@spud>
 <dfe8e47e-6c31-4b11-b733-38e5bd0e49d3@kernel.org>
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
In-Reply-To: <dfe8e47e-6c31-4b11-b733-38e5bd0e49d3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/24 09:35, Krzysztof Kozlowski wrote:
> On 20/11/2024 18:11, Conor Dooley wrote:
>> On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrote:
>>> add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
>>>      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>>>      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>>>      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator
>>>
>>> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
>>
>> Why did you drop my ack?
>> https://lore.kernel.org/all/20241106-linoleum-kebab-decf14f54f76@spud/
> So that's a v2? Or v3? Then should be marked correctly. Please start
> using b4. I already asked analog.com for this in few cases. Feel free
> not to use b4 if you send correct patches, but this is not the case here.
> 

In general I agree, but this is a combination of two patch series, as mentioned
in the summary. I am not sure how to use versioning in such situations. Is it
v2 of one series or v3 of the other ?

Thanks,
Guenter


