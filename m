Return-Path: <linux-i2c+bounces-4852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D692D8E9
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CACF11F26B48
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 19:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1147C195FE0;
	Wed, 10 Jul 2024 19:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaXLcqL9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F20194C73;
	Wed, 10 Jul 2024 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720639020; cv=none; b=pD858YkY2Vmy9j464yNZpoq2Enolttz28C16mgMgdWYrTh7lmyjhttxBe530/ffbsK8EUPi+fmdxFIsNAzDjw3f+rbhBBjYe4ULcxb/cBr7jAxBWelATsjRr8GjUfLbU6CtVMHpYq9k4xUOpJvpgXQnyypYAb8RQeCKzpobCgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720639020; c=relaxed/simple;
	bh=q0/2Al4mJgaZPBCzGQz4fSEpj64qqLpkAQJY2B90HEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7DKar6QyzCNdD8bhPvLWaM6/OmQW6OiZs0oV8uUMan7fyhiaO9RzfSRbNd6EFQ7zOjZglziD0uMnu1JYJl2gbvpyrehkntQrDz/Qxx9ItTPCr6HJ95rTkQVNNMUDeZAla1ELm2xfE/O8d3iG5MwdxmhTR/oF6VcMHO/gzNnqhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaXLcqL9; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-710437d0affso39001a12.3;
        Wed, 10 Jul 2024 12:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720639018; x=1721243818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rFSrAVkn/a7mPoj30LB+T4FnVW3db2UjOHGrRFwKl3Y=;
        b=VaXLcqL9J7TcOD+Nev4IAFIa1+NxGfdt+aePI3kSfb/bF/uBxcZ2t42ch4qO4tJamx
         buFApxAoeqHeQLNUl0DFEdWv84P+iOJRIDaOzjK2HkSd8VBbqJsyQObjRcuWoOooXH1Y
         POXzimcbDmEsOo9F8noFYpBoOeULKrXGK37d1ar/yAvofn1WEOB9S3pETDHixQQKEPk4
         EY5i+amAq/dZ/CFpwG8qP3Nz2dGTFLOpKOQJq4Eh/iGUoknbSPBBMmPr7NhpOLGVC5rT
         l3lj7NNnekzfgoXJsHb5HaUheHXXEmXJf9UTimyu5kHmz5WidO2wvySvNI75myxOvAJ1
         kgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720639018; x=1721243818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFSrAVkn/a7mPoj30LB+T4FnVW3db2UjOHGrRFwKl3Y=;
        b=m9LgHu+BbMb0+vPwrqT77sW/fLbWAdL78iWMyMl0Eg+xVtCuBV0B6W5vng6Mp5kghE
         l8xQEan4eM3rK0rO7ly+PNDjWV5jWmYtPwHlmQj7sBPwYw/KIv1tn/7PkLG9h5Ch1oT1
         yRigBo3zmmpnNf4tic+AM1oxYcp0bprLm4ZRMBr68G4NfNWzzj58A+Ye3quLw9N+3qlp
         u1JGfYqGfSab9xhzaT2cRUrMaGmZJYhe4LTuPM0vZAxVjuxHqCuQSz9thEyYfb+rPJxt
         t9sUuK7ta46o7Pi6as9tGlsHbPnKQM5rPb/3bhnmvhVxBZTzRv5yTZxChJvG3vts5uLl
         +Gfg==
X-Forwarded-Encrypted: i=1; AJvYcCXr93qkZlX8+a0c3YTTv/fs3vcjGQ8HDqHRxQsTOxqCBpoB3/CqUOPTYDJrgiQYK/B3bEIh+4xmthVq9jUPrKqQOD9JLIzZcxwizcRmI+wijEH6U3AzL8vszgX6Sq6pR7UKNwDZWmU=
X-Gm-Message-State: AOJu0Yy79Rq73oQYvYtIfFg7CLQsn+nwiGEV8xEkwedPsrSuy4LAqaM6
	5eakxXAdxlet0tJrxUEe/LB1Btrq6b26QzK3W7lYVLrxMMByG+3L
