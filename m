Return-Path: <linux-i2c+bounces-4362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FDA9178F5
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 08:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BFA6286965
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 06:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0047614F126;
	Wed, 26 Jun 2024 06:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SkMn796K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B08710F4
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 06:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719383459; cv=none; b=p6D27z/vjjEsyTVOT5m4ZL4o7L02UWGRon7QCO3LuDD38mmKJPWVbuZtDlJAI3GU/6ikJ6JWlfoJqmh7R/wOQ5HdSx5MD5CCd963FUf5GaJ6tnw6jtHU7XwSsYUISNWPwkgy/B4UwPkEhVbXf9jy3VAoisKTk2nL9r+vPC2FGmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719383459; c=relaxed/simple;
	bh=QoZBBD04nCqz77PHfde6PgjybQ+GJKEDMKybcnGsOdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DReVGZ4P+XHEamhnPQSW7W+rG5iXBYiaz8Wo2yamjwcGoNYlnh1/aYljGljKKvFC4JAqwv66QpiatcM6Iadtn6bxF4uOwVN72+OxedkMAbs1eCMqzoXWclH50jnKt3e2OExMT2oi1R+KsnK5GU5K2YbzAxC+Af1NPe8I3vkP1jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SkMn796K; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42249a4f9e4so47077965e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 23:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719383455; x=1719988255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAa6dLYtG2OKHXr/wLMHqZHlSTHh379e2cdOImJ5HIk=;
        b=SkMn796KEBMmlV1/LwsBYi0uEeQgLMvJYCdtzsUV4h9Zs0Vfk/eVV4cFPxU8GTgIkx
         sjPhw2ncxVF5MD5MCb7EK+vcKHuISxNhCGEnWSqO3U0McmuVu/XJ49e8rpxYKEiptPGE
         fMdzQcUYJ36eaBfwLvUQqu202vtcnLN9yoGpgXbfdY9dSbMJ/KZMoaKJUhoaZzL/13SA
         ilV6wG3qjFLgDOk3A9oTZwj5wj5UTZQFjhjlZDwUymqieIUzXSzuqrHCLWqcRaaQUz+V
         U6vjppqavaSBh4Mxw7w1x4/W4p7i7j3ZxqYy0TsmOK9HECt3mW7dIThRqMPzWuUayS6l
         DVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719383455; x=1719988255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAa6dLYtG2OKHXr/wLMHqZHlSTHh379e2cdOImJ5HIk=;
        b=U/V8Ec3q3bt9BwubAhNIx4yuVKf0eStGcjPGrvRXhn/oY5H8qsi5LohN5vDj2rrCMV
         kEDw2c3rndrnogU6d/kw116EC/Hz6ol+qi4vT53ZckFu6daGmocSROrqABEqBedE+jUP
         NQ1KNrjt929r5GhD3ZvomZGuJCi1U+lpaE9O2b0QcMCQJdAd01EYbB09Ng1ynqaZMHL+
         2iZ1p+fWDGoGZR1fuYmcnCut/m07xtVh/1fk2vZBYlFtghd+JrKOTgaC+mzUSJbDe9Np
         ORh7jRnXWaBtu470AkhSLZo9W6vJmEsorw07Rqo2sn1AF1kOzXVXYsWjHpw8VqLTjIWc
         4uGw==
X-Forwarded-Encrypted: i=1; AJvYcCXuF8K+MyJVECZQqwYk/SCjjVJGJbmT7h0wX9TiI7WKImT/+XuANK3QKZves+HbcSXr9Kb9n68nWpveEe4cs/v+tQh/XZBYWDe0
X-Gm-Message-State: AOJu0YzuYEMlMXjPBJEX8bPMjev4bAhvVpXCVi5nzHewtlHu2xw81NhC
	8ea5hf6gtsr8kF104tdyS1zPsa0EVTpEcnkoa22cJB973M0Ozni//GlWkWun9qQ=
X-Google-Smtp-Source: AGHT+IHPgO5hKOzY5PM4GBfrNZwkRIyiopPXJvxBeCAet0Hc/x7gix4dehei+CLMhB2R8dFv9g/XqA==
X-Received: by 2002:a05:600c:5686:b0:423:668:4c39 with SMTP id 5b1f17b1804b1-4248cc18115mr72023575e9.1.1719383455336;
        Tue, 25 Jun 2024 23:30:55 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c84692c0sm12747975e9.43.2024.06.25.23.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 23:30:54 -0700 (PDT)
Message-ID: <a8b5ccee-f9a9-4bfa-be70-085d2fe7f8d2@tuxon.dev>
Date: Wed, 26 Jun 2024 09:30:52 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
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
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346F03386D05D608041DE8D86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <14167607-e67b-4627-99f0-6e99acc7f880@tuxon.dev>
 <TY3PR01MB11346A47493E0EE96CB2CF17B86D62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346A47493E0EE96CB2CF17B86D62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26.06.2024 09:23, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Wednesday, June 26, 2024 7:14 AM
