Return-Path: <linux-i2c+bounces-4255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D623A913470
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 557461F2259B
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 14:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DAE16F859;
	Sat, 22 Jun 2024 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TvP9+ozD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE06116CD0A
	for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719066382; cv=none; b=RIlBVOs3BrdC3qt2T64ldyKrgVDTFtJVkvTe1rGsgcf1Opr+ykEhmRwcyVrFA+X0/tIpM5A0QHvodFc0YMd9tOHxPEVWTQREBo4tqwXZWbQ4IVLMSartGAiLjZuHFEpKRzipY28g+aDWeyKfaCeumkjNpnmptLM+6/WYVRDbEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719066382; c=relaxed/simple;
	bh=saLL2+2foDk7RD6FrX4oobQeO3PKIlOMb9DYi0tfpbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CC3r6RFyaNAW/19TUsYzNzGFYezUTwtfW3npPOqyUcXF66iq8CqGBLjvR0T59uvfjeYOvaQbvMBF3CPGIhfvsIm8HZUdRwXDCli/4VwJNl748jQzaOyrUSxKq9qYwYY1SxPYS0CIIIZmHbe4pn7ewMNfvdjYWMyjParr6u3dwGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TvP9+ozD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719066379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rp0dlVs8mryrj4wyZGhbbU4dXiHE4PKTpKDlpcmoS1w=;
	b=TvP9+ozDOmFlWmJaL4+epsoBVBY5jyxJsoGkSHQ9JdtYcfmoA6K6dmZ7TQvNHWx4x2oDlR
	HFDgIM6N9wW14XqLGacT3a3NNb9sz7erJ2z9dmqwXWuqsO52vgRc38jIlXR+CqrrLSgXYZ
	mC1kAZ3zfjDzABfCOKh1C5Ji+XlGhRM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-bSo9XM-0MsyXdjuGGrF8DQ-1; Sat, 22 Jun 2024 10:26:17 -0400
X-MC-Unique: bSo9XM-0MsyXdjuGGrF8DQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ec568b6fcfso2627491fa.3
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 07:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719066376; x=1719671176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rp0dlVs8mryrj4wyZGhbbU4dXiHE4PKTpKDlpcmoS1w=;
        b=ZHQb9lKZxagL+e/rx4txQNbo9WvJhOf3c8yAefNSu7iGzEqCrwjkA6HsgPWD8ZR9yT
         53h6nbNhdKMynlHjqIPx6SQHAb4CyQevEd2H4FjIf3dLLD2hUJc69Dqo2TdMgpVR4U/Q
         ZuHpz9sCpF52NNWJv+zC75RDHN6tE48I2UhR6+h0s/UA5ErOc2m+i3lC9AvC98pA6zYp
         aC52lfRDZfbTncVsY/+h47v0sr/6LFriY2IbX5HyIf1Q6aye+dFCAA0rguEtDAehZjHW
         DeudffEAm0knwHWFmLPuHy/HgJqGduPfWzcHn/mJfAZc1FWYc8Oyj7mqMxZnOs581cPS
         oXEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVMMfIgHSk5YNyhdWWaaVWxxmIeVAxCJs+Pw0NtIfsSuXblPYNQZRw6+Bys666EPugK+zFAV1fiIB/6D8On+AVnwjeXu3yFRXW
X-Gm-Message-State: AOJu0YyXIKeFBQ8l7Wy/aTItbQCyVoZYKik+SiEwtth8EDlgTDWRB0HR
	HLwubLVnaWxUyluSGj5Oo9glFBYlMPVFPlxn//yo1PutLY+WMXDUDIkqHeVHlbZX1aRf8w9Pb0Q
	1+tG6cNsQ9RnzoQYnGTM5GZ/XY/GQC7YONqm4KEt8KKhNqv18tQztlCDXQw==
X-Received: by 2002:a2e:8817:0:b0:2ec:5abf:f3a8 with SMTP id 38308e7fff4ca-2ec5b269a0amr332551fa.8.1719066375807;
        Sat, 22 Jun 2024 07:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeJq0SB7tr0Lc0yic0o5DdTUmhVxAFVOGOtLe2dYQJ8EnSvEctu+Xb7fsy7MiMajqNjJgrkw==
