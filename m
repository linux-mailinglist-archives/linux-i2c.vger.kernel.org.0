Return-Path: <linux-i2c+bounces-4417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802A91AC3D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 18:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B61284E47
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 16:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5D9199E96;
	Thu, 27 Jun 2024 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="JBO4nFKA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F006D19923E
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719504312; cv=none; b=nO3/LMbarBUMtEZw7pfQ8RDUYB03OZTGM3hgPlwTMz+3PWa20J+aXIJjZpR5xQ9+GmQUzza4kqvx7TboTlkiGla1FfHbLcoNDBAQS+3NmZCwtfY5d2+snH/QzBUemljQTWNvXT3cs3H+EtSfkUwHfF80vNfjSpOH/eomxIdfouQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719504312; c=relaxed/simple;
	bh=AUmrHzl37DeDTFJ7cEg9rwqdrswVslkqOg5yImg4/oM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEHOE1Gg0feL4udxaNNY3JoV27B02v0iTnGyEJNaWNnIpJ4uSTeso8idOwdi6ocorIyOPWqh42EijiNYU1AhIml+JVUH7JjFZBxsAukARkjBVGPYBhehu6BPEQV30fzq1444I2o3R0LwebiNjghnre4K9NpojZHp4AHIF9FzNMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=JBO4nFKA; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B77418852A;
	Thu, 27 Jun 2024 18:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719504309;
	bh=j4sVHB7UzDBKl6Qt3+2VOgoo2yz8DDZzE5UOCvmUu18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JBO4nFKA36YdoUV62JEx5mr7Xf8eMJY73YA+I5OsYYt1B5nWZODkhLmS2Ca798CD6
	 XT2XPROVpdZAvUBBlHK29NrXpb7yfBt4T2EZfapfGnITH8L4Ind9X22geUyww1xZ4R
	 oazTkj6yrGsBFS+ycX3MzGUc7XKZsgMZKsf1gBfLqCi3WUWrCar/FDBP4R9YPkVEsQ
	 uP2f5oi0aCazm/M/feox9dldl1HNM1nUQJJRw1tcw4hinqrY76DJdeN8tTzff3x5QE
	 oM0pc2gRyBUb1lSMO7UxxOS4LYK01tqWqEU/fjH1iQl2KPiSqJPIzlfdMuBzGzO5Vm
	 VdpPL8Ufm6J7A==
Message-ID: <5ee8b82e-72cb-4644-889c-1959a2318d1a@denx.de>
Date: Thu, 27 Jun 2024 17:55:00 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] nvmem: core: Implement force_ro sysfs attribute
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240626041214.513242-1-marex@denx.de>
 <20240626041214.513242-4-marex@denx.de>
 <3e2f38a3-e151-42f1-97ca-b8327ade4acc@linaro.org>
 <ab0cdad7-43e3-4acd-a4cb-b15c1cd26b38@denx.de>
 <55e6f035-fc43-4a56-9bf6-3a1a0e63b85c@linaro.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <55e6f035-fc43-4a56-9bf6-3a1a0e63b85c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/27/24 4:58 PM, Srinivas Kandagatla wrote:
> 
> 
> On 26/06/2024 17:07, Marek Vasut wrote:
>> On 6/26/24 3:07 PM, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 26/06/2024 05:11, Marek Vasut wrote:
>>>>   static const struct attribute_group *nvmem_dev_groups[] = {
>>>> @@ -945,6 +988,7 @@ struct nvmem_device *nvmem_register(const struct 
>>>> nvmem_config *config)
>>>>       nvmem->read_only = device_property_present(config->dev, 
>>>> "read-only") ||
>>>>                  config->read_only || !nvmem->reg_write;
>>>> +    nvmem->default_read_only = nvmem->read_only;
>>>>   #ifdef CONFIG_NVMEM_SYSFS
>>>>       nvmem->dev.groups = nvmem_dev_groups;
>>>> diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
>>>> index 18fed57270e5e..0667937ebb86b 100644
>>>> --- a/drivers/nvmem/internals.h
>>>> +++ b/drivers/nvmem/internals.h
>>>> @@ -16,6 +16,7 @@ struct nvmem_device {
>>>>       int            id;
>>>>       struct kref        refcnt;
>>>>       size_t            size;
>>>> +    bool            default_read_only;
>>>
>>>
>>> Its not very clear what is the need for this?
>>
>> This field is used to discern devices which are by default read-write 
> provider drivers or any drivers should not be accessing this struct 
> directly.
> 
>> from ones which are by default read-only. Only the former can be 
> Why should the drivers care about this?
> If the read_only flag is set in the core, nvmem core should prohibit any 
> writes for this provider.

I think this is a nvmem core patch , isn't it ?

