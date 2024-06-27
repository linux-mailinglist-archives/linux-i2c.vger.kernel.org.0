Return-Path: <linux-i2c+bounces-4398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A235F91AA0D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 16:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D50B81C23220
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 14:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2832F19755A;
	Thu, 27 Jun 2024 14:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qzW+nax6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC513DBBC
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500342; cv=none; b=trqA+EPgriIBA8Z342A2ol34fXgJY3hEx7F5Hm2+ubJdDaWFrYjkUO0ao1R2C7JewUlwmx0lOvqBM0geAKdxfNdEskQZZVZOVYHkfW1Cb8Qbxi2mLRz8oiVWpM6ERAFsmw/CGfr4EWq5aQlsX344LcO6cvXBn78OsqIJKWmCcQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500342; c=relaxed/simple;
	bh=Ij4xretNLkxWm3FW/jOQBkgR14y+ictITaNY99SB4oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHkS2E39/6d71Z7A67wmfGWiFU/Ds9La9J0gO01AelyltVNzx9xUToIa+1AIlwJwwsBbY51kmKAADCbCd030MBD+r51R0LVoPgPGNPGU0N87KoG6R08it5DgSNncugBAEazb1qlU9baOIv1Dg+zdSwp19SIQegbOlSea1NG0zBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qzW+nax6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4249196a361so36361285e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 07:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719500339; x=1720105139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ig6U6g8++BTFMK/ibZIZTHmTmTBWih4H4lRJaCKKAlk=;
        b=qzW+nax6XoL7N+wEW+56RewSkcMXSEL/REH0Op3wJT/f+n7+MlRPg5dcf5SN1Xq82c
         NjnCJqw2d7DuV3VobehgzxX6Tj+CqsiAxAphEGcLY8HhDPK4Gb50l0Or0eihSDOHJivZ
         XT1Ay24eM15j2KH6yNpLsq8ygeXj2nHf6y73OVt++77TsvVFl+tPu+OQsCMuLIuekZEb
         RAyfqMSpUFtYpTFr7uUW+B2jALdnDYdYf7U3O6KE/pf/F17ccmBw7Xw80o6GwpqVphI+
         6Q3gLz2iGfzZcOQUl7xEoBL2DJOcDyRXLz5MK9D7E4L5E6izYRHZA9k5CTIDcCobNNjI
         oG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500339; x=1720105139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ig6U6g8++BTFMK/ibZIZTHmTmTBWih4H4lRJaCKKAlk=;
        b=cxLpwUONXgq030fQbnjKkhs2mc4lwfvyfJXP0Eo14C2O7MotN8WUmAzrsE5ZIPuQ7s
         MXiPY+YlDVErmi2i8uEftyXRbMTUZLxEB3zPIcZt6XNzSMSXgg/cjLJgz8OAT/EWGZw9
         XRgJ8NY+uM/vHHqWLm3afVUYrCHlhJC82TTKb3uwA6b/JbiwXc3jchnjSIXrkB5Wh75C
         72WTwYW4mRSymuXHOuIw7F6auy/aySdCDOZ1QrQGYhbqQ7V5cetloufCeG+jLH7OZCp+
         cpXX1C6GmzUzCHQR8Wuifon3yOEp+XfoEzXjbIK9acnUalS0qHHtO1MOy6/skXJwX4N9
         2jGA==
X-Forwarded-Encrypted: i=1; AJvYcCUHg7g2DBzadwQbDNE8BgPUEwf3FTSEHeWrV7TEs8xT0sbbpksHcN53K5rlQwEA7Z6ITf/vnjF4sFCk+hTErWGMtPEEqcez7Frn
X-Gm-Message-State: AOJu0YxH/WZwUfuArGMkeKYBoAUPS14DY0Av/zC+b/YCiFFYyuCHMEr2
	+MBdTji3qUKEwoP9N+u5Hp1wG/HVKDQBYPRIEOxyjv7aueS44e/mzzXEknwdXp0=
X-Google-Smtp-Source: AGHT+IGQ3865SpOoQ5Nj7avD95DekZCQPvE/pMNUIVq18FYi2h10ibmOwLw4a/AZ0SVy8hcZwa6b4g==
X-Received: by 2002:a05:600c:1c9d:b0:425:6979:9b5f with SMTP id 5b1f17b1804b1-42569799dcfmr525975e9.6.1719500339597;
        Thu, 27 Jun 2024 07:58:59 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42564b7baa9sm32404435e9.22.2024.06.27.07.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 07:58:57 -0700 (PDT)
Message-ID: <55e6f035-fc43-4a56-9bf6-3a1a0e63b85c@linaro.org>
Date: Thu, 27 Jun 2024 15:58:56 +0100
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ab0cdad7-43e3-4acd-a4cb-b15c1cd26b38@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/06/2024 17:07, Marek Vasut wrote:
> On 6/26/24 3:07 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 26/06/2024 05:11, Marek Vasut wrote:
>>>   static const struct attribute_group *nvmem_dev_groups[] = {
>>> @@ -945,6 +988,7 @@ struct nvmem_device *nvmem_register(const struct 
>>> nvmem_config *config)
>>>       nvmem->read_only = device_property_present(config->dev, 
>>> "read-only") ||
>>>                  config->read_only || !nvmem->reg_write;
>>> +    nvmem->default_read_only = nvmem->read_only;
>>>   #ifdef CONFIG_NVMEM_SYSFS
>>>       nvmem->dev.groups = nvmem_dev_groups;
>>> diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
>>> index 18fed57270e5e..0667937ebb86b 100644
>>> --- a/drivers/nvmem/internals.h
>>> +++ b/drivers/nvmem/internals.h
>>> @@ -16,6 +16,7 @@ struct nvmem_device {
>>>       int            id;
>>>       struct kref        refcnt;
>>>       size_t            size;
>>> +    bool            default_read_only;
>>
>>
>> Its not very clear what is the need for this?
> 
> This field is used to discern devices which are by default read-write 
provider drivers or any drivers should not be accessing this struct 
directly.

> from ones which are by default read-only. Only the former can be 
Why should the drivers care about this?
If the read_only flag is set in the core, nvmem core should prohibit any 
writes for this provider.

--srini

> switched between read-write and read-only mode ; the later cannot be 
> switched to read-write mode .


