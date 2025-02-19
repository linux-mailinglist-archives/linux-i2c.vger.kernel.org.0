Return-Path: <linux-i2c+bounces-9495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215C7A3BBA0
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 11:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 632EC7A7B06
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 10:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDAA1D7E21;
	Wed, 19 Feb 2025 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNjlVY1R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625992862BD;
	Wed, 19 Feb 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960542; cv=none; b=rDeVsE4TEpODBtNCeHfwzC5UiyRrCNKLuoGsEecjECX3kVc9nOIfFd8YGkLxgdMTTsIKAk16B2U3jsNZnHPzUdNRuu8KxZjLphyx+4dErOk8LxXgZ/kkREjalt/WvmrH04sbtrj254C1HUqgqmAhiF6eexsAGcdeavMQFyDLo3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960542; c=relaxed/simple;
	bh=Vxo1FceSruAvB78KUC/qw5TmIe/SwwSnkGQR4cU4P9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huCnzh8YEekN+IB9kWmoojB+Rs2vCc5KH+RpN8MIOcM6jFe/GhJ4QdEveptu0bS0f0K3jsXpT0vSjkT7ARBMsz374GDPq97jMvsVaFFtnyro57qcqo8AZcw0MVMZUC4qkDDLckodpKYujVnWNJNmc6Fjd+h407sb4JOTWcQJRqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNjlVY1R; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so531470a12.3;
        Wed, 19 Feb 2025 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739960538; x=1740565338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xn6PLIq/hYJZMHmoZ7WzWDXGDvKP/21qnV3r4rQiOG0=;
        b=VNjlVY1RJxO56p0UIEoojT7L0FdAu5S0qVnZAyVZ3uC6Ehxo/DtVkqUEr0Swtvflr4
         upJ0nDUS5uNrHWePiWh4q1Da7naX7tm8WorREfSIhr3sU1KovUL7qO45IqegnSrtHvSm
         H6scEMU1GADKYzRcbkqDbozYm6Lq8A7UPVCE/wEhCmu+T7Kl/ei2VC1sXxfkaAHBIpY6
         ohZDIYZzhRBFQsTNT1129sbU47IeDbtVx86ASVWfDbU22CexT9rcyRVc/jioyqTKbKnB
         AVb72BVbyok005OQjb6Lzvs7nsgVyytCeVgyr9VJ5yYBzabXvZNBnQjc0wO8zyGGR8tA
         s/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739960538; x=1740565338;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn6PLIq/hYJZMHmoZ7WzWDXGDvKP/21qnV3r4rQiOG0=;
        b=d9bbHPGHpx25q8gYZJZfbnu7obLaiDoY0Zt1LhGx2rREuaaHZvcHvgY1fCbHhgL6IJ
         JYH5iI5/Mm3f8GmYFNnxdJHwQMOpa5mKx9AATzvIvQ0DyLXF0uhDDwEkJ/15XjMx5AZv
         uGlpz/68+Coj40YjFj0KrLCFb1IjYNRa3xgYrZCka4fIlqjkbNU4lQs5Sm8/lrDKan2n
         V7rK1RLvlatGMvGeP2y2bIsJDfi5oheS+2GH6oodyz2xXJm5v9NWozmGupMo8vlP8Jz0
         4WrENftTebIFE/Ou+WXY4eBVRJBT8I/5YzQxPHJ95HgI6lX6+88AkNfPcYJozaXpDsUu
         6mag==
X-Forwarded-Encrypted: i=1; AJvYcCWmaEyV6tNkuSJjdC9WkwDdHf+DvGwVPFwZCAlHjdvMsaCg1H0+K096Sb8MpgfK6Xn5nr86dpfYswri8zP4@vger.kernel.org, AJvYcCXKK5s2sa7YKNPm4kZISIBwKKiZ1exA+pztI/XXvfJm1NVSXzboVlLQD+vAVaOWeUDBPDwW9n2Ho9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUf1wPxG+I4IcEJPw/8kWj/swo4Pr+ak4mOPHKn9LwClJP0CgI
	mL0FAr52O6MiqqvkhI4uMFaXu7cT6yLemmj7MDndMLBw8KZjGygL
