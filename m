Return-Path: <linux-i2c+bounces-4381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FEA918734
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 18:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5C3B28061C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 16:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD4918EFC6;
	Wed, 26 Jun 2024 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="TX/XivMe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAF21849EF
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418941; cv=none; b=GmP2WsVhoGxBeZGaxMRU7lG+nvtrihWEn4IZMPNIKG1K4b7XA6MEF6ciR1E1P4SruYFQdk6RMdgVm2QadH2Lum/W7Z7mWNaMxl7KJBMl52ly2uzNZhhxnKLk9B6jl9SpU88aZPEIX0jfYfdT+kZHPefVf/Sdtw06R66ZvS4f0aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418941; c=relaxed/simple;
	bh=MNpbOyr0HycXTSqa4ZAFL3b+3bXTMx2339d+9hnLxik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/b6ES0XPaZfN6se5CO+3GfO729Gz96uqptxRll6fy5UzIYLEMgkhsCvd9RPSJdeaVCwBAiwEi23qd1aip3E4kt+sfdhqXFmeXUjexRuj4PVE2iklxgJOTKfj3GvPalvodM4PUCB6Upl5zFH+H62kIDtwBf2BHLS1IG9GVH66Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=TX/XivMe; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4721287FED;
	Wed, 26 Jun 2024 18:22:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719418937;
	bh=7EYZGT2Zoe55qpuLNOXok10SHslzycbXGR67RBugIIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TX/XivMeWPQGUC9mIyiRu1V1ogXYn1CoeM3cpnFKjzCq13aOQb/ZNVf/KstTsKSHd
	 SmSlY0abJOkTbLWEUvh0uCXdXDrdP3YMQUk7kSQadKjYVakPaeoCvOnB+0hzr+dJGj
	 q61KPA4FUkVBubmIfb5MoA2NZK3DEoKVwSj76m0H/oyxL+lJElg8T8gAAwop0VrTXZ
	 nGRA9tjovEF4RC+d0P1Wo2BWT7Wc7a88Vjpp0LoBaCrab1q6HFFbnoawGJYsSwOPAi
	 cAJBjfGB95txd+TZvaxyG/EvfaICnSuBxF/FT4BdC9ViKTWPrnCr/KgHyfdh9/ZpSw
	 JOzKej0cu73Yg==
Message-ID: <ab0cdad7-43e3-4acd-a4cb-b15c1cd26b38@denx.de>
Date: Wed, 26 Jun 2024 18:07:01 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3e2f38a3-e151-42f1-97ca-b8327ade4acc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/26/24 3:07 PM, Srinivas Kandagatla wrote:
> 
> 
> On 26/06/2024 05:11, Marek Vasut wrote:
>>   static const struct attribute_group *nvmem_dev_groups[] = {
>> @@ -945,6 +988,7 @@ struct nvmem_device *nvmem_register(const struct 
>> nvmem_config *config)
>>       nvmem->read_only = device_property_present(config->dev, 
>> "read-only") ||
>>                  config->read_only || !nvmem->reg_write;
>> +    nvmem->default_read_only = nvmem->read_only;
>>   #ifdef CONFIG_NVMEM_SYSFS
>>       nvmem->dev.groups = nvmem_dev_groups;
>> diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
>> index 18fed57270e5e..0667937ebb86b 100644
>> --- a/drivers/nvmem/internals.h
>> +++ b/drivers/nvmem/internals.h
>> @@ -16,6 +16,7 @@ struct nvmem_device {
>>       int            id;
>>       struct kref        refcnt;
>>       size_t            size;
>> +    bool            default_read_only;
> 
> 
> Its not very clear what is the need for this?

This field is used to discern devices which are by default read-write 
from ones which are by default read-only. Only the former can be 
switched between read-write and read-only mode ; the later cannot be 
switched to read-write mode .

