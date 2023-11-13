Return-Path: <linux-i2c+bounces-137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC287EA2BC
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 19:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C957FB20955
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 18:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6989A22F06;
	Mon, 13 Nov 2023 18:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+0MGKQV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D02122EFF
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 18:20:34 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F09D75;
	Mon, 13 Nov 2023 10:20:31 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-409299277bbso35469315e9.2;
        Mon, 13 Nov 2023 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699899630; x=1700504430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vR2tSI1FHdo0MdNCRFyH3Id2jdmfKM0uOJk3bFQk5DQ=;
        b=b+0MGKQVc5SYV6Vz2YID+domf3d9JVBkQP1Hxm+m7HOh1j1S3G2uMsQ50rjOYgkm5X
         e/PlUkD5KJF+Aptq8q37iUDqYqqMDMehFD/e0E+rYSRKk1bEdwMgSNbGCHyZvmlJrlAu
         uCmr36L5LlGfNsHVe7EJB0eehVSH5esuv1j9lkq/XldaJysW542b5NgWAGOs4OcREDIH
         hCCpOdHLGCr/HSNW7nT2s/dlMxpps/EGNsdTne2OO4q/leENXSgJ7YbluLLiZakwm2sP
         N8rl+rVkkATyQjIhVBo6khXgRZAWTvc6nriUs5sSXnrNfufYAwz0jr2eJl5RoM1d3Zrn
         Z9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899630; x=1700504430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vR2tSI1FHdo0MdNCRFyH3Id2jdmfKM0uOJk3bFQk5DQ=;
        b=a2I4d+lsm5ug0b5VLCpBef52db1b2WJ+MHHPwZo0TAufD+btaLrVSP8/BC0cJz1ysI
         bXhg0eHLq4Gcej7Hlp0FBqF4AftS42isYw7g4u7AOqmLjIFMLzF5lK+r01aFlud6qkLD
         tpVLpVrzrM/9fJZT5GQInK8Lmv75YQKLVV3ynvu+JU1nV5n7nrjxxer+dn2C60t8iPat
         4/HROCUiiQUxtqfPy8hriwGJhizxf7qym3p+GB5pvq7HwaL2Rg7afqU0awzUr0XYz/Nt
         CxPar+B9YVUQNwMn4tPbf1Iw4ZE5GV3J8pZsNl7XMN8TqNXL5Pm5Rtp3eBk//K0VDvM2
         qnoA==
X-Gm-Message-State: AOJu0YyIDY8TUam4y5h6T0lnieEqvHAr6lnYMBCNiUZuVgoLxZxroT2y
	Z4W9BiDGgU2muUV9maRQT+tknV/Nryw7wA==
X-Google-Smtp-Source: AGHT+IFrDi6+Ycx9FGDwOHQ4DtjjVSUXMvfJDFpi6nfL3QaqrqxNFooA5hebl16tvK+UJfR0lzFyWA==
X-Received: by 2002:a05:600c:1d1b:b0:408:3e41:aea with SMTP id l27-20020a05600c1d1b00b004083e410aeamr5638141wms.1.1699899629944;
        Mon, 13 Nov 2023 10:20:29 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e16:fe00:c172:813e:6561:e5e7? (dynamic-2a01-0c22-6e16-fe00-c172-813e-6561-e5e7.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:c172:813e:6561:e5e7])
        by smtp.googlemail.com with ESMTPSA id l10-20020adfa38a000000b0032dbf26e7aesm5989241wrb.65.2023.11.13.10.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:20:29 -0800 (PST)
Message-ID: <105d8b23-e199-4fef-bf28-f66f29b7932f@gmail.com>
Date: Mon, 13 Nov 2023 19:20:29 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC
 support
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-16-hkallweit1@gmail.com> <87sf59vodx.fsf@intel.com>
 <6f924890-a5a0-48b4-973d-3c0f88b0d294@gmail.com> <878r71tudv.fsf@intel.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <878r71tudv.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2023 18:50, Jani Nikula wrote:
> On Mon, 13 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> On 13.11.2023 13:17, Jani Nikula wrote:
>>> On Mon, 13 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
>>>> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
>>>> Class-based device auto-detection is a legacy mechanism and shouldn't
>>>> be used in new code. So we can remove this class completely now.
>>>
>>> So this is copy-pasted to all commits and the cover letter, but please
>>> do explain why there are no functional changes here (or are there?),
>>> without me having to go through the i2c stack and try to find the
>>> commits alluded to in "After removal of the legacy ...".
>>>
>> Legacy eeprom driver was marked deprecated 4 yrs ago with:
>> 3079b54aa9a0 ("eeprom: Warn that the driver is deprecated")
>> Now it has been removed with:
>> 0113a99b8a75 ("eeprom: Remove deprecated legacy eeprom driver")
>>
>> Declaration of I2C_CLASS_DDC support is a no-op now, so there's
>> no functional change in this patch.
>>
>> If loaded manually, the legacy eeprom driver exposed the DDC EEPROM
>> to userspace. If this functionality is needed, then now the DDC
>> EEPROM has to be explicitly instantiated using at24.
>>
>> See also:
>> https://docs.kernel.org/i2c/instantiating-devices.html
> 
> I'll take your word for it. Though none of the documentation I can find
> say that setting the class is legacy or deprecated or should be
> avoided. *shrug*.
> 
I have to agree that it's not obvious that class-based instantiation
is considered a legacy mechanism. The commit message of this 9 yrs old
commit provides an explanation.

0c176170089c ("i2c: add deprecation warning for class based instantiation")

> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
Thanks

> 
>>
>>
>>> What does this mean?
>>>
>>>
>>> BR,
>>> Jani.
>>>
>> Heiner
>>
>>>
>>>>
>>>> Preferably this series should be applied via the i2c tree.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>
>>>> ---
>>>>  drivers/gpu/drm/i915/display/intel_gmbus.c |    1 -
>>>>  drivers/gpu/drm/i915/display/intel_sdvo.c  |    1 -
>>>>  2 files changed, 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>>>> index 40d7b6f3f..e9e4dcf34 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>>>> @@ -899,7 +899,6 @@ int intel_gmbus_setup(struct drm_i915_private *i915)
>>>>  		}
>>>>  
>>>>  		bus->adapter.owner = THIS_MODULE;
>>>> -		bus->adapter.class = I2C_CLASS_DDC;
>>>>  		snprintf(bus->adapter.name,
>>>>  			 sizeof(bus->adapter.name),
>>>>  			 "i915 gmbus %s", gmbus_pin->name);
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
>>>> index a636f42ce..5e64d1baf 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
>>>> @@ -3311,7 +3311,6 @@ intel_sdvo_init_ddc_proxy(struct intel_sdvo_ddc *ddc,
>>>>  	ddc->ddc_bus = ddc_bus;
>>>>  
>>>>  	ddc->ddc.owner = THIS_MODULE;
>>>> -	ddc->ddc.class = I2C_CLASS_DDC;
>>>>  	snprintf(ddc->ddc.name, I2C_NAME_SIZE, "SDVO %c DDC%d",
>>>>  		 port_name(sdvo->base.port), ddc_bus);
>>>>  	ddc->ddc.dev.parent = &pdev->dev;
>>>>
>>>
>>
> 


