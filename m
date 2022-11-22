Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9779634512
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 21:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234529AbiKVUCE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 15:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234595AbiKVUB5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 15:01:57 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBB8A316F
        for <linux-i2c@vger.kernel.org>; Tue, 22 Nov 2022 12:01:55 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxZSk-0004kV-8h; Tue, 22 Nov 2022 21:01:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxZSi-005ubg-5m; Tue, 22 Nov 2022 21:01:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxZSi-000rhZ-D0; Tue, 22 Nov 2022 21:01:44 +0100
Date:   Tue, 22 Nov 2022 21:01:40 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 541/606] regulator: fan53555: Convert to i2c's
 .probe_new()
Message-ID: <20221122200140.eyz7543bg2udl7be@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-542-uwe@kleine-koenig.org>
 <Y30l2LiPQIxb+Vll@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wq4qmmfasjw5e5iu"
Content-Disposition: inline
In-Reply-To: <Y30l2LiPQIxb+Vll@sirena.org.uk>
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


--wq4qmmfasjw5e5iu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 07:41:12PM +0000, Mark Brown wrote:
> On Fri, Nov 18, 2022 at 11:44:35PM +0100, Uwe Kleine-K=F6nig wrote:
>=20
> > +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
>=20
> This function is only in -next so I'll skip all the patches that need
> it.

Just in case you missed that information from the cover letter:
You can pull this function into your tree from Wolfram's immutable
branch at

	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_d=
evice_id_helper-immutable

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wq4qmmfasjw5e5iu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN9KqEACgkQwfwUeK3K
7AlaMwgAoA3tMSUXWIlQKPEa0VLDVRPq7CWlO2CT3LAfKZDF7yIbGm/kkNL6hy5e
vYVeWJrgoWsXElRnICSWUsRsJ+gAzLSsIWFlfBeK+uRhGogF7vNR50isNt/29231
jG1qO5eNSJFUR6g/eg3K284GaSTU6+yd2pQNXiFP1w882P6AdudKnRBym244IyUt
o3W1Q4nTwdWKcJlsUecbS6hWoVAkq48F9eWV2raLlrKNUN7hpLnh+7EoZFLDa0Qp
bxA8J6x9g9mDCKU8GHsnWXthzCoeFzleVvTvkUeSELuY5QN2BZjdIAeAqslRr3rt
1RnI9REKpDWb7sjVd/rZH1Rs3xeNlg==
=/9nb
-----END PGP SIGNATURE-----

--wq4qmmfasjw5e5iu--
