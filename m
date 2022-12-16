Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0174264E87D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 10:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbiLPJJc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 04:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiLPJJa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 04:09:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1112601
        for <linux-i2c@vger.kernel.org>; Fri, 16 Dec 2022 01:09:29 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p66iL-0004Tg-9b; Fri, 16 Dec 2022 10:09:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p66iG-004ssC-47; Fri, 16 Dec 2022 10:09:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p66iG-005ULn-9b; Fri, 16 Dec 2022 10:09:04 +0100
Date:   Fri, 16 Dec 2022 10:09:04 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        linux-integrity@vger.kernel.org
Subject: Re: [PATCH 001/606] tpm: st33zp24: Convert to Convert to i2c's
 .probe_new()
Message-ID: <20221216090904.qlekgvtpriijmvay@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-2-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xd4tmrhrs6drh2st"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-2-uwe@kleine-koenig.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xd4tmrhrs6drh2st
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

while rebasing my series onto today's next I noticed the Subject being
broken:

	$Subject ~=3D s/Convert to //

Apart from that I wonder who feels responsible to apply this patch (and
the other tpm patches in this series). They got an Ack by Jarkko, but
didn't appear in next.

The plan for this series is not to apply to a single tree, but let the
subsystem maintainers take their patches. I'd be happy if you consider
them for the next merge window.

Should I resend the tpm patches (with the subject fixed) once v6.2-rc1
is published?

Note that 662233731d66 ("i2c: core: Introduce i2c_client_get_device_id
helper function") is already in Linus' tree, so if your tree is new
enough (say v6.2-rc1 then) you don't need to care for this dependency.

Best regards and thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xd4tmrhrs6drh2st
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOcNa0ACgkQwfwUeK3K
7Alw4Af/RK9/7IC05BwpBrpy0qDkpZHmoJJKG3Gb/FsaXieOZO7bPAMOJzsW8Hy2
5B4efkwpE0raNTxC8HAz4NUJiZW0uMGu3VvhsKDtR2g29fZZoen7ip9oVD1hD5J0
5e5ZNaqVpjLe+Dl38VwO67/Us7ml8bQsXN6ZxnyAcb8sHQOzQ6eJ6WdyELoGOSSB
CwYhlAAJB/CKv2DNwsuWI0dfw08Qxn5IoU98W9TKnOeYcMuq2PdZwcOt6fzSVdAZ
XNE7isARnTxdSWjlZRyumVVlgf3Islw3ER4KJzaCAi/qn1LR5CRi+ppnDaoulAwT
iL/CrBRnGkwTVS6WGqyFVv8YzIoI4g==
=2hOt
-----END PGP SIGNATURE-----

--xd4tmrhrs6drh2st--
