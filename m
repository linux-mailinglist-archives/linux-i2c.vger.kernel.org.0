Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31643B5B31
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 11:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbhF1J1w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 05:27:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:54594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231935AbhF1J1w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Jun 2021 05:27:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0588D619C5;
        Mon, 28 Jun 2021 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624872326;
        bh=9hbXiUBY42wqyZ3S+XRFsdzel0Y/SaiNH6aUIjDnuho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R1UxvH8Ljh47e19eRa80RrR8cxqF/rigIm/CiFK/OEOOM7LMyJmoayTcMuCqVNzXV
         8UMPk6y/649xcrsfg/OSTdwkAxs9EowfBuV6Kb5XAIuzUJsankjrk9JnnEVfVdp7Nx
         BoXikdrO7XbY+0L4bgBzrwRwHXKsYXSRrwzeHGkywQ2StzJZqU7C4wVVmZ+OXX9Wph
         FsNSjsCLmoMZGAc2eoVPdtZTuxAd6WyMTR5aH29+zfTXOWRHqmTWDFT4nClSy/H7Eb
         E9vPPZzEf1uv2sJtBFXf7p0Eak8tYDgQ/j4C7OSS3gcNyY22PxHH4lBPZpDzrUbri2
         QNPU7vXmoV0dw==
Date:   Mon, 28 Jun 2021 11:25:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNmVg3ZhshshlbSx@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, yu1.wang@intel.com,
        shuo.a.liu@intel.com, Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato>
 <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TV29oUdJ9vn7foA0"
Content-Disposition: inline
In-Reply-To: <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TV29oUdJ9vn7foA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

> You probably know this already, but just in case for clarification
> these are two different things:

Ah, yes. I mistyped VFIO. Shows that I am not really fluent with these
terms. But as I spoke of paravirtualized later, I think I meant the
right thing.

>=20
> > I2C transactions can have an arbitrary number of messages which can
> > arbitrarily be read or write. As I understand the above, only one read,
> > write or read-write transaction is supported. If that is the case, it
> > would be not very much I2C but more SMBus. If my assumptions are true,
> > we first need to decide if you want to go the I2C way or SMBus subset.
>=20
> This has come up in previous reviews already. I think it comes down
> to the requirement that the virtio i2c protocol should allow passthrough
> access to any client devices connected to a physical i2c bus on the host,
> and this should ideally be independent of whether the host driver
> exposes I2C_RDWR or I2C_SMBUS ioctl interface, or both.

If a host driver supports I2C_RDWR (i.e. I2C bus transactions) it will
support I2C_SMBUS (i.e. SMBus transactions), too. It can be emulated and
host drivers just need to set I2C_FUNC_SMBUS_EMUL. With the notable
excaption of zero length transfers. Some cannot do this, so they use
I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK).

The other way around is not possible, SMBus is a subset of I2C.

> This can be done either by having both interface types in the transport,
> or picking one of the two, and translating to the host interface type
> in software.

If you have I2C, you have SMBus as well.

> As far as I understand me (please clarify), implementing only the smbus
> subset would mean that we cannot communicate with all client devices,
> while implementing both would add more complexity than the lower-level
> protocol.

Correct. You need to pick I2C if you want to support all devices. SMBus
will give you only a lot of devices.

> > Also, as I read it, a whole bus is para-virtualized to the guest, or?
> > Wouldn't it be better to allow just specific devices on a bus? Again, I
> > am kinda new to this, so I may have overlooked things.
>=20
> Do you mean just allowing a single device per bus (as opposed to
> having multiple devices as on a real bus), or just allowing
> a particular set of client devices that can be identified using
> virtio specific configuration (as opposed to relying on device
> tree or similar for probing). Both of these are valid questions that
> have been discussed before, but that could be revisited.

I am just thinking that a physical bus on the host may have devices that
should be shared with the guest while other devices on the same bus
should not be shared (PMIC!). I'd think this is a minimal requirement
for security. I also wonder if it is possible to have a paravirtualized
bus in the guest which has multiple devices from the host sitting on
different physical busses there. But that may be the cherry on the top.

All the best,

   Wolfram


--TV29oUdJ9vn7foA0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDZlX8ACgkQFA3kzBSg
KbYr/A/+IVuQKIHTHVsGCl2H0fxYrJfQAXRabOjo1aWzaorqk3KDVJd885x4s2Dr
5ZsHDrSwe7oPCMaYH42yT1uPIatE9rS9MN8/yY6gfYK8mjqkoy4ovP4QflrTxpvH
q0gyaOwAGDgtkdC8MOPDTuMkxMebyGH4hHn6okorHub/+NRUoBWU+XV9cssQWjl3
8PccBD506kBWUaeIPwPDSqWkqxxN31sqMRNApFeP7wQrtvdT/UKjlae/cCUXPrdb
Wr+fgP4+5AlbuScXWmRig3763X2Se3aZaPQAiYVdeiYjAuaG7bFVE4YMXqdKoDZz
V+uYo3d7LNKG2O8uLt1HmYTHiF760Gv7PhTDFkBRFET829lMLhhv5h1gHEB6ZNp6
AZfR5Tju1cQeG1Mo8lVBxFWymexruM33v2wB1dZod7MVnkjwq4pBS1YSmHDfWDhV
a/mSKIeLrcRqfDGM2Qmak6jy2hgm0XqqKLrZp2thrI/+rBFE9eIj29BTAEwh7++i
PEVPSUPsaiVf88GzlS8AiGSH7HFhlnIpQxxGYPgqoviPytt4zUI1DT84g9sREAm8
j3y3skEXrTxWnbqS1qOq/HihyrMSDxFqW8Vep2YT/rw1MfxEU9pN/vymm4zYv5SJ
sBQgZiwvjcczCxW37ueZ0zFtRreCyq2x8Y38olFyL+G6mGYoSAE=
=jaDp
-----END PGP SIGNATURE-----

--TV29oUdJ9vn7foA0--
