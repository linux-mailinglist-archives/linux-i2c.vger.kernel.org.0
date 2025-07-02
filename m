Return-Path: <linux-i2c+bounces-11752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49555AF0B57
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 08:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E38DB3ADBBD
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 06:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1191218AC1;
	Wed,  2 Jul 2025 06:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWDG0isC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C51F4621;
	Wed,  2 Jul 2025 06:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436631; cv=none; b=jUdpKjB9rkaAFy1avxKc1dgBxgCP6dtxlPuqMLAOYBSXLLnwvH1MUK0f946Xu3ZPYJiP2iJq/jFsJ9gJFra3iFiHLDTvp50BmCv9D4cIfzwUTU0F4JY6AnqLTxmGptMro6mBLNY43gbnm5KzATHr5d8JGRfnb6IdU3Y35iacOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436631; c=relaxed/simple;
	bh=jTxeZTxuIEmptXyaI8i1uVNMBzq5osaRO+bZp5mu0is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQEh/cuomr2gv92L0EEpAWD/3wQ21hMGIoEyAxINUuaSKeg/NxA/mbC5KoEt3zmgfhcPfYuFzszo9bjVCXTjjtOn4IQn1Bc3u0mDbJZ8MV3shW4ZAyk706UWCXkB/D/7mA7E3l/At9uCeyJ+qIP6Z1VcIbSYVuFEiCBS9Ehy1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWDG0isC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C363C4CEEE;
	Wed,  2 Jul 2025 06:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751436630;
	bh=jTxeZTxuIEmptXyaI8i1uVNMBzq5osaRO+bZp5mu0is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWDG0isC2uNjFuDe3JPfxbgnNDiLAKGklW9DTAz2P2ytBJL6UdEXbpir70IkxkiAq
	 SYkAm13wd/ZsySAUN5mpMILP27UykLjLZUAdZ6vezYSbTyP9dQxmkL9u/OyZAYHu/i
	 X3LQcVAgGFGbEzb+q8Z531JFZRAQo0bpaB0ZDV/3xFobNA5KtUEBq4kNjYPGXQduZI
	 8oVmPxcqY6payAVFbG7VJsnuXAKVzeVVxQwGG/pG8UoCPEwlLYYuWOpJke1I3ef+M+
	 8KCc9jnbv0IxFnscmMd4Mw+jJ9Vt7o/dWCo1vsVauS75cHMsFA/slfRWgrJdUO8p+Y
	 0R/P3vu3ytNbA==
Date: Wed, 2 Jul 2025 08:10:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Waqar Hameed <waqar.hameed@axis.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>, 
	William Breathitt Gray <wbg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
Message-ID: <zxtyk4vly2salnoy3lng2ni7pzu3wg6qnmucadnclfigrd2m2m@i6xcrmvh34r5>
References: <pnd7c0s6ji2.fsf@axis.com>
 <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
 <CAHp75Ve=Zas8=6YKoPeTRrvjCaTyyRAyJG1gBLripqZgQpfg7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k77zpjuydsxyj3qv"
Content-Disposition: inline
In-Reply-To: <CAHp75Ve=Zas8=6YKoPeTRrvjCaTyyRAyJG1gBLripqZgQpfg7g@mail.gmail.com>


--k77zpjuydsxyj3qv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
MIME-Version: 1.0

Hello Andy,

On Tue, Jul 01, 2025 at 08:57:02PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 1, 2025 at 8:44=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ke=
rnel.org> wrote:
> > On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
>=20
> ...
>=20
> > With that
> >
> >         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> >                                        meson->channels[i].clk);
> >         if (ret)
> >                 return dev_err_probe(dev, ret,
> >                                      "Failed to add clk_put action\n");
> >
> > from drivers/pwm/pwm-meson.c is optimized to
> >
> >         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> >                                        meson->channels[i].clk);
> >         if (ret)
> >                 return ret;
> >
> > .
> >
> > I would prefer this approach, because a) there is no need to drop all
> > dev_err_probe()s after devm_add_action_or_reset() and b) the
> > dev_err_probe()s could stay for consistency in the error paths of a
> > driver.
>=20
> Why do we need a dev_err_probe() after devm_add_action*()? I would
> expect that the original call (if needed) can spit out a message.

I'm not a big fan of API functions that emit an error message. In
general the caller knows better what went wrong (here:
devm_add_action_or_reset() doesn't know this to be about the clk_put
action), so the error message can be more expressive.

Also in general an API function doesn't know if a failure is fatal or if
the consumer handles the failure just well and if the call is part of a
driver's .probe() so it's unclear if dev_err_probe() can/should be used.
(I admit that the last two probably don't apply to
devm_add_action_or_reset() but that's not a good enough reason to
make this function special. Every special case is a maintanance burden.)

My two =C2=A2,
Uwe

--k77zpjuydsxyj3qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhkzVEACgkQj4D7WH0S
/k4QBQf9Em2pqsnQTecp04ABJJapZRnih78NLCfEr+OSLp62HS+/R6qdnaueQp3c
snWhr/KeS8lMJkfhBrRz7mtGC8nKRmUxJX5dVG2x47hs2LAAyBQ528DJscHxvlZf
GMOpPcMVMCyEE2s+LXKg+027cbqGV3oa60NL6VbzadTPoGrjxEdftDezQftDsxsu
TGm7XMEbxP+TO6ZdVtF8HmKAfaLmh5QKwXn0D8UCSe8LVjtlvlDD7RI6MNqpHNiH
yr28f1rCDnAut6qhCa9g3zsSYlmBpztpd56Y3hSn3kLXtVz3OBx+Py7jDsyV/QuU
NBEpFQGKyurRCKocUTGotAcog+9ozA==
=azmY
-----END PGP SIGNATURE-----

--k77zpjuydsxyj3qv--

