Return-Path: <linux-i2c+bounces-4445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232C91B94E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BC801C22998
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1215143C45;
	Fri, 28 Jun 2024 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kalId1eJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B161A140363
	for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561777; cv=none; b=AV7neeVNjoK8DNxF9WsEkqf4aFqJ9aiTosY+0n/vdZbu5HCyBoxEDB+9Tmbk3tfpwMol3ylWMa1eUvvaWhe0pdyAFlz4DekRkQSyCqwefLu5cEFiWj9kIaZYJYk/a0VXVophblztUSKrxvYVKU6Bg1xyCz8aJZfEJ/sjGkCa174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561777; c=relaxed/simple;
	bh=QXYx6rkU0AQabrspd6YVjPYtAZW/WYWgvStOMy1phM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pr+9J3jyJBN3VIv1eJNClZBvZzPo2K+lATn/xSQ4Oz6QYGscRS6OUFobhQyTbmGM40QfybiZ5dS6yNSoJVC1ReE5PkSEUbIGh4YyUNGqgM7/1Qab0riW17NnekkX1+j0Wunb01a0BBcUFizHAqhd11uD/8PVLqHUxvfIZ8Onfx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kalId1eJ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52d259dbe3cso322646e87.0
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719561773; x=1720166573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRZz2tsfNxD7GWDFKOlUJ52oUZ9Phz5yzlW6R6P2fIk=;
        b=kalId1eJcHB2c+gA1rSMEHEJ/HFeAFBQQzBA9bGjlTrAKalHAkO7SyxoD3ZnF2NnH3
         mmHQceD3SNd9WLw6u0DOTNiwkkKm1JReIUjaMGwJn9cmxi2VsG+VQ/Yny574qXgkWTZT
         y988OYooRtWoyH0CH1iVCNzvs2ypbG+CZ+4RZWpVP9PDWnUumAX8jNHYsutfsiIS4mSV
         jstiQ+Z5D8eaFQ3bPD6U26m8WFZY+o5m0TIuziOBnObb7UpF87WI52/uLebVMiW4GAfL
         KbD46+EnUdXz5Z6Vw2WvPnVDILwdd6T1sxmGbijtdPqUeBJ3Ud9et8/V78EvEF7UxBhk
         lNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561773; x=1720166573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRZz2tsfNxD7GWDFKOlUJ52oUZ9Phz5yzlW6R6P2fIk=;
        b=plbnf/VgBgXjNBULzr52zsAWr9toHGz6k31pypXqxGKakILnd0Pb01VHr69BRQmjkT
         Dp465aQGN/8M/646U4kcNbq5lqeg7p9TmJIoKiUwRBLy8+R/sEYsSTEVhj4xHy3+SlI5
         4pHx1E+0Tss2zvvISwwxgsqdfFLUqgNw40WVbn2qbTYQMS5YBxyz9u0bwHDq2jZNFigO
         KTfTV5W/B0MdanMZXV5Pe53kYNfeteFACMHhpG7nuzX4OgTC2QS2Fcm+5ThBpWZ/2ufM
         Z12JYlXW7PjeIK8GcT828Y5COxarBVVk3zWt+rUNwCa/iEWHgbfcl68i0lYwpN03js3H
         m2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVkioX2j8x0jceJJqc96PYIjEEkBtyO/hC9huP+hPbE/XWg4u0Doz+xIf2yyAv2y9dl2yky2G24gv4WC7p8asg/jPEyj1TN3YT
X-Gm-Message-State: AOJu0YwOIx7Sxnv+7zK9VRT3tm4sAG1C1Ruh2zvB9BZ+Di5P+eCzV4Jg
	LBi2/4O7fZc6cDa2rP3Gt3M2MPrPThQLN1XviaMWyO1lmm/6AMlI88TYN0qA2hk=
X-Google-Smtp-Source: AGHT+IFT/fp8+C8tAy9VJfwqFHoTu04HnMgmLLyaEnM4DD3aQT6hgmQpsdTV/mdHCYEPvuo5cEcr+g==
X-Received: by 2002:a19:8c4d:0:b0:52c:d36f:f78b with SMTP id 2adb3069b0e04-52ce061f766mr11031618e87.31.1719561772772;
        Fri, 28 Jun 2024 01:02:52 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b097b82sm23496605e9.34.2024.06.28.01.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 01:02:52 -0700 (PDT)