>> To: Biju Das <biju.das.jz@bp.renesas.com>; Chris Brandt <Chris.Brandt@renesas.com>;
>> andi.shyti@kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
>> geert+renesas@glider.be; magnus.damm@gmail.com; mturquette@baylibre.com; sboyd@kernel.org;
>> p.zabel@pengutronix.de; wsa+renesas@sang-engineering.com
>> Cc: linux-renesas-soc@vger.kernel.org; linux-i2c@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Claudiu Beznea
>> <claudiu.beznea.uj@bp.renesas.com>
>> Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
>>
>> Hi, Biju,
>>
>> On 25.06.2024 18:53, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: Tuesday, June 25, 2024 1:14 PM
>>>> Subject: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> pm_runtime_get_sync() may return with error. In case it returns with
>>>> error
>>>> dev->power.usage_count needs to be decremented.
>>>> dev->pm_runtime_resume_and_get()
>>>> takes care of this. Thus use it.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - delete i2c adapter all the time in remove
>>>>
>>>>  drivers/i2c/busses/i2c-riic.c | 30 ++++++++++++++++++++++++------
>>>>  1 file changed, 24 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-riic.c
>>>> b/drivers/i2c/busses/i2c-riic.c index 83e4d5e14ab6..002b11b020fa
>>>> 100644
>>>> --- a/drivers/i2c/busses/i2c-riic.c
>>>> +++ b/drivers/i2c/busses/i2c-riic.c
>>>> @@ -113,6 +113,8 @@ struct riic_irq_desc {
>>>>  	char *name;
>>>>  };
>>>>
>>>> +static const char * const riic_rpm_err_msg = "Failed to runtime
>>>> +resume";
>>>> +
>>>>  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)  {
>>>>  	writeb(val, riic->base + riic->info->regs[offset]); @@ -133,10
>>>> +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>>>>  	struct riic_dev *riic = i2c_get_adapdata(adap);
>>>>  	struct device *dev = adap->dev.parent;
>>>>  	unsigned long time_left;
>>>> -	int i;
>>>> +	int i, ret;
>>>>  	u8 start_bit;
>>>>
>>>> -	pm_runtime_get_sync(dev);
>>>> +	ret = pm_runtime_resume_and_get(dev);
>>>> +	if (ret) {
>>>> +		dev_err(dev, riic_rpm_err_msg);
>>>
>>> As at the moment we don't know how to reproduce this error condition
>>> Can we use WARN_ON_ONCE() instead to catch detailed error condition here??
>>
>> [1] states "So, naturally, use of WARN_ON() is also now discouraged much of the time". I've go with
>> dev_err() or something similar.
> 
> WARN_ON_ONCE() should be ok I guess as people are using for printing this info only once??

Ok, I'm leaving this to I2C maintainers.

Andi, Wolfram,

Would you prefer having WARN_ON_ONCE() instead of dev_err() for potential
failures of pm_runtime_resume_and_get()?

Thank you,
Claudiu Beznea

> 
> Currently we don't know how to trigger pm_runtime_resume_and_get() error 
> condition in our setup using a testapp and we are expecting an error may
> happen in future. If at all there is an error in future, we need detailed
> error info so that we can handle it and fix the bug.
> 
> Cheers,
> Biju
> 
>>
>> Thank you,
>> Claudiu Beznea
>>
>> [1] https://lwn.net/Articles/969923/
>>
>>>
>>> Cheers,
>>> Biju
>>>
>>>> +		return ret;
>>>> +	}
>>>>
>>>>  	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
>>>>  		riic->err = -EBUSY;
>>>> @@ -301,6 +307,7 @@ static const struct i2c_algorithm riic_algo = {
>>>>
>>>>  static int riic_init_hw(struct riic_dev *riic, struct i2c_timings
>>>> *t)  {
>>>> +	int ret;
>>>>  	unsigned long rate;
>>>>  	int total_ticks, cks, brl, brh;
>>>>  	struct device *dev = riic->adapter.dev.parent; @@ -379,7 +386,11 @@
>>>> static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>>>>  		 t->scl_fall_ns / (1000000000 / rate),
>>>>  		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
>>>>
>>>> -	pm_runtime_get_sync(dev);
>>>> +	ret = pm_runtime_resume_and_get(dev);
>>>> +	if (ret) {
>>>> +		dev_err(dev, riic_rpm_err_msg);
>>>> +		return ret;
>>>> +	}
>>>>
>>>>  	/* Changing the order of accessing IICRST and ICE may break things! */
>>>>  	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1); @@
>>>> -498,11 +509,18 @@ static void riic_i2c_remove(struct platform_device *pdev)  {
>>>>  	struct riic_dev *riic = platform_get_drvdata(pdev);
>>>>  	struct device *dev = &pdev->dev;
>>>> +	int ret;
>>>>
>>>> -	pm_runtime_get_sync(dev);
>>>> -	riic_writeb(riic, 0, RIIC_ICIER);
>>>> -	pm_runtime_put(dev);
>>>>  	i2c_del_adapter(&riic->adapter);
>>>> +
>>>> +	ret = pm_runtime_resume_and_get(dev);
>>>> +	if (ret) {
>>>> +		dev_err(dev, riic_rpm_err_msg);
>>>> +	} else {
>>>> +		riic_writeb(riic, 0, RIIC_ICIER);
>>>> +		pm_runtime_put(dev);
>>>> +	}
>>>> +
>>>>  	pm_runtime_disable(dev);
>>>>  }
>>>>
>>>> --
>>>> 2.39.2
>>>>
>>>

