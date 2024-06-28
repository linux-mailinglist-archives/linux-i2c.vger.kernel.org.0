Return-Path: <linux-i2c+bounces-4463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F191BC95
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 12:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8809B1F23BB8
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9AF1552FF;
	Fri, 28 Jun 2024 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ptzsed1R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DD01509B6
	for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719570544; cv=none; b=gzu97FOW7qf91JIG3tTKsYxoVBrACElpdELA6/OlmGeBqM/q09K4brIvoZM/vLIMGdV67QJ8oGS0XvDAwx8qFIXA6CtEBeq9+5wAUVplXQNpMpsKExF9AXyOxEGibqIi4klDTrHZ62m7cP75kfzVHyOiuwITUCJfOr84zoEXrws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719570544; c=relaxed/simple;
	bh=w2Ma/Gjvlg8oufsUs+3sDRJDwFue5i1t5t/mj72HMB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbEcXPMLhpkhqrdt1nUK/l7a8o7/+4YN3JYvPy4gO23V63eGKWnySz1tMncdQhyYsaKv2uePmJLWtLcmDIzFo4UlZXWVgwqyZawIos8YrgW+QRYoMwnZhXnXKGga/uSJJXFyg/W4zv+TtQNoYXecMEAVqw8NWYOr3ALZxoY3FhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ptzsed1R; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d2fc03740so522188a12.0
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719570541; x=1720175341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1Yuc8HPdjefPq+QJsoY4VAF1d5sHQPx0WEKNSi2S60=;
        b=ptzsed1RcvacNpjcsnFM3b7X5t8k52wTsjA9aJnwALiUkxOx02Gkwr2WEOwxiHeA8Z
         YDrcPlAEIQ6Xe7cR8lgbapqxBdUst79z5MCUhiB1PP/UPZrwqDUshwMKD9riMDCcR0Vr
         cYE0pt8dhuRXiKZucopfe23D+4tcs9j34biIERlRjnp9PlGConqbtlB0NjQuB0AUJCka
         tEPRI4fLbZT8mxC9bm2b8Q07Z9e7heeEAxgitqCoC6MyHFMBU7L4Jobk0r321DRYQ+Zt
         wXNHs7fhYCd5oRL4nP3IAGmpeBxF9goK71BiB7usE62TmaywnCtsM/Q31JPzTxKcqYyC
         tnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719570541; x=1720175341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1Yuc8HPdjefPq+QJsoY4VAF1d5sHQPx0WEKNSi2S60=;
        b=URkLPCr39PTTvk0f0/HTSIA9iM/lfgRwukV0BFvqUm7dCE5EFy8WJwlY8x2O8GRX7A
         yOi2fA4CGraXZmurpGR+Ik96W3wQQBKOKuVQKnbyAbbjAgoDRcMO6gd9xlXJ79wlcFq0
         6VPerwS8IoDZMy4Q6GFXyP/RHAowciqWGrGd2kR08wMv1OrdAG33U1GkSW0ugBRhe9OF
         XCQVWVTZm/A5YqigrqFemxQDrwkew1QmA3yOrhx+OGksvDY5FjuHnFnuwgNvXu3AWuIK
         YCh3dt5pfTh7nLtU7DWlNZEaezrNhEw6IFaCRt0r0Iq4O/BRA9xgsw7jwmx1HD8yVzME
         Hsdw==
X-Forwarded-Encrypted: i=1; AJvYcCUMWqGzvHOoJ0B+8rDDmcY/pZjlL8LYqByHnOJTBp/wge1UempKSYz//h8kY8rIrGpzAsVEf9wvUfQ1CyZrgi37vfOFLU3G41Z8
X-Gm-Message-State: AOJu0Yzvn0DFfVbt6XN6hz2JcSulGZDP4MXx2OdCLzbfiHTLFkjuQHmS
	tLD+P0DmVzmKiz9ukKyKSZrun1K/ZB9XfNLzBd0M2PjDmxFfIbcin6jhV0g5IR8=
X-Google-Smtp-Source: AGHT+IGe0+LPjJDA+086uzSs+k4pBy3W/YqLLanB3vnbyU1MPnomcsSYewlm0BJeRxppWtiWVGHm1A==
X-Received: by 2002:a17:906:3c3:b0:a6f:b08b:86ca with SMTP id a640c23a62f3a-a7245df73b4mr991080266b.75.1719570541128;
        Fri, 28 Jun 2024 03:29:01 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08cc07sm67417366b.149.2024.06.28.03.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 03:29:00 -0700 (PDT)
