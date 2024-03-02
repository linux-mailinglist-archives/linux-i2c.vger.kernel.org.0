Return-Path: <linux-i2c+bounces-2113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E6986F045
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 12:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09579B23C25
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 11:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2463017553;
	Sat,  2 Mar 2024 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fWD2o0DN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FF217548
	for <linux-i2c@vger.kernel.org>; Sat,  2 Mar 2024 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709379514; cv=none; b=h5gZ5+9RdRrbBAIxEJYMCP+6XD4uV1UlmtwtzB01d3sYmam1dsM7RwjNMfI2nQLTGElm/Pt+hEFv5VFw+9XXTjri6VUsHFpUKk9fiYwwwX8wCBGxaLntrT4ff/wZexjZ/8hXBRfHnZ3yznBx/s1xiw374KLm0RsSLiJKnd3xQZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709379514; c=relaxed/simple;
	bh=dR221nuvdid6yanuCziQuzGHHK79PSbWcRvVZnC32jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+mj3sghTdhx+2Gk8wi9UcG53gkS8rMf/dUQJqj49VkrAJ35ZoQiaVSqhfZ3MNOLhUYbkzzWabpLNs0bco91AbTbHbnxqfaL3Trjlr78CiiFKJJdhSyAt/BsJ8/R0Vx9Y5oVoHdBCylQlWESX0GT5KV+ylhD5QmbYV0rV2l+dXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fWD2o0DN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709379511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPCs84wnj42hQeMF4SkEh7lGDrpXMEJz0dFw5Fxf5vM=;
	b=fWD2o0DN9md+mkjMGhAGKk7I9r6tmJFZu9ewJJL6d+ZQmKVPcUidM1bXOsOgS6jkYyraRn
	dVY8ffuUPe+nAeCFinxoXcV4T+QE03ivPXC2Vgc7MvDGzFFX48o7hSu6m8AgYmt9CVBZku
	Qqk8xGq6x/k4xiOfQ5MfpUyty7h2MT4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-k3UECcXJMwS_c4MN7mUBTg-1; Sat, 02 Mar 2024 06:38:30 -0500
X-MC-Unique: k3UECcXJMwS_c4MN7mUBTg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a3bdd99a243so329203866b.0
        for <linux-i2c@vger.kernel.org>; Sat, 02 Mar 2024 03:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709379509; x=1709984309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPCs84wnj42hQeMF4SkEh7lGDrpXMEJz0dFw5Fxf5vM=;
        b=eJrZbjHKxU5Ajm+yUPgVpNyJnSiWxesfR2ChdhM58IKGeJT7Ff8DOsiJmS+TG6uzil
         dOszssCkUMa+g9OnI0LS45VyeTbnGd7AMVODr9+379U+ittdHIdb9iTiVmDXYEZl1Rg6
         +tUdwS2Z93fFEcGRlJq8IYTEzVKzL7sOhMTpo7uChNImQujq0kv9Q6ebaZHbJQTrfA4f
         flysDbOY7GLD5lFIHHsybEveHvUj4AGEM5qiXyeuhPGCC7y59VOfvCe4s8EHryciljVT
         XAWo9ldY9Ga4Diuriq53yvJCUnYZo/DYA22EYv8LAKC6+LvAYT7GqtXdW9gLPhQcW93+
         Db5g==
X-Forwarded-Encrypted: i=1; AJvYcCUf3ywgfidXTiGijBV2aB/ZsUo84oeaNeOU7yMV4vdkcRp9V4FuQDs8fOQAgB5seTPCi7GgoP6mdLpgdNncLdpWiOFOausLsSJN
X-Gm-Message-State: AOJu0YzsvD3SWVltrRxKI1le0xYy8u3Z3zzn3g1SKz7Rg7rH3l6so6Cf
	7gOFhxAzz0ZjKxB8kn7iUuZeV2K2fDnkLTuG5wa85jDrlw0z7K7Q6IdYl3edA7DnPNvj8Ec6qFO
	NJ8jwe6yRCxY+PTqhRcBQ+KyPd44Zto/fh65r3hGFHWaLXP+M5I6zv6ptHw==
X-Received: by 2002:a17:907:986f:b0:a44:eb5:dd4a with SMTP id ko15-20020a170907986f00b00a440eb5dd4amr3445308ejc.25.1709379508827;
        Sat, 02 Mar 2024 03:38:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8rVzcoFgf4C/2dGSVoD55sTTAqJJtrcupLNN3P1q1wmz3RJ+u/0w+iKVi+Fq5yMP8wyBSIA==
