Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCBD5660611
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jan 2023 18:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjAFR4v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Jan 2023 12:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235050AbjAFR4g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Jan 2023 12:56:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577188061D
        for <linux-i2c@vger.kernel.org>; Fri,  6 Jan 2023 09:56:34 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pDqx4-0001Et-NZ; Fri, 06 Jan 2023 18:56:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pDqx0-004FtV-BZ; Fri, 06 Jan 2023 18:56:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pDqwz-00AihF-Fm; Fri, 06 Jan 2023 18:56:17 +0100
Date:   Fri, 6 Jan 2023 18:56:17 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Grant Likely <grant.likely@linaro.org>,
        Peter Huewe <peterhuewe@gmx.de>,
        Lee Jones <lee.jones@linaro.org>,
        linux-integrity@vger.kernel.org
Subject: Re: [PATCH 001/606] tpm: st33zp24: Convert to Convert to i2c's
 .probe_new()
Message-ID: <20230106175617.d3tlyb4lfdv34pvw@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-2-uwe@kleine-koenig.org>
 <20221216090904.qlekgvtpriijmvay@pengutronix.de>
 <Y696MSvhEUWlHSoK@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cxrh6k27i7zhw6ts"
Content-Disposition: inline
In-Reply-To: <Y696MSvhEUWlHSoK@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cxrh6k27i7zhw6ts
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jarkko,

On Fri, Dec 30, 2022 at 11:54:25PM +0000, Jarkko Sakkinen wrote:
> I picked it now.
>=20
> BR, Jarkko
>=20
> On Fri, Dec 16, 2022 at 10:09:04AM +0100, Uwe Kleine-K=F6nig wrote:
> > while rebasing my series onto today's next I noticed the Subject being
> > broken:
> >=20
> > 	$Subject ~=3D s/Convert to //

I see you picked this patch, but you didn't drop the duplicated "Convert
to " :-\

Also you didn't pick patches #2 - #5 which are tpm related, too.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cxrh6k27i7zhw6ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO4YL4ACgkQwfwUeK3K
7Am5tAf8CcRnHBDsafIlP1LKrJdQcpJRhuW3vxmMWFQcjzZRYgQsba9ScKPERriX
QDrX4MnJV4E5zvQiFDj9VMDVnkfSW3ovKIZ5s7DkIU73p3xElLMXEDlMzwisrUev
Uj/sbJDXF6ALt7xclf07xLPnQ8h3HH5NBZKR2pygldLjzMiPBM5AiJT+EqB1eoNu
DB/Ajl8zjD9MpCpTXswjIeNSsSauZxdIqBOrEkk9kf7h+Ztp7yh70KwgmMhaZEfW
DKObRqBmi9kmb8BRlDT+bU2jRV1hSNj2RtHW8TVVU9CbiecSQw523vWwW7pgo2ms
YX+s+JekGtpjs2GvITci0O8rw+vjbg==
=5CRE
-----END PGP SIGNATURE-----

--cxrh6k27i7zhw6ts--
