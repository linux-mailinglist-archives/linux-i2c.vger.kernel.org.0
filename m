Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40CB630FB41
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Feb 2021 19:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239032AbhBDSWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Feb 2021 13:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238998AbhBDSUd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Feb 2021 13:20:33 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AB8C061794
        for <linux-i2c@vger.kernel.org>; Thu,  4 Feb 2021 10:19:53 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l7jAm-0002WQ-TD; Thu, 04 Feb 2021 19:16:08 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l7jAV-0005Pi-Pr; Thu, 04 Feb 2021 19:15:51 +0100
Date:   Thu, 4 Feb 2021 19:15:51 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-fbdev@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>, kvm@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
        Jaroslav Kysela <perex@perex.cz>,
        Eric Anholt <eric@anholt.net>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig.org@pengutronix.de>, linux-i2c@vger.kernel.org,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-rtc@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mike Leach <mike.leach@linaro.org>,
        linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
        Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-crypto@vger.kernel.org, kernel@pengutronix.de,
        Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210204181551.ethtuzm65flujmwe@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
 <YBwnUrQqlAz2LDPI@kroah.com>
 <20210204165951.GB1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mw66hszyvu2hxhxe"
Content-Disposition: inline
In-Reply-To: <20210204165951.GB1463@shell.armlinux.org.uk>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mw66hszyvu2hxhxe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 04:59:51PM +0000, Russell King - ARM Linux admin wr=
ote:
> On Thu, Feb 04, 2021 at 05:56:50PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linux admi=
n wrote:
> > > On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wrote:
> > > > I'm glad to take this through my char/misc tree, as that's where the
> > > > other coresight changes flow through.  So if no one else objects, I=
 will
> > > > do so...
> > >=20
> > > Greg, did you end up pulling this after all? If not, Uwe produced a v=
2.
> > > I haven't merged v2 yet as I don't know what you've done.
> >=20
> > I thought you merged this?
>=20
> I took v1, and put it in a branch I've promised in the past not to
> rebase/rewind. Uwe is now asking for me to take a v2 or apply a patch
> on top.
>=20
> The only reason to produce an "immutable" branch is if it's the basis
> for some dependent work and you need that branch merged into other
> people's trees... so the whole "lets produce a v2" is really odd
> workflow... I'm confused about what I should do, and who has to be
> informed which option I take.
>=20
> I'm rather lost here too.

Sorry to have cause this confusion. After I saw that my initial tag
missed to adapt a driver I wanted to make it easy for you to fix the
situation.
So I created a patch to fix it and created a second tag with the patch
squashed in. Obviously only one of them have to be picked and I hoped
you (=3D Russell + Greg) would agree which option to pick.

My preference would be if you both pick up v2 of the tag to yield a
history that is bisectable without build problems, but if Russell (who
already picked up the broken tag) considers his tree immutable and so
isn't willing to rebase, then picking up the patch is the way to go.

I suggest that Russell descides which option he wants to pick and tells
Greg to do the same!?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mw66hszyvu2hxhxe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAcOdQACgkQwfwUeK3K
7AlatwgAoTySm2q5g+gxl/CCA9C6tYko2Pu8wLkL3YfNBIgf05iOJ9G8Miwhd95G
eDv5Ue6LEvHVOMZHbbZMliKzacCtSGzzhTpNpIcL7SZH/Vu0nyB8qGbN+PAm+rsX
K54DEaOvyPIcDUkuXgUGC2e0nXjg7499oDQs/rajEADbs8ECpDvKCTRYczmQ6E8v
VS9a/GOt/WDa0dqOdAt6OfxirahLKjPQC1/FS1kcREk1QBYbH6TqM/t8b4t0ED9p
A5RYkSHAXArD/ifkinbRDUIhLY7XzhBYGEiiNgwCCtsbHE06GP/BNPlXMj6+fLAY
g/wGBoyP1j9OrCrpGDnsy/oyv64XRg==
=Rv8c
-----END PGP SIGNATURE-----

--mw66hszyvu2hxhxe--
