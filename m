Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6312630EF
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 17:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbgIIPtk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 11:49:40 -0400
Received: from sauhun.de ([88.99.104.3]:50122 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730187AbgIIPtW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 11:49:22 -0400
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
        by pokefinder.org (Postfix) with ESMTPSA id 584A92C082B;
        Wed,  9 Sep 2020 17:49:05 +0200 (CEST)
Date:   Wed, 9 Sep 2020 17:49:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/34] Improvements for Tegra I2C driver
Message-ID: <20200909154902.GA916@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>, linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200908224006.25636-1-digetx@gmail.com>
 <CAHp75Vdh6bErqeO-ki2xsS9jEeoy4mKF1h0Jw_HM6UpukqH_BQ@mail.gmail.com>
 <854a0ed8-35dd-0b25-6c53-4915be0e33e9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <854a0ed8-35dd-0b25-6c53-4915be0e33e9@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 06:36:50PM +0300, Dmitry Osipenko wrote:
> 09.09.2020 12:11, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 9, 2020 at 1:40 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> >>
> >> Hello!
> >>
> >> This series performs refactoring of the Tegra I2C driver code and hard=
ens
> >> the atomic-transfer mode.
> >=20
> > I think there is still room for improvement, but let not block it, FWIW,
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>=20
> Thank you and Micha=C5=82 for helping with the review! Very appreciate th=
is!

Yes, thanks everyone so far!

Is there some internal testfarm where this should be regression tested?
Otherwise, I'd trust Dmitry, Andy, and Micha=C5=82 here and would apply it
this week after some generic high-level review.


--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Y+WoACgkQFA3kzBSg
KbYhUg//dp6m9B+pSWdeinWM7HM7oTSzKB+tjzuCz29yuhxYd4foiCYNTU6viTaH
QL538Q+1El/Vhd4BbUKLtUHZ3gdjVfLJqDROUn9w67trlwFGz++c9KP8B2DuiZAF
bgaf56yQfyjuHOTD1B3MMQXCcazfbYVoUFnYlwgpHYa/Ma/CI1pJFp5mt1VieWtE
XqhzCJaoNUjHGxakTWwFPet2lX0RvpaaumKJQvkSO1bNY1r1+fsIOWI4injEE8W8
0rjP4Tvf3ACzKZ1L6xnTmT2+d2Y2SyK1wlaa2T6erznL7K/0lp36BhE6z/o4uXZ4
WrBiuONIvNbMPQVt58IXQ7/7ODoO+tXxRQoGe8KL/CsUvo6WTzfb+Ji9JRyshndS
cRSjp0nsEHjGVYVY+LhI6BrwSaqKZJg1hpbdbRkw6Lqj1H7eHCzrATce0w4AFJIa
xRXOWz1KrtrVm62yi28iuZ0cpL0L1zDTNCB3haS94/JWYHRKMuXYyPqlNUDkIhHD
NRATRfQX01adeiYoYay4SEPi2ygGzmlAl4Y1EUnMi71NNAe+3RyZFfHWQVLPzKwB
DU7NEGcTetrFvDm3/0Ne3cgVHMsGtEjDOFQGg7WmaHGgHeFUhYHxo6UbzA/96YwW
X3AKfaWv7ijuvDYX0cK522QWtUrhy+g4fXyD7ELj7Cg/2unQSkk=
=+bLv
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
