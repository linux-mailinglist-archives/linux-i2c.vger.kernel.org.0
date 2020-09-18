Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9429E270747
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 22:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgIRUpk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 16:45:40 -0400
Received: from sauhun.de ([88.99.104.3]:48526 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgIRUpi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 16:45:38 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id 73B1B2C079A;
        Fri, 18 Sep 2020 22:45:35 +0200 (CEST)
Date:   Fri, 18 Sep 2020 22:45:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     qii.wang@mediatek.com, linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Leilk Liu <leilk.liu@mediatek.com>
Subject: Re: [PATCH] i2c: mediatek: Fix generic definitions for bus
 frequencies
Message-ID: <20200918204535.GA52206@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>, qii.wang@mediatek.com,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Leilk Liu <leilk.liu@mediatek.com>
References: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
 <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -       if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
> > -               target_speed =3D I2C_MAX_FAST_MODE_PLUS_FREQ;
> > +       if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
> > +               target_speed =3D I2C_MAX_HIGH_SPEED_MODE_FREQ;
>=20
> Thanks for fixing this. Indeed, somehow I messed these up.

I read this as Rev-by for v2. Thanks!


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lHGsACgkQFA3kzBSg
Kbb8+Q//d12J/hP68UWUVx1wF2vUsU24vGA8FJZMSyvSlrcOD6QZRalGsA6LR8k1
w6G70LEDSRlDVe1Q/9NuYJT6enGqXhGKs2up0qnGHAB14N6S5WS7hMQJXSFvc6Mm
xXnNV4gFGcXfcqZMRgl3er6mDeMKJh+Sa5mnmaDhViT11VegGYkAr+VjFOyg5qLh
EzR4ZO8NoMCi/hvTkiIu3MQNyKPQy33Xq4SdQqGC/x1ew7DWAwopPmQsooL7zQv2
dqYd7X4FN6qcd/oF0K6tMyY6bbUVf/XiCfruyJjRf7hSESw/fc8HkFjF4oN8oIKR
x/sVPceOiMjHpu186UGBK8ieupBQduP5PgewXmFM6Xgsj2hOBV/lwIFF2JoV7wO4
ETFZJVJUNbLb8XjavbTVRbfaVSHTEa4pR1dGjOARj5sUdpEV6jOGY1ziRGntUh0u
7DTZK0uZym8qms+6SB2dmHakkkXISGeAi/RNjx7vrmhShh1C4auluXWO8/SbIkGU
Nm6lrKP4hmEXTAdvAcivMwnLHHZ+MgaWGaAZtSJv3EfqoYpnZRSNTCkFTLiRyAh/
nkZn0naZnd5tO7jMr7U/43ZSHi7sTDBcPNnmx+e/qE+EZakkDBTXO107YHnks69E
CQRE6DyZ3jdjeTjG301Y65dMW3n+gJq7ZlpE+pUJZVQUyW9zyz0=
=/Aw9
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
