Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E520435EFB
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 16:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbfFEOSP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 10:18:15 -0400
Received: from sauhun.de ([88.99.104.3]:54796 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727904AbfFEOSP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jun 2019 10:18:15 -0400
Received: from localhost (p5486CB35.dip0.t-ipconnect.de [84.134.203.53])
        by pokefinder.org (Postfix) with ESMTPSA id 87E5D2C016F;
        Wed,  5 Jun 2019 16:18:12 +0200 (CEST)
Date:   Wed, 5 Jun 2019 16:18:12 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.brown@linaro.org,
        alokc@codeaurora.org, kramasub@codeaurora.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190605141812.GA962@kunai>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
 <20190605062020.GL22737@tuxbook-pro>
 <20190605071625.GK4797@dell>
 <20190605075656.GC29637@localhost>
 <20190605082047.GM4797@dell>
 <20190605083353.GD29637@localhost>
 <20190605084921.GQ4797@dell>
 <20190605085527.GE29637@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <20190605085527.GE29637@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> To enable dynamic debugging in driver core you could use something like
>=20
> 	CONFIG_CMDLINE=3D"dyndbg=3D\"func really_probe =3Dp\""
>=20
> That gives you two printouts per successful probe, for example:
>=20
> 	bus: 'usb-serial': really_probe: probing driver edgeport_ti_1 with devic=
e ttyUSB0
> 	bus: 'usb-serial': really_probe: bound device ttyUSB0 to driver edgeport=
_ti_1

I agree that this scales much better than adding strings to every
driver. Also, the driver core will report failed probes other than
-ENODEV, or?

Regarding this patch, however, I don't care much. I'll let the driver
maintainers decide.


--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz3zx8ACgkQFA3kzBSg
KbbwxQ//RQO8EXcBxgeJWiAo1YAvXE5bXco6J0Kag8kCqqOMHBIScESwy3pPkg+5
DS/gtk2oJhvxOzUsFV1pLy+Eo3XbwN91CqbOd4QN8EEDTovnAWjvkzfyvy71DBgY
w+O3WXPA4vsZ1i3907HUdaUAgfcWOLJYe6TaJG/4gkS43ByT1eK54rsOg9Gz1YZZ
L06igURCQudkaB/OGzVuNk4nkyd1v5HoSiMcuYHKp9ifOf9ID992LpJ47FIEb2h+
QFFSc/M5XGGETtUuQxdPW9DjqthrSUKV6hKoIKBMOG3uH13JUVbCCB8DIyTvb8h6
UWcDfjQp/s7f279yVjhnE4+oEnKD4qzrsHX5+rzdeZ3rbEbLvjtbX7DHkeT6/ql7
FcHnLelb3wGM0wSBybsovpH7zyzMR1g3CPTuClmjtuxNTQKcdRdZ6+7ZimA0KdQE
/zQEW/QIwIutYmpU11iei8VT5BIg3ihI+xJOrFvdJMpmsrf9Y0WAR6j6kypBHPAH
V750wMmIEQVgd+tordV7qB+HYdcCQspA2Beqglhz7Lu0f4ynexueEzP4oLQZRohR
j/1C+7+dTDz43EIXL6OJpaXpyJPzeTnrSuyuVOquAJcXSPa9ALu36A7QFFsjU3t+
oyeAoN/LwsnU5AxUy28uOyBgDldBrwrihTH/i0GU4pdAn54BY+Y=
=a6fa
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