X-Received: by 2002:a17:907:986f:b0:a44:eb5:dd4a with SMTP id ko15-20020a170907986f00b00a440eb5dd4amr3445286ejc.25.1709379508448;
        Sat, 02 Mar 2024 03:38:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qx22-20020a170906fcd600b00a4302eb448dsm2598584ejb.134.2024.03.02.03.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 03:38:28 -0800 (PST)
Message-ID: <cc13a44e-ca2b-4c4a-b2c6-23ae4b13f473@redhat.com>
Date: Sat, 2 Mar 2024 12:38:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Content-Language: en-US, nl
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <20240227214011.xeys7rtukn6hksdw@pali>
 <4344926b-40e9-4423-b208-c18263248a82@redhat.com>
 <20240229205724.4izh253onvh4mijd@pali>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240229205724.4izh253onvh4mijd@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/29/24 21:57, Pali Rohár wrote:
> On Wednesday 28 February 2024 14:10:14 Hans de Goede wrote:
>>>>> Now after looking at this change again I see there a problem. If i2c-801
>>>>> driver initialize i2c-801 device after this smo8800 is called then
>>>>> accelerometer i2c device would not happen.
>>>>
>>>> That is a good point (which Jean also points out). But this can simply
>>>> be fixed by making the dell-smo8800's probe() method return -EPROBE_DEFER
>>>> if the i2c-i801 i2c-bus is not present yet (all designs using the
>>>> dell-smo8800 driver will have an i2c-bus so waiting for this to show
>>>> up should not cause regressions).
>>>
>>> Adding EPROBE_DEFER just complicates the dependency and state model.
>>> I would really suggest to come up with a simpler solution, not too
>>> complicated where it is required to think a lot if is is correct and if
>>> all edge-cases are handled.
>>
>> I'm not sure what you are worried about here. dell-smo8800 is
>> a leave driver, nothing inside the kernel depends on it being 
>> loaded or not. So there are no -EPROBE_DEFER complexities here,
>> yes -EPROBE_DEFER can become a bit hairy with complex dependency
>> graphs, but this is a very KISS case.
>>
>> Are there any specific scenarios you are actually worried about
>> in this specific case?
> 
> -EPROBE_DEFER restarts and schedule probing of the device later. It does
> not inform device manager when it can try do it. So it can try probing
> it many more times until it decide to not try it again.

"until it decide to not try it again" is not how the kernel's EPROBE_DEFER
mechanism works. It will queue a new re-probe of all devices on the
deferred probe list whenever another driver's probe() method succeeds.

So once i801_probe() returns success, the dell-smo8800 driver's probe()
will be tried again and at that point the i2c-i801 i2c_adapter exists
and it will succeed.

Yes the dell-smo8800 driver's probe() may be called multiple times
before i801_probe(), but that is not an issue.

It is guaranteed that the dell-smo8800 driver's probe() will be called
at least once after i801_probe() succeeds.

> This
> asynchronous design is broken and I do not see reason why to use it in
> another driver

EPROBE_DEFER is used in other cases on x86 platforms too and it is
used a whole lot on ARM platforms. If you consider EPROBE_DEFER
fundamentally broken then that is a whole other discussion and
frankly that is out of scope for this discussion. EPROBE_DEFER
is a widely used and proven mechanism. Arguing that this patch
cannot move forward because EPROBE_DEFER has generic issues really
is out of scope.

>>>> If we can agree to move forward this series I'll fix this.
>>>>
>>>> Pali wrote:
>>>>> Also it has same problem if PCI i801 device is reloaded or reset.
>>>>
>>>> The i801 device is not hotplugable, so normally this will never
>>>> happen. If the user manually unbinds + rebinds the i2c-i801 driver
>>>> them the i2c_client for the smo88xx device will indeed get removed
>>>> and not re-added. But this will normally never happen and if
>>>> a user is manually poking things then the user can also unbind +
>>>> rebind the dell-mso8800 driver after the i2c-i801 rebind.
>>>> So I don't really see this as an issue.
>>>
>>> Well, rmmod & modprobe is not the rare cases. Whatever developers say
>>> about rmmod (or modprobe -r or whatever is the way for unloading
>>> modules), this is something which is used by a lot of users and would be
>>> used. 
>>
>> Many modules actually have bugs in there remove paths and crash,
>> this is really not a common case. Sometimes users use rmmod + modprobe
>> surrounding suspend/resume for e.g. a wifi driver to work around
>> suspend/resume problems but I have never heard of this being used
>> for a driver like i2c-i801.
>>
>> And again if users are manually meddling with this, the they can
>> also rmmod + modprobe dell-smo8800 after re-modprobing i2c-i801.
> 
> Argument that other modules have bugs in some code path does not mean to
> introduce bugs also into other modules. I do not take it.

