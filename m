Return-Path: <linux-i2c+bounces-10764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E465AA9115
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 12:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E041F1754C2
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 10:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685431FF1B0;
	Mon,  5 May 2025 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpwKPMcJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C8EAE7;
	Mon,  5 May 2025 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746440823; cv=none; b=T3j2BiO2vWeO8RCAkCAZH4nESnKn1I/l3z5ny2bEr2te9MRc9JQc+jB2UPu4WfBaPTCDPDYoTOabH31JayfkpQ9+59MkvMXod1U80WHIDtTKYLpPN9OJroeILvVdlJvSUjowdJqqOo07XzOTuJF0dsWNIFw5i/Jed1/lx7fXy/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746440823; c=relaxed/simple;
	bh=vIEn5jPg1DlXlT2DtAHSUaaG6Asm33c6yiTnu7goALA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nbdu5SMPP3Lge9sLNTehyXLi86Qz3yMMUP61DZlL1s4INZAqlZut5YsU+yfF7k5jHHsynVbaK6acW3KK2ENQPCSJO6Cdl6boTZKOnOANKJramoaYCrQ05CUGEydKcalV/JY6C9uIJjjMx+AtH0ITtsaNEdNlLSn1RvqyUih3jMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpwKPMcJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2c663a3daso836475866b.2;
        Mon, 05 May 2025 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746440820; x=1747045620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONK1gMSU4x7CVxggdEmF7Yfu7g3KNC31GYbuN3RsWUg=;
        b=gpwKPMcJZjKQCBrV77tOAI81kXA5o2wOKmXpWaJEBawcynqsqcBrZCRn0iiVAW7SAX
         muCqYH2lyo9ETMDqAUNiXHIxXdOW1durB5CHCid4+/oG99J5j6qFrpJrlSiWFT7hcO6L
         HvJ/Kk4jotySsTdNJLHoottFT8MFWXSRjxeemJIYTDmqErWRQypd/uknE52+6uYA0HuP
         y+iAfteJmFYnRMgFv9R9zJQiCPNAxuRkzzKZRd3OtqkYyK7WlsajpkiDWMElsBLH8V0U
         dCxFNJkzqIqvL/g4EvGgqPQpvW/HMdfx8ozIbySUKpwZPkrG0vEgUjcBaxM80tqyChGn
         tSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746440820; x=1747045620;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONK1gMSU4x7CVxggdEmF7Yfu7g3KNC31GYbuN3RsWUg=;
        b=xF1xfLYkIP7XT8UWiATOTxmeVKDTj9NwUdBAOF4j4fEPbYuOV+XcsVhwPXLQZtcxRt
         Jzit+Isr1suxPuMg2kABBWhQHCrSTjEra3VWma53clSQ5MoVI8SY9bGpwsecZdLBwsmc
         f1uHeq1RS0xd9Imh1o8zoVeGZTbsH0BQ2kHkUzdg1W3wDMCPU3RX6gfQZfHcZ/ZF+ba2
         Sc/Zso2YFWSkOcbV1i6rc2HMJSkm7eySk4KVQUnF+uszf+xkfcfJEloCaF33RLBt9ZuK
         FqDE9DbTXV1JrGkomfeQk9lvbLQlpgKqeqvWz5ARTOOc0PEQo/SBnqYttsrbffHi0Lno
         wLZA==
X-Forwarded-Encrypted: i=1; AJvYcCUEqIZWP1jByKJ9UGb6yNJIV4D0L70qts+ta5wS4/bhil+13Yih8wBXKD5bKtNVlZXsvDUvbJICzig=@vger.kernel.org, AJvYcCVql3iDYZT7X6l4wAtLVeM9GOgHAC8xrEfuxkVfK1xgcPHoZgXitb5fWzqVqK5Ooiv8DJC94yOESOYKIwCc@vger.kernel.org, AJvYcCXTqrves7gNc80CumfIvFE0muVdcuTANnUYBze4V/5BTUHrxnrqR6VTQfG7H6DjJzRW0PmKbtnrdkUqEQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQLBVNfxPvBAXanl98bOEYimdKGJ4NrwfOG4tX13NI87TDxHK
	yu6jxLEUseNgYURyd96fxl6wGnO47wxybZ9SKHnfr30Mln5hOKzz
X-Gm-Gg: ASbGncv5WURiyxwKGjVpFf3aj63QF2bfei5PQEcl//0xs/K72bOuvTTQ2TvrvRJO1jA
	oCLaOBhm3qW+RHtvOzSb57bCIHH7ij4P+jMv+TYpxS9/i0AfNyBK1Ve22FLvLACZbQHCtEWld2w
	ZeybdevyA1lqynUNLI62wdLNt93RPGFu2fGy3IHRErabhBXWnm1XpYsghCaocck5zgtdOCP7UVY
	WFOylIqaxpNhLk3aVhs1COjuMDvl99nV64phHhdK+jnsHMA4PT5QGO+qW2RcvBKfH9iCeiN6IbC
	FJdRB3hejRz+og9UFJnhpB9QmW66KxN6nuSjOzGphUo49o0KWoaF9o8o
