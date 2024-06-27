Return-Path: <linux-i2c+bounces-4418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8891AC7F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 18:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702711F2597F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 16:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2625199399;
	Thu, 27 Jun 2024 16:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sO5ee+MB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1BA1991A9
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 16:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719505323; cv=none; b=VDI14BEkrxCb/xUp55u93Y7zZz3vekHSFXplrBU4ZOLYGmgjuk5K9xEnXjjwmVu2WWNRAy54bsQwjgKmNKNp4OZJofYydcdfH89Vb44beyBrHXABFcEkRKR1rRC3mMW8mF0vlDXkzpd8QX/2SpSAP4cUcHmwxvICztPnJG17yO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719505323; c=relaxed/simple;
	bh=uvdiuJICWZGOUK5HsHj+Wv1U2CRsEVEPXVqkBpE8/x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2CD7NHxn8xuZB/OfuF3Q1eh/h7n/xw+SDUNOxU8FWZwriYf9TbAVUZVSXjR0ahZdfWjdvrWMVIvT2uSps8D4UtwO0yYesLT+mnbDcSUEAokT8w88Byzovu5+x/JthkcIxpDA4SiwM5Vin7eLEv5pCWKcXMbPgT1CjooiJBEHQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sO5ee+MB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-362f62ae4c5so1239340f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 09:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719505320; x=1720110120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOX3H3BHvh1Vh93qPloTSmlsv9FLCXDf6NkvmfDx9ho=;
        b=sO5ee+MBjmWtmOFQaUO8+/1Pdq1VBpj27HjesGSEQ8iriUJKgn77PDk73TNKxNvdy6
         KZaVlif7tyc1tjjLLzZAM9zJy4YFPdviLxcHUGxMRQa8/VWKOIhwHZmDA7Lo8WmH5C7A
         1WhWYuawEYXi9rAXizClfrW7jLi1Q2fcfox6GZOloOYYbFebGM/QS1llEkTZl9ySO/8Q
         05NZoG6ZttTrylRBN07vStUQg4uE2e62Db3KyzfLpkwIVllNhmjnjZX2o0sesqxtSQHl
         U5GnjT817/P0aUBkN5xZJpMrFsJpdala0VFsbHZPQmK7qFbsQSc7ek7HnwecDUvF7V3l
         mD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719505320; x=1720110120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOX3H3BHvh1Vh93qPloTSmlsv9FLCXDf6NkvmfDx9ho=;
        b=qoNW8kmznx03s+8bph5vYzgr4NbNjRkElEuklLi00g1i2qUNAhZ/zcMc3BCSX07MV+
         BNVkAe7PmBSeB1kZ9t0PVoDd/nhE4jdNveqTtxLImwmTHKqA5GxG7vfD+lUW1mYQQzwS
         VBRonAEGxqw2zP6aH0ZYacn6EDIKfptM+ffits69yM3KGL3thkniheo2Mbdmrb0AwRhu
         DCNs8gpBS/hxHSgumqOBABg2oehfWrVm/37gaMLbw87qObOk1KDaFOodhRPjtLOLmkmz
         6DBstb0+32rqhN60BMyNqa1xNrLIve4Qr+D/LBTpK6Mni4qSL+LWfY5vF5MuV4dcQYiF
         LWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYB92Fac3Qa83qCPFkKuTMrEGkOKvYe8XzsGoNaLjUnnDZtMar2rpu+ZewOOBXk8yq7FGyTcCBF6l0fCTWw+IPkm1jX+d7rd75
X-Gm-Message-State: AOJu0Yx6TjUT2ZxevbVGz9H8gfSsXoDBl7A4PYi4wb90jOrfHhcU+IcL
	KOEIYOi0Tf3ALMNukLfypVsSS7dSSfQ2dFT9E1DeJy/l6wfG5n4Gwx3ALs7N404=
X-Google-Smtp-Source: AGHT+IGQVTfNs65gmD2TMr+3wE9F2QWRlVUFfUemSiLKvNMaZnuc+kVuKx0kfZKSs2GP4ml4C7FMHQ==
X-Received: by 2002:a5d:46cf:0:b0:363:b3ea:7290 with SMTP id ffacd0b85a97d-367418bfb65mr2388917f8f.20.1719505320187;
        Thu, 27 Jun 2024 09:22:00 -0700 (PDT)
Received: from [192.168.86.191] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42564a4da40sm36223415e9.5.2024.06.27.09.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 09:21:59 -0700 (PDT)
Message-ID: <92f0bec8-283b-4619-9b0b-d5a678fa200c@linaro.org>
Date: Thu, 27 Jun 2024 17:21:58 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] nvmem: core: Implement force_ro sysfs attribute
To: Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240626041214.513242-1-marex@denx.de>
 <20240626041214.513242-4-marex@denx.de>
 <3e2f38a3-e151-42f1-97ca-b8327ade4acc@linaro.org>
 <ab0cdad7-43e3-4acd-a4cb-b15c1cd26b38@denx.de>
 <55e6f035-fc43-4a56-9bf6-3a1a0e63b85c@linaro.org>
 <5ee8b82e-72cb-4644-889c-1959a2318d1a@denx.de>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <5ee8b82e-72cb-4644-889c-1959a2318d1a@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 27/06/2024 16:55, Marek Vasut wrote:
> On 6/27/24 4:58 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 26/06/2024 17:07, Marek Vasut wrote:
>>> On 6/26/24 3:07 PM, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 26/06/2024 05:11, Marek Vasut wrote:
>>>>>   static const struct attribute_group *nvmem_dev_groups[] = {
>>>>> @@ -945,6 +988,7 @@ struct nvmem_device *nvmem_register(const 
>>>>> struct nvmem_config *config)
>>>>>       nvmem->read_only = device_property_present(config->dev, 
>>>>> "read-only") ||
>>>>>                  config->read_only || !nvmem->reg_write;
>>>>> +    nvmem->default_read_only = nvmem->read_only;
>>>>>   #ifdef CONFIG_NVMEM_SYSFS
>>>>>       nvmem->dev.groups = nvmem_dev_groups;
>>>>> diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
>>>>> index 18fed57270e5e..0667937ebb86b 100644
>>>>> --- a/drivers/nvmem/internals.h
>>>>> +++ b/drivers/nvmem/internals.h
>>>>> @@ -16,6 +16,7 @@ struct nvmem_device {
>>>>>       int            id;
>>>>>       struct kref        refcnt;
>>>>>       size_t            size;
>>>>> +    bool            default_read_only;
>>>>
>>>>
>>>> Its not very clear what is the need for this?
>>>
>>> This field is used to discern devices which are by default read-write 
>> provider drivers or any drivers should not be accessing this struct 
>> directly.
>>
>>> from ones which are by default read-only. Only the former can be 
>> Why should the drivers care about this?
>> If the read_only flag is set in the core, nvmem core should prohibit 
>> any writes for this provider.
> 
> I think this is a nvmem core patch , isn't it ?
All that I see in this patch is setting default_read_only and no user 
for it. unless am looking at wrong patch.

--srin


