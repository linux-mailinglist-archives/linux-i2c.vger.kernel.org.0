Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33A43E28E0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 12:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhHFKrX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 06:47:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:49700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231808AbhHFKrT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Aug 2021 06:47:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94F1D61181;
        Fri,  6 Aug 2021 10:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628246823;
        bh=BPSXBro8n0D4eX84+ol/LzzXA9eptVWWM3T1TCuLZMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S8s9LOD6F9AeMF8hRNuqovUMkQhARKRBxBxuKEhOdDgbf8muDrWY/M8RHk96+DLOf
         H3LB8rAYOWEji/ll7FYspPBISn2zkGDVVJaC1pB3QppjHnV5dnmhPmSl9o4mT47HO6
         X3eJGvckDNv/8ne2wxTDY4HOBYhhIlP3NtslIamgSzgAX+edqriryG9X5tAIUBWxTd
         xj4c+VSv7fjaW6R09X9Tz02hJzM9pptzaGCQ2/OtBZ9/etzm1mLUosEkZYca1n45Ws
         bDlu7OAqQ57EP9KZmI9mQ+s5xDloL4z//hhQG3lj0OWjmidSA1b44X9RRui/aLgcBS
         IKNDMERSpCKlA==
Received: by pali.im (Postfix)
        id EBB2F768; Fri,  6 Aug 2021 12:47:00 +0200 (CEST)
Date:   Fri, 6 Aug 2021 12:47:00 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/10] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <20210806104700.2plfzwtp2ajvmwfa@pali>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <f2477399-62df-0036-7d35-4e8634afad9c@gmail.com>
 <20210805115156.70e364be@endymion>
 <20210805191144.qq37e73p5zqomkem@pali>
 <14a49ba2-f6a6-3ccc-6a65-70a72bb3fe51@gmail.com>
 <20210805230818.mmgybd4ybr2savyk@pali>
 <20210806115519.3d9c58cf@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210806115519.3d9c58cf@endymion>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Friday 06 August 2021 11:55:19 Jean Delvare wrote:
