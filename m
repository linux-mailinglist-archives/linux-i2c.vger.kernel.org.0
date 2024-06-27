Return-Path: <linux-i2c+bounces-4433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D503A91B4C2
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 03:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 909AA284013
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 01:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5191A716;
	Fri, 28 Jun 2024 01:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="fg5NjlgK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD51755C
	for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 01:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719539370; cv=none; b=I87nqnyw41V7YCE0fRgkcZ4tdl0wLXom3zCwM6M9vGFhFj4ZLpVTXLuc3HeBfX1MdsA/+Ebks5ywSR+fsuwQyupiRZ4L7mSUisq+i9dnfwmBT98FuwAMs/e/XFXlg8YyZ+7Gldcoa0r+M3Hv9PFnQw3L9GOWlpXTJfTc3NorfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719539370; c=relaxed/simple;
	bh=mMuz5ee6byG2fxXPSCdE3I3qG6GBngAFug68Busa1to=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSksd5/Zttvcnv32gQrQoQWfZ6mjBHqvx7kPthXUBeCf59+Y5JsOv0G0vravNcDjye4XfFx0chMhQlP3sBqTd5Bu1XcDfNIn7bruGvaStU10kjUwIz+v6XWarGvUrYsbDSN/j+9Qw34NEfEmsB2CpqlLZuwve8Y6ul10JniTEaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=fg5NjlgK; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D266487B77;
	Fri, 28 Jun 2024 03:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719539359;
	bh=hGdz+UC1G/HPh6TLtsMvnIjEZXP9PQWW6H/+36xQ+nY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fg5NjlgKbELTr/sMmSAjenBySIEdWGk2cB3bWELwUfr3RqY85xrvxAriOvQw9skGM
	 aE5L58jqVnu08TJWV+FvWfqddy4eYy5VgzLxR4oRilLaE88dppPVQDFFX4EK22l44q
	 0k5jryBx721E1/lMDErjmDAHLixI8QoTyHtX1VTjX4TxUiYn5AuAhdh//m5NWRH807
	 e4bMLGQSHfwK0wuwYd52aCjbP7ClbNPUuyPzJy1+8TFCPU/iVEe70Hy7YMlW25AOlA
	 cxE6iD4Q4iB/KDLE8XLRcNBw19ulVjX7O6+dK8DpxHhVARJNB5KCntl7C83Hh96Ses
	 +M2hJnWkrnX+A==
Message-ID: <21a0fec1-c133-4acc-a447-0632a232e45f@denx.de>
Date: Fri, 28 Jun 2024 01:39:07 +0200
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
 <5ee8b82e-72cb-4644-889c-1959a2318d1a@denx.de>
 <92f0bec8-283b-4619-9b0b-d5a678fa200c@linaro.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <92f0bec8-283b-4619-9b0b-d5a678fa200c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/27/24 6:21 PM, Srinivas Kandagatla wrote:
> 
> 
> On 27/06/2024 16:55, Marek Vasut wrote:
>> On 6/27/24 4:58 PM, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 26/06/2024 17:07, Marek Vasut wrote:
>>>> On 6/26/24 3:07 PM, Srinivas Kandagatla wrote:
>>>>>
>>>>>
>>>>> On 26/06/2024 05:11, Marek Vasut wrote:
>>>>>>   static const struct attribute_group *nvmem_dev_groups[] = {
>>>>>> @@ -945,6 +988,7 @@ struct nvmem_device *nvmem_register(const 
>>>>>> struct nvmem_config *config)
>>>>>>       nvmem->read_only = device_property_present(config->dev, 
>>>>>> "read-only") ||
>>>>>>                  config->read_only || !nvmem->reg_write;
>>>>>> +    nvmem->default_read_only = nvmem->read_only;
>>>>>>   #ifdef CONFIG_NVMEM_SYSFS
>>>>>>       nvmem->dev.groups = nvmem_dev_groups;
>>>>>> diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
>>>>>> index 18fed57270e5e..0667937ebb86b 100644
>>>>>> --- a/drivers/nvmem/internals.h
>>>>>> +++ b/drivers/nvmem/internals.h
>>>>>> @@ -16,6 +16,7 @@ struct nvmem_device {
>>>>>>       int            id;
>>>>>>       struct kref        refcnt;
>>>>>>       size_t            size;
>>>>>> +    bool            default_read_only;
>>>>>
>>>>>
>>>>> Its not very clear what is the need for this?
>>>>
>>>> This field is used to discern devices which are by default read-write 
>>> provider drivers or any drivers should not be accessing this struct 
>>> directly.
>>>
>>>> from ones which are by default read-only. Only the former can be 
>>> Why should the drivers care about this?
>>> If the read_only flag is set in the core, nvmem core should prohibit 
>>> any writes for this provider.
>>
>> I think this is a nvmem core patch , isn't it ?
> All that I see in this patch is setting default_read_only and no user 
> for it. unless am looking at wrong patch.

Oh, now I understand, doh ... this is a remnant which should be removed. 
The force_ro attribute is now hidden for read-only devices outright in 
nvmem_attr_is_visible, so they cannot be switched to read-write mode.

Fixed in V4, thanks.

