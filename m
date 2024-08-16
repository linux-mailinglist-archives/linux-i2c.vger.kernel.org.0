Return-Path: <linux-i2c+bounces-5446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB3195418E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 08:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95087285C60
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 06:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEB07E76F;
	Fri, 16 Aug 2024 06:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j20n7dVR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CC075817
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723788771; cv=none; b=fzsxpzZ4l8RHOgL+ALYl8QDmJowvOU7nvo0ts+ww3il234dCjj2p8G9VwTnsJ70fIXt6eSe00i/8hzK/iGHzXHxWsgvdTHvnASl9z/W3KWE5cVrauochnw4YjL6dMq4/zN7dhe0DKIs1vknwFAVyi4NOaU1YpGcNX8L/QnmzO1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723788771; c=relaxed/simple;
	bh=XWrVVzC3ODoqv+3mipm/AQDabZK5kzVJlWhApsNZdwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMJ1MfNecCLNS57K2FHhtZRpAA2I1cwdkpYFo4kcwBrX/KFMGTJ6f4tmclY+O/3IG+/f0+wO+EUB7pkz4lqR90cNNk891DUduxGkyACBriW61r6V9PF80zYHSBckJvUmDjdTTb92ZaBumyrUqDDnbFyZHcjsk7/J1YRfDo6TGEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j20n7dVR; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f01b8738dso1536740e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 23:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723788767; x=1724393567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cEAPc/iw8TfnpZfE8RCsfp5DNhNSSfOtqbtk9ioyMEc=;
        b=j20n7dVR5mVd1JvxrUZ5pYxaclvZYPpNYUnTrsDeKHJwjqOjL4LfFPYjfbb7Cq94HR
         h2b9TcDVuEaNN/0LfIfyicKSVyg8FcTm2NKtLREumHWc07mF5u9Henk1QnGvC1Kq+Wnn
         /UGsIecBLZ0smjdTBVM2EcUiUyGNjcWOzZXQg6fsxt+9FhBQbpfWctV84RP9a6MLVZ/3
         pyLKFuPeQ9T5IZkQTFwiPi16AuIykUzJ9SzifdnfnCP9MoJMJBR5j3qIZa7x1Qij+SZx
         MI7FaWOyg4IPcpX6bfnY8MDPN5ULJTQ1Cb6Qj7/I9WMx8N9o2fq913Fi9C0YHwcjv7xJ
         ZEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723788767; x=1724393567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEAPc/iw8TfnpZfE8RCsfp5DNhNSSfOtqbtk9ioyMEc=;
        b=K6zanIVUMNIQYA3e0vAlFb1JeNr/dmDKPJQd1ZhwAVB60oxBJyBPkyo2VKHPK7Bnyp
         oA9CX+Lf5+TAaagFLst6PSzbbyVq5nzpY3tsC/DKrmlJ8Su2h0X+MA+8VSyijIMi/mrl
         /e+xtB/g2AVFW8HD2QaFxsNnq8Xo1lBBneZpjSkpnon6EmIQSZbENAbXNVHmyzjcvEon
         1OSfBu7vyb30/Mbsgq4BIm61mZm9rct7ibvTTOWsg5D5DmKLmFjJz9qPgfQ8NtorDRRq
         ATeHSTAneJqaqQFk3dclGg3VftC9ZF6ruw0RT983xPJYRN6YZknP3oswm6AOZB+m80yA
         cJbw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4e/SuOQfGweGNID73iORimIfCanAju3017lGpqWk6FIt67IcmoutTvwrDGxyP4+X4mu9agSOGM1Ros0HVR7ENStMm59Rsbzw
X-Gm-Message-State: AOJu0YzdZAAbUSKf1ZqsLVCMK9QHHd8gYbH1mPqQjR+1Fkbpf40M1UFW
	7eo8c0r4RwImTyCBFhoMnhPgwC9mgQJtIWniDwlltRXNePYyKDNw
X-Google-Smtp-Source: AGHT+IFlA6jUpHtXH9FzSveE4S4BBhmdomIjtx3psORs8QO1xsd2dRzjjDK+U/1f1uLPaPhmcZQeiQ==
X-Received: by 2002:a05:6512:238a:b0:530:dab8:7dce with SMTP id 2adb3069b0e04-5331c6a27abmr1063293e87.19.1723788766939;
        Thu, 15 Aug 2024 23:12:46 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73d1:9100:598d:a6c0:8c7e:b859? (dynamic-2a01-0c22-73d1-9100-598d-a6c0-8c7e-b859.c22.pool.telefonica.de. [2a01:c22:73d1:9100:598d:a6c0:8c7e:b859])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed79da99sm13245755e9.46.2024.08.15.23.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 23:12:46 -0700 (PDT)
Message-ID: <7260d24e-30c5-49ff-bc27-2c68bc2d6113@gmail.com>
Date: Fri, 16 Aug 2024 08:12:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: core: Lock address during client device
 instantiation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Krzysztof Piotr Oledzki <ole@ans.pl>
References: <32a2d535-d7c8-47da-a42f-b41d3fae972f@gmail.com>
 <Zr6LAJPqabEMMy17@google.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Zr6LAJPqabEMMy17@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 01:10, Dmitry Torokhov wrote:
> Hi Heiner,
> 
> On Thu, Aug 15, 2024 at 09:44:50PM +0200, Heiner Kallweit wrote:
>>  
>> +/*
>> + * Serialize device instantiation in case it can be instantiated explicitly
>> + * and by auto-detection
>> + */
>> +static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
>> +			 unsigned short flags)
>> +{
>> +	if (!(flags & I2C_CLIENT_TEN) &&
>> +	    test_and_set_bit(addr, adap->addrs_in_instantiation))
>> +		return -EBUSY;
> 
> Why don't you add a list of client devices to the adapter structure
> instead of using bitmap? Then you could handle cases with 10 bit
> addresses as well.
> 
I think this question in the same as asked by Wolfram: whether a linked list
would be better suited. It would require more complexity to deal with it than
the bitmap. And we could use the bitmap also with 10bit addresses, then the
bitmap would have 128 bytes. It's an acceptable tradeoff to exclude (very rare)
10 bit addresses from the check.

> I know that there is already a list of children in the driver core, but
> it is populated too late for what we need.
> 
> Thanks.
> 