My remark about many modules having bugs in their remove() path
was to counter your argument that people do manual rmmod-s all
the time.

But how many people do or do not do manual rmmods is not
the fundamental point here.

The fundamental point is that if users make manual rmmod calls then
they already need to also manually undo the results of the rmmod call.
So now they will also need to reload dell-smo8800 driver as part of
the manual undoing. I really don't see a problem with that. Users
should not be unloading (and 99% is not unloading) the i2c-i801 driver
in the first place.


>>>> The i2c-i801 driver gets loaded on every x86 system and it is
>>>> undesirable to have this extra code and the DMI table in RAM
>>>> on all those other systems.
>>>
>>> I think we can take an assumption that ACPI SMO device does not change
>>> it existence or ACPI enabled/disabled state during runtime. So we can
>>> scan for ACPI SMO device just once in function stored in __init section
>>> called during the kernel/module initialization and cache the result
>>> (bool if device was found + its i2c address). After function marked as
>>> __init finish its job then together with DMI tables can be discarded
>>> from RAM. With this way it does take extra memory on every x86 system.
>>> Also we can combine this with an SMO config option, so the whole code
>>> "glue" code would not be compiled when SMO driver is not enabled via
>>> Kconfig.
>>
>> This approach does not work because i2c-i801.c registers a PCI driver,
>> there is no guarantee that the adapter has already been probed and
>> an i2c_adapter has been created before it. A PCI driver's probe()
>> function must not be __init and thus any code which it calls also
>> must not be __init.
>>
>> So the majority of the smo88xx handling can not be __init.
> 
> This argument is wrong. smo88xx has nothing with PCI, has even nothing
> with i2c. The detection is purely ACPI based and this can be called at
> any time after ACPI initialization. Detection does not need PCI. There
> is no reason why it cannot be called in __init section after ACPI is
> done.

My patch series adds support for probing the i2c-address to make it
easier for users to check what the address of the lis3lv02d chip
on their laptop model is.

This probing requires access to the actual i2c_adapter which is
a PCI device. So this can only run after the PCI-driver for the
i2c-i801 bus has bound, which means after the probe() from the
PCI driver so it cannot be __init code.

Pali I'm getting the feeling that you have dug in your heels that:

1. Current approach is good
2. Hans' new approach is bad

And that you are not really given my arguments why moving
the code out of the i2c-i801 driver is a good idea a fair hearing.

I would like you to try and take some distance from this and
look at this with more of a helicopter view.

As I mentioned earlier in the thread and as Andy has agreed
with my main motivation for moving the handling of the i2c_client
instantation is that this is a SMO88xx ACPI device specific kludge
and as such IMHO thus belongs in the driver for the SMO88xx ACPI
platform_device.

Had I been involved in (and have the knowledge of kernel internals
I have now) the original i2c-i801.c SMO88xx ACPI device changes
then I would likely have nacked them.

Putting this sort of highly device specific code into generic
drivers like the i2c-i801 code does not scale. What if tomorrow
we find some other ACPI device with similar issues are we then
going to add yet another kludge to the generic shared i2c-i801 code ?

Also note that the i2c-i801.c code already is triggered by
the presence of certain ACPI hw-ids and we already have a
mechanism to only load code based on ACPI hw-ids (1), that is
have a platform_driver with an acpi_match table for those ids,
which is exactly the mechanism my new approach is using.

From a design perspective the handling of all of this
*very obviously* belongs in a driver actually binding to
these ACPI ids and my suggested changes are actually
following this, what IMHO is the only proper way to handle
this.

Now if there were big problems with my suggested approach
then I could understand your reluctance.

But the only real problem you have pointed out is that
if people *manually* rmmod i2c-i801 that then after *manually*
modprobing i2c-i801 again the i2c_client for the lis3lv02d chip
is not automatically re-instated, instead they will need to
also manually reload the dell-smo8800 driver. Which IMHO
really is not an issue since they are already manually messing
with drivers anyways.

And note that even that problem could be fixed by using
bus-notifiers as Andy suggested. IMHO using notifiers here is
overkill. But if you are ok with moving this code out of i2c-i801
and intel dell-smo8800 if I use notifiers in the next version so
that things will keep working even after a *manual* rmmod of
i2c-i801 then I'll do so for v3 of the patchset.

Regards,

Hans


1) The fact alone that the old approach requires manually
syncing the 2 copies of the ACPI hw-id tables already
indicates that the i2c-i801 code is not the right place
for this functionality.



