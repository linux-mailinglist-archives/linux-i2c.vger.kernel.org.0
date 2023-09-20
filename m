Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C557A77CF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 11:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234187AbjITJn5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 05:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234197AbjITJn4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 05:43:56 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3871CAF
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 02:43:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qitkE-00037g-A5; Wed, 20 Sep 2023 11:43:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qitkD-007elH-Ss; Wed, 20 Sep 2023 11:43:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qitkD-003FqQ-JE; Wed, 20 Sep 2023 11:43:41 +0200
Date:   Wed, 20 Sep 2023 11:43:41 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, Lee Jones <lee@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 2/2] i2c: Drop legacy callback .probe_new()
Message-ID: <20230920094341.fhiljy2ew4n6mepj@pengutronix.de>
References: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
 <20230905194253.256054-3-u.kleine-koenig@pengutronix.de>
 <ZQF34dwupVtsIr3K@shikoro>
 <20230920065409.xexu5ab6omvl7afx@pengutronix.de>
 <ZQq1h0F/5dSCvH2i@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sgcgdnxy7gzvfc5s"
Content-Disposition: inline
In-Reply-To: <ZQq1h0F/5dSCvH2i@shikoro>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sgcgdnxy7gzvfc5s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Wolfram,

On Wed, Sep 20, 2023 at 11:04:07AM +0200, Wolfram Sang wrote:
>=20
> > you even took it via a faster path than I expected (i.e. it went in for
> > 6.6-rc2 instead of 6.7-rc1).
>=20
> Was that bad? Was there a reason to wait?

No, it's great. This way I can reduce my checks about new drivers being
added that get it wrong. I just expected that this change doesn't
qualify to be applied after -rc1 and I'd have to wait for the next merge
window.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sgcgdnxy7gzvfc5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUKvswACgkQj4D7WH0S
/k6CKQf+MUjMsmCsm2bJkcUZqfw5i1eFylcPWYlZfVmKTpfrHneDqxIf8eUrTPo7
zqmfAH1BZcC8u6kTY2/SLog71/+/J+V44rdikkljsLESAUhY6wjvezQ3a/IjLo7x
M8m5HPtai0daivHwHvFdDi15OIUbqjQC95EL1YSpAGsZVyJ4qNjyaJo+UIEfpl/4
wRjE4lcucK+rtZfLYUjbRb5pRNlD+pQdMAfwjls9zQLDFVpRPUhbmQd8sbhkM9Je
z8/6bHjdlEN53XYdiM6RpTq4bF9ntwin0ufS1F/3adsUjh+nRgDqTo1evgG1uzOR
RR4b0F9D088wu698M6oH4PNIvCf3PQ==
=ivsf
-----END PGP SIGNATURE-----

--sgcgdnxy7gzvfc5s--
