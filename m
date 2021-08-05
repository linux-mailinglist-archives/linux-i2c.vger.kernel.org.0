Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8D03E1F2D
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 01:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhHEXIf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 19:08:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:60108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229697AbhHEXIf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Aug 2021 19:08:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2A336103B;
        Thu,  5 Aug 2021 23:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628204900;
        bh=E3Ox1MZITA9f5KC4G5WdWoqc7M48/wZuaVVGznI7CIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FcKQA/Tu6J2zNlan449pjx0o897JuvivbsfBtcdo7amc0f6KJQBEltygIP8/uNztK
         VP/qn9Gq6Sp/hWx1Mr3bSZpwSu4XKbvbZ0XztYpQyjdymbGy+woPs9RdHn+5CKK98h
         NLrJYP84xHYXf7ClU/Y8t8SSX3W+KrX08BXeHDVtXQ6moJca1Exjg47HT4khb4M8CQ
         qzwMH5O4yo6E3SOxTbne8aKZVzPBJ62prFw+sfOFiT5FXN/PVy5ZA2DC4VTZxaKg6X
         o+9gBtgKJ80Z1R0F6w5o3Ss1tzZH5lDPatZylNNXlAypIdmGASftQczMLkuaNCxlVV
         wRqLHUkJQRtZQ==
Received: by pali.im (Postfix)
        id 49400817; Fri,  6 Aug 2021 01:08:18 +0200 (CEST)
Date:   Fri, 6 Aug 2021 01:08:18 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/10] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <20210805230818.mmgybd4ybr2savyk@pali>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <f2477399-62df-0036-7d35-4e8634afad9c@gmail.com>
 <20210805115156.70e364be@endymion>
 <20210805191144.qq37e73p5zqomkem@pali>
 <14a49ba2-f6a6-3ccc-6a65-70a72bb3fe51@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14a49ba2-f6a6-3ccc-6a65-70a72bb3fe51@gmail.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thursday 05 August 2021 21:42:23 Heiner Kallweit wrote:
> On 05.08.2021 21:11, Pali Rohár wrote:
> > Hello!
> > 
> > On Thursday 05 August 2021 11:51:56 Jean Delvare wrote:
> >> Hi Heiner,
> >>
> >> On Sun, 01 Aug 2021 16:20:19 +0200, Heiner Kallweit wrote:
> >>> Replace the ugly cast of the return_value pointer with proper usage.
> >>> In addition use dmi_match() instead of open-coding it.
> >>
> >> Pali, would you be able to test this patch?
> > 
> > Tested now on Latitude E6440 and patch is working fine (no difference).
> > 
> >>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >>> ---
> >>>  drivers/i2c/busses/i2c-i801.c | 13 ++++---------
> >>>  1 file changed, 4 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> >>> index d971ee20c..a6287c520 100644
> >>> --- a/drivers/i2c/busses/i2c-i801.c
> >>> +++ b/drivers/i2c/busses/i2c-i801.c
> >>> @@ -1191,7 +1191,7 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> >>>  
> >>>  	kfree(info);
> >>>  
> >>> -	*((bool *)return_value) = true;
> >>> +	*return_value = obj_handle;
> > 
> > You are missing a cast here. "obj_handle" is of unknown typedef type
> > acpi_handle and *return_value is of type void*. So this can generate a
> > compile warning (either now or in future).
> > 
> 
> acpi_handle is defined as:  typedef void *acpi_handle;
> Therefore compiler is happy (as long as acpi_handle is any pointer type).

But point of this typedefing is to hide real type and let user to use
this "unknown" type without excepting any specific type.

"Therefore compiler is happy" here is there just a "hack" which
currently mute casting warning. But I think it is not something which
should be used as it is against how API / code of specific function was
designed.

For me this situation looks like: Somebody created API and specified how
to use it. It was realized that specified usage is not ideal for some
operations. And then people started "hacking" this API to look better
in these special cases.

But solution for this issue is to fix API (or create a new API which
better for this purpose), not hacking or workarounding it to looks
better by hiding / workarounding other important details.

