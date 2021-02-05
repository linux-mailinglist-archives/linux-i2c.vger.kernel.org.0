Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B5B3116DA
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Feb 2021 00:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhBEXRB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 18:17:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbhBEK6s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 05:58:48 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBBAC06178C
        for <linux-i2c@vger.kernel.org>; Fri,  5 Feb 2021 02:58:08 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l7ymj-00035C-2Q; Fri, 05 Feb 2021 11:56:21 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l7ymd-0004Fb-NN; Fri, 05 Feb 2021 11:56:15 +0100
Date:   Fri, 5 Feb 2021 11:56:15 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-fbdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
        kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
        Eric Anholt <eric@anholt.net>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig.org@pengutronix.de>, linux-i2c@vger.kernel.org,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-rtc@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mike Leach <mike.leach@linaro.org>,
        linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        Vladimir Zapolskiy <vz@mleia.com>,
        Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-mmc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210205105615.qumu45huvntf2v4j@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
 <YBwnUrQqlAz2LDPI@kroah.com>
 <20210204165951.GB1463@shell.armlinux.org.uk>
 <20210204181551.ethtuzm65flujmwe@pengutronix.de>
 <20210205093744.kr4rc7yvfiq6wimq@pengutronix.de>
 <YB0baUzgvpd+EoO6@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vslstwmibba5nymi"
Content-Disposition: inline
In-Reply-To: <YB0baUzgvpd+EoO6@kroah.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vslstwmibba5nymi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 11:18:17AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Feb 05, 2021 at 10:37:44AM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello Russell, hello Greg,
> >=20
> > On Thu, Feb 04, 2021 at 07:15:51PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Thu, Feb 04, 2021 at 04:59:51PM +0000, Russell King - ARM Linux ad=
min wrote:
> > > > On Thu, Feb 04, 2021 at 05:56:50PM +0100, Greg Kroah-Hartman wrote:
> > > > > On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linu=
x admin wrote:
> > > > > > On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wr=
ote:
> > > > > > > I'm glad to take this through my char/misc tree, as that's wh=
ere the
> > > > > > > other coresight changes flow through.  So if no one else obje=
cts, I will
> > > > > > > do so...
> > > > > >=20
> > > > > > Greg, did you end up pulling this after all? If not, Uwe produc=
ed a v2.
> > > > > > I haven't merged v2 yet as I don't know what you've done.
> > > > >=20
> > > > > I thought you merged this?
> > > >=20
> > > > I took v1, and put it in a branch I've promised in the past not to
> > > > rebase/rewind. Uwe is now asking for me to take a v2 or apply a pat=
ch
> > > > on top.
> > > >=20
> > > > The only reason to produce an "immutable" branch is if it's the bas=
is
> > > > for some dependent work and you need that branch merged into other
> > > > people's trees... so the whole "lets produce a v2" is really odd
> > > > workflow... I'm confused about what I should do, and who has to be
> > > > informed which option I take.
> > > >=20
> > > > I'm rather lost here too.
> > >=20
> > > Sorry to have cause this confusion. After I saw that my initial tag
> > > missed to adapt a driver I wanted to make it easy for you to fix the
> > > situation.
> > > So I created a patch to fix it and created a second tag with the patch
> > > squashed in. Obviously only one of them have to be picked and I hoped
> > > you (=3D Russell + Greg) would agree which option to pick.
> > >=20
> > > My preference would be if you both pick up v2 of the tag to yield a
> > > history that is bisectable without build problems, but if Russell (who
> > > already picked up the broken tag) considers his tree immutable and so
> > > isn't willing to rebase, then picking up the patch is the way to go.
> >=20
> > OK, the current state is that Russell applied the patch fixing
> > drivers/mailbox/arm_mhuv2.c on top of merging my first tag.
> >=20
> > So the way forward now is that Greg pulls
> >=20
> > 	git://git.armlinux.org.uk/~rmk/linux-arm.git devel-stable
> >=20
> > which currently points to=20
> >=20
> > 	860660fd829e ("ARM: 9055/1: mailbox: arm_mhuv2: make remove callback r=
eturn void")
> >=20
> > , into his tree that contains the hwtracing changes that conflict with =
my
> > changes. @Greg: Is this good enough, or do you require a dedicated tag
> > to pull that?
> >=20
> > I think these conflicting hwtracing changes are not yet in any of Greg's
> > trees (at least they are not in next).
> >=20
> > When I pull
> >=20
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git ne=
xt
> >=20
> > (currently pointing to 4e73ff249184 ("coresight: etm4x: Handle accesses
> > to TRCSTALLCTLR")) into 860660fd829e, I get a conflict in
> > drivers/hwtracing/coresight/coresight-etm4x-core.c as expected. My
> > resolution looks as follows:
>=20
> Ok, my resolution looked a bit different.
>=20
> Can you pull my char-misc-testing branch and verify I got this all
> pulled in correctly?

minor side-note: mentioning the repo url would have simplified that test.

I looked at

	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-=
misc-testing

commit 0573d3fa48640f0fa6b105ff92dcb02b94d6c1ab now.

I didn't compile test, but I'm willing to bet your resolution is wrong.
You have no return statement in etm4_remove_dev() but its return type is
int and etm4_remove_amba() still returns int but should return void.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vslstwmibba5nymi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAdJEwACgkQwfwUeK3K
7AkhPggAk0ucNSGkkTWYbQF9BBYOZDKVlqvPHzvkMilvBGuAa1EXhuHHKu3esHxh
NZf5xH5Lh7cnNyXodWF4Mp20NZfV0VFjzhbfNFexDfO2QfKJhJbATh9YiJ5onzsT
cbMDvw+fQNUmooGN1gOW4OCiRvEPcYf8Z/TdrAkBXuRDaCYLiqJBPX1PCFTumEr3
8Lxp3+k4zN9Wpkt17sqmgJxalvUHqNFOuL+1II2APrzMSZHB6T5fNtxEzMXUGXHx
LzNGWjnnUKovRddHUyjFZu+rr6B/MUELKSYf9WH7lPI6osLnyjQf6vtczDdyZmlP
PmCOMN9d1QJAKEMe6RJZvyfO22d11w==
=kmsA
-----END PGP SIGNATURE-----

--vslstwmibba5nymi--
