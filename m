Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7817162AC
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 15:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjE3NxP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 09:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjE3NxP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 09:53:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BE08E
        for <linux-i2c@vger.kernel.org>; Tue, 30 May 2023 06:53:14 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3zmc-0001is-LM; Tue, 30 May 2023 15:53:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3zmb-003tBi-CD; Tue, 30 May 2023 15:53:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3zma-009WA6-J1; Tue, 30 May 2023 15:53:04 +0200
Date:   Tue, 30 May 2023 15:53:01 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [PATCH] i2c: sprd: Delete i2c adapter in .remove's error path
Message-ID: <20230530135301.zlgobrereestoabc@pengutronix.de>
References: <20230309095819.2569646-1-u.kleine-koenig@pengutronix.de>
 <CAHp75VeMO+0VisrQXTGj9yuGz23jMaX8G0PDPUhhD1bMJ4ji2w@mail.gmail.com>
 <20230309120418.rbzfefxxrqqsawd4@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aznh46knmgqpl7ls"
Content-Disposition: inline
In-Reply-To: <20230309120418.rbzfefxxrqqsawd4@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aznh46knmgqpl7ls
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy, hello Wolfram,

On Thu, Mar 09, 2023 at 01:04:18PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Mar 09, 2023 at 01:17:22PM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 9, 2023 at 11:58=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > If pm runtime resume fails the .remove callback used to exit early. T=
his
> > > resulted in an error message by the driver core but the device gets
> > > removed anyhow. This lets the registered i2c adapter stay around with=
 an
> > > unbound parent device.
> > >
> > > So only skip clk disabling if resume failed, but do delete the adapte=
r.
> >=20
> > Still worrisome. I would disable clock independently, but the questions=
 are:
>=20
> Note that pm-runtime stuff disables the clk, so if resume failed, you
> have to assume the clk already being off.
>=20
> > 1) why the heck we need this dance with PM runtime for disabling clocks;
> > 2) why can't we use devm_clk_get_enabled() or so in the probe;
>=20
> These questions are orthogonal to my patch, right?
>=20
> Runtime PM might delay suspend, so if you submit two transfers shortly
> after another, this might be more effective as the device isn't
> suspended in between. (Attention: half-baked knowledge)

I wonder if my reply was enough to sort out Andy's concerns?! If so,
would be great to get this patch applied.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--aznh46knmgqpl7ls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR1/70ACgkQj4D7WH0S
/k59hAf/evCy/lQDiK/VKV190WCELFcpO+VNlgzFBnTWoZpQ5m2k2sKNubmDENnx
hiUxBsRHp0pc2CQEHSQrKy+yDesuAiTvbpuF+4x7oPOQ+1ltnjCqypkBUdL7SZWL
aoxxqtOeyx1K7B+vgMPoxTWHviej/xbFS4T7q5l/oWOp4DTY5Qb1dWhM4O8SvM35
xhtb8GoQWyLaxLI666Ll063XcoaQoXIfAf5CbnYd/ePLC9o+zL3P+K8ucpUc8X/L
98MVZexBxfz3cH1Ga4eK0KZgQMoz0mlTt/jK+/k80Bs6/V0aA1tjoMZKO8KYhMEs
o65lCh6la/2L1uP0ekiW3lghcwWWtg==
=3RLS
-----END PGP SIGNATURE-----

--aznh46knmgqpl7ls--
