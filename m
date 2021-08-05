Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4453E1D25
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 22:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhHEUGW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 16:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240406AbhHEUGV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 16:06:21 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39182C061765
        for <linux-i2c@vger.kernel.org>; Thu,  5 Aug 2021 13:06:06 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso7182884wmg.4
        for <linux-i2c@vger.kernel.org>; Thu, 05 Aug 2021 13:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oactcNYgygK0S1qFaSdTYOMswejDqZsyThMN3pxelK0=;
        b=RfVnMWqGawcaBLB0hdhb/1pCYwbO/8cCoNFm4frEb5TbeHxy648eTdi2UnH+/boVm4
         3ujf00vcVDrv5p9RJzM5s4cw+lqKepw7L306rwXCHOZEFrsO5fOIiCLw31FtWPoLlYmj
         wkSJM5J/X39RHPPHhXeFtlDhjbvkulG8f9BIhbvl/vImX52JwiQLAelfoJtuRGJneKme
         nkvWffvikhmiYtk2eKcRI0BXear4qMWO08rEA5tDEqpTwZ+4hImbt/Rhp1OlRWQfc17y
         lkaypHFAm1R58WKALeJejXqWGs98rO6J1kVFIab/AH0gZtrhtktoZYN/tcW6ZDU0kSak
         vsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oactcNYgygK0S1qFaSdTYOMswejDqZsyThMN3pxelK0=;
        b=V2/5+k0FCdVTsUQmoAUZquYkhmw/3IeRfRFhC1XQ1hSyRO7QL2HMGkoXoMrAffFFJi
         /87fOhcSqBni6xu0lG4PeCor/GsZzywLs6UVRDMhI0dXlyHpkT/1rOz3zqpr4MR/dOMX
         Letan1JokvRzpoGFv40vT5bAQbkyZ2UhL/rZnd87mDJh1Oheb0ZleNdOnievpxkoBhJ3
         P4kwmTD9no8q/O/j3jOrDckfGKN0oh7IGMWExGF8jcx4uoDIVU7aUWEOFal/EJkCrNMM
         ynPlp/N1RE5dpl1XkxxSjILZn6GEgml1X6HrlTRvbufN8gOFs0z8UmSbAeXNxiU1lrKm
         HGKg==
X-Gm-Message-State: AOAM533Dd5CGZiRvakrlfuYu1M60dvOZuIffX6l8FCTu3yxGwkIwN4rQ
        D9nX3OmY4vVZ7djhlNpVs5yxZFnCkfw3Vg==
X-Google-Smtp-Source: ABdhPJzZw13iIb6eJ7Kzn4hoyYF6VSJBrJVLLWI8k2mpCW0WyxO13nT8vqQwKjGo9pu3k71VUN2aXA==
X-Received: by 2002:a05:600c:1c11:: with SMTP id j17mr6635706wms.35.1628193964647;
        Thu, 05 Aug 2021 13:06:04 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:75d1:7bfc:8928:d5ba? (p200300ea8f10c20075d17bfc8928d5ba.dip0.t-ipconnect.de. [2003:ea:8f10:c200:75d1:7bfc:8928:d5ba])
        by smtp.googlemail.com with ESMTPSA id o2sm6513055wmq.30.2021.08.05.13.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 13:06:04 -0700 (PDT)
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <f2477399-62df-0036-7d35-4e8634afad9c@gmail.com>
 <20210805115156.70e364be@endymion> <20210805191144.qq37e73p5zqomkem@pali>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 05/10] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <14a49ba2-f6a6-3ccc-6a65-70a72bb3fe51@gmail.com>
Date:   Thu, 5 Aug 2021 21:42:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805191144.qq37e73p5zqomkem@pali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05.08.2021 21:11, Pali Rohár wrote:
> Hello!
> 
> On Thursday 05 August 2021 11:51:56 Jean Delvare wrote:
>> Hi Heiner,
>>
>> On Sun, 01 Aug 2021 16:20:19 +0200, Heiner Kallweit wrote:
>>> Replace the ugly cast of the return_value pointer with proper usage.
>>> In addition use dmi_match() instead of open-coding it.
>>
>> Pali, would you be able to test this patch?
> 
> Tested now on Latitude E6440 and patch is working fine (no difference).
> 
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>  drivers/i2c/busses/i2c-i801.c | 13 ++++---------
>>>  1 file changed, 4 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>> index d971ee20c..a6287c520 100644
>>> --- a/drivers/i2c/busses/i2c-i801.c
>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>> @@ -1191,7 +1191,7 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
>>>  
>>>  	kfree(info);
>>>  
>>> -	*((bool *)return_value) = true;
>>> +	*return_value = obj_handle;
> 
> You are missing a cast here. "obj_handle" is of unknown typedef type
> acpi_handle and *return_value is of type void*. So this can generate a
> compile warning (either now or in future).
> 

acpi_handle is defined as:  typedef void *acpi_handle;
Therefore compiler is happy (as long as acpi_handle is any pointer type).

> So you need to write it something like this:
> 
>   *((acpi_handle *)return_value) = obj_handle;
> 
> But what is benefit of this change? Is not usage of explicit true and
> false values better than some acpi_handle type of undefined value stored
> in obj_handle?
> 
>From a logical perspective I agree. My motivation is that I see explicit
casts as a last resort and try to avoid them as far as possible.
The current code abuses a void* variable to store a bool. This makes the
implicit assumption that a pointer variable is always big enough to
store a bool.

With regard to "acpi_handle of undefined value": I'm just interested
in the information whether handle is NULL or not. That's the normal
implicit cast to bool like in every if(pointer) clause. 

>>>  	return AE_CTRL_TERMINATE;
>>>  
>>>  smo88xx_not_found:
>>> @@ -1201,13 +1201,10 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
>>>  
>>>  static bool is_dell_system_with_lis3lv02d(void)
>>>  {
>>> -	bool found;
>>> -	const char *vendor;
>>> +	acpi_handle found = NULL;
> 
> Anyway, it looks strange to use name "found" for object handle
> variable. I would expect that something named "found" is storing
> something which refers to 2-state logic and not some handle value.
> 
>>>  
>>> -	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
>>> -	if (!vendor || strcmp(vendor, "Dell Inc."))
>>> +	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
>>>  		return false;
>>
>> Looks good to me.
>>
>>> -
>>
>> I see no reason to remove that blank line.
>>
>>>  	/*
>>>  	 * Check that ACPI device SMO88xx is present and is functioning.
>>>  	 * Function acpi_get_devices() already filters all ACPI devices
>>> @@ -1216,9 +1213,7 @@ static bool is_dell_system_with_lis3lv02d(void)
>>>  	 * accelerometer but unfortunately ACPI does not provide any other
>>>  	 * information (like I2C address).
>>>  	 */
>>> -	found = false;
>>> -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
>>> -			 (void **)&found);
> 
> Just to explain my motivation: I originally assigned found to false
> value immediately before acpi_get_devices() function call to show that
> this is the place where variable is used due to to API of that function.
> 
>>> +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &found);
>>
>> The choice of return value by the acpi_get_devices() designer is very
>> unfortunate. It would have been much more convenient if the return
>> value was different whether a match has been found or not. Oh well.
> 
> I agree, it is very _original_ way...
> 
>> I agree that the proposed change is a nicer way to work around this
>> limitation. Unfortunately I can't test this as I do not own a Dell
>> laptop. Were you able to test it? If not, I hope Pali will.
>>
>>>  
>>>  	return found;
>>>  }
>>
>> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>>
>> -- 
>> Jean Delvare
>> SUSE L3 Support

