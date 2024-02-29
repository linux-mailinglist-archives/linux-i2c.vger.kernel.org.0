Return-Path: <linux-i2c+bounces-2075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C186D5BE
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 22:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43BAB1C2372C
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 21:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A950C154EBD;
	Thu, 29 Feb 2024 20:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uh6nSsGR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6740B1509B3;
	Thu, 29 Feb 2024 20:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240248; cv=none; b=I+d7cSMbriI4bXf3MTALqid4I8FLh+aLm9BzwJALipH4O1kq+1ayqfKJonsrHW9OiHYj2oMbAAfRoJ39a6a+dwlmKDHV+IB8nxk6Z8dmLV0OrUxLOM3Ze0+SIyWC7XH/ilq8BFKAcxVPQbB7cV3g4WaIHo0PHS8WANk3BLm3Pwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240248; c=relaxed/simple;
	bh=WVG5iUUffSOSc7mMlDKuyehPwdznGu9f9KNXU8GTaG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhQQSaomucDkmHHmFWuKGolcOv3mx/UcIWuDoCNg+EvCSB5mYry1p6T69ycEZmk6/ZaaaPRvdhU9TNDGJB0RwW854zgfS8qQd8G5sdrdR3scNv5lwdC8cyJBVGhm63v9QO8BrCvOhsXQtvxf6tkR2jBCZt9ymjJ8ODoZWj/DDbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uh6nSsGR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B72C433C7;
	Thu, 29 Feb 2024 20:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709240247;
	bh=WVG5iUUffSOSc7mMlDKuyehPwdznGu9f9KNXU8GTaG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uh6nSsGRJZ6HE2NtoEQH7+Wnreac2/OhbnYncCUs2FrlaNihyvg1iSGtjn7YecGpw
	 LWAYg/rXOZX2OYJJyN5BqELBThTepbIs5rFtHXlymBLy9pM/rvml85Tjt5VEPDYsKE
	 LbM2WhkJFWm+BBI7NL+FQO1zZVOh+m1hiUbrUY0SU+lvgvV+qF6rOZD+rAKrsiYt3L
	 EE5ErvD1kjOXxRy1w8lV0hwn6lHipTs3wxMOFGCcZ2PbZ1/52ZqJuSKG/6kjC9nxRB
	 opDTJG1DXFC8519vgTd8WnynqRFt0X7ZRFKWzLUddGZ89Yj8dflqMUuciue/qKoCtR
	 TYH23fA9kgFDg==
Received: by pali.im (Postfix)
	id 528CB92C; Thu, 29 Feb 2024 21:57:24 +0100 (CET)
Date: Thu, 29 Feb 2024 21:57:24 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jean Delvare <jdelvare@suse.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240229205724.4izh253onvh4mijd@pali>
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <20240227214011.xeys7rtukn6hksdw@pali>
 <4344926b-40e9-4423-b208-c18263248a82@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4344926b-40e9-4423-b208-c18263248a82@redhat.com>
User-Agent: NeoMutt/20180716

On Wednesday 28 February 2024 14:10:14 Hans de Goede wrote:
> >>> Now after looking at this change again I see there a problem. If i2c-801
> >>> driver initialize i2c-801 device after this smo8800 is called then
> >>> accelerometer i2c device would not happen.
> >>
> >> That is a good point (which Jean also points out). But this can simply
> >> be fixed by making the dell-smo8800's probe() method return -EPROBE_DEFER
> >> if the i2c-i801 i2c-bus is not present yet (all designs using the
> >> dell-smo8800 driver will have an i2c-bus so waiting for this to show
> >> up should not cause regressions).
> > 
> > Adding EPROBE_DEFER just complicates the dependency and state model.
> > I would really suggest to come up with a simpler solution, not too
> > complicated where it is required to think a lot if is is correct and if
> > all edge-cases are handled.
> 
> I'm not sure what you are worried about here. dell-smo8800 is
> a leave driver, nothing inside the kernel depends on it being 
> loaded or not. So there are no -EPROBE_DEFER complexities here,
> yes -EPROBE_DEFER can become a bit hairy with complex dependency
> graphs, but this is a very KISS case.
> 
> Are there any specific scenarios you are actually worried about
> in this specific case?

-EPROBE_DEFER restarts and schedule probing of the device later. It does
not inform device manager when it can try do it. So it can try probing
it many more times until it decide to not try it again. This
asynchronous design is broken and I do not see reason why to use it in
another driver, in case we have a cleaner solution how to initialize and
probe device without -EPROBE_DEFER. This is for sure not a KISS case
but a case with lot of corner cases... and your proposed patch is just
an example of it as you forgot about at least one corner case. Current
solution does not have edge cases... this can be marked as KISS design.

> >> If we can agree to move forward this series I'll fix this.
> >>
> >> Pali wrote:
> >>> Also it has same problem if PCI i801 device is reloaded or reset.
> >>
> >> The i801 device is not hotplugable, so normally this will never
> >> happen. If the user manually unbinds + rebinds the i2c-i801 driver
> >> them the i2c_client for the smo88xx device will indeed get removed
> >> and not re-added. But this will normally never happen and if
> >> a user is manually poking things then the user can also unbind +
> >> rebind the dell-mso8800 driver after the i2c-i801 rebind.
> >> So I don't really see this as an issue.
> > 
> > Well, rmmod & modprobe is not the rare cases. Whatever developers say
> > about rmmod (or modprobe -r or whatever is the way for unloading
> > modules), this is something which is used by a lot of users and would be
> > used. 
> 
> Many modules actually have bugs in there remove paths and crash,
> this is really not a common case. Sometimes users use rmmod + modprobe
> surrounding suspend/resume for e.g. a wifi driver to work around
> suspend/resume problems but I have never heard of this being used
> for a driver like i2c-i801.
> 
> And again if users are manually meddling with this, the they can
> also rmmod + modprobe dell-smo8800 after re-modprobing i2c-i801.

Argument that other modules have bugs in some code path does not mean to
introduce bugs also into other modules. I do not take it.

> >> The i2c-i801 driver gets loaded on every x86 system and it is
> >> undesirable to have this extra code and the DMI table in RAM
> >> on all those other systems.
> > 
> > I think we can take an assumption that ACPI SMO device does not change
> > it existence or ACPI enabled/disabled state during runtime. So we can
> > scan for ACPI SMO device just once in function stored in __init section
> > called during the kernel/module initialization and cache the result
> > (bool if device was found + its i2c address). After function marked as
> > __init finish its job then together with DMI tables can be discarded
> > from RAM. With this way it does take extra memory on every x86 system.
> > Also we can combine this with an SMO config option, so the whole code
> > "glue" code would not be compiled when SMO driver is not enabled via
> > Kconfig.
> 
> This approach does not work because i2c-i801.c registers a PCI driver,
> there is no guarantee that the adapter has already been probed and
> an i2c_adapter has been created before it. A PCI driver's probe()
> function must not be __init and thus any code which it calls also
> must not be __init.
> 
> So the majority of the smo88xx handling can not be __init.

This argument is wrong. smo88xx has nothing with PCI, has even nothing
with i2c. The detection is purely ACPI based and this can be called at
any time after ACPI initialization. Detection does not need PCI. There
is no reason why it cannot be called in __init section after ACPI is
done.

