Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F291F763F5D
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 21:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjGZTQy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 15:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjGZTQx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 15:16:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B611FF0
        for <linux-i2c@vger.kernel.org>; Wed, 26 Jul 2023 12:16:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOk06-0008V4-Rl; Wed, 26 Jul 2023 21:16:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOk05-002JRn-U7; Wed, 26 Jul 2023 21:16:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOk05-0081Jk-1G; Wed, 26 Jul 2023 21:16:45 +0200
Date:   Wed, 26 Jul 2023 21:16:43 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] w1: ds2482: Switch back to use struct i2c_driver's
 .probe()
Message-ID: <20230726191643.ex6cckrwnlx5bgz6@pengutronix.de>
References: <20230612072807.839689-1-u.kleine-koenig@pengutronix.de>
 <6d76105f-daa1-1cd0-35b3-1727aa967bcc@linaro.org>
 <20230613070237.srqd3sy2c3lp7u5p@pengutronix.de>
 <dcc99c16-3807-1f81-03b8-86095f08258e@linaro.org>
 <20230720085253.arndjzqyhlbiioyy@pengutronix.de>
 <6b38bf1f-600c-e6e9-ebf7-c27a06fffed1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="255rtgoxmoh34m77"
Content-Disposition: inline
In-Reply-To: <6b38bf1f-600c-e6e9-ebf7-c27a06fffed1@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--255rtgoxmoh34m77
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

On Wed, Jul 26, 2023 at 10:21:39AM +0200, Krzysztof Kozlowski wrote:
> On 20/07/2023 10:52, Uwe Kleine-K=F6nig wrote:
> > On Tue, Jun 13, 2023 at 10:06:46AM +0200, Krzysztof Kozlowski wrote:
> >> On 13/06/2023 09:02, Uwe Kleine-K=F6nig wrote:
> >>> Assuming there are only less than 10 patches remaining on top of
> >>> v6.5-rc1, I intend to create a pull request for Wolfram with the
> >>> remaining bits and a patch doing
> >>
> >> Sure, go ahead:
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >=20
> > Thanks, but this didn't happen because I missed a few introductions of
> > new .probe_new. My plan was rescheduled to one merge window later. So if
> > you want to take this for v6.6-rc1 that would be great.
>=20
> I don't have anything in w1 queue, so it would be easier if you take it
> with the rest.

OK, will do.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--255rtgoxmoh34m77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTBcRoACgkQj4D7WH0S
/k7UnQf9GzYYX1vMwlQhlqgTTPGvGCvBmDC2yE29X3l/tibDVAWVNsUqneb89DF9
sjA3pT30BquyJU8gMZwDu2utsiQvkYz7wCL9ZudsSJaerWTxwHNVCT3aSiFgetex
qAztPjl56MZ17VgLYHCdAtC2lFcJVSt6M8aJq7wkztRpgAX4xZjzcD1YowUIu+L3
Cq/kMwqm05njYgcNgbIibeVP2Di3gsLqlwXtDdd57iBzed3l+SzLCsBn0fHSURiE
wxR62xVMRBIfdtOExB5G9XnacuSj0ZD72M3jraAIKfHKRyA/aiWHWzCyhO4c0b1i
Gcu6oYbHBU/+ViMrrl/wDnAh0L0M/g==
=e8SN
-----END PGP SIGNATURE-----

--255rtgoxmoh34m77--
