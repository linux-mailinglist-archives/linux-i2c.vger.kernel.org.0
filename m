Return-Path: <linux-i2c+bounces-1604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CA84626F
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 22:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610E61F264E7
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 21:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B14412FB2F;
	Thu,  1 Feb 2024 21:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSyTv1Vm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C603BB2D
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706821589; cv=none; b=AI3o3YXH/84r8jd8K5qcNsZee/vPHtmyRJfyc60wFH4drHbpNvALw4VXh943IH6knEII51Sjihv7J5FWT1JJTCOnaxqTWmur4tZmI7cWjysnTeR5TsG9T6cj6I7lIlKKcL9FC4D81wwLnZk18p0/u7ijVWnMt/xltqdw2F3bYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706821589; c=relaxed/simple;
	bh=EstGASzv9AEhLf8cljBdFNKgS7Uxs3yivm2jsurJCNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lk/FNcJQNmt82kvLJqPXt/4W1il7uc/kXBokF0J6BomQA3kXxsReIHlFdHaUgko9Cjs5lXXzvRNcGf/V4GCcfNfnQEn3NBe2W1zpARylubjuyuF0jPbiwyfo5eGgMSZKJt7QbVyyUPZIPaLfT9xJMA7sbYMYSRsMI4xJAxkWRxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSyTv1Vm; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so1718128a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 13:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706821585; x=1707426385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcBMMl9BpOxPL/zONJSIOTWL7iriK6Cb8Z4Qp2Fm0Lg=;
        b=dSyTv1Vm2VnkZqcAGn3BPkVQkjnNLHmTH93LKLJt/rp4JZ8Z1+3aR8VPjm9ieFOHvS
         36Llc4BTzJQEX+k+S7nHwGubBiuGyR2QnQ0gSl+KsG4UmLpYFXPjOj3ATcftNt7mi6ct
         Xwo/fHj5Yyx3iNKh4QkWc1J2bJ2/PjvB0QAEZWVyuOogYPkmjBxhJVpYTIZtgqlNj4zr
         Fr0bX2+fk1Vbx5ARwc6/J2eDntGQG6/KKRu7vGf3zt1ZWqdZmhIvsqU3EHeXJ1fRQOT1
         Ut/zZ1FjML+ajExLR3nXzv7W/Uz8qZryhR5+5QXhHhFdotQupxTIZeFyVwbMCUBSnN38
         lftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706821585; x=1707426385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcBMMl9BpOxPL/zONJSIOTWL7iriK6Cb8Z4Qp2Fm0Lg=;
        b=NtS4dUpKY7P1gJ/7Z0jlqE9IdbiYNF8/xyNPemLjFqkkt3JU2xMS22imJRANoHz20y
         Q8FlfPEJo7ngU9n7QvffZSbMbJqTcNRKhXvWNsJ0HCorS97gRFvPUUkk9FUbyl/a+9b4
         U60MsZhNBYHGWwldh5irpNM8prOTF75FQQeRwY793kNxuDarEgKtBenWypuzCKKtuLmd
         d+kofEFhkFPnYblvmBK3zHFf9uU75dTbiJfIF2JLOsXf3UYbWiTgkwDJmVcaSamGOWm6
         2JBJwlsZ+qmo48YWmX/6BiejXdB3TFjEaAEuf7N9LkykY5SdF0Cu+uR95qCTLe2sIg0n
         ek5Q==
X-Gm-Message-State: AOJu0Yzrk4QdHI09ByQqOVbiwOcHSZsFZxWw8qFelhxRUW68yUubppDo
	JkwVihT0j50441Z9JEQFlfcYe10KzQk2/L/LUq85mcghwuBIfXJ4
X-Google-Smtp-Source: AGHT+IEgovTwtqNdQ01vnvW2KQUrzvefUazWU1paWi+8SNpH8DpA7OokcmrJ27IKSTWhT/7BRf+z3A==
X-Received: by 2002:a17:907:110d:b0:a36:915e:5ff7 with SMTP id qu13-20020a170907110d00b00a36915e5ff7mr2561374ejb.45.1706821585340;
        Thu, 01 Feb 2024 13:06:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX9ZCLnsCJHIEbj60ODTY3wnYx5P0pPB72E+PU8hAoiGBQA9jPqkcAHK7jCU8yYt0icRAnY5b8k9UeTQ63nVdt+JmG4mI2PXDLb
Received: from ?IPV6:2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac? (dynamic-2a01-0c23-bcb7-3100-59fd-7b30-8e23-b0ac.c23.pool.telefonica.de. [2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac])
        by smtp.googlemail.com with ESMTPSA id u16-20020a1709064ad000b00a311092d2f8sm155644ejt.169.2024.02.01.13.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 13:06:25 -0800 (PST)
Message-ID: <aab7a892-2dad-4190-b443-14c35f46c776@gmail.com>
Date: Thu, 1 Feb 2024 22:06:26 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] i2c: i801: Add SMBUS_LEN_SENTINEL
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <54845225-ffa5-4983-8bb5-3aa70ef72c72@gmail.com>
 <9d06c7d6-8c62-4e44-9e3e-334ac14e38a1@gmail.com>
 <ZbwDm1hEbE3dYCun@smile.fi.intel.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZbwDm1hEbE3dYCun@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 21:48, Andy Shevchenko wrote:
> On Thu, Feb 01, 2024 at 09:12:33PM +0100, Heiner Kallweit wrote:
>> Add a sentinel length value that is used to check whether we should
>> read and use the length value provided by the slave device.
>> This simplifies the currently used checks.
> 
> ...
> 
>> +		/* At transfer start i801_smbus_block_transaction() marks
>> +		 * the block length as invalid. Check for this sentinel value
>> +		 * and read the block length from SMBHSTDAT0.
>> +		 */
> 
> /*
>  * May we use the correct multi-line
>  * comment style, please?
>  */
> 

Right, everybody outside netdev uses this comment style

> ...
> 
>> +		/* At transfer start i801_smbus_block_transaction() marks
>> +		 * the block length as invalid. Check for this sentinel value
>> +		 * and read the block length from SMBHSTDAT0.
>> +		 */
> 
> Ditto.
> 
> ...
> 
>>  	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
>> -		data->block[0] = I2C_SMBUS_BLOCK_MAX;
>> +		data->block[0] = SMBUS_LEN_SENTINEL; /* Mark block length as invalid */
> 
> I would add a separated comment line on top.
> 
OK
>>  	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
>>  		return -EPROTO;
> 


