Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864F54864D3
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 14:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239226AbiAFNBz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 08:01:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiAFNBy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 08:01:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2701AC061245;
        Thu,  6 Jan 2022 05:01:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E3A07B820D7;
        Thu,  6 Jan 2022 13:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304CAC36AE5;
        Thu,  6 Jan 2022 13:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641474111;
        bh=chr6OhSO72WY5HE02D29Xp6019RC6teoBDKT2biZsb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oxcWc6vf3Po8YeYtTxhRo/KaT47kCcwvexM49REaXLHL8ZHqXgJIgmPniSVCLk/Be
         79nw8QLotx66UUJ+zqz2Jxost5pMZ2UqGgsayMxceDW3YeViRaK6jefUePIoFTuC4Q
         ChHkcFbh0fNnVFxam6Di1VoUzRqV3g8JQtuTVtVhZpoXwEtlvgR+AjMpxvlyfP9zk6
         YGKCHEnaaweX6HMN3iNGkAE+Me0G8vMBfJ4caAOQ7JLOjCvanjeRCpRbshzeRwn3xM
         jHxPdDGIkZDAaPhdGG3atNOFi0zzxCi5n6v+464ffLiGQ2KSt+TgtKhhaYYrENhI81
         DhjZRxrluJkgw==
Date:   Thu, 6 Jan 2022 14:01:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Terry Bowman <Terry.Bowman@amd.com>,
        Jean Delvare <jdelvare@suse.de>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas.lendacky@amd.com
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Message-ID: <YdboPCYlhExlLWhX@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Terry Bowman <Terry.Bowman@amd.com>,
        Jean Delvare <jdelvare@suse.de>, Guenter Roeck <linux@roeck-us.net>,
        linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas.lendacky@amd.com
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
 <20210907183720.6e0be6b6@endymion>
 <20211105170550.746443b9@endymion>
 <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Eh9MfQE45o/Uiuok"
Content-Disposition: inline
In-Reply-To: <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Eh9MfQE45o/Uiuok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean and Guenter,

> This is a gentle reminder to review my previous response when possible. T=
hanks!

Quite some modern AMD laptops seem to suffer from slow touchpads and
this patch is part of the fix [1]. So, if you could comment on Terry's
questions, this is highly appreciated!

Thanks and all the best,

   Wolfram

[1] https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzC=
iYJ-XQ@mail.gmail.com

>=20
> Regards,
> Terry
>=20
> On 12/13/21 11:48 AM, Terry Bowman wrote:
> > Hi Jean and Guenter,
> >=20
> > Jean, Thanks for your responses. I added comments below.
> >=20
> > I added Guenter to this email because his input is needed for adding th=
e same
> > changes to the sp5100_tco driver. The sp5100_tco and piix4_smbus driver
> > must use the same synchronization logic for the shared register.
> >=20
> > On 11/5/21 11:05, Jean Delvare wrote:
> >> On Tue, 7 Sep 2021 18:37:20 +0200, Jean Delvare wrote:
> >>> More generally, I am worried about the overall design. The driver
> >>> originally used per-access I/O port requesting because keeping the I/O
> >>> ports busy all the time would prevent other drivers from working. Do =
we
> >>> still need to do the same with the new code? If it is possible and sa=
fe
> >>> to have a permanent mapping to the memory ports, that would be a lot
> >>> faster.
> >>>
> >=20
> > Permanent mapping would likely improve performance but will not provide=
 the
> > needed synchronization. As you mentioned below the sp5100 driver only u=
ses
> > the DECODEEN register during initialization but the access must be
> > synchronized or an i2c transaction or sp5100_tco timer enable access ma=
y be
> > lost. I considered alternatives but most lead to driver coupling or con=
siderable
> > complexity.
> >=20
> >>> On the other hand, the read-modify-write cycle in
> >>> piix4_setup_sb800_smba() is unsafe if 2 drivers can actually call
> >>> request_mem_region() on the same memory area successfully.
> >>>
> >>> I'm not opposed to taking your patch with minimal changes (as long as
> >>> the code is safe) and working on performance improvements later.
> >>
> >=20
> > I confirmed through testing the request_mem_region() and request_muxed_=
region()=20
> > macros provide exclusive locking. One difference between the 2 macros i=
s the=20
> > flag parameter, IORESOURCE_MUXED. request_muxed_region() uses the=20
> > IORESOURCE_MUXED flag to retry the region lock if it's already locked.=
=20
> > request_mem_region() does not use the IORESOURCE_MUXED and as a result =
will=20
> > return -EBUSY immediately if the region is already locked.
> >=20
> > I must clarify: the piix4_smbus v1 patch uses request_mem_region() whic=
h is not=20
> > correct because it doesn't retry locking an already locked region.  The=
 driver=20
> > must support retrying the lock or piix4_smbus and sp5100_tco drivers ma=
y=20
> > potentially fail loading. I added proposed piix4_smbus v2 changes below=
 to solve.
