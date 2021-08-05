Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD3A3E1C32
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 21:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242268AbhHETMB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 15:12:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:50868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242056AbhHETMB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Aug 2021 15:12:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EE85610FF;
        Thu,  5 Aug 2021 19:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628190706;
        bh=MAIZmfCBJpWdBGUfQQv8rUI4fZ0Lv77KXSxJRDYR4Ig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OKP8FkMfD+rJs1TDLly8ABicRrQPa4NRrs9Z4VRe70/nWIUMY51LlE7J96Hs/tcna
         K7al4SBcy7EYLv/wt55XnWpMnxY0YUWYrNGajWxc4v/W4yt/1oAi/Z1/jiA3ZEb9Rp
         sYOeJPc3XCsRt6E6gTxwYRKWN7LU7B7Nl0Bssl1jteFWlAv9sUXPRSj/FO0jOEow2M
         /rLN//FiOAExo8pj9HgZJ/9hcREROg4FqTyYC+motWDW3fKjuVAX8t5Axzl3Ohk0k7
         rS2mOm+64n5rq3ommnV2WWLEo2G0ZaNcyvzPUQrUBpTUo+KPm6G1LJ7VDm3Y/yDIIL
         FdIGItrpYW5/g==
Received: by pali.im (Postfix)
        id 32A93817; Thu,  5 Aug 2021 21:11:44 +0200 (CEST)
Date:   Thu, 5 Aug 2021 21:11:44 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/10] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <20210805191144.qq37e73p5zqomkem@pali>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <f2477399-62df-0036-7d35-4e8634afad9c@gmail.com>
 <20210805115156.70e364be@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805115156.70e364be@endymion>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello!

On Thursday 05 August 2021 11:51:56 Jean Delvare wrote:
> Hi Heiner,
> 
> On Sun, 01 Aug 2021 16:20:19 +0200, Heiner Kallweit wrote:
> > Replace the ugly cast of the return_value pointer with proper usage.
> > In addition use dmi_match() instead of open-coding it.
> 
> Pali, would you be able to test this patch?

Tested now on Latitude E6440 and patch is working fine (no difference).

> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index d971ee20c..a6287c520 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1191,7 +1191,7 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> >  
> >  	kfree(info);
> >  
> > -	*((bool *)return_value) = true;
> > +	*return_value = obj_handle;

You are missing a cast here. "obj_handle" is of unknown typedef type
acpi_handle and *return_value is of type void*. So this can generate a
compile warning (either now or in future).

So you need to write it something like this:

  *((acpi_handle *)return_value) = obj_handle;

But what is benefit of this change? Is not usage of explicit true and
false values better than some acpi_handle type of undefined value stored
in obj_handle?

> >  	return AE_CTRL_TERMINATE;
> >  
> >  smo88xx_not_found:
> > @@ -1201,13 +1201,10 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> >  
> >  static bool is_dell_system_with_lis3lv02d(void)
> >  {
> > -	bool found;
> > -	const char *vendor;
> > +	acpi_handle found = NULL;

Anyway, it looks strange to use name "found" for object handle
variable. I would expect that something named "found" is storing
something which refers to 2-state logic and not some handle value.

> >  
> > -	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> > -	if (!vendor || strcmp(vendor, "Dell Inc."))
> > +	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
> >  		return false;
> 
> Looks good to me.
> 
> > -
> 
> I see no reason to remove that blank line.
> 
> >  	/*
> >  	 * Check that ACPI device SMO88xx is present and is functioning.
> >  	 * Function acpi_get_devices() already filters all ACPI devices
> > @@ -1216,9 +1213,7 @@ static bool is_dell_system_with_lis3lv02d(void)
> >  	 * accelerometer but unfortunately ACPI does not provide any other
> >  	 * information (like I2C address).
> >  	 */
> > -	found = false;
> > -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> > -			 (void **)&found);

Just to explain my motivation: I originally assigned found to false
value immediately before acpi_get_devices() function call to show that
this is the place where variable is used due to to API of that function.

> > +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &found);
> 
> The choice of return value by the acpi_get_devices() designer is very
> unfortunate. It would have been much more convenient if the return
> value was different whether a match has been found or not. Oh well.

I agree, it is very _original_ way...

> I agree that the proposed change is a nicer way to work around this
> limitation. Unfortunately I can't test this as I do not own a Dell
> laptop. Were you able to test it? If not, I hope Pali will.
> 
> >  
> >  	return found;
> >  }
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> -- 
> Jean Delvare
> SUSE L3 Support
