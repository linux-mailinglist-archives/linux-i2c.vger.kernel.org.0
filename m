Return-Path: <linux-i2c+bounces-11401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61BAD80DA
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 04:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49B4F17E0F4
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 02:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E75C1EFFA6;
	Fri, 13 Jun 2025 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KCzhBJrz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B791DB92E
	for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 02:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749780971; cv=none; b=ePqR+s4KAorBwHDond9QuYJAHnk6ypRI2AZmmued4XJGr8laxpBhOKdrCAvMYoA4mqotOu1zs2aOIfR31siTHe+YaNdktunyR/cq1FJ5RXjNFviS9YrjYsqho64r2kCt/5prP1WtoGkKNdjOsOqDDztLXh6plTLuPmTXuuKMBCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749780971; c=relaxed/simple;
	bh=bq8ZvLLY3sBFobFVReFNoN1iLHim74L7lvCBMNa9U60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkgWpeAgssMo0VjtxrPOwq3xaBJsvqRrS62LfW2b1dWdGfcU5poZl16Mph4f+60m7QJ1RQdyQokQtHWOn9oFl5z63t5lOnt6w1lCSLYDiKu+ijPYRCutYIU00txhi++OcMUrf3p0iMWYI3ViRdsDa3EAD3yqS83d00ByT2zw2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KCzhBJrz; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fae04a3795so16944146d6.3
        for <linux-i2c@vger.kernel.org>; Thu, 12 Jun 2025 19:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749780967; x=1750385767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkp2SwT2RePaCxrYCauyGX41s3IGrIg/X27XfJMOji4=;
        b=KCzhBJrzuBKajrJZ8jRIIiCPju9sJWppE3KqgUceDOLFz4m4AzNlM1dFDT1vyIEbIm
         apoUIPOTwGXqfWOzCsaRiUGyFNMZNm3C3rz/jfdE+1vwmVvtAbapfh3mdT/Bs71ERN7S
         CIVnTi0PUpuxAnlHM5tfXHaxqqzBw68LLUeAJSuxDO1ORDpWhsxqSdTFO5GUNoC3BxIx
         9QmHoPR0csnoN672QnrhE1IDXsRA/IOp7SUerRhCKk6gsMTp6IBLPY5A323Ul/VDAbfq
         WSlI+eXK4rkDx4Zc1MBMhcZBnqkM+Irh0WEtqppVk/ZJ6oEkEkPJCViqGbiGXL53q+uW
         tXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749780967; x=1750385767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkp2SwT2RePaCxrYCauyGX41s3IGrIg/X27XfJMOji4=;
        b=IYkUyHkTTgOlOfn/rkn+CujeX7pkrDMRWdNGuuV6d66Y3KkZND0gDgDYDZjkSklboW
         tiuACusAw7lZTYN8uG0abYZio0PVJyBXZ2ZZnlsTWeaGHcTpWH6Tc+OdcY/BH7MjFDtq
         eLt2AuvtXCgC65hmqPwTO6Cu1d/PaMJj5g6uTdwdGFX6GPx2yrCcTIZuIJPww++pqBX2
         CyeNhq8/rUQCO448fj0lMVbw7uv4ixycklBisRMMM0L8HyiIn/PZCkc7MQNszcH4+Jez
         BMg/orV1WeDoqQ7NvAKhR7AvKW+HILVS7iUVsucEhpdVDYQ+ao4FJKjSuNPctC9xNzoG
         KJVw==
X-Gm-Message-State: AOJu0YwpPfxz/ekC12P4Y/xNpLvHvMacIGL89IuDGlNSCnhs1vV6f6nW
	ze1dr80eW7c1OHZ6iwJuNjrG7nGXX2grDk6dtoo/Weoo4Cd1Nw7m811KnYHw64b80ejaaZhRrEQ
	55poC
X-Gm-Gg: ASbGncsPeYYdTRhJONQK9ZCB6+MbAuNr34oPuMahEE0+aPdvm+KdGlsquGb8MlExCXS
	8Yxex6TxzGlHnqDqx97iX89O/0FB8w7/JnH7Kb2ZKT/VEp2OL/BUrGoqvn5H7XAIoaecQDYkgzU
	SCbOsPIhajqZfWtYfLmIzcYq/N5a1hBluWWo2ZMsa8O4a/zYInlWBgaNguv0abYYpIExGUkfZQa
	Y+uBOjpdObJnhTIUFSvD9yH4iCzqVVJlu93njkBUPYMTDmIVCLVBTdwhN4Pu2bNkcS6z8ts8HzF
	ZhKkVc4TVw8yTUa1nabgrFHrSAVgUkm/LXwDYgUw5bD9EW9ypXESgzKCQyRUy4d8ra40TqyKg/M
	Jox9O0opga19okGwoBAAdbvBhlA==
X-Google-Smtp-Source: AGHT+IEPrCYVuYaf2snbGSL6nYTSnkJ5v4bgC7WUqyASAClJfsf2Fn+WgQFF908p7KrLOpj+L5tcig==
X-Received: by 2002:a05:6214:230a:b0:6e8:fbb7:6764 with SMTP id 6a1803df08f44-6fb3e629659mr19306186d6.45.1749780967455;
        Thu, 12 Jun 2025 19:16:07 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c895f2sm16333826d6.116.2025.06.12.19.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 19:16:07 -0700 (PDT)
Message-ID: <d7f7dc4c-5d2a-4f63-9451-5e4d2e53cf1b@riscstar.com>
Date: Thu, 12 Jun 2025 21:16:05 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: k1: check for transfer error
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
 dlan@gentoo.org
Cc: linux-i2c@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Troy Mitchell <troy.mitchell@linux.dev>
References: <20250612225627.1106735-1-elder@riscstar.com>
 <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 9:12 PM, Troy Mitchell wrote:
> On Thu, Jun 12, 2025 at 05:56:25PM -0500, Alex Elder wrote:
>> If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
>> complete, or if the hardware reports an error, it returns a negative
>> error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).
>>
>> The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
>> which is the i2c_algorithm->xfer callback function.  It currently
>> does not save the value returned by spacemit_i2c_xfer_msg().
>>
>> The result is that transfer errors go unreported, and a caller
>> has no indication anything is wrong.
>>
>> When this code was out for review, the return value *was* checked
>> in early versions.  But for some reason, that assignment got dropped
>> between versions 5 and 6 of the series, perhaps related to reworking
>> the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().
>>
>> Simply assigning the value returned to "ret" fixes the problem.
>>
>> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
>> ---
>> v2: Added Troy's Reviewed-by
> Hi Alex, you added the changelog, but the subject line
> doesn't have the "V2" suffix. Is this a mistake?

Yes it's a mistake.  I contemplated sending an immediate
"oops, this was v2!!!" but opted to wait until someone
like you asked about it.

This *is* version 2, and I made the updates I describe.

					-Alex
> 
>              - Troy
> 
>>
>>   drivers/i2c/busses/i2c-k1.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
>> index 5965b4cf6220e..b68a21fff0b56 100644
>> --- a/drivers/i2c/busses/i2c-k1.c
>> +++ b/drivers/i2c/busses/i2c-k1.c
>> @@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>>   
>>   	ret = spacemit_i2c_wait_bus_idle(i2c);
>>   	if (!ret)
>> -		spacemit_i2c_xfer_msg(i2c);
>> +		ret = spacemit_i2c_xfer_msg(i2c);
>>   	else if (ret < 0)
>>   		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>>   	else
>>
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> -- 
>> 2.45.2
>>


