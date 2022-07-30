Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FFC585C98
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Jul 2022 01:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbiG3XN5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 Jul 2022 19:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbiG3XN4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 30 Jul 2022 19:13:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E73140D5
        for <linux-i2c@vger.kernel.org>; Sat, 30 Jul 2022 16:13:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oHveS-0000Sc-81; Sun, 31 Jul 2022 01:13:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oHveQ-000niP-8b; Sun, 31 Jul 2022 01:13:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oHveP-008af3-7k; Sun, 31 Jul 2022 01:13:41 +0200
Date:   Sun, 31 Jul 2022 01:13:35 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Make sure to unregister adapter on remove()
Message-ID: <20220730231335.xwm3e5nbojztcpcw@pengutronix.de>
References: <20220720150933.239956-1-u.kleine-koenig@pengutronix.de>
 <20220729042922.GD30201@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="geiqhvxy5dj2bvwy"
Content-Disposition: inline
In-Reply-To: <20220729042922.GD30201@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--geiqhvxy5dj2bvwy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 06:29:22AM +0200, Oleksij Rempel wrote:
> Hi Uwe,
>=20
> thank you for your work.
>=20
> On Wed, Jul 20, 2022 at 05:09:33PM +0200, Uwe Kleine-K=F6nig wrote:
> > If for whatever reasons pm_runtime_resume_and_get() fails and .remove()=
 is
> > exited early, the i2c adapter stays around and the irq still calls its
> > handler, while the driver data and the register mapping go away. So if
> > later the i2c adapter is accessed or the irq triggers this results in
> > havoc accessing freed memory and unmapped registers.
> >=20
> > So unregister the software resources even if resume failed, and only sk=
ip
> > the hardware access in that case.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Can you please add Fixes tag. I assume this patch can got to stable
> kernel version too.

That would be:

Fixes: 588eb93ea49f ("i2c: imx: add runtime pm support to improve the perfo=
rmance")

and that was merged around v4.4. I'm not sure it's sensible to backport
that given the bug is that old and didn't even pop up in a user story
but by a cleanup effort. *shrug* Up to you and Wolfram to decide.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--geiqhvxy5dj2bvwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLluxwACgkQwfwUeK3K
7Ake3Af/fhZ0ehuFxgVXQepv0AQ0lQYo137wUkTv7u25aH7dsq/WR8GHESYR/VU8
eueNLPPcGtqZ7htSocN81HqZNYC+yVt+v4rkkGKo0kk00oVky9PqXiuFDmmB53YN
DVDPvcAQ17SCr5cB7fRMtCx5qawdClPujdwoNTuIUhJiGXgYqUvk73bTEDYtAVpL
DqDJU8ZuhyfBYdsgxuzyFaJX+PCrewqaoEbfcMLKL1YKd2LyOK7eDGRiB8qQVPE7
fBTGZiafWHq6S/T0SY3E7S+qdfJxxi2uK1GOgljSx3MowV1/mhOPm/dL7ESTgplE
szyHGy2FW0t2YucgqcSOIz5CRkLbVQ==
=EbbU
-----END PGP SIGNATURE-----

--geiqhvxy5dj2bvwy--
