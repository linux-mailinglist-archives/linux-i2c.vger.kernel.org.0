Return-Path: <linux-i2c+bounces-2191-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA9A871632
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 08:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF9911C21D4D
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 07:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D45F7B3CA;
	Tue,  5 Mar 2024 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aueYHGZg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F44500B
	for <linux-i2c@vger.kernel.org>; Tue,  5 Mar 2024 07:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709622369; cv=none; b=PGofVIm9E8weA/8WAOInILwZw9uEHXkRwaV8PL6dBty31kNc8r9dC21kXY2GuZQrbqlJQgFFFJEvobTSqnZYeKan460KN30zmotkIQizRwvb5e8HTHEzeGBtqHmWvmz6NnPIviE5Dn+0EaFOOu3WzjqsOCrN7s8AsedBMWOw2HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709622369; c=relaxed/simple;
	bh=zwCgx19yuoQ7USXJztur6k8XtWMvNux3cNr90Loah7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeUwFldz12bwmqKgqNKQfBNGkuZZfZVVJ0d7VJBkZZfwQyPbn22QeOKJbtHFObYZSpRm0hwG11TOx/2pV/qkWHwmn19z1HExVKkAi625lAutgL/NLjUzjLwtnAPDn69Ap9vTFw29Dx9EC+rKtBKkj/IPzWLSD/P61ejtJ9werIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aueYHGZg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a452877ddcaso245900866b.3
        for <linux-i2c@vger.kernel.org>; Mon, 04 Mar 2024 23:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709622365; x=1710227165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P2cgCu3Lw0p/zMDL6K7EeHJc2SupWKs6IwPRqzCwkFg=;
        b=aueYHGZgnsT0yDCbCEsVm7IOEupBvjD/Ic6R/a02niqKVrW4eEqK+JLwQunv8YsGgI
         L3vbleo0K2Nks4BLd0vruU66RAucFV96JYJ7kP7HXbtD8gS0YO3EUWFDAlYyOVvy7O0F
         d5rahn/lwCftBPmPdrVkq4UPoRtA3tMaDabK55uHfrGrIOVNju0c5vBqh6G4Y6BRxxBj
         d5ZyI3pBvqRoDm+0XUPirAV8AwZuP7otGF4HgJFf3DPR86SBOgbUNnn0hLh58dAYRJiy
         OGozQHGUpvIXbNez/cNCBY8nYsJGvf2EbbnYP1Eg0vjS7WMTxbRqkzFzJ5ic8hIvDmxo
         SsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709622365; x=1710227165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2cgCu3Lw0p/zMDL6K7EeHJc2SupWKs6IwPRqzCwkFg=;
        b=EYpHV7QiZk2jlT5eMzII5r7D0VJ0wCNMZJgZQ37MW7yyhytbUsYdnljEDx7Dh2/NCq
         p3xRiO5dOT+dkrDPsl8SdWgw0R7lfw1PkAZgjPup+4Z9h/18As5IJRgSV9us4ccrrAoN
         6MX34kh9+Klf7qAHqOCbkxi3vekg2TiiXK+0jie/T7t67cJguhuzZ9Hjy23vAJEXtDsp
         oA+IuQXm8flHWND/zqlXQRt5UJI+RbGyV0/6af4lnY1DVhD3UOxXzfAiGxRMaL8W7GDw
         SgboLW9Zclv0JIvLx06KF/Xg35Nc1b00XS3st6NY/uNn9xGYdeojTgFZoMAXi41zPx/t
         QUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCULb/9jSP99ZHgXU9+dDD+66Uq9KD6KfBJ+oKbMxLL0sBxA8IeSb1wuFvtkjq9kQxUHH2CDY9hxs9Ah9G7cSKnlgEqOY02VNKzq
X-Gm-Message-State: AOJu0Yw6hFSb7u7cK3NwnbSnVfn4IR7kR1KVK9BH+EdIsDufKeo6tVLV
	a3uMfahqZLE1VRCYv0F+8/QqGmatRY34NG4UDsze+kl/eRRm9+5k9PK764CO
X-Google-Smtp-Source: AGHT+IGRsFJ9s5dzkXi+pIUL6WJXyKRhPFEO6sl/5Kv2rV4QFzcQrIgnI91egZHV69l2/vi51VwtNQ==
X-Received: by 2002:a17:906:1114:b0:a44:729f:5bac with SMTP id h20-20020a170906111400b00a44729f5bacmr7164067eja.53.1709622365298;
        Mon, 04 Mar 2024 23:06:05 -0800 (PST)
Received: from ?IPV6:2a01:c22:73c9:2400:b162:822e:885f:75b0? (dynamic-2a01-0c22-73c9-2400-b162-822e-885f-75b0.c22.pool.telefonica.de. [2a01:c22:73c9:2400:b162:822e:885f:75b0])
        by smtp.googlemail.com with ESMTPSA id z20-20020a170906271400b00a441cb52bfcsm5721595ejc.165.2024.03.04.23.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 23:06:04 -0800 (PST)
Message-ID: <3f49c0df-449b-4c46-b789-ae492957cb5e@gmail.com>
Date: Tue, 5 Mar 2024 08:06:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: i801: Avoid potential double call to
 gpiod_remove_lookup_table
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <8d35529d-8ba9-4bdd-a3a3-00d67ab6f2d5@gmail.com>
 <jn7f4n6nnr24jpp5wo6yz55gm5y3mgwqmwaopxuy5kasvub37x@k7xt7kxjcckd>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <jn7f4n6nnr24jpp5wo6yz55gm5y3mgwqmwaopxuy5kasvub37x@k7xt7kxjcckd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2024 00:04, Andi Shyti wrote:
> Hi Heiner,
> 
> On Mon, Mar 04, 2024 at 09:31:06PM +0100, Heiner Kallweit wrote:
>> If registering the platform device fails, the lookup table is
>> removed in the error path. On module removal we would try to
>> remove the lookup table again. Fix this by setting priv->lookup
>> only if registering the platform device was successful.
>> In addition free the memory allocated for the lookup table in
>> the error path.
>>
>> Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v2:
>> - cc stable
>> - free memory allocated for the lookup table
>> v3:
>> - cc'ed Linus
> 
> this patch is a resend...
> 
Right, it's effectively a resend.

>> ---
>>  drivers/i2c/busses/i2c-i801.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 291c609d1..9c624f31c 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1428,7 +1428,6 @@ static void i801_add_mux(struct i801_priv *priv)
>>  		lookup->table[i] = GPIO_LOOKUP(mux_config->gpio_chip,
>>  					       mux_config->gpios[i], "mux", 0);
>>  	gpiod_add_lookup_table(lookup);
>> -	priv->lookup = lookup;
> 
> if I miss something obvious in my reviews, please let me know...
> I spend most of my time reviewing patches and it happens quite
> often :-)
> 
> Andi
> 
>>  	/*
>>  	 * Register the mux device, we use PLATFORM_DEVID_NONE here
>> @@ -1442,7 +1441,10 @@ static void i801_add_mux(struct i801_priv *priv)
>>  				sizeof(struct i2c_mux_gpio_platform_data));
>>  	if (IS_ERR(priv->mux_pdev)) {
>>  		gpiod_remove_lookup_table(lookup);
>> +		devm_kfree(dev, lookup);
>>  		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
>> +	} else {
>> +		priv->lookup = lookup;
>>  	}
>>  }
>>  
>> -- 
>> 2.44.0
>>


