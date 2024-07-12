Return-Path: <linux-i2c+bounces-4958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFDB92F67D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 09:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DC761F23BEE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 07:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5CD140E2E;
	Fri, 12 Jul 2024 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GBeS11TK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4407813F452
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720770554; cv=none; b=unB9YD7q37qezXB8pp8fs7OVvwl4zY9wIq8N9op6DuBrST5zOiS/+zJ1P/6zroxXmONFrQk9WPawTcq1Yv24/xDtcl3pN5pFyuiEJib4+qEa0TCSXs5vWPVvxFZnHVCdoIgeAFEyJUvtHppm9DF0Trzd5BwO7hhMTV4r4CGELDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720770554; c=relaxed/simple;
	bh=GgyXeX6vRq/B+zT7c/I8o809APEqFYzIqOfSPZTJV4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbCel0i0zP5R1NkH34XhyLgK0qdzVG+xpcUsHbh3NrBNk99HyRCzNGRVkmeF+389ze/i0u4Ojk1kIh6wdDgCpP/8mdCF+1/Fw/ObgV7UgQkX508uq0kTrx6ICLbysjaysHHUN7Y6GFxLhECyZnTT61I6cgomIMRwC8z+EiufTO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GBeS11TK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-367a081d1cdso901180f8f.1
        for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720770550; x=1721375350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQ8ijy1w9qa1wZbbcvL0kjrbjKmo8bNSB+DJPQwcHnU=;
        b=GBeS11TKS4Dv9SbQt0K/2wJJka/oijyLSL7jo67WmEc0CgUBWt0jTY6KaaQnYoJsEu
         KaaBAZ3KLEXJopq9hqgRNVg3auTJ1qYEPBGzzU+fj8wJ/SMknu6T156AVDMyDhhfKNGJ
         bmJ1k1hmNZ5ngZP18QheQsejDeV4XdF38TRL8NocmJITO2ZUtqWA5Lqzqzrps1EgFZtF
         A+6peCmg4j+ekRtIw8f7pRneMlHEn3R+pV9lCG7nLuYCSc6E60fHeUXTGkKjjaD2nsjV
         NZMsrgLyQehbPrWOQ1lPLnycoP/wshuOteyuuXK4Yaax1QvLsXYxvldzwMvTIwXAocqE
         HG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720770550; x=1721375350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQ8ijy1w9qa1wZbbcvL0kjrbjKmo8bNSB+DJPQwcHnU=;
        b=L50W7IPEzxAy0KbBE2Kwfrei06wx05hRIpI3XdFqHxt1ixUUQfsjOQOd6V/w3CkgIs
         Fsl8eoBBGPDxigrt3H31W0YxrlTsj99+rZCRv+6unrUaf17+XuOZJuvf4aOhKLfTGQPt
         2WxNZEJH6aKydZDNwUL+Kvc/wWjXDYBy4JUqpN7K6zpJ8uGVozPG66RhyOIW83rWqfFt
         stk2iGpgkSp793DYWN1yhWgnax7DSI5Mj8uyihM4ldxrTzoLXZnJvEheOwUxRTOqZpJB
         5+xbcReFJbSmNkhhgFnC/mNNA04Ik2bcG3dSvyAKIK7RxxjJSQ4BTJWcSRmlkIp5TjWp
         LlDw==
X-Forwarded-Encrypted: i=1; AJvYcCXI6o0CZ3OYn6hMc1uDGxMYt5RRGyzecY+4TP8mYL5Jod/qVs5HyJ04NTIVbhnqrHQqLBB8OmizNn2I3mcwO0bhxH7gqaZ7nYl8
X-Gm-Message-State: AOJu0YyDUexHqvpjxq6XZu+GjexlSgALcKyFsitmLyGq+7JZcz1UON66
	RWAmOBBvpDCNw/XDYVJnyTFVTbvARMM2r/Vg4OrPWngtxku/pk7GddUUZ9CPjkI=
X-Google-Smtp-Source: AGHT+IGHj2HvbZP4hc88ihdmh15kc6PiOMtrsrZeH+p1UwP0kL1uZIIQk4Qau93XYXPUg/qe5DNZZw==
X-Received: by 2002:a5d:654d:0:b0:367:8f98:c503 with SMTP id ffacd0b85a97d-367cea45cffmr6602885f8f.1.1720770550532;
        Fri, 12 Jul 2024 00:49:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa0613sm9565691f8f.88.2024.07.12.00.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 00:49:10 -0700 (PDT)
Message-ID: <b5dd19d3-9a08-4187-b976-c197a2c0d9d7@tuxon.dev>
Date: Fri, 12 Jul 2024 10:49:07 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend support
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB1134615117603F62796558D1486A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e574e2a6-b231-4737-9501-342445923542@tuxon.dev>
 <TY3PR01MB1134611DB941585B340D09B7186A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB1134611DB941585B340D09B7186A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12.07.2024 10:45, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Friday, July 12, 2024 8:41 AM
>> Subject: Re: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend support
>>
>> Hi, Biju,
>>
>> On 12.07.2024 10:15, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: Thursday, July 11, 2024 12:52 PM
>>>> Subject: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend
>>>> support
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Enable runtime PM autosuspend support for the RIIC driver. With this,
>>>> in case there are consecutive xfer requests the device wouldn't be
>>>> runtime enabled/disabled after each consecutive xfer but after the
>>>> the delay configured by user. With this, we can avoid touching
>>>> hardware registers involved in runtime PM suspend/resume saving in this way some cycles. The
>> default chosen autosuspend delay is zero to keep the previous driver behavior.
>>>
>>> On the other hand, you are saving power. Currently the driver is
>>> highly optimized for Power usage.
>>>
>>> Before transfer turn on the clock
>>> After transfer turn off the clock, this is the optimal power usage correspond to suspend delay.
>>>
>>> By adding suspend delay, you are consuming power corresponding to that
>>> delay.
>>
>> The default delay is zero, see the following diff in this patch:
>>
>> @@ -479,6 +481,8 @@ static int riic_i2c_probe(struct platform_device *pdev)
>>
>>  	i2c_parse_fw_timings(dev, &i2c_t, true);
>>
>> +	pm_runtime_set_autosuspend_delay(dev, 0);
> 
> I just provided justification, why you addes 0  msec here, compared to xx msec
> in the original internal version.

Isn't it in the commit description already?

"The default chosen autosuspend delay is zero to keep the
previous driver behavior."

> 
> Cheers,
> Biju