> Hi Pali, Heiner,
> 
> On Fri, 6 Aug 2021 01:08:18 +0200, Pali Rohár wrote:
> > On Thursday 05 August 2021 21:42:23 Heiner Kallweit wrote:
> > > On 05.08.2021 21:11, Pali Rohár wrote:  
> > > > On Thursday 05 August 2021 11:51:56 Jean Delvare wrote:  
> > > >> On Sun, 01 Aug 2021 16:20:19 +0200, Heiner Kallweit wrote:  
> > > >>> Replace the ugly cast of the return_value pointer with proper usage.
> > > >>> In addition use dmi_match() instead of open-coding it.  
> > > >>
> > > >> Pali, would you be able to test this patch?  
> > > > 
> > > > Tested now on Latitude E6440 and patch is working fine (no difference).
> 
> Thank you for joining the discussion and testing.
> 
> > > >>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > > >>> ---
> > > >>>  drivers/i2c/busses/i2c-i801.c | 13 ++++---------
> > > >>>  1 file changed, 4 insertions(+), 9 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > > >>> index d971ee20c..a6287c520 100644
> > > >>> --- a/drivers/i2c/busses/i2c-i801.c
> > > >>> +++ b/drivers/i2c/busses/i2c-i801.c
> > > >>> @@ -1191,7 +1191,7 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> > > >>>  
> > > >>>  	kfree(info);
> > > >>>  
> > > >>> -	*((bool *)return_value) = true;
> > > >>> +	*return_value = obj_handle;  
> > > > 
> > > > You are missing a cast here. "obj_handle" is of unknown typedef type
> > > > acpi_handle and *return_value is of type void*. So this can generate a
> > > > compile warning (either now or in future).
> > > 
> > > acpi_handle is defined as:  typedef void *acpi_handle;
> > > Therefore compiler is happy (as long as acpi_handle is any pointer type).  
> > 
> > But point of this typedefing is to hide real type and let user to use
> > this "unknown" type without excepting any specific type.
> > 
> > "Therefore compiler is happy" here is there just a "hack" which
> > currently mute casting warning. But I think it is not something which
> > should be used as it is against how API / code of specific function was
> > designed.
> 
> But you can't respect that "unknown type" and still code cleanly. The
> definition of acpi_handle hides the fact that this is a pointer type.
> And you can't code cleanly if you need to manipulate an "object" but
> have no idea whether it's a pointer, a scalar value or a structure.
> 
> (Well, you *could* with an API which does all the manipulation for you.
> But that's not what we have here.)
> 
> In my opinion, the only value of "acpi_handle" as it is currently
> defined is to let people know what type of data is found behind that
> pointer. But I would much prefer real structure and an explicit pointer
> to it.

+1

> > For me this situation looks like: Somebody created API and specified how
> > to use it. It was realized that specified usage is not ideal for some
> > operations. And then people started "hacking" this API to look better
> > in these special cases.
> > 
> > But solution for this issue is to fix API (or create a new API which
> > better for this purpose), not hacking or workarounding it to looks
> > better by hiding / workarounding other important details.
> 
> The practical issue here is that we are talking about ACPICA, which is
> partly developed outside / independently of the rest of the kernel. If
> you can convince the ACPICA developers to implement a better
> alternative to acpi_get_devices(), and/or make acpi_handle a better
> type, I'll be more than happy to use that in the i2c-i801 driver. But I
> don't see that happening any time soon, if ever, and for the time
> being, we have to live with the poor API we are given.

Now I'm looking how is acpi_get_devices() used on other places and
basically it is used like before this patch...

    my_type my_value;
    ...
    *(my_type *)return_value = my_value;

(and in most cases my_type is acpi_handle)

So I'm not sure if it is a good idea to change this "common" usage just
in one place in one driver in kernel.

I do not remember details, but I think I chose this bool casting because
it was (and still is) common pattern how this function is used in
kernel.

> > > > So you need to write it something like this:
> > > > 
> > > >   *((acpi_handle *)return_value) = obj_handle;
> > > > 
> > > > But what is benefit of this change? Is not usage of explicit true and
> > > > false values better than some acpi_handle type of undefined value stored
> > > > in obj_handle?
> > >
> > > From a logical perspective I agree. My motivation is that I see explicit
> > > casts as a last resort and try to avoid them as far as possible.  
> 
> I tend to agree with that, FWIW.
> 
> > But in this case you really should not avoid casting. It is different
> > pointer type of unknown (or rather hidden) type. Currently it does not
> > throw warning (maybe because compiler is not smart enough). But it does
> > not mean that code is really semantically correct or that in future
> > compiler (or its new version) does not throw warning.
> 
> It's not about the smartness of the compiler. acpi_handle is equal to
> void *, and Heiner's code is perfectly valid for a void *. No cast
> needed with any compiler or on any platform.
> 
> Of course, things would break if the definition of acpi_handle ever
> changes. Which would be great new actually, as I wrote above. And we
> can revisit the code then.
> 
> > Syntactically code looks better, but only until reader start studding
> > what code is really doing.
> 
> I have to admit I got pretty confused when reading it at first. On the
> other hand, I was equally confused by the code that it attempts to
> replace ^^
> 
> > > The current code abuses a void* variable to store a bool. This makes the
> > > implicit assumption that a pointer variable is always big enough to
> > > store a bool.  
> > 
> > I understand your concerns and also your motivation. API is not ideal
> > for usage. But both current and your proposed solution is just a hack to
> > workaround this API usage.
> > 
> > I think that according to C standard it is possible to cast between
> > pointer and non-pointer (integer-like) types only via uintptr_t (or
> > intptr_t) type...
> > 
> > So compliant C code could look like this?
> > 
> >     void func(void **ret) {
> >         *ret = (void *)(uintptr_t)1;
> >     }
> > 
> >     bool test(void) {
> >         void *found = (uintptr_t)0;
> >         func(&found);
> >         return (uintptr_t)found;
> >     }
> > 
> > or test() function may be simplified:
> > 
> >     bool test(void) {
> >         void *found = NULL;
> >         func(&found);
> >         return found;
> >     }
> > 
> > (but for me it looks strange if I'm reading _word_ NULL when used as a
> > false value in 2-state logic variable)
> 
> I don't like this and I'm not even sure if that is allowed in the kernel.

I do not like it too...

Now I'm looking at kernel code and uintptr_t and pointer casting is used.

> > > With regard to "acpi_handle of undefined value": I'm just interested
> > > in the information whether handle is NULL or not. That's the normal
> > > implicit cast to bool like in every if(pointer) clause.   
> > 
> > Yes, of course, this is fully valid.
> > (...)
> > > > Anyway, it looks strange to use name "found" for object handle
> > > > variable. I would expect that something named "found" is storing
> > > > something which refers to 2-state logic and not some handle value.
> 
> It's actually a rather common pattern for lookup functions, returning
> NULL when the expected item wasn't found, or a pointer to the item if
> found. What makes things a bit weird here is that we don't actually
> care about acpi_handle. All we need is a pointer to pretty much
> anything, to differentiate between the found and not found cases.
> 
> Therefore I would propose the following alternative:
> 
> --- linux-5.13.orig/drivers/i2c/busses/i2c-i801.c	2021-08-06 11:11:44.275200299 +0200
> +++ linux-5.13/drivers/i2c/busses/i2c-i801.c	2021-08-06 11:18:19.847469822 +0200
> @@ -1194,7 +1194,7 @@ static acpi_status check_acpi_smo88xx_de
>  
>  	kfree(info);
>  
> -	*((bool *)return_value) = true;
> +	*return_value = hid;	/* Could be any address, used as true value */
>  	return AE_CTRL_TERMINATE;
>  
>  smo88xx_not_found:
> @@ -1204,13 +1204,10 @@ static acpi_status check_acpi_smo88xx_de
>  
>  static bool is_dell_system_with_lis3lv02d(void)
>  {
> -	bool found;
> -	const char *vendor;
> +	acpi_handle found = NULL;

Then you should define it as: "void *found = NULL;" and not as
acpi_handle anymore.

>  
> -	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> -	if (!vendor || strcmp(vendor, "Dell Inc."))
> +	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
>  		return false;
> -
>  	/*
>  	 * Check that ACPI device SMO88xx is present and is functioning.
>  	 * Function acpi_get_devices() already filters all ACPI devices
> @@ -1219,9 +1216,7 @@ static bool is_dell_system_with_lis3lv02
>  	 * accelerometer but unfortunately ACPI does not provide any other
>  	 * information (like I2C address).
>  	 */
> -	found = false;
> -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> -			 (void **)&found);
> +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &found);
>  
>  	return found;
>  }
> 
> Basically, it's Heiner's patch except for one line, the idea is to
> return the HID string pointer (which has type char *) instead of the
> acpi_handle. That way we don't depend on an opaque ACPI type. (I first
> tried with the matching acpi_smo8800_ids entry but compiler complained
> about incompatible pointer types due to the const).
> 
> Actually, I think we could use pretty much ANY pointer. Heck, that
> would work too:
> 
> 	*return_value = &disable_features;	/* Could be any address, used as true value */
> 
> Would be kinda confusing, but the comment is supposed to address that.
> In fact we could even do:
> 
> 	*return_value = &i;	/* Could be any address, used as true value */
> 
> That's the address of a local variable on the stack, which will no
> longer exist by the time we check it, but that's still a non-NULL
> pointer so it would work :-D Seriously, let's not do that, simply
> because static code analyzers would possibly complain.

Ehm.. :-) Rather do not talk about other _interesting_ options. Somebody
could listen and come up with this idea as another workaround for
misusing ACPI functions API...

Basically using random pointer values or context-valid pointers just as
true value can cause issues of leaking pointer to context where it is
not valid anymore. And very smart code analyzers are correct if they
throw error that in variable is stored dangling pointer.

> -- 
> Jean Delvare
> SUSE L3 Support