> > So you need to write it something like this:
> > 
> >   *((acpi_handle *)return_value) = obj_handle;
> > 
> > But what is benefit of this change? Is not usage of explicit true and
> > false values better than some acpi_handle type of undefined value stored
> > in obj_handle?
> > 
> From a logical perspective I agree. My motivation is that I see explicit
> casts as a last resort and try to avoid them as far as possible.

But in this case you really should not avoid casting. It is different
pointer type of unknown (or rather hidden) type. Currently it does not
throw warning (maybe because compiler is not smart enough). But it does
not mean that code is really semantically correct or that in future
compiler (or its new version) does not throw warning.

Syntactically code looks better, but only until reader start studding
what code is really doing.

> The current code abuses a void* variable to store a bool. This makes the
> implicit assumption that a pointer variable is always big enough to
> store a bool.

I understand your concerns and also your motivation. API is not ideal
for usage. But both current and your proposed solution is just a hack to
workaround this API usage.

I think that according to C standard it is possible to cast between
pointer and non-pointer (integer-like) types only via uintptr_t (or
intptr_t) type...

So compliant C code could look like this?

    void func(void **ret) {
        *ret = (void *)(uintptr_t)1;
    }

    bool test(void) {
        void *found = (uintptr_t)0;
        func(&found);
        return (uintptr_t)found;
    }

or test() function may be simplified:

    bool test(void) {
        void *found = NULL;
        func(&found);
        return found;
    }

(but for me it looks strange if I'm reading _word_ NULL when used as a
false value in 2-state logic variable)

> With regard to "acpi_handle of undefined value": I'm just interested
> in the information whether handle is NULL or not. That's the normal
> implicit cast to bool like in every if(pointer) clause. 

Yes, of course, this is fully valid.

> >>>  	return AE_CTRL_TERMINATE;
> >>>  
> >>>  smo88xx_not_found:
> >>> @@ -1201,13 +1201,10 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> >>>  
> >>>  static bool is_dell_system_with_lis3lv02d(void)
> >>>  {
> >>> -	bool found;
> >>> -	const char *vendor;
> >>> +	acpi_handle found = NULL;
> > 
> > Anyway, it looks strange to use name "found" for object handle
> > variable. I would expect that something named "found" is storing
> > something which refers to 2-state logic and not some handle value.
> > 
> >>>  
> >>> -	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> >>> -	if (!vendor || strcmp(vendor, "Dell Inc."))
> >>> +	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
> >>>  		return false;
> >>
> >> Looks good to me.
> >>
> >>> -
> >>
> >> I see no reason to remove that blank line.
> >>
> >>>  	/*
> >>>  	 * Check that ACPI device SMO88xx is present and is functioning.
> >>>  	 * Function acpi_get_devices() already filters all ACPI devices
> >>> @@ -1216,9 +1213,7 @@ static bool is_dell_system_with_lis3lv02d(void)
> >>>  	 * accelerometer but unfortunately ACPI does not provide any other
> >>>  	 * information (like I2C address).
> >>>  	 */
> >>> -	found = false;
> >>> -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> >>> -			 (void **)&found);
> > 
> > Just to explain my motivation: I originally assigned found to false
> > value immediately before acpi_get_devices() function call to show that
> > this is the place where variable is used due to to API of that function.
> > 
> >>> +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &found);
> >>
> >> The choice of return value by the acpi_get_devices() designer is very
> >> unfortunate. It would have been much more convenient if the return
> >> value was different whether a match has been found or not. Oh well.
> > 
> > I agree, it is very _original_ way...
> > 
> >> I agree that the proposed change is a nicer way to work around this
> >> limitation. Unfortunately I can't test this as I do not own a Dell
> >> laptop. Were you able to test it? If not, I hope Pali will.
> >>
> >>>  
> >>>  	return found;
> >>>  }
> >>
> >> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> >>
> >> -- 
> >> Jean Delvare
> >> SUSE L3 Support
> 
