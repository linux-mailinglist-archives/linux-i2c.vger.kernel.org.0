Return-Path: <linux-i2c+bounces-2039-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 763F486A1CA
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 22:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CF342818BB
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 21:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F12E14EFE1;
	Tue, 27 Feb 2024 21:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRbPdEru"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2C622EE0;
	Tue, 27 Feb 2024 21:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709070015; cv=none; b=t0RJ4sPCMQUBvYsoSVqI5Sp4TTosQ33sbvaZsiqfW40w0ZC7ENHD8ytkZEdO/pVlX7owhUkFQO0+J3sZy5a2Rw6uDciMjDhVqyzryC1VaPloIMNV2daNH7imamZDd9oSHuoMdcxwG7zOegCgdek2QozCMun6GQlxDpPsfKMhWqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709070015; c=relaxed/simple;
	bh=NGzOCJdgpsKsw64/9C8ilMbFNlJMq/bziAr5AqU1y5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUVAFsWPduWmeCTUhzf81ZIiNJEZXE/1CqF8Siws3nZ497LTDARVc+qPa5BnvGfjz99+aTLOVZtX1akcrQGCrG9qR67Ossf8+vbexL60ZhVlB/Fe+2y9f/84VV0vRzeQRa2OpfRCt7uwhJdpVKHqpug/3J7j+IvyP20XiLHnlYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRbPdEru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F517C433C7;
	Tue, 27 Feb 2024 21:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709070014;
	bh=NGzOCJdgpsKsw64/9C8ilMbFNlJMq/bziAr5AqU1y5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRbPdErucO9OKyz9CrarRCGDKcsn4HGN+y9/59V2ojcEiyU0ygILlCsmhmZtFzlfX
	 Ou/bbRoizH8xm3t5nyeX9viQ5zRtjmvIJwEAc+LSYtaScR1thX/PzHRRHgYvI3useR
	 2ieScgDF5k5fGd4q4y5P+gTM5zhAuFklgTt3hUYWn5KGiABrIIwU6bS5KbQFAnztne
	 hD48FKnoSReVK8X3H5IJWlCfa8wUdlg+0+tiHcFoUVUtxdTplHYMjVhhoWel0H0gjU
	 R1L+iZGTVTsqCglldFBaa/4lC/cpXBRXvwC4zCHYZp2rlZjVdaXDcyG1rsl5d9xm21
	 CtM5ZqapRDx4Q==
Received: by pali.im (Postfix)
	id 4C69C828; Tue, 27 Feb 2024 22:40:11 +0100 (CET)
Date: Tue, 27 Feb 2024 22:40:11 +0100
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
Message-ID: <20240227214011.xeys7rtukn6hksdw@pali>
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 17 February 2024 11:33:21 Hans de Goede wrote:
> Hi Jean,
> 
> On 2/13/24 17:30, Jean Delvare wrote:
> > Hi Pali, Hans,
> > 
> > On Sun, 7 Jan 2024 18:10:55 +0100, Pali Rohár wrote:
> >> On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
> >>> It is not necessary to handle the Dell specific instantiation of
> >>> i2c_client-s for SMO8xxx ACPI devices without an ACPI I2cResource
> >>> inside the generic i801 I2C adapter driver.
> >>>
> >>> The kernel already instantiates platform_device-s for these ACPI devices
> >>> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
> >>> platform drivers.
> >>>
> >>> Move the i2c_client instantiation from the generic i2c-i801 driver to
> >>> the Dell specific dell-smo8800 driver.
> >>>
> >>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>> ---
> >>> Changes in v2:
> >>> - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
> >>> - Add a comment documenting the IDF PCI device ids
> >>> ---
> >>>  drivers/i2c/busses/i2c-i801.c            | 126 +----------------------
> >>>  drivers/platform/x86/dell/dell-smo8800.c | 121 +++++++++++++++++++++-
> >>>  2 files changed, 123 insertions(+), 124 deletions(-)  
> >>
> >> I'm looking at this change again and I'm not not sure if it is a good
> >> direction to do this movement. (...)
> > 
> > Same feeling here. Having to lookup the parent i2c bus, which may or
> > may not be present yet, doesn't feel good.
> > 
> > I wouldn't object if everybody was happy with the move and moving the
> > code was solving an actual issue, but that doesn't seem to be the case.
> 
> I thought you would actually like getting this somewhat clunky code
> which basically works around the hw not being properly described in
> the ACPI tables out of the generic i2c-i801 code.
> 
> I didn't get around to answer's Pali's concerns yet, so let me
> start by addressing those since you indicate that you share Pali's
> concerns:
> 
> Pali wrote:
> > Now after looking at this change again I see there a problem. If i2c-801
> > driver initialize i2c-801 device after this smo8800 is called then
> > accelerometer i2c device would not happen.
> 
> That is a good point (which Jean also points out). But this can simply
> be fixed by making the dell-smo8800's probe() method return -EPROBE_DEFER
> if the i2c-i801 i2c-bus is not present yet (all designs using the
> dell-smo8800 driver will have an i2c-bus so waiting for this to show
> up should not cause regressions).

