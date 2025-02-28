Return-Path: <linux-i2c+bounces-9642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DDA49915
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 13:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B86189673F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 12:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFED268C6D;
	Fri, 28 Feb 2025 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0q/zVr3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECC11C5496;
	Fri, 28 Feb 2025 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745361; cv=none; b=IYEn3e3Vj5GgqD4kL8uLOdIsWm08Q8E/4lP9qaSjTiR4/GLs1FK9wUXY39BUX2P5dOUWTnByM8/jo53fhJnz4kD+LHKdXn27eB1shRDSjCQpHgwnCzYBTHR00YLkuEj18OPx3Pk1ZyRbd6RTq+/PolRFX07J1zRR3Q97xaTFfSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745361; c=relaxed/simple;
	bh=zN8FxJjE2ih1PRLDBbvb/XoK9cKYEl2ko3azJSx85Eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+elJMDFWdE81VEWtcc+37DlqvexutLX25n3onZ5WfZBGEcxw3EQVlDbiKvpB0DReWDnaCNgtpt6hzdtrMbse+6R17yngblyjC+avN1sGI2r9Wq7VOW6KlfXbTV0SolKffdbvHrLHF4kc4bVGyUQlr3+viRPQXC/z121aEaRQ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0q/zVr3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e4f5cc3172so783678a12.0;
        Fri, 28 Feb 2025 04:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740745358; x=1741350158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYyvZ/njHqTmV4uUbvFhn12gYgVAOrVWpfl3Ld8U4xE=;
        b=j0q/zVr3CmH1tfjwfij52uWU5ELgctUqaIb2Wi/dwJOsF97e8UTlKi882stzystyF/
         cKJseLOBbf4l/Euy4cVwTcFrKxC/929kwcQph7dI5SkA4Kmi4s1jF/1nmDmggV/AOJFM
         bVx82bTZBFAoxFO5L3pXlFeVjGKfwv5Cj7ucotrUoqI5QARtW7ICteXFaJKfirhjHbC/
         OqFV+o7wrNjBz3MaM+zWTP4xXl1VGu8ZnFbuBuWmodKcBF5EvqPbe+5BDnzVsH6536QG
         w7jRTp3IYwuIZpWT91eFuldGyutpoNCOhUqH3UkMG3SFHiKGaa0e9hynGIVFD3oyVmsh
         f8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740745358; x=1741350158;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYyvZ/njHqTmV4uUbvFhn12gYgVAOrVWpfl3Ld8U4xE=;
        b=KWAvCIGQAmQr62vSFzImkKTT4QT4es/LAuKZc4HG7Z3J/HigriepehJiQA0zmkyMek
         IrcmvQ2bvoo96JkmigECF6M3P6ATDxJyGJdnXeiGTRfIMXjgvkcvX6htbQf/EOm0fqnK
         akgoXRJAf70nK6j+b8ryX+bWkwOAHUnqLUoNZAvzyXiYiPpTPTxUnE6coYts6i0z3VFa
         OMY9K+DAqPzeE1S57P6wXQtCL3u/vIRoYlWvMpALD+nkcImnSmFPB5BqXGAyD9WpZAHr
         uXs9FoMd1gesImBcCXYtIiGxp0ktXb9tG1bYh72hHJOIY1klfkOsZsMvaGwTOPud2u9Y
         oFoA==
X-Forwarded-Encrypted: i=1; AJvYcCUo61AWRxE7d5yAa6+iCNDQy8IuKfPCCiX8iuIoul88qzzG/yBBa5ycMiqsBopnAZDW2j/E2ngN2LHP39z7@vger.kernel.org, AJvYcCVwvltDGogIhiQh7WwP4F/muWq+IrcO+Z5+2AMYugYceFje2gHyU+N3SBuyclhZ1KRuudpLZPLGoMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVa1zu+SYBCCRSo9RC2mBIxkQx28JhTC1GL9YxZNoG4FSj9Hdk
	2pzlp7sraXeQkKyt0sxMn9gpT4ifcMB71FgM54aF85CulLi2ieC8+3G4JA==
