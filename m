Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A3F6D3CFF
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 07:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbjDCFtB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 01:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjDCFtA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 01:49:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262AA6E91
        for <linux-i2c@vger.kernel.org>; Sun,  2 Apr 2023 22:48:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjD3f-0001Mh-T8; Mon, 03 Apr 2023 07:48:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjD3c-008c3N-2w; Mon, 03 Apr 2023 07:48:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjD3b-00A8sQ-Em; Mon, 03 Apr 2023 07:48:43 +0200
Date:   Mon, 3 Apr 2023 07:48:37 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Don't do pm_runtime_resume in .remove()
Message-ID: <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
References: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
 <20230402225001.75a32147@aktux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="elfkugrrzbiqzu5a"
Content-Disposition: inline
In-Reply-To: <20230402225001.75a32147@aktux>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--elfkugrrzbiqzu5a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andreas,

On Sun, Apr 02, 2023 at 10:50:01PM +0200, Andreas Kemnade wrote:
> On Sun,  2 Apr 2023 12:55:18 +0200
> Uwe Kleine-K=F6nig         <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > One of the first things that the driver's pm_runtime_resume callback
> > does is to write zero to the OMAP_I2C_CON_REG register.
> > So there is no need to have the device resumed just to write to the
> > OMAP_I2C_CON_REG register and the call to pm_runtime_resume_and_get()
> > can be dropped.
> >=20
> > The intended side effect of this commit is to remove an error path of
> > the function resulting in the remove callback returning a mostly ignored
> > error code. This prepares changing the prototype of struct
> > platform_driver's remove callback to return void.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> As far as I have understand the code that runtime resume is needed
> for enabling clocks to access the device

The only HW access the .remove() callback does is

	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);

=2E The driver's runtime resume callback looks as follows:

        pinctrl_pm_select_default_state(dev);

        if (!omap->regs)
                return 0;

        __omap_i2c_init(omap);

and the first thing in in __omap_i2c_init is (also) writing a zero to
OMAP_I2C_CON_REG.

I wouldn't expect that the pinctrl call is a precondition for the
register access?! The check for omap->regs is somehow strange, because
other code locations that do register access just assume that ->regs is
non-NULL.

So if there is some clk handling necessary before the register access,
I'm not aware where it's hidden. Is there some bus or omap specific code
that ensures clk handling?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--elfkugrrzbiqzu5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQqaLQACgkQj4D7WH0S
/k49Mwf/Zql8i6hMxha765EKWIpaTDHnoZYJ6ghu9LMtnaPVhmSqaxOzdKY5heqf
t6Srv5f9Rz92AU9q04CI/DYcSbsGbIaqlnhzPpWVc0YMZl0kR0s7gr6aI6S18blH
jajN6L4TFz05HHw+rV9J8xKHfvyCRiPn73KCwZ9dOlla80QVMQtL1c2y+BLjxVeL
zWXLrMwcsdUY4BmSLqqjDu6QGr04tfjQt9Lzr2Eazm0BM60RaZCv5fIEGnS/BXuj
bB4fpAb0DlTaI3mC8MlJLLhBU1gp0m2NRY6vSLiNQBIr5Vo8rpQu/00uTio4o1em
iOG0UQE1nvpkOJtVYNtGXyqkAxIqbw==
=OOEM
-----END PGP SIGNATURE-----

--elfkugrrzbiqzu5a--