X-Received: by 2002:a2e:8817:0:b0:2ec:5abf:f3a8 with SMTP id 38308e7fff4ca-2ec5b269a0amr332391fa.8.1719066374980;
        Sat, 22 Jun 2024 07:26:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30562ef3sm2381595a12.91.2024.06.22.07.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 07:26:14 -0700 (PDT)
Message-ID: <b76dc029-ded0-4911-92ee-ab46351105cc@redhat.com>
Date: Sat, 22 Jun 2024 16:26:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622142015.7cfl2onabpr6kl6r@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 6/22/24 4:20 PM, Pali Rohár wrote:
> On Saturday 22 June 2024 16:06:01 Hans de Goede wrote:
>> Hi Pali,
>>
>> On 6/22/24 3:16 PM, Pali Rohár wrote:
>>> On Friday 21 June 2024 14:24:58 Hans de Goede wrote:
>>>> It is not necessary to handle the Dell specific instantiation of
>>>> i2c_client-s for SMO88xx ACPI devices without an ACPI I2cResource
>>>> inside the generic i801 I2C adapter driver.
>>>>
>>>> The kernel already instantiates platform_device-s for these ACPI devices
>>>> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
>>>> platform drivers.
>>>>
>>>> Move the i2c_client instantiation from the generic i2c-i801 driver to
>>>> the SMO88xx specific dell-smo8800 driver.
>>>
>>> Why it has to be in dell-smo8800 driver? Code for registering lis3lv02d
>>> and freefall code for smo88xx are basically independent.
>>>
>>> lis3lv02d is for accelerometer axes and smo88xx is for freefall hardisk
>>> detection. The only thing which have these "drivers" common is the ACPI
>>> detection mechanism based on presence of SMO88?? identifiers from
>>> acpi_smo8800_ids[] array.
>>>
>>> I think it makes both "drivers" cleaner if they are put into separate
>>> files as they are independent of each one.
>>>
>>> What about moving it into drivers/platform/x86/dell/dell-lis3lv02d.c
>>> instead (or similar name)? And just share list of ACPI ids via some
>>> header file (or something like that).
>>
>> Interesting idea, but that will not work, only 1 driver can bind to
>> the platform_device instantiated by the ACPI code for the SMO88xx ACPI device.
> 
> And it is required to bind lis3 device to ACPI code? What is needed is
> just to check if system matches DMI strings and ACPI strings. You are
> not binding device to DMI strings, so I think there is no need to bind
> it neither to ACPI strings.

The driver needs to bind to something ...

This is code for special handling required for SMO88xx ACPI devices,
dell-smo8800 is *the* driver for those ACPI devices. So this code clearly
belongs here.

According to diffstat this adds about 400 lines of code that is really not
that big, so I see no urgent reason to introduce weird tricks instead of
standard driver binding for this.

Regards,

Hans






