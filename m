Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA6F6F3E12
	for <lists+linux-i2c@lfdr.de>; Tue,  2 May 2023 09:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbjEBHDy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 May 2023 03:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbjEBHDx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 May 2023 03:03:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85EC170A
        for <linux-i2c@vger.kernel.org>; Tue,  2 May 2023 00:03:51 -0700 (PDT)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1ptk33-0001uP-Lo; Tue, 02 May 2023 09:03:41 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 104711BBEE2;
        Tue,  2 May 2023 07:03:40 +0000 (UTC)
Date:   Tue, 2 May 2023 09:03:39 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Wolfram Sang <wsa@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
        "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Message-ID: <20230502-grueling-plural-694f7fc7c9ff-mkl@pengutronix.de>
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com>
 <4797405.GXAFRqVoOG@steina-w>
 <ZE4TU0rCw9MSwrmB@sai>
 <2143344.irdbgypaU6@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ywzxrng3y4nbcxxf"
Content-Disposition: inline
In-Reply-To: <2143344.irdbgypaU6@steina-w>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
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


--ywzxrng3y4nbcxxf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02.05.2023 08:50:06, Alexander Stein wrote:
> Hello Wolfgang,
>=20
> Am Sonntag, 30. April 2023, 09:05:55 CEST schrieb Wolfram Sang:
> > * PGP Signed by an unknown key
> >=20
> > > > IIRC this is a general problem^w limitation of the clock framework,
> > > > clock providers cannot use clocks themselves in certain callback, e=
=2Eg.
> > > > set_rate.
> > >=20
> > > Well, that's essentially impossible when this clock provider is attac=
hed
> > > via i2c. i2c transfers potentially need to change or prepare clocks.
> >=20
> > So, as I get it, this is not a specific lpi2c problem but affecting any
> > I2C controller driver which uses get_rate() to setup a transfer to a
> > remote I2C clock provider? And this lockdep warning is a false-positive?
>=20
> Yes, IMHO this could potentially occur on every I2C controller driver, if=
 a=20
> clock provider while holding the clk_prepare_lock, e.g. during registrati=
on,=20
> issues an i2c transfer.
> I'm not so sure if this is a false-positive, but more like trying to do a=
=20
> nested lock.

It's a general limitation of the clock framework. The clk_prepare_lock()
is taken by clk_prepare() and by clk_get_rate(). So if you implement a
clock provider driver that uses I2C, which might use clk_get_rate() it
might deadlock. However there's a workaround for nested I2C calls:
533ddeb1e86f "(clk: allow reentrant calls into the clk framework,
2013-03-28)". This doesn't work for SPI, as it's using a worker thread.

| https://elixir.bootlin.com/linux/v6.3/source/drivers/clk/clk.c#L128

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ywzxrng3y4nbcxxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmRQtckACgkQvlAcSiqK
BOhPxwgAr5nYSNP4JEu7xo76JeUQGHdeOk6wmcHDpSmhFJje5gaXzU1knRdxynwV
OM+EkIYxbuDzvdRwpgg+cdyGUmprQxPiUHMjYasDOR9lv4lSKVKKomDqPXyLBI/r
jbRkiuslJF6Hrk9y7qxDEo6oGlh86UlNEvwKO4ImFJWDBDTovgjxUXk1wTyP8HPm
ANOYQMWy+LY1OM3+oR0h/VOAFfRtAr1zrPnhcY6vk1/ZlG8gNzg8r/WSwez4qYKB
NBxZdcKtGxuuFAl+T8y9aoKa4i2r8YmJtMY0HBDhAcZHQ2MPFyR9wzpAC7rXpKKO
BQkb/3bMwJ0/XuXcapo2sJrUK7jxSw==
=1qAJ
-----END PGP SIGNATURE-----

--ywzxrng3y4nbcxxf--
