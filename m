Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5907A7342
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 08:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbjITGya (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 02:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233411AbjITGy0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 02:54:26 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D723E8
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 23:54:14 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qir6B-0000Wo-Bh; Wed, 20 Sep 2023 08:54:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qir6A-007cyg-KN; Wed, 20 Sep 2023 08:54:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qir6A-003Cit-9O; Wed, 20 Sep 2023 08:54:10 +0200
Date:   Wed, 20 Sep 2023 08:54:09 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, Lee Jones <lee@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 2/2] i2c: Drop legacy callback .probe_new()
Message-ID: <20230920065409.xexu5ab6omvl7afx@pengutronix.de>
References: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
 <20230905194253.256054-3-u.kleine-koenig@pengutronix.de>
 <ZQF34dwupVtsIr3K@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="knuucdqqnm4kqj36"
Content-Disposition: inline
In-Reply-To: <ZQF34dwupVtsIr3K@shikoro>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--knuucdqqnm4kqj36
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Wolfram,

On Wed, Sep 13, 2023 at 10:50:41AM +0200, Wolfram Sang wrote:
> On Tue, Sep 05, 2023 at 09:42:53PM +0200, Uwe Kleine-K=F6nig wrote:
> > Now that all drivers are converted to the (new) .probe() callback, the
> > temporary .probe_new() can go away. \o/
> >=20
> > Link: https://lore.kernel.org/linux-i2c/20230626094548.559542-1-u.klein=
e-koenig@pengutronix.de
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Aaaaaand applied to for-current, thanks! Hooray \o/ Thank you, Uwe!

you even took it via a faster path than I expected (i.e. it went in for
6.6-rc2 instead of 6.7-rc1).

Thanks!
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--knuucdqqnm4kqj36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUKlxAACgkQj4D7WH0S
/k7rlQf/dFADqFkq1VTZpOL10gJ7c56ZyOU7lTFXmoEMtrKLyhDzTwd+GrsDmmb7
0ZFGO91rF0Dcza3jsfW1C8qExcRkjpdeAJV5QMq28p2xXL530mn0A8EBl8xRh6+t
MKHmb0j9HcSn7ikVYQCn0l7mAZZBIyv1cFn7cnqs3nQIWF3nFY+Ny3S41y3ntclM
LO4+KYzLrkFQTYEgocphiRMd7urpgU3gMBkMDV5rnnYxbAsNg2NpjQWykP+piq0N
O3pBOMMkBqz9DMQ6xBXFKezg6JI29aWL35qMASNdYpKJ4n4KOz2XAOktO5J5QKOE
POuWUOs4wO9Y5T9uu2dHt39fORCJ0Q==
=Jxeu
-----END PGP SIGNATURE-----

--knuucdqqnm4kqj36--
