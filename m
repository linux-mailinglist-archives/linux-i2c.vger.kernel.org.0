Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B5730D457
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Feb 2021 08:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbhBCHw3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Feb 2021 02:52:29 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37795 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhBCHw1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Feb 2021 02:52:27 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l7CrV-0000mf-2a; Wed, 03 Feb 2021 08:46:05 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l7CrM-0005LW-0J; Wed, 03 Feb 2021 08:45:56 +0100
Date:   Wed, 3 Feb 2021 08:45:55 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
        Eric Anholt <eric@anholt.net>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig.org@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-rtc@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Mike Leach <mike.leach@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
        Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org,
        Matt Mackall <mpm@selenic.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-watchdog@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-mmc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-crypto@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 0/5] amba: minor fix and various cleanups
Message-ID: <20210203074555.tusulu3iqg5wgxeb@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202104915.GK1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nnu6wqtgppbbywlf"
Content-Disposition: inline
In-Reply-To: <20210202104915.GK1463@shell.armlinux.org.uk>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nnu6wqtgppbbywlf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

we already talked about this via irc, but for the record and the benefit
of others:

On Tue, Feb 02, 2021 at 10:49:15AM +0000, Russell King - ARM Linux admin wr=
ote:
> I think you need to have a 6th patch which moves the
> probe/remove/shutdown methods into the bus_type - if you're setting
> them for every struct device_driver, then there's no point doing that
> and they may as well be in the bus_type.

This is implemented in patch 5 already.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nnu6wqtgppbbywlf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAaVLAACgkQwfwUeK3K
7AlQLgf+P1DKYj6OELp8rvge2qlgjLziflPm/vmYKoER7GP62xMAt1jHBWvMgDLx
SQfCWfc7aNauEmrPFy3TDOyu3SrNFjDVRf3DfOGZ+VpYmmtyUJihjezhbbhpysK5
Pchia3IjZ0wVWPBC0mb8a1o5w1GQ7l49/QaVZ6buVR+RoNYiKGFdiKcEc8JB+c19
s2ksv2HXH9eB66fQ+yNQY7W2lNiK98iTc0txk+lhP2wRnFXHPMgqQhFb3j2wt7Or
ix27mqEX40GyAOv+Xmam2NtjLRM5WD4zflnasEKvxQoa0Qe0mpR6aSKIotUmM4yi
oNcARpnSdJUwDrfHL0GDd9ksOomPMA==
=r9/H
-----END PGP SIGNATURE-----

--nnu6wqtgppbbywlf--