> 
>>>> Moving the i2c_client instantiation here has the following advantages:
>>>>
>>>> 1. This moves the SMO88xx ACPI device quirk handling away from the generic
>>>> i2c-i801 module which is loaded on all Intel x86 machines to the SMO88xx
>>>> specific dell-smo8800 module where it belongs.
>>>>
>>>> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
>>>> between the i2c-i801 and dell-smo8800 drivers.
>>>>
>>>> 3. This allows extending the quirk handling by adding new code and related
>>>> module parameters to the dell-smo8800 driver, without needing to modify
>>>> the i2c-i801 code.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Note the goto out_put_adapter, which can be avoided by moving the DMI check
>>>> up, is there deliberately as preparation for adding support to probe for
>>>> the i2c address in case there is no DMI match.
>>>> ---
>>>> Changes in v3:
>>>> - Use an i2c bus notifier so that the i2c_client will still be instantiated if
>>>>   the i801 i2c_adapter shows up later or is re-probed (removed + added again)
>>>> - Switch to standard dmi_system_id matching to check both sys-vendor +
>>>>   product-name DMI fields
>>>> - Use unique i2c_adapter->name prefix for primary i2c_801 controller
>>>>   to avoid needing to duplicate PCI ids for extra IDF i2c_801 i2c_adapter-s
>>>> - Drop MODULE_SOFTDEP("pre: i2c-i801"), this is now no longer necessary
>>>> - Rebase on Torvalds master for recent additions of extra models in
>>>>   the dell_lis3lv02d_devices[] list
>>>>
>>>> Changes in v2:
>>>> - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
>>>> - Add a comment documenting the IDF PCI device ids
>>>> ---
>>>>  drivers/i2c/busses/i2c-i801.c            | 124 -------------
>>>>  drivers/platform/x86/dell/dell-smo8800.c | 214 ++++++++++++++++++++++-
>>>>  2 files changed, 213 insertions(+), 125 deletions(-)
>>
>> <snip>
>>
>>>> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
>>>> index f7ec17c56833..cd2e48405859 100644
>>>> --- a/drivers/platform/x86/dell/dell-smo8800.c
>>>> +++ b/drivers/platform/x86/dell/dell-smo8800.c
>>
>> ...
>>
>>>> @@ -103,6 +112,184 @@ static const struct file_operations smo8800_misc_fops = {
>>>>  	.release = smo8800_misc_release,
>>>>  };
>>>>  
>>>> +/*
>>>> + * Accelerometer's I2C address is not specified in DMI nor ACPI,
>>>> + * so it is needed to define mapping table based on DMI product names.
>>>> + */
>>>> +static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
>>>> +	/*
>>>> +	 * Dell platform team told us that these Latitude devices have
>>>> +	 * ST microelectronics accelerometer at I2C address 0x29.
>>>> +	 */
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5250"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>> +	},
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5450"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>> +	},
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5550"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>> +	},
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>> +	},
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440 ATG"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>> +	},
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6540"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>> +	},
>>>> +	/*
>>>> +	 * Additional individual entries were added after verification.
>>>> +	 */
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 5480"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>> +	},
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Precision 3540"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>> +	},
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
>>>> +		},
>>>> +		.driver_data = (void *)0x1dL,
>>>> +	},
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 5568"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>> +	},
>>>> +	{
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 7590"),
>>>> +		},
>>>> +		.driver_data = (void *)0x29L,
>>>
>>> At least for me, casting i2c address to LONG and then to pointer looks
>>> very strange. If I look at this code without knowing what the number
>>> 0x29 means I would not figure out that expression "(void *)0x29L" is i2c
>>> address.
>>>
>>> Is not there a better way to write i2c address? E.g. ".i2c_addr = 0x29"
>>> instead of ".something = (void *)0x29L" to make it readable?
>>
>> struct dmi_system_id is an existing structure and we cannot just go adding
>> fields to it. driver_data is intended to tie driver specific data to
>> each DMI match, often pointing to some struct, so it is a void *, but
> 
> Yes, I know it.
> 
>> in this case we only need a single integer, so we store that in the
>> pointer. That is is the address becomes obvious when looking at the code
>> which consumes the data.
> 
> Ok, this makes sense. Anyway, is explicit void* cast and L suffix
> required?
> 
>>> Also does the whole device table has to be such verbose with lot of
>>> duplicated information (which probably also increase size of every linux
>>> image which includes this driver into it)?
>>
>> struct dmi_system_id is the default way to specify DMI matches in
>> the kernel. This avoids code duplication in the form of writing
>> a DYI function to do the matching.
>>
>> In v2 of the patch-set I only matched on product-name, but you asked
>> in the review of v2 to also match on sys-vendor and you mentioned
>> we may want to support other sys-vendors too, since some other brands
>> have SMO88xx ACPI devices too. This more or less automatically leads
>> to using the kernel's standard, existing, DMI matching mechanism.
>>
>> We really want to avoid coming up with something "new" ourselves here
>> leading to unnecessary code duplication.
>>
>> Regards,
>>
>> Hans
> 
> Ok, then let that table as you have it now.
> 