X-Gm-Gg: ASbGncs9cVYMur3IBYYqHC1oO8Sf5Mjn74+pNl6GiLQRMHpcIClCP32qHP+j6GZlk9f
	0/2WEim3YVd+k9Yp1ZMCfw6iAkdkCr6Gn2DHvOy875FoNL6aZprWHuySsVyqSdSmEAzJO0nrAyM
	ix1pFagjsb4m/GPbl4M7K9n1xd9Z8Y/qHNqTXgsGUHBAp7Sblmnkn+ijb8P+mLZnsR9SL1P9GA6
	dZCnyBDa63nlZq27OjmJEV9WmQB3VOV8xhvZQPc2C1Jr4ZklFgFhFQQJseiQGgeSPA/ZWTKu3ws
	pbuC1yHd9+mo+9IvWau5LGzH+2f03nmT
X-Google-Smtp-Source: AGHT+IHSpDHvHjBFxPTpd55+gD+EkwkqhzMpASgQ/6fc/mHclW7Ak4D78nI46qRukSAYIJCdvW9GUA==
X-Received: by 2002:a05:6402:274b:b0:5e4:cf2e:891c with SMTP id 4fb4d7f45d1cf-5e4d6ad8737mr2816866a12.12.1740745358261;
        Fri, 28 Feb 2025 04:22:38 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bb73e0sm2478875a12.40.2025.02.28.04.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 04:22:37 -0800 (PST)
Message-ID: <36a3cd6b-085d-4ea9-bbfa-86222b166984@gmail.com>
Date: Fri, 28 Feb 2025 14:22:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] i2c: atr: deduplicate logic in attach_addr()
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250225113939.49811-1-demonsingur@gmail.com>
 <20250225113939.49811-7-demonsingur@gmail.com> <3644500.iIbC2pHGDl@fw-rgant>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <3644500.iIbC2pHGDl@fw-rgant>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/27/25 3:36 PM, Romain Gantois wrote:
> On mardi 25 février 2025 12:39:34 heure normale d’Europe centrale Cosmin
> Tanislav wrote:
>> This is the same logic as in i2c_atr_create_mapping_by_addr().
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   drivers/i2c/i2c-atr.c | 30 ++++++------------------------
>>   1 file changed, 6 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
>> index b62aa6ae452e..5b53eaee0408 100644
>> --- a/drivers/i2c/i2c-atr.c
>> +++ b/drivers/i2c/i2c-atr.c
>> @@ -538,38 +538,20 @@ static int i2c_atr_attach_addr(struct i2c_adapter
>> *adapter, struct i2c_atr_chan *chan = adapter->algo_data;
>>   	struct i2c_atr *atr = chan->atr;
>>   	struct i2c_atr_alias_pair *c2a;
>> -	u16 alias;
>> -	int ret;
>> -
>> -	ret = i2c_atr_reserve_alias(chan->alias_pool);
>> -	if (ret < 0) {
>> -		dev_err(atr->dev, "failed to find a free alias\n");
>> -		return ret;
>> -	}
>> -
>> -	alias = ret;
>> +	int ret = 0;
>>
>>   	mutex_lock(&chan->alias_pairs_lock);
> 
> A mutex guard could be used here.
> 

Should we be using it in other places in the driver too then?

We could leave that conversion for a separate commit.

>>
>> -	c2a = i2c_atr_create_c2a(chan, alias, addr);
>> +	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
>>   	if (!c2a) {
>> -		ret = -ENOMEM;
>> -		goto err_release_alias;
>> +		dev_err(atr->dev, "failed to find a free alias\n");
>> +		ret = -EBUSY;
>> +		goto out_unlock;
>>   	}
>>
>> -	ret = atr->ops->attach_addr(atr, chan->chan_id, addr, alias);
>> -	if (ret)
>> -		goto err_del_c2a;
>> -
>>   	dev_dbg(atr->dev, "chan%u: using alias 0x%02x for addr 0x%02x\n",
>> -		chan->chan_id, alias, addr);
>> +		chan->chan_id, c2a->alias, addr);
>>
>> -	goto out_unlock;
>> -
>> -err_del_c2a:
>> -	i2c_atr_destroy_c2a(&c2a);
>> -err_release_alias:
>> -	i2c_atr_release_alias(chan->alias_pool, alias);
>>   out_unlock:
>>   	mutex_unlock(&chan->alias_pairs_lock);
>>   	return ret;
> 
> Best Regards,
> 


