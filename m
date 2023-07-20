Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37EF475AA26
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jul 2023 10:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjGTI61 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jul 2023 04:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjGTIxJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jul 2023 04:53:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B948A2690
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jul 2023 01:53:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMPP7-0004wa-5a; Thu, 20 Jul 2023 10:52:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMPP6-000nEK-8n; Thu, 20 Jul 2023 10:52:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMPP5-006JH7-Je; Thu, 20 Jul 2023 10:52:55 +0200
Date:   Thu, 20 Jul 2023 10:52:53 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] w1: ds2482: Switch back to use struct i2c_driver's
 .probe()
Message-ID: <20230720085253.arndjzqyhlbiioyy@pengutronix.de>
References: <20230612072807.839689-1-u.kleine-koenig@pengutronix.de>
 <6d76105f-daa1-1cd0-35b3-1727aa967bcc@linaro.org>
 <20230613070237.srqd3sy2c3lp7u5p@pengutronix.de>
 <dcc99c16-3807-1f81-03b8-86095f08258e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="52qxrbqmcewb3bwk"
Content-Disposition: inline
In-Reply-To: <dcc99c16-3807-1f81-03b8-86095f08258e@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--52qxrbqmcewb3bwk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 10:06:46AM +0200, Krzysztof Kozlowski wrote:
> On 13/06/2023 09:02, Uwe Kleine-K=F6nig wrote:
> > Hello Krzysztof,
> >=20
> > On Mon, Jun 12, 2023 at 10:10:30PM +0200, Krzysztof Kozlowski wrote:
> >> On 12/06/2023 09:28, Uwe Kleine-K=F6nig wrote:
> >>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> >>> call-back type"), all drivers being converted to .probe_new() and then
> >>> commit 03c835f498b5 ("i2c: Switch .probe() to not take an id paramete=
r")
> >>> convert back to (the new) .probe() to be able to eventually drop
> >>> .probe_new() from struct i2c_driver.
> >>>
> >>> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >>> ---
> >>>  drivers/w1/masters/ds2482.c | 2 +-
> >>
> >> Thank you for the patch.
> >> It is too late in the cycle for me to pick it up. I will take it after
> >> the merge window.
> >=20
> > This is one of only 19 patches that are still needed on top of what is
> > currently in next before I can drop .probe_new() which I intended to
> > tackle after the upcoming merge window. I expect that most of these 19
> > patches will still be picked up and go into v6.5-rc1.
> >=20
> > Assuming there are only less than 10 patches remaining on top of
> > v6.5-rc1, I intend to create a pull request for Wolfram with the
> > remaining bits and a patch doing
>=20
> Sure, go ahead:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks, but this didn't happen because I missed a few introductions of
new .probe_new. My plan was rescheduled to one merge window later. So if
you want to take this for v6.6-rc1 that would be great.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--52qxrbqmcewb3bwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS49eQACgkQj4D7WH0S
/k7mDgf+Po0jJl8c+9wG4gRc7YWBQCc2/8LfXNwtomTQJWTxwfOYkKUBMgphk1H8
JvKXc21seKdolajCS7VAgQZxdWBb/JWJd8HJj2Pir0W/4LqJ5nk/ev8OKigtuaoS
IpGkl0uvWbVHJYT4FRcwrjSR3S0JNJIauiWQcokPDbbVMzYrJ/uPPvuIdjJhc79Q
mm6sAuUPadrPUrrd6p5m/dTpfN7ZxOE7lXe31MDoC71Nq4pjNEX5zoNOqtuBvTka
fuVDnWf1VDet4GdlmNSsYKFYA48pdkIm9c6NKIsEQl7rWiwro4FOD8DSGd42B/GR
xmZwjanVhM/pStoaAsAmeN5YtZyjrg==
=RvSl
-----END PGP SIGNATURE-----

--52qxrbqmcewb3bwk--