X-Google-Smtp-Source: AGHT+IGuepe0LlZuH7k9BifxCdXTDAiyz3I//ZLrO5gZGm0XUMQnOJdkn8MCVDEBki1OiwrI+BcGYw==
X-Received: by 2002:a05:6a20:7f81:b0:1c2:905c:dba with SMTP id adf61e73a8af0-1c2984e4218mr7790063637.54.1720639018243;
        Wed, 10 Jul 2024 12:16:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439ed0f6sm4122463b3a.218.2024.07.10.12.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 12:16:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <201dec9d-bba0-477b-bbb2-c17aa37b944a@roeck-us.net>
Date: Wed, 10 Jul 2024 12:16:55 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (pmbus/ltc4286) Improve device matching
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
 Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <cover.1720600141.git.u.kleine-koenig@baylibre.com>
 <cf49bf8b0ba4e50e71e0b31471748b50d7b1a055.1720600141.git.u.kleine-koenig@baylibre.com>
 <c98be2fa-bc08-45cb-bed6-3efeeefa8754@roeck-us.net>
 <3jyzvldeh32cwjmvcuhazmz2jzuqjcbnza4yajnn2ky7mcby37@aswnxwoe6whu>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <3jyzvldeh32cwjmvcuhazmz2jzuqjcbnza4yajnn2ky7mcby37@aswnxwoe6whu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/10/24 08:48, Uwe Kleine-König wrote:
> Hello Guenter,
> 
> On Wed, Jul 10, 2024 at 07:09:28AM -0700, Guenter Roeck wrote:
>> On 7/10/24 01:35, Uwe Kleine-König wrote:
>>> The devices supported by this driver report the model name in their
>>> register space. The way this is evaluated allows longer strings than the
>>> driver's model list. Document this behaviour in a code comment to lessen
>>> the surprise for the next reader.
>>>
>>> Additionally emit the reported model name in case of a mismatch.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>> ---
>>>    drivers/hwmon/pmbus/ltc4286.c | 12 +++++++++---
>>>    1 file changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
>>> index 9e7ceeb7e789..2e5532300eff 100644
>>> --- a/drivers/hwmon/pmbus/ltc4286.c
>>> +++ b/drivers/hwmon/pmbus/ltc4286.c
>>> @@ -95,13 +95,19 @@ static int ltc4286_probe(struct i2c_client *client)
>>>    				     "Failed to read manufacturer model\n");
>>>    	}
>>> -	for (mid = ltc4286_id; mid->name[0]; mid++) {
>>> +	for (mid = ltc4286_id; mid->name[0]; mid++)
>>> +		/*
>>> +		 * Note that by limiting the comparison to strlen(mid->name)
>>> +		 * chars, the device reporting "lTc4286chocolade" is accepted,
>>> +		 * too.
>>> +		 */
>>
>> This is misleading; the desired match is LTC4286 and all its variants (LTC4286[A-Z] and
>> whatever else the vendor can come up with), i.e., it is supposed to include all device
>> variants, and ignoring case since it is irrelevant. Referring to the odd string just
>> makes that look unnecessarily bad. I am not going to apply this patch, sorry.
> 
> You're quite an optimist, expecting "whatever the vendor can come up
> with" but nothing bad :-)
> 

"optimist" is relative. A perfectly valid alternative would be to _not_ do any
testing at all. After all, this is not a detect function, this is the probe
function, which should only be called _after_ the chip has been identified.

Since the model number is not used for anything but extra validation, one might
as well argue that the validation is unnecessary and can or should be dropped
to reduce boot time. Of course, given the vagueness of the PMBus specification,
that might result in fatal consequences if the wrong chip is instantiated,
so I think that validation does make sense, and I suggest to add it for all
PMBus drivers. However, one can overdo it (and not all drivers do it).

> Anyhow, what about updating the comment to read:
> 
> 	Note that by limiting the comparison to strlen(mid->name) chars,
> 	matching for devices that report their model with a variant
> 	suffix is supported.
> 
> While looking at the code again, I spotted a (theoretic) bug: Given that
> block_buffer isn't initialized at function entry, it might well contain
> "LTC4286something" (which might even be realistic if the driver just
> probed on a different bus?). Now if i2c_smbus_read_block_data(...
> PMBUS_MFR_MODEL, ...) returned something between 0 and 6, we're looking
> at bytes that didn't come from the block read.
> 

Yes, I would agree that a check ensuring that ret >= 7 would make sense.

Thanks,
Guenter


