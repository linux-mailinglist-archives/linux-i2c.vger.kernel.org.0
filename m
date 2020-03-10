Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9117E17F3AB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 10:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgCJJbk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 05:31:40 -0400
Received: from sauhun.de ([88.99.104.3]:46550 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbgCJJbk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 05:31:40 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id 4D28D2C1EB6;
        Tue, 10 Mar 2020 10:31:37 +0100 (CET)
Date:   Tue, 10 Mar 2020 10:31:36 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: i801: Do not add ICH_RES_IO_SMI for the
 iTCO_wdt device
Message-ID: <20200310093136.GE1987@ninjato>
References: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
 <20200226132122.62805-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Content-Disposition: inline
In-Reply-To: <20200226132122.62805-4-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 04:21:22PM +0300, Mika Westerberg wrote:
> Martin noticed that nct6775 driver does not load properly on his system
> in v5.4+ kernels. The issue was bisected to commit b84398d6d7f9 ("i2c:
> i801: Use iTCO version 6 in Cannon Lake PCH and beyond") but it is
> likely not the culprit because the faulty code has been in the driver
> already since commit 9424693035a5 ("i2c: i801: Create iTCO device on
> newer Intel PCHs"). So more likely some commit that added PCI IDs of
> recent chipsets made the driver to create the iTCO_wdt device on Martins
> system.
>=20
> The issue was debugged to be PCI configuration access to the PMC device
> that is not present. This returns all 1's when read and this caused the
> iTCO_wdt driver to accidentally request resourses used by nct6775.
>=20
> It turns out that the SMI resource is only required for some ancient
> systems, not the ones supported by this driver. For this reason do not
> populate the SMI resource at all and drop all the related code. The
> driver now always populates the main I/O resource and only in case of SPT
> (Intel Sunrisepoint) compatible devices it adds another resource for the
> NO_REBOOT bit. These two resources are of different types so
> platform_get_resource() used by the iTCO_wdt driver continues to find
> the both resources at index 0.
>=20
> Link: https://lore.kernel.org/linux-hwmon/CAM1AHpQ4196tyD=3DHhBu-2donSsuo=
gabkfP03v1YF26Q7_BgvgA@mail.gmail.com/
> Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
> Reported-by: Martin Volf <martin.volf.42@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I added a comment saying that the whole series is needed for a complete
fix. Dunno if there is a better way to express such dependencies for
stable.

Applied to for-current, thanks!


--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nXngACgkQFA3kzBSg
KbZU4w/8DWEsX3sB25IkWCiHMd+k6Xdt9pibradFLjnIPS2iR7fCa2RdyBkB3pQj
Woql9oxCJX7yrncKky7XaFYalUhAcSiFg/Li8gDQ+p+ilszMrU4bS+9nYCl+MAel
RXxSmIv7gbdiTewYewssmh8ttNeDkbx96EoIxcyIKMPMNHOITfkcsDihwWTI+grg
00GwjQafODS2Iyuoy9vZW0dgbBWMXfeZWG2Yk7nQS5QI5Mb4N4s6KwN7aVS6EJCz
VsHrvzmyyRLd8//LhOGbV2JGsHIwkrp9j5snGRWumXYqWZKpaboXMf1G0xx1ZbU4
M8qn1R/LaiJa6Lmk+J8Xv/eVEeBBNY4C3ljGw0n8Yut2dmGWUxLZ7Bu5QXM1wUeg
etlA+NmfABg83PhtLQyImtrmvBuQ/SQGHoA7MZB9wDqBdg3E+mK9fjAGFKXmfED0
Hjhh+xZrg61RS3oP68SPqcWJVXi2S5BYNzL3132ub5iYuhmdeu9ZXhI34ImwCob9
ZKxG14azyq/LIPf5IV3aZ3hu+B2kmb9EbL8FWMP5sjk+gI72WdF+Ff84h5OOPyi7
nyzBUTJDJtacPraxurwQ9elA9cNVjo0iawcTUM/bhD2S/ucfDezKtKEOD0WO/5rQ
tx7qPcWlol8eGOaFT3SbuJtW2gbNoeHrI3UkpSxHqxg/II5FWJQ=
=0FFd
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--
