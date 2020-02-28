Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8D7173DDD
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2020 18:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgB1RDp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Feb 2020 12:03:45 -0500
Received: from sauhun.de ([88.99.104.3]:59882 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgB1RDp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Feb 2020 12:03:45 -0500
Received: from localhost (p54B3301B.dip0.t-ipconnect.de [84.179.48.27])
        by pokefinder.org (Postfix) with ESMTPSA id D2A142C1E8B;
        Fri, 28 Feb 2020 18:03:42 +0100 (CET)
Date:   Fri, 28 Feb 2020 18:03:42 +0100
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
Subject: Re: [PATCH v2 0/3] i2c: i801: Fix iTCO_wdt resource creation if PMC
 is not present
Message-ID: <20200228170342.GC1130@ninjato>
References: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline
In-Reply-To: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 04:21:19PM +0300, Mika Westerberg wrote:
> Hi all,
>=20
> This series aims to fix the issue reported by Martin Volf [1] that preven=
ts
> the nct6775 driver from loading.
>=20
> I added Fixes tag to the last patch but not stable tag because the other
> two patches it depends are not really stable material IMO. Please let me
> know if there is a better way to organize these :)
>=20
> I tested this on Intel Whiskey Lake based system (CNL derived) and on Com=
et
> Lake-V based system (SPT derived and the iTCO_wdt still works and I can s=
ee
> the expected resources in /proc/ioports and /proc/iomem.
>=20
> The previous version of the patch series can be found here:
>=20
>   https://lore.kernel.org/linux-hwmon/20200225123802.88984-1-mika.westerb=
erg@linux.intel.com/
>=20
> Changes from the previous version:
>=20
>   * Call request_region() also for iTCO_vendorsupport
>   * Drop the core populating ICH_RES_IO_SMI completely from i2c-i801.c
>=20
> [1] https://lore.kernel.org/linux-hwmon/CAM1AHpQ4196tyD=3DHhBu-2donSsuoga=
bkfP03v1YF26Q7_BgvgA@mail.gmail.com/

I can take this series via I2C. Just wanted to let you know that I am
aiming for rc5, because I'd like to have this in linux-next for a week
to make sure we don't regress again (despite all precautions) somewhere
else.

Thanks to everyone to get this regression handled in such a concentrated
manner!


--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5ZR+4ACgkQFA3kzBSg
Kbb29A//YUY3JKyYa6plCWxNQj6H12cc6EdXrS4lOnESwx89pq9ITm98Juu/VPqe
41Y0idzm2RNeq9ez7J6lxzGfYul5TkAxex+FGirUlp5GwrtrpRq2WFptcCR66Vx3
Tx4hw4bnValX5pWvQegGpvCX0kvFvMu4/Lv47C8nCWEljm0L0j144MTgXfgzCRKb
1iElopnX9Y7c0p5SaJUmM13WjHi9Y4TloOjmeIcGjOpEcQ0YzdsPeFfuGpn17FhX
Ninbdux+DM94gWEuK6e3Xc3HAyz3zQDN9b1MR0A/0UqjoeEUspa2yvSOEOcNcDDH
KyD7No8DbVNc6n8dLmncQqf+jZ4yN2hPMy/6YaJGhjk40hJI8M1cYC3jVqj8bnYA
ItjrjV7QANSUwP+Kne2qCf5rQ10P18SJXaDd8s8cWXBmOh1Y6U9XsaDRrbfuXBO1
t0Lr6ssJZ3/RCu+X8wVMAIqgBQkhV57T0HItN8xeNhS8HpSopXank5tKVhQaUx7N
vy4E8AoTO/T/mkNdjiUFfhDCxRqUElM5V5gtYJEl+B5Bx//2f1doGMBa0A+UIOk4
oMsevqtEXyPacx7U7gaXbverDoLwppf2zNclJ9aSopCDoyHUBTjbvIw2aHQA3oyz
uvhVF1Re0owL3aqfAuXbPQtUdLMdJRELXEIa0dcwOi89leiCdmc=
=71Zy
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
