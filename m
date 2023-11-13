Return-Path: <linux-i2c+bounces-130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A07E9C2B
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 13:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B996F280D38
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820A21D694;
	Mon, 13 Nov 2023 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDGAJpdt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239621CF8B
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 12:32:11 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846B81732;
	Mon, 13 Nov 2023 04:32:09 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9e4675c7a5fso626358566b.0;
        Mon, 13 Nov 2023 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699878728; x=1700483528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x1BA37xzLMbaGEFB8hLhmjzvz9IlyQPVOmdDLVIho+g=;
        b=eDGAJpdtanpmnu2UyGQu0RRFJbEHzYD7SPFGU3mzemtwc1M836U2a5qoonVqTcUBq6
         SEz6CDa12R468ADCvJn+PIa1qf9dfSW4XYhUblIZ6Tw+J385cTMOlTHfJFRBZXEZEmrk
         DG22KSji2hYqc2Ekq5yTjKCdHm1MwrpTjo+HZuSBhXeUWILbxsh5xDccrF3HtTdQ6q97
         mVdIodHDS+2Zj88copV3QGObY/gqjwtWXx/TYO8jbUfTVZe1DToKjlYZtDeXV7eA2MMs
         Jh6gGb0drehLSAWcrgEAL8X4EVHQ3Up+C0eKI78ldBiD+3W+AiH/9URbhsIF44eXGBG1
         XRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878728; x=1700483528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1BA37xzLMbaGEFB8hLhmjzvz9IlyQPVOmdDLVIho+g=;
        b=NtUrfCk5oLWY0sTvxWtV4zhTE8U7aYpijjYfJ1zZXPzZKHJRtU4a63wPOb5v/RKWSd
         8Qxr+liHV+db8Q7UGDkaUj1uKlGbKu61xaGS2gxWgdznX7CVNoKXswPbMtTKXH4/M77s
         ZDz8gTJ6QSMAqhjz2ubg40jJu/UidPJaSPBwBKn7xBORLx9zOEHPRFH9bqI8fn6mY/QZ
         8pLYUiS5LQw81mR9g5Ykd1zeOjAfhJaR7fBfqww1tDer8aSU1yP+3iP6UNyMr+KkykC6
         uoS3sYPT2+cxSeDHX2JCKh1uwctY0TJRKmsJ3scfe+M2lFrrjpJdirDUcE2bg8J2u6m4
         3wmg==
X-Gm-Message-State: AOJu0YyRG2G0rOMQSgP27lRArU7w9RBanzWfh6084uXYwq3Uig6yEl6O
	Myh13KLygdkjAlhAR7566Lg=
X-Google-Smtp-Source: AGHT+IHdv6FpGBoNZX6lKWCWGJ3sgmgVzfv+2IGImtL/y6l0K6r+Q6rEOV/VB3FfV2g/FqnaPVcplg==
X-Received: by 2002:a17:906:bc54:b0:9d5:ecf9:e6b5 with SMTP id s20-20020a170906bc5400b009d5ecf9e6b5mr4641477ejv.59.1699878727732;
        Mon, 13 Nov 2023 04:32:07 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e16:fe00:5105:d737:3805:1e81? (dynamic-2a01-0c22-6e16-fe00-5105-d737-3805-1e81.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:5105:d737:3805:1e81])
        by smtp.googlemail.com with ESMTPSA id y10-20020a1709064b0a00b009dd7bc622fbsm3964988eju.113.2023.11.13.04.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 04:32:07 -0800 (PST)
Message-ID: <6f924890-a5a0-48b4-973d-3c0f88b0d294@gmail.com>
Date: Mon, 13 Nov 2023 13:32:07 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC
 support
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <87sf59vodx.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2023 13:17, Jani Nikula wrote:
> On Mon, 13 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
>> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
>> Class-based device auto-detection is a legacy mechanism and shouldn't
>> be used in new code. So we can remove this class completely now.
> 
> So this is copy-pasted to all commits and the cover letter, but please
> do explain why there are no functional changes here (or are there?),
> without me having to go through the i2c stack and try to find the
> commits alluded to in "After removal of the legacy ...".
> 
Legacy eeprom driver was marked deprecated 4 yrs ago with:
3079b54aa9a0 ("eeprom: Warn that the driver is deprecated")
Now it has been removed with:
0113a99b8a75 ("eeprom: Remove deprecated legacy eeprom driver")

Declaration of I2C_CLASS_DDC support is a no-op now, so there's
no functional change in this patch.

If loaded manually, the legacy eeprom driver exposed the DDC EEPROM
to userspace. If this functionality is needed, then now the DDC
EEPROM has to be explicitly instantiated using at24.

See also:
https://docs.kernel.org/i2c/instantiating-devices.html


> What does this mean?
> 
> 
> BR,
> Jani.
> 
Heiner

> 
>>
>> Preferably this series should be applied via the i2c tree.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>
>> ---
>>  drivers/gpu/drm/i915/display/intel_gmbus.c |    1 -
>>  drivers/gpu/drm/i915/display/intel_sdvo.c  |    1 -
>>  2 files changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> index 40d7b6f3f..e9e4dcf34 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> @@ -899,7 +899,6 @@ int intel_gmbus_setup(struct drm_i915_private *i915)
>>  		}
>>  
>>  		bus->adapter.owner = THIS_MODULE;
>> -		bus->adapter.class = I2C_CLASS_DDC;
>>  		snprintf(bus->adapter.name,
>>  			 sizeof(bus->adapter.name),
>>  			 "i915 gmbus %s", gmbus_pin->name);
>> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
>> index a636f42ce..5e64d1baf 100644
>> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
>> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
>> @@ -3311,7 +3311,6 @@ intel_sdvo_init_ddc_proxy(struct intel_sdvo_ddc *ddc,
>>  	ddc->ddc_bus = ddc_bus;
>>  
>>  	ddc->ddc.owner = THIS_MODULE;
>> -	ddc->ddc.class = I2C_CLASS_DDC;
>>  	snprintf(ddc->ddc.name, I2C_NAME_SIZE, "SDVO %c DDC%d",
>>  		 port_name(sdvo->base.port), ddc_bus);
>>  	ddc->ddc.dev.parent = &pdev->dev;
>>
> 


