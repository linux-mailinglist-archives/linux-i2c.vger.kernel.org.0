Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C14714E2144
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Mar 2022 08:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344871AbiCUHZM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Mar 2022 03:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344856AbiCUHZE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Mar 2022 03:25:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83DA19296
        for <linux-i2c@vger.kernel.org>; Mon, 21 Mar 2022 00:23:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nWCND-0006et-Tt; Mon, 21 Mar 2022 08:22:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nWCMp-0021t4-Og; Mon, 21 Mar 2022 08:22:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nWCMp-00AcZn-OA; Mon, 21 Mar 2022 08:22:15 +0100
Date:   Mon, 21 Mar 2022 08:22:15 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        =?utf-8?B?QW5kcsOp?= Gustavo Nakagomi Lopez <andregnl@usp.br>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Russell King <linux@armlinux.org.uk>,
        linux-pwm@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-iio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Guenter Roeck <linux@roeck-us.net>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Michal Simek <michal.simek@xilinx.com>, kernel@pengutronix.de,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
        Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Fabio Estevam <festevam@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        linux-amlogic@lists.infradead.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        linux-hwmon@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        UNGLinuxDriver@microchip.com, Vinod Koul <vkoul@kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>,
        linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        dmaengine@vger.kernel.org,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>
Subject: Re: [PATCH v8 02/16] clk: Provide new devm_clk helpers for prepared
 and enabled clocks
Message-ID: <20220321072215.5lffm7qtpvg5ofk4@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
 <20220319182936.06d75742@jic23-huawei>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oterd73bfcoy35ck"
Content-Disposition: inline
In-Reply-To: <20220319182936.06d75742@jic23-huawei>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oterd73bfcoy35ck
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 19, 2022 at 06:29:36PM +0000, Jonathan Cameron wrote:
> On Mon, 14 Mar 2022 15:16:29 +0100
> Uwe Kleine-K=F6nig         <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > When a driver keeps a clock prepared (or enabled) during the whole
> > lifetime of the driver, these helpers allow to simplify the drivers.
> >=20
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> One trivial thing below.
>=20
> > ---
> >  drivers/clk/clk-devres.c | 31 ++++++++++++++
> >  include/linux/clk.h      | 90 +++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 120 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> > index fb7761888b30..4707fe718f0b 100644
> > --- a/drivers/clk/clk-devres.c
> > +++ b/drivers/clk/clk-devres.c
> > @@ -67,12 +67,43 @@ struct clk *devm_clk_get(struct device *dev, const =
char *id)
> >  }
> >  EXPORT_SYMBOL(devm_clk_get);
> > =20
> > +struct clk *devm_clk_get_prepared(struct device *dev, const char *id)
> > +{
> > +	return __devm_clk_get(dev, id, clk_get, clk_prepare, clk_unprepare);
>=20
> Nitpick but this spacing before } in functions is rather unusual and not
> in keeping with the existing code in this file.
>=20
> > +
> > +}

ack, I fixed that in my tree, so this will be part of an v9. I won't
send it just for this change, though. I fixed three further functions
that had a similar empty line, too.

Thanks for looking
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--oterd73bfcoy35ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmI4J6MACgkQwfwUeK3K
7Ak5sAf/aG3oVD1FgzqJLWD3uSmF0uX0/3lky1l56go3LpRjDym8tlGglXT4z7Hl
Z3q8YXru6LSihHT/n6V4EUdpV6f49dxPfrr9hu9OFU+UY0Cd7NgisKr+0Wi61dbS
d8IVGHwcCPqBZanHdAEjhle7d7WdWhfukR1oLljd8B2XM6qP2jQgjFWzrSJfZ+hd
qd6k9TcfIHjy8n8xBtyIYSvYZbywqfa+wJeU54fe4fp4NNPVTmxGtzHFNDipSZGL
uF+yg7qDqSezst7wO3dNeblEvpVZfG9TZAXvGMCZQLn9x4b35iSmZtLVPN+HZZM4
WBr/EA6mCSOr4iHXCKfNr4UegGV4/w==
=gON5
-----END PGP SIGNATURE-----

--oterd73bfcoy35ck--