Message-ID: <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
Date: Fri, 28 Jun 2024 11:02:50 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28.06.2024 10:55, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Friday, June 28, 2024 8:32 AM
>> Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe the register offsets
>>
>> Hi, Biju,
>>
>> On 28.06.2024 08:59, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: Tuesday, June 25, 2024 1:14 PM
>>>> Subject: [PATCH v2 07/12] i2c: riic: Define individual arrays to
>>>> describe the register offsets
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Define individual arrays to describe the register offsets. In this
>>>> way we can describe different IP variants that share the same
>>>> register offsets but have differences in other characteristics. Commit prepares for the addition
>> of fast mode plus.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - none
>>>>
>>>>  drivers/i2c/busses/i2c-riic.c | 58
>>>> +++++++++++++++++++----------------
>>>>  1 file changed, 31 insertions(+), 27 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-riic.c
>>>> b/drivers/i2c/busses/i2c-riic.c index
>>>> 9fe007609076..8ffbead95492 100644
>>>> --- a/drivers/i2c/busses/i2c-riic.c
>>>> +++ b/drivers/i2c/busses/i2c-riic.c
>>>> @@ -91,7 +91,7 @@ enum riic_reg_list {  };
>>>>
>>>>  struct riic_of_data {
>>>> -	u8 regs[RIIC_REG_END];
>>>> +	const u8 *regs;
>>>
>>>
>>> Since you are touching this part, can we drop struct and Use u8* as
>>> device_data instead?
>>
>> Patch 09/12 "i2c: riic: Add support for fast mode plus" adds a new member to struct riic_of_data.
>> That new member is needed to differentiate b/w hardware versions supporting fast mode plus based on
>> compatible.
> 
> Are we sure RZ/A does not support fast mode plus?

From commit description of patch 09/12:

Fast mode plus is available on most of the IP variants that RIIC driver
is working with. The exception is (according to HW manuals of the SoCs
where this IP is available) the Renesas RZ/A1H. For this, patch
introduces the struct riic_of_data::fast_mode_plus.

I checked the manuals of all the SoCs where this driver is used.

I haven't checked the H/W manual?

On the manual I've downloaded from Renesas web site the FMPE bit of
RIICnFER is not available on RZ/A1H.

Thank you,
Claudiu Beznea

> If it does not, then it make sense to keep the patch as it is.
> 
> Cheers,
> Biju
> 
>>
>> Keeping struct riic_of_data is necessary (unless I misunderstood your proposal).
>>
>> Thank you,
>> Claudiu Beznea
>>
>>>
>>> ie, replace const struct riic_of_data *info->const u8 *regs in struct
>>> riic_dev and use .data = riic_rz_xx_regs in of_match_table?
>>>
>>> Cheers,
>>> Biju
>>>>  };
>>>>
>>>>  struct riic_dev {
>>>> @@ -531,36 +531,40 @@ static void riic_i2c_remove(struct platform_device *pdev)
>>>>  	pm_runtime_dont_use_autosuspend(dev);
>>>>  }
>>>>
>>>> +static const u8 riic_rz_a_regs[RIIC_REG_END] = {
>>>> +	[RIIC_ICCR1] = 0x00,
>>>> +	[RIIC_ICCR2] = 0x04,
>>>> +	[RIIC_ICMR1] = 0x08,
>>>> +	[RIIC_ICMR3] = 0x10,
>>>> +	[RIIC_ICSER] = 0x18,
>>>> +	[RIIC_ICIER] = 0x1c,
>>>> +	[RIIC_ICSR2] = 0x24,
>>>> +	[RIIC_ICBRL] = 0x34,
>>>> +	[RIIC_ICBRH] = 0x38,
>>>> +	[RIIC_ICDRT] = 0x3c,
>>>> +	[RIIC_ICDRR] = 0x40,
>>>> +};
>>>> +
>>>>  static const struct riic_of_data riic_rz_a_info = {
>>>> -	.regs = {
>>>> -		[RIIC_ICCR1] = 0x00,
>>>> -		[RIIC_ICCR2] = 0x04,
>>>> -		[RIIC_ICMR1] = 0x08,
>>>> -		[RIIC_ICMR3] = 0x10,
>>>> -		[RIIC_ICSER] = 0x18,
>>>> -		[RIIC_ICIER] = 0x1c,
>>>> -		[RIIC_ICSR2] = 0x24,
>>>> -		[RIIC_ICBRL] = 0x34,
>>>> -		[RIIC_ICBRH] = 0x38,
>>>> -		[RIIC_ICDRT] = 0x3c,
>>>> -		[RIIC_ICDRR] = 0x40,
>>>> -	},
>>>> +	.regs = riic_rz_a_regs,
>>>> +};
>>>> +
>>>> +static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
>>>> +	[RIIC_ICCR1] = 0x00,
>>>> +	[RIIC_ICCR2] = 0x01,
>>>> +	[RIIC_ICMR1] = 0x02,
>>>> +	[RIIC_ICMR3] = 0x04,
>>>> +	[RIIC_ICSER] = 0x06,
>>>> +	[RIIC_ICIER] = 0x07,
>>>> +	[RIIC_ICSR2] = 0x09,
>>>> +	[RIIC_ICBRL] = 0x10,
>>>> +	[RIIC_ICBRH] = 0x11,
>>>> +	[RIIC_ICDRT] = 0x12,
>>>> +	[RIIC_ICDRR] = 0x13,
>>>>  };
>>>>
>>>>  static const struct riic_of_data riic_rz_v2h_info = {
>>>> -	.regs = {
>>>> -		[RIIC_ICCR1] = 0x00,
>>>> -		[RIIC_ICCR2] = 0x01,
>>>> -		[RIIC_ICMR1] = 0x02,
>>>> -		[RIIC_ICMR3] = 0x04,
>>>> -		[RIIC_ICSER] = 0x06,
>>>> -		[RIIC_ICIER] = 0x07,
>>>> -		[RIIC_ICSR2] = 0x09,
>>>> -		[RIIC_ICBRL] = 0x10,
>>>> -		[RIIC_ICBRH] = 0x11,
>>>> -		[RIIC_ICDRT] = 0x12,
>>>> -		[RIIC_ICDRR] = 0x13,
>>>> -	},
>>>> +	.regs = riic_rz_v2h_regs,
>>>>  };
>>>>
>>>>  static int riic_i2c_suspend(struct device *dev)
>>>> --
>>>> 2.39.2
>>>>
>>>