X-Gm-Gg: ASbGncsOQRiOYR6HqLYHT2qgYkqlwF5VEHlinvaNwKcP0/9w7b/c6CGKaGrBZ3uP6+R
	UFeOvy/hOwQwY3ve6SU2hs4+r8UGFb7EUXv6s7P5eEMUPkbT16iwgMJ3rUWuh/Xa0y4gd1Vi8Lz
	/0b1e2VmgL0yTDItGadgQCfeT3NTXHW2T41XT8sVp374AMZyxKpmQuWdNUHiZ+uM8SVLtvaeCLJ
	PHG7fU8Zq+m9s4htNZmkHKNHjnAe50r0PFSpqiHVYGaKSsVOPm0XxoYO+8rWkYsrKRtkkQ6Bt7V
	k8m1pym1Mrz0E25zfWFl3w==
X-Google-Smtp-Source: AGHT+IF1+i4w7feQne7dUBBneVK+7IjMeRYgja79qLFzsAniiNZS6ZHXXRPmYfSSYLgyXVDvPobLAg==
X-Received: by 2002:a17:906:c154:b0:ab8:95f8:b5e4 with SMTP id a640c23a62f3a-abb70d943c3mr2000318866b.41.1739960537281;
        Wed, 19 Feb 2025 02:22:17 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbdf076360sm55717366b.110.2025.02.19.02.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 02:22:16 -0800 (PST)
Message-ID: <72a4a706-c673-4f64-b0b4-6d70e2daf621@gmail.com>
Date: Wed, 19 Feb 2025 12:22:12 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: atr: add passthrough flag
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250203121629.2027871-1-demonsingur@gmail.com>
 <20250203121629.2027871-4-demonsingur@gmail.com>
 <4414628.ejJDZkT8p0@fw-rgant>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <4414628.ejJDZkT8p0@fw-rgant>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/19/25 11:52 AM, Romain Gantois wrote:
> Hello Cosmin,
> 
> On lundi 3 février 2025 13:15:17 heure normale d’Europe centrale Cosmin
> Tanislav wrote:
>> Some I2C ATRs can have other I2C ATRs as children. The I2C messages of
>> the child ATRs need to be forwarded as-is since the parent I2C ATR can
>> only do address remapping for the direct children.
>>
>> In the case of GMSL, the deserializer I2C ATR actually doesn't have I2C
>> address remapping hardware capabilities, but it is able to select which
>> GMSL link to talk to, allowing it to change the address of the
>> serializer.
>>
>> The child ATRs need to have their alias pools defined in such a way to
>> prevent overlapping addresses between them, but there's no way around
>> this without orchestration between multiple ATR instances.
>>
>> To allow for this use-case, add a flag that allows unmapped addresses
>> to be passed through, since they are already remapped by the child ATRs,
>> and disables dynamic remapping, since devices that need passthrough
>> messages to be forwarded as-is, can only handle remapping for their
>> direct children.
>>
>> There's no case where a non-remapped address will hit the parent ATR.
> 
> I'm having trouble understanding this, because it seems like there's a
> contradiction with your previous statement:
> 
>> add a flag that allows unmapped addresses to be passed through
> 
> Unmapped addresses are "non-remapped" by definition right? And they can hit the
> parent ATR since we're adding a flag to allow them to pass through...
> 

Non-remapped address means addresses that have never been remapped, on
any ATR instance, not on the parent one.

It's impossible for non-remapped addresses to reach the parent ATR
since the direct children are remapped by the parent ATR and the
children of the child ATRs are remapped by the child ATRs.

Unampped address means addresses that are not remapped on the current
ATR instance (the parent one, in this case, since that's where the flag
is supposed to be used).

I agree that my explanation was a bit confusing.