Adding EPROBE_DEFER just complicates the dependency and state model.
I would really suggest to come up with a simpler solution, not too
complicated where it is required to think a lot if is is correct and if
all edge-cases are handled.

> If we can agree to move forward this series I'll fix this.
> 
> Pali wrote:
> > Also it has same problem if PCI i801 device is reloaded or reset.
> 
> The i801 device is not hotplugable, so normally this will never
> happen. If the user manually unbinds + rebinds the i2c-i801 driver
> them the i2c_client for the smo88xx device will indeed get removed
> and not re-added. But this will normally never happen and if
> a user is manually poking things then the user can also unbind +
> rebind the dell-mso8800 driver after the i2c-i801 rebind.
> So I don't really see this as an issue.

Well, rmmod & modprobe is not the rare cases. Whatever developers say
about rmmod (or modprobe -r or whatever is the way for unloading
modules), this is something which is used by a lot of users and would be
used. 

> With those remarks addressed let me try to explain why I think
> that moving this to the dell-smo8800 code is a good idea:
> 
> 1. It is a SMO88xx ACPI device specific kludge and as such IMHO
> thus belongs in the driver for the SMO88xx ACPI platform_device.

I'm not sure if it belongs to "SMO88xx ACPI platform_device" but for
sure I agree with you that it does not belong to i801 code. I would say
that it belongs to some SMO8800 glue code -- because it is not the
classic ACPI driver too. But I'm not against to have SMO glue code and
SMO ACPI driver in one file (maybe it is even better to have it).

> The i2c-i801 driver gets loaded on every x86 system and it is
> undesirable to have this extra code and the DMI table in RAM
> on all those other systems.

I think we can take an assumption that ACPI SMO device does not change
it existence or ACPI enabled/disabled state during runtime. So we can
scan for ACPI SMO device just once in function stored in __init section
called during the kernel/module initialization and cache the result
(bool if device was found + its i2c address). After function marked as
__init finish its job then together with DMI tables can be discarded
from RAM. With this way it does take extra memory on every x86 system.
Also we can combine this with an SMO config option, so the whole code
"glue" code would not be compiled when SMO driver is not enabled via
Kconfig.

> 2. Further changes in this series, like adding support for
> probing for the i2c address of the lis3lv02d device on models
> not yet in the DMI table, will add a bunch of more code specific
> to SMO88xx ACPI devices. Making the problem of having SMO88xx
> specific code in the generic i2c-i801 driver even bigger.
> The current amount of SMO88xx specific code in the
> generic i2c-i801 driver might be considered acceptable but I'm
> afraid that the amount of code after this series will not be
> acceptable.

I think alternative approach which I described in the other email in
this thread could be useful for this issue too (to move SMO code from
i2c-i801.c source file). Together with above __init section approach it
can also decrease memory usage.

> 3. Some of the changes in this series are harder to implement inside
> the i2c-i801 code, like optionally instantiating an i2c_client for
> the IIO st_accel driver (*) so that the accelerometer gets presented
> to userspace as a standard IIO device like all modern accelerometer
> drivers do.

This is something about which I'm not very convinced. IIO st_accel
driver does not support freefall interface (or any other for signalling
hard disk falls, which is used by userspace) and in dell systems, this
hard disk protection is the primary usage of the accelerometer.

In last two months I talked with two people, users of the accelerometers
axis on dell and thinkpad machines. They were using it in games which
were joystick-based (one game was tuxracer, second I do not remember
name).

So I'm not sure that replacing joystick driver by some new API would be
really useful for users of accelerometer axis.

Before such change I would propose to teach IIO st_accel driver (or what
would be the replacement) to support joystick API for userspace.

> This requires setting i2c_client.irq and that IRQ comes from
> the SMO88xx ACPI device. So this would require the i2c-i801 code
> to lookup the ACPI device and get the IRQ from there. Where as
> in the SMO88xx ACPI platform_device driver the IRQ is readily
> available.

I understand this problem.

But I would like to ask a question: WHY it is needed at all?
The IRQ represents the free fall / hard disk fall event, which is
slightly different thing than reporting accelerometer axis.
Why IIO st_accel (or lis3lv02d) needs free fall IRQ?

Hard disk fall interrupt on Dell machines can be handled by separate
driver, not related to ACPI SMO8800 device.

It would be much more easier to split these two different
functionalities (reporting axes; and reporting hard disk fall event)
into two separate drivers. And it would simplify whole logic related to
instantiating free fall hard disk driver and accelerometer axes driver
(either IIO st_accel or lis3lv02d or some other...).

So from my side, I do not see a reason to "inject" IRQ number into
driver which reads accelerometer axes.

> TL;DR: IMHO all this SMO88xx quirk/glue handling belongs in
> the SMO88xx specific dell-smo8800 driver rather then in
> the generic i2c-i801 code.

I agree, that it does not belong to the i2c-i801.c source file. And I
also would like to see movement. That is why I proposed alternative and
simpler solution.

> Regards,
> 
> Hans
> 
> 
> *) Instead of an i2c_client for the somewhat weird (but still
> default for backward compat) drivers/misc/lis3lv02d/lis3lv02d.c
> driver
> 
> 
> 
> 
> 
> 
> 

