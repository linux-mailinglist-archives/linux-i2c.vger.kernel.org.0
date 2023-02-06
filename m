Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAF768C5F6
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 19:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjBFSjl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 13:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjBFSjk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 13:39:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BDC2ED64
        for <linux-i2c@vger.kernel.org>; Mon,  6 Feb 2023 10:39:33 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pP6Op-0006cv-QR; Mon, 06 Feb 2023 19:39:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pP6On-0037UJ-VE; Mon, 06 Feb 2023 19:39:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pP6Oo-001MHG-8Z; Mon, 06 Feb 2023 19:39:30 +0100
Date:   Mon, 6 Feb 2023 19:39:30 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <20230206183930.sipw62it7xmx6nkt@pengutronix.de>
References: <20230118134940.240102-1-brgl@bgdev.pl>
 <Y9DpbChLZfDONHPz@ninjato>
 <Y9GpL9RBNM8H2ZSL@shikoro>
 <20230206155107.qwf5tbrqsbvv4hln@pengutronix.de>
 <CAMRc=Mdz_+_MDJAjkXWa2P8FM8i6XPMAVQ-xTUtZDXfD-RBo_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qc7dorfog3znw3nz"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdz_+_MDJAjkXWa2P8FM8i6XPMAVQ-xTUtZDXfD-RBo_w@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URI_DOTEDU autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qc7dorfog3znw3nz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bartosz,

On Mon, Feb 06, 2023 at 07:01:11PM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 6, 2023 at 4:51 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > ah, this is the mail I missed before.
> >
> > On Wed, Jan 25, 2023 at 11:11:59PM +0100, Wolfram Sang wrote:
> > >
> > > > So, this code handled all my stress-testing well so far. I'll try to
> > > > think of some more ideas until this evening, but likely I will appl=
y it
> > > > later. Nonetheless, more review eyes are still welcome!
> > >
> > > Ah yes, I now recalled why I had the gut feeling that this solution is
> > > not complete. See this mail thread from 2015:
> > >
> > > https://lkml.iu.edu/hypermail/linux/kernel/1501.2/01700.html
> > >
> > > There are still drivers using i2c_del_adapter()+kfree(), so removing =
the
> > > completion could cause use-after-free there, or?
> >
> > There is also a strange construct in spi that I understand at one point
> > in time, but I failed to swap it in quickly. It's about commit
> > 794aaf01444d4e765e2b067cba01cc69c1c68ed9. I think there should be a
> > nicer solution than to track if the controller was allocated using devm,
> > but I don't remember the details. But before addressing the i2c problem
> > it might be worth to invest some time into that spi issue to not make
> > the same mistake for i2c.
>=20
> Yeah, I've seen these constructs before elsewhere... Sadly, we have
> workarounds upon workarounds within workarounds chased by other
> workarounds due to this issue.

Another pointer: Some time ago I did to the counter framework what would
be needed here for i2c. See
https://lore.kernel.org/all/20211230150300.72196-1-u.kleine-koenig@pengutro=
nix.de/.
This was applied in commit f2ee4759fb700b32a1bd830960fe86bf6bdfd0ab and
its parents.

Maybe it can serve as a template for i2c.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qc7dorfog3znw3nz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPhSV8ACgkQwfwUeK3K
7Aka2QgAn+gAHTQ5MLO3HpHfAiBq1stJZADDOy6EEM/kmPrdLuHMcH7LAXOSGgu5
IUEBWnfWTaTHKRbtjyd7CVJ5cXH/6+XQ2qBY+SKC9Kj2Eao5VP3ouhqGKtQD3ezf
NWYAXPaeY9vIiNIW6drt5LRYnnbdAiMZDal/5hbnw2DyK69sOq61ovQoJJcAhMvt
1QIRfN8P6JEGmT91f+/vbw23KpGl7dVpVBPMMvCOoet2iWHt8EKxSiCLQAonC0mg
jb+Xid9GYeXuBY0JApBFR4yMbpt7NBOs3oAWyw0y6x0DRLMSR1O0VPQMb67UHTME
XJtcZ8RTqNVL+zNiuXza677zjlfdRg==
=eUGB
-----END PGP SIGNATURE-----

--qc7dorfog3znw3nz--
