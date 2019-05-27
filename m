Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05022BA95
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 21:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfE0TPh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 15:15:37 -0400
Received: from sauhun.de ([88.99.104.3]:36064 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726801AbfE0TPh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 15:15:37 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id EE0C02C04C2;
        Mon, 27 May 2019 21:15:34 +0200 (CEST)
Date:   Mon, 27 May 2019 21:15:34 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Annaliese McDermond <nh6z@nh6z.net>
Cc:     Eric Anholt <eric@anholt.net>, stefan.wahren@i2se.com,
        f.fainelli@gmail.com, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
Message-ID: <20190527191534.GD8808@kunai>
References: <20190508071227.18609-1-nh6z@nh6z.net>
 <4174B26B-4E3A-4CCA-A5ED-BE62A3B5E66A@nh6z.net>
 <20190516075848.GA1033@kunai>
 <2E6EDCD1-E0B1-4859-BD75-EF411D3D4C6B@nh6z.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rz+pwK2yUstbofK6"
Content-Disposition: inline
In-Reply-To: <2E6EDCD1-E0B1-4859-BD75-EF411D3D4C6B@nh6z.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Annaliese,

> Thank you very much for your response.

You are welcome.
> I was also similarly nervous about a clock provider being outside of=20
> drivers/clk, especially since one of the instances of that I wrote.
>=20
> When writing this, there was a certain logic to putting this inside of
> clk-bcm2835.c instead.  Eric may like this approach better because there
> will probably be more code reuse of some of the dividers he uses in that
> driver. =20

Regardless which solution is favoured, I am going to apply this patch in
a minute:

http://patchwork.ozlabs.org/patch/1097688/

It enables this driver for ARCH_BRCMSTB. So, the solution should work
for this as well. (I don't know any of these platforms well)

Regards,

   Wolfram

--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsN1YACgkQFA3kzBSg
Kbb1dw//QS+QQ+6Ka2TybGbcATjH7NybVWBniOTptTCbQCN311faU5s1tZX8Sgpo
Ljx4Y59PQRKdaB6LoIjl9d8lHA3LaMfRg/vMij5g552liEl6eWp8KOBlVUEsBAVU
DYkU9sNnEcFT48PyM5fzQLtPTcYUFlfbs5VSXzGDqQzliUNzMkdGIfWNTYtgYtRO
ckLUDRc7ALC/QZ3y7WEJqr/goaAZV2+2ao5D7jAe3Eu30ZvqrVlLCHPf+vtFDUJ5
6P3FzeGRTvLHzxhW5Segip1iEyMNOjLuZvc0+fXgOyLND1DDVrO9cws7j7u9pyhl
zl2Ot2xAOF3nEVnkxcpTAsEx9m07cW95wOhSTUDcW/IEIEqrlp1krlqqIoy8mWN3
wT2Gnno+g8Wr/It5BC26Ei3WaW+ZLqFQxyePxrdFqG28/60qLBKaKGsHyCNFh9D/
SSwHqEfwRs9QkUQTA1pKaMZIFsrJg2AVL44CuPpcS+xTcUowyFI7tBJ+t2OogGrh
2qPFfgUpRkD4EoxKiZCcGwaEtY5qcDXZOWUWo4tTBUopXIbeLhaEva1U0Yc28Kx2
/+PRal68slAZt31SP5f+FcxXfq6fb/RIOR6VRS2R69ooyxj1/2tCZcxTgvJ07h1+
3XkG3WfsyjKjYuKHq4YKabkaQ2t5pXhAw3IOJdhoKLGrOylyryk=
=u+lI
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
