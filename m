Return-Path: <linux-i2c+bounces-11755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A98AF0C05
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 08:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 818871C038A3
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 06:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC22622688C;
	Wed,  2 Jul 2025 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgEzaVEs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E21D7E41;
	Wed,  2 Jul 2025 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751439291; cv=none; b=BjfMjfHkxNG/5DvAGvzbZLvTEKzn+u8ddSmrXTImXjzHopwtvDy6llJmAGdu4eIH0dxlIcqNsl95Hp+PRawPWXTt1DpfcdYajuXsdD3ghRf84pAbjE2Pff8auxKLO4l0zbLwvMpOAJt7U7yU0/RQuojBpyseFN3KVKl2WHyjAe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751439291; c=relaxed/simple;
	bh=OygOYEPels4czGsYfayew2rB/2MBUfzsc+sH9m4SBq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBBfrUnx9JuUhGVeZWDW8VRQY/VuyV4KM9C+G391oK4/4pwqIrx2j17CoRcnQJYc08TNW90QrZBH4tqaQBI++It2Z9EJTitBWsUQ4tyicMLDtWpnF5+OsFd52mAjMDBcD7SfqGX+famczpUpXpY8NOsxKq2m2qGgos+KJ4lyheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgEzaVEs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DADDC4CEEE;
	Wed,  2 Jul 2025 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751439290;
	bh=OygOYEPels4czGsYfayew2rB/2MBUfzsc+sH9m4SBq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HgEzaVEsk//JdYC+Qyn/5EKrQUtKGk9503aAH2+MGID4BNeVQ532beH+YUPat8bTE
	 ksassL7x58UVM8H2z1YiCwar+F03MKvsVVnuzRRKynO2HQG/FWdGtT9efkSLGsT2I7
	 Ms+P4pZHTOL3Vi5wMI5yX6frOXuS33VSRWuaxiWcuK7ssHBQAM1VMY79ox/M3t/Kkg
	 MpzSll7uEgbWqbwWs12mIdTWwhhed0E7KABMg9q7RSCMgBIviaW2okigJHox485Vzp
	 +NGA4KhTUCCW4PB5nkG0t/tcwwrvz8+nBPF7c5fUeC9tKEKmXUIejMhEFiSWJ7w1Sq
	 ROwcsDKchkEaA==
Date: Wed, 2 Jul 2025 08:54:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Waqar Hameed <waqar.hameed@axis.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>, 
	William Breathitt Gray <wbg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matteo Martelli <matteomartelli3@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, Mudit Sharma <muditsharma.info@gmail.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Song Qiang <songqiang1304521@gmail.com>, 
	Crt Mori <cmo@melexis.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Karol Gugala <kgugala@antmicro.com>, 
	Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, kernel@axis.com, 
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
Message-ID: <jeajjewfbg5qo736imozpghnpxln2pux74aegtqsi57qsbpug2@opndel6zc3m3>
References: <pnd7c0s6ji2.fsf@axis.com>
 <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
 <20250701185519.1410e831@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yoqxembgtzssn7jy"
Content-Disposition: inline
In-Reply-To: <20250701185519.1410e831@jic23-huawei>


--yoqxembgtzssn7jy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
MIME-Version: 1.0

Hello Jonathan,

On Tue, Jul 01, 2025 at 06:55:19PM +0100, Jonathan Cameron wrote:
> On Tue, 1 Jul 2025 19:44:17 +0200
> Uwe Kleine-K=F6nig <ukleinek@kernel.org> wrote:
>=20
> > On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
> > >  drivers/pwm/pwm-meson.c                          | 3 +-- =20
> >=20
> > Looking at this driver I tried the following:
>=20
> I'm not sure what we actually want here.
>=20
> My thought when suggesting removing instances of this
> particular combination wasn't saving on code size, but rather just
> general removal of pointless code that was getting cut and
> paste into new drivers and wasting a tiny bit of review bandwidth.
> I'd consider it bad practice to have patterns like
>=20
> void *something =3D kmalloc();
> if  (!something)
> 	return dev_err_probe(dev, -ENOMEM, ..);
>=20
> and my assumption was people would take a similar view with
> devm_add_action_or_reset().
>
> It is a bit nuanced to have some cases where we think prints
> are reasonable and others where they aren't so I get your
> point about consistency.

The problem I see is that there are two classes of functions: a) Those
that require an error message and b) those that don't. Class b) consists
of the functions that can only return success or -ENOMEM and the
functions that emit an error message themselves. (And another problem I
see is that for the latter the error message is usually non-optimal
because the function doesn't know the all details of the request. See my
reply to Andy for more details about that rant.)

IMHO what takes away the review bandwidth is that the reviewer has to
check which class the failing function is part of. If this effort
results in more driver authors not adding an error message after
devm_add_action_or_reset() that's nice, but in two months I have
forgotten the details of this discussion and I have to recheck if
devm_add_action_or_reset() is part of a) or b) and so the burden is
still on me.

So to give my answer on your question "What do we actually want here?":
Please let us get rid of the need to care for a) or b).

> The code size reduction is nice so I'd not be against it as an extra
> if the reduction across a kernel builds is significant and enough
> people want to keep these non printing prints.

To complete implementing my wish all API functions would need to stop to
emit an error message. Unfortunately that isn't without downsides
because the result is that there are more error strings and so the
kernel size is increased. So you have to weight if you prefer individual
error messages and easier review/maintenance at the cost of a bigger
binary size and more dev_err_probe() calls in drivers eating vertical
space in your editor.

I know on which side I am, but I bet we won't find agreement about that
in the kernel community ...

Best regards
Uwe

--yoqxembgtzssn7jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhk17UACgkQj4D7WH0S
/k4YcQgAlm1BDi3/P3JcN5b6Y1UamZV/S9cGOikezq/kf1GhqDBu8DxrVjTBFjOf
OJoBgw/566zxq5agBq8EUgc7GrJBwe7BhieAXUGmYQI0pBg1Zdhgyj42kXhx7B9R
u2j6XXXrEWa1Sw58sbK3g8bLeDEo9/kIem6g0Yk6NZX2WibbNU6Bw6UuV3yVwVaX
TH4uFzMJ5wVvnwJDz2HCuxCLQ9NO25UL0U3DdZWIPI9oeuodG3U3MVNJWMJ5OuXc
e+Yo5MhzsrnrMpj4nWPaicdD25qLOdVCySFDim72U4oI24wsmtlQBiJmDuNoldf/
kbQM9dmwp48V3mVs7SFSmrt/TD4bFw==
=6zPO
-----END PGP SIGNATURE-----

--yoqxembgtzssn7jy--