>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   drivers/i2c/i2c-atr.c   | 26 ++++++++++++++++++--------
>>   include/linux/i2c-atr.h | 20 +++++++++++++++++---
>>   2 files changed, 35 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
>> index 13f7e07fd8e87..5f0e8f1cf69f7 100644
>> --- a/drivers/i2c/i2c-atr.c
>> +++ b/drivers/i2c/i2c-atr.c
>> @@ -106,6 +106,7 @@ struct i2c_atr_chan {
>>    * @lock:      Lock for the I2C bus segment (see &struct
>> i2c_lock_operations) * @lock_key:  Lock key for @lock
>>    * @max_adapters: Maximum number of adapters this I2C ATR can have
>> + * @flags:     Flags for ATR
>>    * @alias_pool: Optional common pool of available client aliases
>>    * @i2c_nb:    Notifier for remote client add & del events
>>    * @adapter:   Array of adapters
>> @@ -122,6 +123,7 @@ struct i2c_atr {
>>   	struct mutex lock;
>>   	struct lock_class_key lock_key;
>>   	int max_adapters;
>> +	u32 flags;
>>
>>   	struct i2c_atr_alias_pool *alias_pool;
>>
>> @@ -241,7 +243,7 @@ static void i2c_atr_release_alias(struct
>> i2c_atr_alias_pool *alias_pool, u16 ali
>>
>>   /* Must be called with alias_pairs_lock held */
>>   static struct i2c_atr_alias_pair *
>> -i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>> +i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr, bool
>> new_addr) {
> 
> IMO the "new_addr" naming is quite confusing.
> 

Could you suggest a better name? I picked new_addr since when that flag
is true, we are mapping a new address, the call is coming from
i2c_atr_attach_addr().
When we're mapping a new address, and we are in passthrough mode, we're
free to reserve a new alias.
I've since then modified the conditions slightly to cover an edge case.

if (!new_addr && (atr->flags & I2C_ATR_PASSTHROUGH))
	return NULL;

ret = i2c_atr_reserve_alias(chan->alias_pool);
if (ret < 0) {
	if (atr->flags & I2C_ATR_PASSTHROUGH)
		return NULL;

	...
}

With this change, if we've made it past the section where we look for
an existing mapping, and we're not adding a new address, and we're in
passthrough mode, we return NULL. Passthrough mode shouldn't allow
aliases to be reserved dynamically, since the hardware can only map
direct children.

Also, if we are adding a new address, and we failed to reserve a free
alias, and we are in passthrough mode, we don't allow replacing an
existing mapping.

> After this patch is applied, the expected behavior is:
> 
> i2c_atr_find_mapping_by_addr() called from i2c_atr_attach_addr():
>    1. find existing mapping, return it
>    2. OR find free alias, create mapping and return it
>    3. OR remap used alias, return mapping
>    4. OR fail
> 
> i2c_atr_find_mapping_by_addr(), called from anywhere else:
>     1. find existing mapping, return it
>     2. OR find free alias, create mapping and return it
>     3. OR if the ATR has PASSTHROUGH set, fail
>     4. OR remap used alias, return mapping
>     5. OR fail
> 
> To me, the proposed code doesn't make it immediately obvious why the
> PASSTHROUGH flag should have anything to do with not attempting alias
> remapping.
> 
> Moreover, if we truly want to ignore *all* unmapped addresses, then shouldn't
> we also give up on step 2.? (the one that tries to map a free alias to the
> requested address).
> 
> In that case, I think something like this would be clearer:
> 
> in  i2c_atr_smbus_xfer() and i2c_atr_map_msgs():
> 
> ```
> #never attempts to create a new mapping, only to find an existing one
> c2a = i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
> if (!c2a) {
> 	if (PASSTHROUGH)
> 		# Since passthrough is set, we ignore unmapped addresses
> 		goto success or whatever;
> 
> 	c2a = i2c_atr_create_mapping(chan, msgs[i].addr);
> 	if (!c2a)
> 		fail;
> }
> ```
> 
> in i2c_atr_attach_addr():
> 
> ```
> c2a = i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
> if (!c2a) {
> 	c2a = i2c_atr_create_mapping(chan, msgs[i].addr);
> 	if (!c2a)
> 		fail;
> }
> ```
> 
> So what I'm suggesting is to remove all c2a mapping creation logic from
> find_mapping_by_addr() entirely, and to move it to a separate function.
> 
> Please let me know what you think.
> 

In the case of passthrough ATR, mapping creation should only be allowed
when direct devices are attached, ie: in the call to
i2c_atr_find_mapping_by_addr() from i2c_atr_attach_addr().
If i2c_atr_find_mapping_by_addr() cannot find a free alias in that case,
it should fail.

Other calls to i2c_atr_find_mapping_by_addr() should either return an
existing alias or NULL, and not attempt to create a new one or to
replace an existing one.

Let me know if my explanations made it clearer and what the you think
about going forward with this patch. In the meantime, I'll try to see
how the code looks with splitting creating from finding.

> Thanks,
> 


