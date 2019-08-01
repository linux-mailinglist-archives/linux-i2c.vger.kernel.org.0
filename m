Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 969547DAF1
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 14:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbfHAMIm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 08:08:42 -0400
Received: from sauhun.de ([88.99.104.3]:52170 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728129AbfHAMIm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 08:08:42 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id B05342C2817;
        Thu,  1 Aug 2019 14:08:39 +0200 (CEST)
Date:   Thu, 1 Aug 2019 14:08:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drivers: Introduce device lookup variants by
 ACPI_COMPANION device
Message-ID: <20190801120830.GA1659@ninjato>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-6-suzuki.poulose@arm.com>
 <20190726202353.GA963@kunai>
 <20190801115856.GS23480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20190801115856.GS23480@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2019 at 02:58:56PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 26, 2019 at 10:23:54PM +0200, Wolfram Sang wrote:
> > On Tue, Jul 23, 2019 at 11:18:36PM +0100, Suzuki K Poulose wrote:
> > > Add a generic helper to match a device by the ACPI_COMPANION device
> > > and provide wrappers for the device lookup APIs.
> > >=20
> > > Cc: Len Brown <lenb@kernel.org>
> > > Cc: linux-acpi@vger.kernel.org
> > > Cc: linux-spi@vger.kernel.org
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > Cc: Wolfram Sang <wsa@the-dreams.de>
> > > Cc: linux-i2c@vger.kernel.org
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> >=20
> > From my side, OK:
> >=20
> > Acked-by: Wolfram Sang <wsa@the-dreams.de> # I2C parts
> >=20
> > yet you missed to cc the I2C ACPI maintainers. Done so now.
>=20
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Thanks, Wolfram, for notifying.

Sure. There seems to be a problem, though? Please check:

[PATCH 1/3] i2c: Revert incorrect conversion to use generic helper

which came in today.


--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C1joACgkQFA3kzBSg
KbbX9w//ahSM//xepZXO66KqHlHww6eDykCIoj3oQpGcr21WoXQ5yAdv72yYXQtq
rl7XeSaJ8Iv2ssC0wmeBfJeChcltWVeiQ3pMr9j6iKLEAcqkjzEBqS3V1jbs4mkE
ozU97VeC3SqzksBRLDE3Ff4tRm4I5hH5JomEjPFX5Vbilf4XrD2BFFCT8Mq1C068
lxX4PtvnkYkmjY3OC0brXw//i5IIo5ht66ilLow4Lto63tGqyAzxvrgEQeG5HT9D
zzel4ygQxoTJLefLD9Vm1NdjIfcDSA0BUEe6zyaKfUS/P1E+tQS3oqgLuInor5zf
jXmcw6LwlYDn7S4A+8vkGrn6fhgY4zBBN5qOZz9yNOb3d83ifyiPZ1TiGnXuE5U4
ROK5OCrgCrIUB3QuDUQGNFet3j3WpUh4HObje5YOyh2Rb3snk8cx+uCMwWjg2v+d
hMgoaegs+wjORIZ5p+db7XbdIiWwpxG86N80mKvoxzQHik9wkDDBfczv2BGK2hsA
Zw8PJalgcGhHfaSZuuADyrOvr6Gg6s7pEi9BlpF7/6JrAZ+a7zTIE4+IShwsG8vu
UaDL7UBoY5JVzvgbAt98C1DKaaQolC2ccLv6HOKgeNoXuA0RLOQj7A47tkHEHuEq
O8vqYaYJOZPGdN2Kx94xvpmwsAR2hFLvGuuHqW6V9LqCBP18meY=
=wX+k
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