Message-ID: <7c542f46-c644-4f22-bbc4-408b7dad8273@tuxon.dev>
Date: Fri, 28 Jun 2024 13:28:58 +0300
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
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
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
 <CAMuHMdXJ8eKLzMqCPR2ewS9gr_m5OQPneETPMC-rOOmW+--f5A@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXJ8eKLzMqCPR2ewS9gr_m5OQPneETPMC-rOOmW+--f5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 28.06.2024 12:13, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Jun 28, 2024 at 10:12 AM claudiu beznea
> <claudiu.beznea@tuxon.dev> wrote:
>> On 28.06.2024 11:09, Biju Das wrote:
>>>> -----Original Message-----
>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: Friday, June 28, 2024 9:03 AM
>>>> Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe the register offsets
>>>>
>>>>
>>>>
>>>> On 28.06.2024 10:55, Biju Das wrote:
>>>>> Hi Claudiu,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>>> Sent: Friday, June 28, 2024 8:32 AM
>>>>>> Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to
>>>>>> describe the register offsets
>>>>>>
>>>>>> Hi, Biju,
>>>>>>
>>>>>> On 28.06.2024 08:59, Biju Das wrote:
>>>>>>> Hi Claudiu,
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>>>>>> Sent: Tuesday, June 25, 2024 1:14 PM
>>>>>>>> Subject: [PATCH v2 07/12] i2c: riic: Define individual arrays to
>>>>>>>> describe the register offsets
>>>>>>>>
>>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>>
>>>>>>>> Define individual arrays to describe the register offsets. In this
>>>>>>>> way we can describe different IP variants that share the same
>>>>>>>> register offsets but have differences in other characteristics.
>>>>>>>> Commit prepares for the addition
>>>>>> of fast mode plus.
>>>>>>>>
>>>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> Changes in v2:
>>>>>>>> - none
>>>>>>>>
>>>>>>>>  drivers/i2c/busses/i2c-riic.c | 58
>>>>>>>> +++++++++++++++++++----------------
>>>>>>>>  1 file changed, 31 insertions(+), 27 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/i2c/busses/i2c-riic.c
>>>>>>>> b/drivers/i2c/busses/i2c-riic.c index
>>>>>>>> 9fe007609076..8ffbead95492 100644
>>>>>>>> --- a/drivers/i2c/busses/i2c-riic.c
>>>>>>>> +++ b/drivers/i2c/busses/i2c-riic.c
>>>>>>>> @@ -91,7 +91,7 @@ enum riic_reg_list {  };
>>>>>>>>
>>>>>>>>  struct riic_of_data {
>>>>>>>> -        u8 regs[RIIC_REG_END];
>>>>>>>> +        const u8 *regs;
>>>>>>>
>>>>>>>
>>>>>>> Since you are touching this part, can we drop struct and Use u8* as
>>>>>>> device_data instead?
>>>>>>
>>>>>> Patch 09/12 "i2c: riic: Add support for fast mode plus" adds a new member to struct
>>>> riic_of_data.
>>>>>> That new member is needed to differentiate b/w hardware versions
>>>>>> supporting fast mode plus based on compatible.
>>>>>
>>>>> Are we sure RZ/A does not support fast mode plus?
>>>>
>>>> From commit description of patch 09/12:
>>>>
>>>> Fast mode plus is available on most of the IP variants that RIIC driver is working with. The
>>>> exception is (according to HW manuals of the SoCs where this IP is available) the Renesas RZ/A1H.
>>>> For this, patch introduces the struct riic_of_data::fast_mode_plus.
>>>>
>>>> I checked the manuals of all the SoCs where this driver is used.
>>>>
>>>> I haven't checked the H/W manual?
>>>>
>>>> On the manual I've downloaded from Renesas web site the FMPE bit of RIICnFER is not available on
>>>> RZ/A1H.
>>>
>>> I just found RZ/A2M manual, it supports FMP and register layout looks similar to RZ/G2L.
>>
>> I introduced struct riic_of_data::fast_mode_plus because of RZ/A1H.
> 
> Do you need to check for that?
> 
> The ICFER_FMPE bit won't be set unless the user specifies the FM+
> clock-frequency.  Setting clock-frequency beyond Fast Mode on RZ/A1H
> would be very wrong.

I need it to avoid this scenario ^. In patch 09/12 there is this code:

+	if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
+	    (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
+		dev_err(dev, "unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
+			info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
+			I2C_MAX_FAST_MODE_FREQ);
 		return -EINVAL;

to avoid giving the user the possibility to set FM+ freq on platforms not
supporting it.

Please let me know if I'm missing something (or wrongly understood your
statement).

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

