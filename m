Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E11806B23A1
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 13:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjCIME2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 07:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjCIME2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 07:04:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D02EE276B
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 04:04:27 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1paF0O-0001EV-AH; Thu, 09 Mar 2023 13:04:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1paF0N-002w8m-9t; Thu, 09 Mar 2023 13:04:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1paF0M-003X7Q-Ih; Thu, 09 Mar 2023 13:04:18 +0100
Date:   Thu, 9 Mar 2023 13:04:18 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [PATCH] i2c: sprd: Delete i2c adapter in .remove's error path
Message-ID: <20230309120418.rbzfefxxrqqsawd4@pengutronix.de>
References: <20230309095819.2569646-1-u.kleine-koenig@pengutronix.de>
 <CAHp75VeMO+0VisrQXTGj9yuGz23jMaX8G0PDPUhhD1bMJ4ji2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ujixru633oz7kvth"
Content-Disposition: inline
In-Reply-To: <CAHp75VeMO+0VisrQXTGj9yuGz23jMaX8G0PDPUhhD1bMJ4ji2w@mail.gmail.com>
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


--ujixru633oz7kvth
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 01:17:22PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 9, 2023 at 11:58=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > If pm runtime resume fails the .remove callback used to exit early. This
> > resulted in an error message by the driver core but the device gets
> > removed anyhow. This lets the registered i2c adapter stay around with an
> > unbound parent device.
> >
> > So only skip clk disabling if resume failed, but do delete the adapter.
>=20
> Still worrisome. I would disable clock independently, but the questions a=
re:

Note that pm-runtime stuff disables the clk, so if resume failed, you
have to assume the clk already being off.

> 1) why the heck we need this dance with PM runtime for disabling clocks;
> 2) why can't we use devm_clk_get_enabled() or so in the probe;

These questions are orthogonal to my patch, right?

Runtime PM might delay suspend, so if you submit two transfers shortly
after another, this might be more effective as the device isn't
suspended in between. (Attention: half-baked knowledge)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ujixru633oz7kvth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQJyz8ACgkQwfwUeK3K
7AkTHgf9Hlm3S3QM9UcQDfjyIBlpc1+Aq1lhQybdzmq5DrJrKP0TzuHg8ao+0MPa
99Y16LIkJMwON16YxqKzI4KyHbQKu7XDA393XbdTOb5vovUTEgqze5cPrcAxc2t7
1x0GZ9iVe58ahpIqNgnOD6AS66vnhofmtcb3Yh0qrZSBickti1ucY73/ZAzVrQAa
Q1Fz0iBwsZ9HY/R6tIc4KN++dWrNMCm8xN3tbeO6hfHY3XZevLTzkLf5LZKB8QcX
c5uhouHR7kAJkns5yRf0pRyrv0+EVkhJQTowlWwAr5u1MJ3kTFQEpx+lPiwwi0+R
GMjnswHpmGQLMe+vIIKLL+sw1rcRiQ==
=UjRh
-----END PGP SIGNATURE-----

--ujixru633oz7kvth--
