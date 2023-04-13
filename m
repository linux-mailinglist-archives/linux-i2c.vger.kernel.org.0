Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5DE6E07E4
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 09:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjDMHhf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 03:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjDMHhe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 03:37:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC9B9005
        for <linux-i2c@vger.kernel.org>; Thu, 13 Apr 2023 00:37:29 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmrWB-0002uj-CR; Thu, 13 Apr 2023 09:37:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmrW9-00Auym-IY; Thu, 13 Apr 2023 09:37:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmrW8-00Coga-Cf; Thu, 13 Apr 2023 09:37:16 +0200
Date:   Thu, 13 Apr 2023 09:37:16 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Vignesh R <vigneshr@ti.com>, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Improve error reporting for problems during
 .remove()
Message-ID: <20230413073716.usr2r7kzw52z5n5l@pengutronix.de>
References: <20230402225001.75a32147@aktux>
 <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
 <20230403060404.GX7501@atomide.com>
 <ZC5qUU4JLI9Negyi@sai>
 <20230406082354.jwchbl5ir6p4gjw7@pengutronix.de>
 <20230413051222.GA9837@atomide.com>
 <20230413062440.yixne5wqed4zrva4@pengutronix.de>
 <20230413063915.GA36234@atomide.com>
 <20230413070745.mpcqpqokqspzavca@pengutronix.de>
 <20230413071124.GB36234@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ku3vzwlkkgg6oroe"
Content-Disposition: inline
In-Reply-To: <20230413071124.GB36234@atomide.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ku3vzwlkkgg6oroe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Tony,

On Thu, Apr 13, 2023 at 10:11:24AM +0300, Tony Lindgren wrote:
> * Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> [230413 07:07]:
> > On Thu, Apr 13, 2023 at 09:39:15AM +0300, Tony Lindgren wrote:
> > > Oh OK. Care to clarify a bit why we are not allowed to return errors
> > > on remove though? Are we getting rid of the return value for remove?
> > > Sorry if I'm not following the cunning plan here :)
> >=20
> > Yes, that's the plan. If you look at the caller of the remove functions
> > (before 5c5a7680e67ba6fbbb5f4d79fa41485450c1985c):
> >=20
> > static void platform_remove(struct device *_dev)
> > {
> >         struct platform_driver *drv =3D to_platform_driver(_dev->driver=
);
> >         struct platform_device *dev =3D to_platform_device(_dev);
> >=20
> >         if (drv->remove) {
> >                 int ret =3D drv->remove(dev);
> >=20
> >                 if (ret)
> >                         dev_warn(_dev, "remove callback returned a non-=
zero value. This will be ignored.\n");
> >         }
> >         dev_pm_domain_detach(_dev, true);
> > }
> >=20
> > you see it's pointless to return an error value. But the prototype
> > seduces driver authors to do it yielding to error that can easily
> > prevented if .remove returns void. See also
> > 5c5a7680e67ba6fbbb5f4d79fa41485450c1985c for some background and details
> > of the quest.
>=20
> OK thanks. So maybe check the pm_runtime_get_sync() and on error do
> pm_runtime_put_noidle(), or pm_runtime_resume_and_get(). Both ways
> are fine for me, maybe you already figured it out.

Is this an Ack for my patch?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ku3vzwlkkgg6oroe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ3sSsACgkQj4D7WH0S
/k7W0Qf/Rgd07O/AuT0Kk41gCkpBHZCzd8wW9eTU8o7iTsaBMNO+DoMiP+ErpDyl
n4ZccrJ0ceJBDG3sPBaGuTpY66YhEqyz76d48vOLwol77fEGLR1x5DJZ0cQTyIXf
3daHjGh3j7d20a71s7qUAphhAgOv5MKfk1TFgs6i1S/c02k+HEs1Qzame+l98sdp
BbXp1aJPI8jmPbBGd2uoNksvZM0kdXi8d/Zisyizpg7YPBjkvzPqnWNwNaPoIj4e
1xqGeCsDEjL2SrxDMn9ZWZjSXFhyX6iWjf/facRM2eP0S5ZCvrO7up7racHWd7ng
q69ywwoD0fJZP5JFjVMD7D7WIX3wAQ==
=4o94
-----END PGP SIGNATURE-----

--ku3vzwlkkgg6oroe--
