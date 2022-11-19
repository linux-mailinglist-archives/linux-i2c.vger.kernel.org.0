Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A4B630E0E
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 11:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbiKSKQk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 05:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiKSKQf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 05:16:35 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED465D6B0
        for <linux-i2c@vger.kernel.org>; Sat, 19 Nov 2022 02:16:34 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owKtQ-00089M-Nr; Sat, 19 Nov 2022 11:16:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owKtG-005EhI-Oa; Sat, 19 Nov 2022 11:16:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owKtG-0006ZF-Ax; Sat, 19 Nov 2022 11:16:02 +0100
Date:   Sat, 19 Nov 2022 11:16:02 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 289/606] macintosh: ams/ams-i2c: Convert to i2c's
 .probe_new()
Message-ID: <20221119101602.kfreiw4mdbjf7prj@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-290-uwe@kleine-koenig.org>
 <1d2ae1bb-d4ba-35cf-63b6-f23a0187a223@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fhfkp732a2k6imuh"
Content-Disposition: inline
In-Reply-To: <1d2ae1bb-d4ba-35cf-63b6-f23a0187a223@csgroup.eu>
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


--fhfkp732a2k6imuh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

On Sat, Nov 19, 2022 at 07:38:58AM +0000, Christophe Leroy wrote:
> Le 18/11/2022 =E0 23:40, Uwe Kleine-K=F6nig a =E9crit=A0:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > The probe function doesn't make use of the i2c_device_id * parameter so=
 it
> > can be trivially converted.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> The patch itself and the others seems ok. But can you group all=20
> macintosh changes into a single patch instead of the 9 patches you sent ?
>=20
> See the process about submitting patches,=20
> https://docs.kernel.org/process/submitting-patches.html and especially=20
> the "NO!!!! No more huge patch bombs to linux-kernel@vger.kernel.org=20
> people!" and the associated reference=20
> https://lore.kernel.org/all/20050711.125305.08322243.davem@davemloft.net/=
 :
>=20
> 	If you feel the need to send, say, more than 15 patches at once,=20
> reconsider.

Thanks for your feedback.

Let me point out in response to the request to squash patches together
that this wish doesn't seem to be the universal right thing to do.

Last time I did a conversion grouped by subsystem, one of the replies
was:

	Reviewed-by: ...
	if you split on per driver basis.

(https://lore.kernel.org/linux-iio/20220808085526.280066-1-u.kleine-koenig@=
pengutronix.de)

The obvious upside of a split per driver is that the individual bits are
easier to review, an Ack can be limited to a certain set of drivers, and
(probably most important): If a driver later gets a commit that needs
backporting, a patch that only touches this single driver can more
easily be backported as a dependency.

Also the request to not send everything at once but keep back some
patches has an obvious downside. I.e. I have to restart yet more often
to rebase + test to get all patches applied in the end. And you could
argue that the sum of the work load on the mail servers doesn't get
smaller in sum if the 600 patches are sent over (say) 2 months.
(To prevent a flame war here: Yeah, I agree there are downsides of a
single big series, too.)

All in all my personal opinion is that the advantages of a split per
driver slightly outweight the disadvantages. But obviously that's
subjective.

I will wait a while before sending updates to this series, so don't
expect a new patch very soon. (This has the nice effect that it gives
you some time to reconsider your argument and maybe apply the patches as
they are now, preventing another mail to the lists with the cumulated
macintosh changes ;-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fhfkp732a2k6imuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN4rN8ACgkQwfwUeK3K
7Al6Vgf8CS2jQ6ydt/mU5uUF2/1EdeFIaEgWWYM8GEO/WO3ITiDMmhcPxvxIiMZ0
3oK9RQOVW5svEcjiGpenqG2JzVC3qN1g86tlnFlbVnr2fNllDVn+UX4yqQIV/MHM
uOROopD1mejOWEeuyKGWSFaOJa+ZnQa94AW9NCnTqz9ZCbbtg1/da8nw7okMtupm
kXwMuuZee0TCK02/9mKYs3H0hWHoTt/2deYHVLrtfNurq5hKPZlqfXSokz1EH19v
rPmnAsQvxBubGj+6uKtx6bzmG+aNwqJe/3j5UbHGe7eIp1i7q4kXjzpi6ioxZ9ef
1lRlkwcKHui3hUwv5kuzN6BIi+ZrAQ==
=vViA
-----END PGP SIGNATURE-----

--fhfkp732a2k6imuh--
