Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1BB271EA1
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgIUJMo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:12:44 -0400
Received: from sauhun.de ([88.99.104.3]:50954 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgIUJMn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:12:43 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        by pokefinder.org (Postfix) with ESMTPSA id E1C8F2C0505;
        Mon, 21 Sep 2020 11:12:40 +0200 (CEST)
Date:   Mon, 21 Sep 2020 11:12:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/34] Improvements for Tegra I2C driver
Message-ID: <20200921091239.GD1840@ninjato>
References: <20200908224006.25636-1-digetx@gmail.com>
 <CAHp75Vdh6bErqeO-ki2xsS9jEeoy4mKF1h0Jw_HM6UpukqH_BQ@mail.gmail.com>
 <854a0ed8-35dd-0b25-6c53-4915be0e33e9@gmail.com>
 <20200909154902.GA916@kunai>
 <20200917124418.GU3515672@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Content-Disposition: inline
In-Reply-To: <20200917124418.GU3515672@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 02:44:18PM +0200, Thierry Reding wrote:
> On Wed, Sep 09, 2020 at 05:49:02PM +0200, Wolfram Sang wrote:
> > On Wed, Sep 09, 2020 at 06:36:50PM +0300, Dmitry Osipenko wrote:
> > > 09.09.2020 12:11, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > On Wed, Sep 9, 2020 at 1:40 AM Dmitry Osipenko <digetx@gmail.com> w=
rote:
> > > >>
> > > >> Hello!
> > > >>
> > > >> This series performs refactoring of the Tegra I2C driver code and =
hardens
> > > >> the atomic-transfer mode.
> > > >=20
> > > > I think there is still room for improvement, but let not block it, =
FWIW,
> > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > >=20
> > > Thank you and Micha=C5=82 for helping with the review! Very appreciat=
e this!
> >=20
> > Yes, thanks everyone so far!
> >=20
> > Is there some internal testfarm where this should be regression tested?
> > Otherwise, I'd trust Dmitry, Andy, and Micha=C5=82 here and would apply=
 it
> > this week after some generic high-level review.
>=20
> I'll queue this for a run on the test farm. I had a couple of minor
> comments, but after going through the full series I'm pretty happy
> overall with the result, so I'll go over my comments again and will
> reevaluate.

Cool, thanks! You guys just let me know if v7 is fine please. Otherwise
I will surely notice if a v8 hits the list ;)


--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9obocACgkQFA3kzBSg
KbayEQ/9GE4R7RHuTRmxdHMw3BDUAbBK4rUVkdbXlK2OurNJppa3fn8uNm90duoR
hHd3E00Qp23SoLz49m/33eG9g5m++qEzAByQWdEijHofXiAY3rkQ/tbD6oaBZLFn
jUqz52z6eqcHbUOdGkI+RjQ9/drvT/G5p/l1kIMX/U8MDDbAd3vTGvypCK75X6pj
gSkKPa2f8jH47JJPd93GIg+byghzWTHoQY7K9ia3j7pzC9jiOO1xqE5RAJGqIdwA
yIih5PhllKu7f6GXV31Ec7sWg4AEb685G8JJfqKL7uFykj5eC2zr+BECjCCCs0Hr
lGZvkW7uFS6klPNAoDOU4JxA+fcf66nvMmHodsN5ckrF89N+uZK9GV4jS3pwPs8G
0D19Xt4EqSG/BuFcBjUN2dR/H1SkHZV6mYi4l+r4rrKRKoawRH7EYgK8qv9dvkyy
ZNq4UPDNuKCU4Pj6dFERsVTZYPQcBE8fPIAsh/huZEkI+9nIA4ZorJkG6FqGD2O6
oikU8+MjV8gooVIQTZEFncqcKtH3kfyT3l15Wv6KkPRx9Ua07x+s1p9KfsFsBbmh
kfPa/10ovLSECUAFDTd35f5lP3zXxL35XvXSoltVTKr9HnaLDXqcihuWyJgFjuBB
7nVH1jxCCqMrD1egO9lanrxj7w5R2XzD8T+nPwbyIVwdRBHUIus=
=gFo1
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--
