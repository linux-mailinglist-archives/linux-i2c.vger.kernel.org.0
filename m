Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E13E0595A4A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiHPLfs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234917AbiHPLfW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:35:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F7E213;
        Tue, 16 Aug 2022 03:59:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B5B116108F;
        Tue, 16 Aug 2022 10:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50996C433D6;
        Tue, 16 Aug 2022 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660647563;
        bh=Q14GK1ttq7bdP+vgMrGUxvdBjHDjlBElsRQ7/2qJ/QA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uy9Qbv1B+24CwNtwFT1jyubs/ylb9Egk9oGGmnFC+8IwME7fZgoLOETAICQIA3h2U
         ihGW4+ir2mvRyUlIsHeVK0lf9kqCcqU2p7oPskknfJIdUivw86e3YWm2tUX8gydppB
         LcfrRmcRQ8SQ1IBrjEv/ZdlahjM7/fsGSMywUcSu4uMZYnkIg7UL/A03zMoyLw3mu2
         P0WGFiHpiVfJ8dH6A8Bi8wtoWIKgKqKulvVtG8g2anDE9bO+p4QJGnEr6qYRaGWrNv
         O91BqmZ/HNK8e9h/qF8ptHxuIrX0IytbM6w9EMS7TvEi3IEGnxXVP4Zhal/weNUa37
         xgbPTSdQhylMA==
Date:   Tue, 16 Aug 2022 12:59:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Sekhar Nori <nsekhar@ti.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Crt Mori <cmo@melexis.com>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Petr Machata <petrm@nvidia.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Peter Rosin <peda@axentia.se>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Corey Minyard <cninyard@mvista.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Subject: Re: [PATCH v2 0/6] i2c: Make remove callback return void
Message-ID: <Yvt4h3L8oPBGOIs9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Sekhar Nori <nsekhar@ti.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Crt Mori <cmo@melexis.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Petr Machata <petrm@nvidia.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Peter Rosin <peda@axentia.se>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Corey Minyard <cninyard@mvista.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0fosoJa+IeyaZHMB"
Content-Disposition: inline
In-Reply-To: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0fosoJa+IeyaZHMB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As some conflicts are expected I sent this early after -rc1 such that it
> can be included early into next and be put on an immutable branch for
> subsystems to resolve merge conflicts.

I pushed the series out now, so it should hit -next tomorrow.

The immutable branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/make_remove_callback_void-immutable

Enjoy!


--0fosoJa+IeyaZHMB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7eIMACgkQFA3kzBSg
KbaSSg//ZLEFXJ2AC4iQCquvREXL77sq8aBYuMF1drDpCKCcirvajM+cix8mBAAv
1RyNuz86FIJts0gipoB3pI5sWJFZUbyzrEe63PIS9ZJgoaXrhfpNnWtI7HS5dVpm
lY5AbbbG8lNBpzqjdSOrVYBgK7V4xgez/RPqHGM+zaStX2Hsfyqi1nk+qVhsBmhp
5ZrnP6Ccw6jjOaJCB9f1uuMLbqXY87PC++y6Dl9voZEfPJuW7Abv821n/sYhXc2Y
bdwh9f8eVbW7ImBR2pDcAUNKrTHT1QzRROkumB9uKQ+Tlljf7NhHleKjTuIsJJyL
GXaxTOcD0SEE71cuEmIKBeL3aKRFLGrklpKPiWtG6F5nuKFYeynOZf7cc/jBEF7Y
f7LtnW0yS9/oZEsLY2lbUW/OzzBF4Dk+CoqDV9TFcZgyPbpMuupDQa9soCE8P0MW
pRu7FCGH+zASyoerYPZ/HHEg9Y6v0VfhsBm71+utgP6HPEfBbLn/yE3xLvalbN58
bt7zDI5nyWScDcOHDwBqI4qwbYCrNPetiVVUoic2sl7ASDVNZe3jGcnr0fTpljSj
693qZgMk/tqzS2EI0eabivGDzXl/zp1qubjTqZJOsL/Nu1nIq5jIGFTfuo2LbnQb
2vw3h55QjleuUINeAkulhjcKtHGf1AS9A1vAJ9rB7skoivdhvWI=
=phI+
-----END PGP SIGNATURE-----

--0fosoJa+IeyaZHMB--