X-Google-Smtp-Source: AGHT+IEA88UDbqLeQ5CxfAdCRwRoKBxVmMrFW+eXkNcP3H/zkxJqAzxrUQDJ2fMD6z2jNnNIopn6jg==
X-Received: by 2002:a17:906:f5a4:b0:ace:cc7f:8abe with SMTP id a640c23a62f3a-ad1a49c349cmr679078166b.31.1746440819386;
        Mon, 05 May 2025 03:26:59 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950ac90sm471864166b.150.2025.05.05.03.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 03:26:58 -0700 (PDT)
Message-ID: <f3bf2c93-31ac-4881-9ca3-ddc33cf3ded3@gmail.com>
Date: Mon, 5 May 2025 13:26:54 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] i2c: atr: split up i2c_atr_get_mapping_by_addr()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250428102516.933571-1-demonsingur@gmail.com>
 <20250428102516.933571-4-demonsingur@gmail.com>
 <20250430163307.528671a8@booty>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20250430163307.528671a8@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/30/25 5:33 PM, Luca Ceresoli wrote:
> On Mon, 28 Apr 2025 13:25:08 +0300
> Cosmin Tanislav <demonsingur@gmail.com> wrote:
> 
>> The i2c_atr_get_mapping_by_addr() function handles three separate
>> usecases: finding an existing mapping, creating a new mapping, or
>> replacing an existing mapping if a new mapping cannot be created
>> because there aren't enough aliases available.
>>
>> Split up the function into three different functions handling its
>> individual usecases to prepare for better usage of each one.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> 
> This function has become quite complex over time, so this looks like a
> good cleanup by itself even not counting the advantages coming with the
> following patches.
> 
> I have only one small remark, see below.
> 
>> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
>> index 939fb95fe781..184c57c31e60 100644
>> --- a/drivers/i2c/i2c-atr.c
>> +++ b/drivers/i2c/i2c-atr.c
>> @@ -239,9 +239,23 @@ static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 ali
>>   	spin_unlock(&alias_pool->lock);
>>   }
>>   
>> -/* Must be called with alias_pairs_lock held */
>>   static struct i2c_atr_alias_pair *
>> -i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>> +i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>> +{
>> +	struct i2c_atr_alias_pair *c2a;
>> +
>> +	lockdep_assert_held(&chan->alias_pairs_lock);
>> +
>> +	list_for_each_entry(c2a, &chan->alias_pairs, node) {
>> +		if (c2a->addr == addr)
>> +			return c2a;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct i2c_atr_alias_pair *
>> +i2c_atr_replace_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>>   {
>>   	struct i2c_atr *atr = chan->atr;
>>   	struct i2c_atr_alias_pair *c2a;
>> @@ -254,41 +268,57 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>>   
>>   	alias_pairs = &chan->alias_pairs;
>>   
>> -	list_for_each_entry(c2a, alias_pairs, node) {
>> -		if (c2a->addr == addr)
>> -			return c2a;
>> +	if (unlikely(list_empty(alias_pairs)))
>> +		return NULL;
>> +
>> +	list_for_each_entry_reverse(c2a, alias_pairs, node) {
>> +		if (!c2a->fixed) {
>> +			found = true;
>> +			break;
>> +		}
>>   	}
>>   
>> +	if (!found)
>> +		return NULL;
>> +
>> +	atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
>> +	c2a->addr = addr;
>> +
>> +	list_move(&c2a->node, alias_pairs);
>> +
>> +	alias = c2a->alias;
>> +
>> +	ret = atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a->alias);
>> +	if (ret) {
>> +		dev_err(atr->dev, "failed to attach 0x%02x on channel %d: err %d\n",
>> +			addr, chan->chan_id, ret);
>> +		i2c_atr_destroy_c2a(&c2a);
>> +		i2c_atr_release_alias(chan->alias_pool, alias);
>> +		return NULL;
>> +	}
>> +
>> +	return c2a;
>> +}
>> +
>> +static struct i2c_atr_alias_pair *
>> +i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> 
> I would move the _create function before the _replace one, because
> that's the logical order in which they are called.
> 

Sadly the diff actually becomes bigger by doing this.
before: 78 insertions(+), 32 deletions(-)
after: 84 insertions(+), 38 deletions(-)

If we were to put things in a logical order then should we put _find()
after create(), or after replace()? There's no specific order in that
case. I think we should keep things as-is as it matches the previous
branches of the code, just split into separate functions.

> As a nice side effect, this might make the diff more readable.
> 
> Luca
> 


