Return-Path: <linux-i2c+bounces-623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B428805998
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 17:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E55A1C210C5
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 16:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7857463DEF;
	Tue,  5 Dec 2023 16:13:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFB89E
	for <linux-i2c@vger.kernel.org>; Tue,  5 Dec 2023 08:13:14 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAY21-00048v-Nv; Tue, 05 Dec 2023 17:12:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAY1z-00DmUU-DU; Tue, 05 Dec 2023 17:12:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAY1z-00EqaV-2n; Tue, 05 Dec 2023 17:12:19 +0100
Date: Tue, 5 Dec 2023 17:12:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel@pengutronix.de
Subject: Re: (subset) [PATCH 00/17] dt-bindings: samsung: add specific
 compatibles for existing SoC
Message-ID: <20231205161218.wymlzvhk4pnnkwze@pengutronix.de>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <170119374454.445690.515311393756577368.b4-ty@gmail.com>
 <20231128205841.al23ra5s34rn3muj@pengutronix.de>
 <ZW8ZNZ_FJSV8fq-U@orome.fritz.box>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dyjed4xxkou772mg"
Content-Disposition: inline
In-Reply-To: <ZW8ZNZ_FJSV8fq-U@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--dyjed4xxkou772mg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Tue, Dec 05, 2023 at 01:36:05PM +0100, Thierry Reding wrote:
> On Tue, Nov 28, 2023 at 09:58:41PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Tue, Nov 28, 2023 at 06:49:23PM +0100, Thierry Reding wrote:
> > >=20
> > > On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> > > > Merging
> > > > =3D=3D=3D=3D=3D=3D=3D
> > > > I propose to take entire patchset through my tree (Samsung SoC), be=
cause:
> >     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >=20
> > > > 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosA=
utov920), so
> > > >    they will touch the same lines in some of the DT bindings (not a=
ll, though).
> > > >    It is reasonable for me to take the bindings for the new SoCs, t=
o have clean
> > > >    `make dtbs_check` on the new DTS.
> > > > 2. Having it together helps me to have clean `make dtbs_check` with=
in my tree
> > > >    on the existing DTS.
> > > > 3. No drivers are affected by this change.
> > > > 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus =
expect
> > > >    follow up patchsets.
> > > >=20
> > > > [...]
> > >=20
> > > Applied, thanks!
> > >=20
> > > [12/17] dt-bindings: pwm: samsung: add specific compatibles for exist=
ing SoC
> > >         commit: 5d67b8f81b9d598599366214e3b2eb5f84003c9f
> >=20
> > You didn't honor (or even comment) Krzysztof's proposal to take the
> > whole patchset via his tree (marked above). Was there some off-list
> > agreement?
>=20
> I had read all that and then looking at patchwork saw that you had
> marked all other patches in the series as "handled-elsewhere" and only
> this one was left as "new", so I assumed that, well, everything else was
> handled elsewhere and I was supposed to pick this one up...

I didn't mark it as handled-elsewhere, but my expectation was that you
might want to send an Ack only.

For today's series by Krzysztof I acked and marked the patch as
handled-elsewhere (together with the rest of the series that isn't pwm
related). So you have to consult your inbox if you still want to send an
Ack for that one.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dyjed4xxkou772mg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVvS+IACgkQj4D7WH0S
/k4wwAf6AlMbQoIitSxoLyL8EPf/AFm1OReNOJVSWyeoYnXJ6AOvGwmxAqCesfcV
8NCugoHjF1JiraIJPpyVgrmmas8T0uk5v4N32GPcL7ld1hBZGsH8B9GsuTioS5R7
+pMOUKwLPmf+vPiDCjkvAL9B3HOBCCSHjU6g9vf2b4O0dNvJK+vVFOuKPF5r+GQr
fFPsuCRnPkkHNn8PWA6HWPUR+0V1rsyiabnsgxlnC6PPyu64tC9aD2Xto0+kM0D0
WAdt4elH5P373tccyXATCZK4xaJWO4eHbzJTeVOCeEqcjB55BwuzMgVP8xQ85Mrx
RHto9piBhu5zc5d4EcBjLTp4QpooUg==
=k470
-----END PGP SIGNATURE-----

--dyjed4xxkou772mg--

