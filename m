Return-Path: <linux-i2c+bounces-3793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD198FB544
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 16:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0A541C22205
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 14:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1352613D27C;
	Tue,  4 Jun 2024 14:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCU4TJ2/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68D13C90F;
	Tue,  4 Jun 2024 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511426; cv=none; b=HKfY4MgcCIL0+IKMLzAKqT8eqjlOGLvPECplAxweZQsr4cYrCAXWWuRcY3tchvJevMS/nOpF/cLcyetvqe3G5MF6ULtbsTXDkaofk7KWH1m+LsaMHXpPjaOJFWb4rHu9+FNsC35M1040fdTr21eD4IaiXmUVlFuB4oUzzjnqReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511426; c=relaxed/simple;
	bh=HwX1B5xANCMQwH4ThuytM1R4l4HRqT25rPLilxhsrlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qKJFERfZ7bl6ipd2z68falSzcJgN0Gfj7Fj9dmDO6pe2FcICpQciKVQo+I4s1rH+hUsyI0/S7Q5AZqKx+LkuucX4uDFXW9uyVEoTrA4xFqQnpnyLC4Au/veDyay5cinqBUEcCAC4x5JnoASABYwypAT/f3rssuGjCWYJ5r+tJbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCU4TJ2/; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2bda9105902so3352892a91.0;
        Tue, 04 Jun 2024 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717511424; x=1718116224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=thPFwuuLv1KcZDTeCxBeR8Efu8jvfri7D4yrW1vwDoo=;
        b=PCU4TJ2/VmYzFGChPme1rSH37SWcJEtXy3TS55ku9oRJH69wSKKV9xT+CVU8+Z2MD+
         GJ2OqqjvSpjW04fDRprKShvxb18ckbywuMEV8v8sCyB38bCAwC8oaEhN7uA48Mugwk0/
         v3BwiJXt076gvd29vGzEMHf7eBmGsYeD1hQoJeSbpwxk587OdwPeZ0cqbNpNc3KT4v5t
         LYOKl61FCwVl+XcMOEAj2iu666GXT242H+zq0S+GiSMMAEn7G28LFYLt380oE8KkYeir
         33DhmgXcV3mVJSeXGTmUPVRM2PNL7qeJmCFXho8gchOo6dXAKBelEOibqcq+Fmb94xEg
         AtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717511424; x=1718116224;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thPFwuuLv1KcZDTeCxBeR8Efu8jvfri7D4yrW1vwDoo=;
        b=biyYYtLN7h5qd6yNiiFYIwPlNZs27fu2sLUuNQBcfAtUq5lLuG34TQK5TRJ2kLRHxR
         /gpu5mWtnduL3eg0xQHjk7U6R7G6VxSe9erfpQImytQexVNo2OBRwLXE3rIHFYGxCGRX
         EgLkJJZvpGrDHCVdVbO+DjqRDSFs1etKTfvA+201NY96tz1V6ChBq/+bruN/vAwlXVsW
         FgqGGcXvRnP8lao2XJShFx5MPP8oAGJPWPKKZVObdDyrzmP/yEy2/XxS5PpcGzQCSc8m
         kHUN5HPLWUZLN/WogsmupxvYYqLBPF7T3aayCjLc+jnOB4SLxSwOcJdLKr7goCvdevRC
         lXTA==
X-Forwarded-Encrypted: i=1; AJvYcCWivdRlcFJK/vS3akieLFPUBjCA5Aw+v3G0om8G1O4nzKnB44qVp9OQ1zOpCqzjI7ewJFerf+OY8NBGto+sBvFy61JOtUGr/8xMyPb/teGcU9kBiYSi2FZxq6jmQmwl7kAq9WVfmq9S3oSf2/ztYcIg9yMd2YRoGk4BX42hHeokb3XWSRp+
X-Gm-Message-State: AOJu0YxpMS4jk+AOMFsg/IlLodRdQIRKJxDSmK0eMcNlPt/GDdlE0mSB
	pYyikT2n5vIG9FsmHvvX6g6OrX/VXpvXcO1D6dEMq4c/3brDb7rN
X-Google-Smtp-Source: AGHT+IEWv14qqDnlNOn1wcBAI1+Pu8swB1LvY/tgLdAc1sXY59NVOcRBGe3oAWrIBP+qHMzfV0LFPA==
X-Received: by 2002:a17:90a:ee8d:b0:2c0:1dd7:4221 with SMTP id 98e67ed59e1d1-2c1dc568f90mr10564016a91.10.1717511424411;
        Tue, 04 Jun 2024 07:30:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a7771386sm10540400a91.22.2024.06.04.07.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 07:30:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2c94220a-29e9-4b83-a427-5ad406ff1c48@roeck-us.net>
Date: Tue, 4 Jun 2024 07:30:22 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] hwmon: (spd5118) Add support for reading SPD data
To: Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-5-linux@roeck-us.net>
 <4cfe1004-77d4-432b-b07e-557a2e57de58@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <4cfe1004-77d4-432b-b07e-557a2e57de58@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/4/24 04:58, Armin Wolf wrote:
> Am 04.06.24 um 06:02 schrieb Guenter Roeck:
> 
>> Add support for reading SPD NVMEM data from SPD5118 (Jedec JESD300)
>> compliant memory modules. NVMEM write operation is not supported.
>>
>> NVMEM support is optional. If CONFIG_NVMEM is disabled, the driver will
>> still instantiate but not provide NVMEM attribute files.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v4: Use NVMEM_DEVID_NONE instead of NVMEM_DEVID_AUTO
>>      Ignore nvmem registration failure if nvmem support is disabled
>>
>> v3: New patch
>>
>>   Documentation/hwmon/spd5118.rst |   8 ++
>>   drivers/hwmon/spd5118.c         | 147 +++++++++++++++++++++++++++++++-


[ ... ]

>> +static int spd5118_nvmem_init(struct device *dev, struct spd5118_data *data)
>> +{
>> +    struct nvmem_config nvmem_config = {
>> +        .type = NVMEM_TYPE_EEPROM,
>> +        .name = dev_name(dev),
>> +        .id = NVMEM_DEVID_NONE,
>> +        .dev = dev,
>> +        .base_dev = dev,
>> +        .read_only = true,
>> +        .root_only = false,
>> +        .owner = THIS_MODULE,
>> +        .compat = true,
> 
> Hi,
> 
> do we really need this setting here?
> 

The "eeprom" file is only created if both "base_dev" and "compat" are set.
decode-dimms depends on it. While decode-dimms has to be updated anyway,
I did not want to make that more complicated than necessary.

Another option would be not to use the nvmem subsystem in the first place,
similar to the ee1004 driver, but my understanding is that the use of the
nvmem subsystem is preferred.

[ ... ]

>> +
>> +    err = spd5118_nvmem_init(dev, data);
>> +    /* Ignore if NVMEM support is disabled */
>> +    if (err && err != -EOPNOTSUPP) {
> 
> Maybe we can use IS_REACHABLE(CONFIG_NVMEM) here?
> 

We could, but I prefer to avoid conditionals in the code if possible,
the dummy devm_nvmem_register() is there specifically to cover that
situation, and no other driver does that. Also, since the underlying
functions are dummy, the compiler should optimize it all away if
CONFIG_NVMEM=n.

Thanks,
Guenter


