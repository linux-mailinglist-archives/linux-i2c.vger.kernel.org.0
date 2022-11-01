Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02A5F614D26
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 15:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiKAOys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 10:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiKAOym (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 10:54:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B476428
        for <linux-i2c@vger.kernel.org>; Tue,  1 Nov 2022 07:54:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1opsel-0008IO-H5; Tue, 01 Nov 2022 15:54:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1opsel-001hAV-Lf; Tue, 01 Nov 2022 15:54:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1opsej-00DhGO-P9; Tue, 01 Nov 2022 15:54:21 +0100
Date:   Tue, 1 Nov 2022 15:54:21 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>
Cc:     linux-iio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] i2c: core: Introduce i2c_client_get_device_id
 helper function
Message-ID: <20221101145421.jwytax2srno4hhrl@pengutronix.de>
References: <cover.1667151588.git.ang.iglesiasg@gmail.com>
 <aeac9f372ffe0013757e261229e6e23f76f2d8f9.1667151588.git.ang.iglesiasg@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sotept4hn6coqzfv"
Content-Disposition: inline
In-Reply-To: <aeac9f372ffe0013757e261229e6e23f76f2d8f9.1667151588.git.ang.iglesiasg@gmail.com>
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


--sotept4hn6coqzfv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2022 at 06:52:18PM +0100, Angel Iglesias wrote:
> Introduces new helper function to aid in .probe_new() refactors. In order
> to use existing i2c_get_device_id() on the probe callback, the device
> match table needs to be accessible in that function, which would require
> bigger refactors in some drivers using the deprecated .probe callback.
>=20
> This issue was discussed in more detail in the IIO mailing list.
>=20
> Link: https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koeni=
g@pengutronix.de/
> Suggested-by: Nuno S=E1 <noname.nuno@gmail.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Angel Iglesias <ang.iglesiasg@gmail.com>
> ---
>  drivers/i2c/i2c-core-base.c | 15 +++++++++++++++
>  include/linux/i2c.h         |  1 +
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index b4edf10e8fd0..e6623226e393 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2236,6 +2236,21 @@ int i2c_get_device_id(const struct i2c_client *cli=
ent,
>  }
>  EXPORT_SYMBOL_GPL(i2c_get_device_id);
> =20
> +/**
> + * i2c_client_get_device_id - get the driver match table entry of a devi=
ce
> + * @client: the device to query
> + *
> + * Returns a pointer to the matching entry if found, NULL otherwise.
> + */
> +const struct i2c_device_id *i2c_client_get_device_id(const struct i2c_cl=
ient *client)
> +{
> +	const struct i2c_driver *drv =3D to_i2c_driver(client->dev.driver);
> +
> +	return i2c_match_id(drv->id_table, client);
> +

I'd drop the empty line after the return. Is it worth to note in a
comment that it only works for bound clients? (Oopses otherwise)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sotept4hn6coqzfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNhMxoACgkQwfwUeK3K
7AnawQgAiVCPA8MToHXg86Pja8R0Ak0Mbzo6HxZefCCg8XC6NrPPwNzxzbly/KHu
UKf1oJhSMOOpwW+xHmfahfYpteqWPrrq7KqjBXRP/ejg92dLHiG8FmCoGGKtIk8e
jus2pyIV3xpcO025BBb7eRbPi6oJcNJ7/D+SbiEml1kFZLAnCdKRjpJT/qc8AiP0
yf/mMzJi5aNNqiCUCLCCPsKD3jMuXu9CvYIgsXSkYat16QwhI7UmtCQBpY8tQLK0
LMC2qoiXuYpNHPEgpgvXw/Cnltsf9m8mvHKo0saIZ8MGS9oAu4DUr5B5H8ntejTe
29qKcOd231RP+mWsreyu8v+WTjed3g==
=cS2k
-----END PGP SIGNATURE-----

--sotept4hn6coqzfv--