> >=20
> > I propose reusing the existing request_*() framework from include/linux=
/ioport.h=20
> > and kernel/resource.c. A new helper macro will be required to provide a=
n=20
> > interface to the "muxed" iomem locking functionality already present in=
=20
> > kernel/resource.c. The new macro will be similar to request_muxed_regio=
n()=20
> > but will instead operate on iomem. This should provide the same perform=
ance=20
> > while using the existing framework.
> >=20
> > My plan is to add the following to include/linux/ioport.h in v2. This m=
acro
> > will add the interface for using "muxed" iomem support:
> > #define request_mem_muxed_region(start,n,name)  __request_region(&iomem=
_resource, (start), (n), (name), IORESOURCE_MUXED)
> >=20
> > The proposed changes will need review from more than one subsystem main=
tainer.
> > The macro addition in include/linux/ioport.h would reside in a
> > different maintainer's tree than this driver. The change to use the
> > request_mem_muxed_region() macro will also be made to the sp5100_tco dr=
iver.
> > The v2 review will include maintainers from subsystems owning piix4_smb=
us
> > driver, sp5100_tco driver, and include/linux/ioport.h.
> >=20
> > The details provided above are described in a piix4_smbus context but w=
ould also be=20
> > applied to the sp5100_tco driver for synchronizing the shared register.
> >=20
> > Jean and Guenter, do you have concerns or changes you prefer to the pro=
posal I=20
> > described above?=20
> >=20
> >> I looked some more at the code. I was thinking that maybe if the
> >> registers accessed by the two drivers (i2c-piix4 and sp5100_tco) were
> >> disjoint, then each driver could simply request subsets of the mapped
> >> memory.
> >>
> >> Unfortunately, while most registers are indeed exclusively used by one
> >> of the drivers, there's one register (0x00 =3D IsaDecode) which is used
> >> by both. So this simple approach isn't possible.
> >>
> >> That being said, the register in question is only accessed at device
> >> initialization time (on the sp5100_tco side, that's in function
> >> sp5100_tco_setupdevice) and only for some devices (Embedded FCH). So
> >> one approach which may work is to let the i2c-piix4 driver instantiate
> >> the watchdog platform device in that case, instead of having sp5100_tco
> >> instantiate its own device as is currently the case. That way, the
> >> i2c-piix4 driver would request the "shared" memory area, perform the
> >> initialization steps for both functions (SMBus and watchdog) and then
> >> instantiate the watchdog device so that sp5100_tco gets loaded and goes
> >> on with the runtime management of the watchdog device.
> >>
> >> If I'm not mistaken, this is what the i2c-i801 driver is already doing
> >> for the watchdog device in all recent Intel chipsets. So maybe the same
> >> approach can work for the i2c-piix4 driver for the AMD chipsets.
> >> However I must confess that I did not try to do it nor am I familiar
> >> with the sp5100_tco driver details, so maybe it's not possible for some
> >> reason.
> >>
> >> If it's not possible then the only safe approach would be to migrate
> >> i2c-piix4 and sp5100_tco to a true MFD setup with 3 separate drivers:
> >> one new MFD PCI driver binding to the PCI device, providing access to
> >> the registers with proper locking, and instantiating the platform
> >> device, one driver for SMBus (basically i2c-piix4 converted to a
> >> platform driver and relying on the MFD driver for register access) and
> >> one driver for the watchdog (basically sp5100_tco converted to a
> >> platform driver and relying on the MFD driver for register access).
> >> That's a much larger change though, so I suppose we'd try avoid it if
> >> at all possible.
> >>

--Eh9MfQE45o/Uiuok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHW6DwACgkQFA3kzBSg
KbYzyhAAoB3SHOX6Lh2+C531BbbbygZuEIxnHA8MZ0NvWuszGm7XxirjS3UdIVfO
7aPcG1MM6oS4flLoKI2L2+v15bkbBzBd6qj1U+vRrb8jeC7Fv1d4swPp0x3cM+kJ
iU89s9jXXYzTa57g28b7O/MAa8NI2dmJOql0DdEgt722nm+P3beXEH5/1TILtFLG
szBzNEYgkhYp9ZyIOB4VIzdTL+H8PXklQUyid0MjygM/L018ydd6RBNiT2w6Oup6
HEGCQk07Eop0a6rv4MbOhbm4EBwyFRyAORUd1CNswrDjmVqKZjxBbTVqzkjaZTd9
Kmy8g/zPj0yAiR/d+5FT+f/rjUbALeSlhW0bsDJ2dqbsgrHtHVXGzImfFx/5eaNR
XZvaUUX0VY1+O6DwfSmKaaplnVslUOKw9LAtmwMtfjNUij6JszV34oLuXHQlZKOK
FrCmNrcMOjKYzkotfWsZ81iQtt7BeBLYnFnvgmbrUOKbVPMp5TA+XUOijRKvc07B
c6m5M5gZ52MzmPddZOSd55WpoCji3/2c5fEZG5Eey+ZE3lVy6xk9YlStbH3V/06k
9GlNqhap/wUhOtOstQg+OBnXDpQBGKEJyIpcOBuCxx4mRxkfvP/EgI2f56mRFxwD
SFQlfpUtZZXeKEpTdcQILxhpoe65Dg5x6UCQrJPoFUY4I3QlBqQ=
=HPYN
-----END PGP SIGNATURE-----

--Eh9MfQE45o/Uiuok--
