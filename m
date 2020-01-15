Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B8513CDD8
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 21:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgAOUL2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 15:11:28 -0500
Received: from sauhun.de ([88.99.104.3]:41256 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729442AbgAOUL2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 15:11:28 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id F2C342C39CA;
        Wed, 15 Jan 2020 21:11:26 +0100 (CET)
Date:   Wed, 15 Jan 2020 21:11:26 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v3 2/3] i2c: pnx: Use proper printk format for
 resource_size_t
Message-ID: <20200115201126.GE23789@ninjato>
References: <20200115200250.10849-1-krzk@kernel.org>
 <20200115200250.10849-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline
In-Reply-To: <20200115200250.10849-2-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2020 at 09:02:49PM +0100, Krzysztof Kozlowski wrote:
> resource_size_t should be printed with its own size-independent format
> to fix warnings when compiling on 64-bit platform (e.g. with
> COMPILE_TEST):
>=20
>     drivers/i2c/busses/i2c-pnx.c: In function =E2=80=98i2c_pnx_probe=E2=
=80=99:
>     drivers/i2c/busses/i2c-pnx.c:737:47: warning:
>         format =E2=80=98%x=E2=80=99 expects argument of type =E2=80=98uns=
igned int=E2=80=99,
>         but argument 5 has type =E2=80=98resource_size_t {aka long long u=
nsigned int}=E2=80=99 [-Wformat=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20

Applied to for-next, thanks!


--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fce4ACgkQFA3kzBSg
KbY56xAAsxppKd34siSFAxR3BSDE0/ILa4HAQbQr9MX2bEsybjidb2IjtGTBcwut
diw1wHjPBp65f5nF3JIt2D3v0vih4NcxdKr2VjNLPgFKlQVk7SKw81zzQdXmLeFy
aOlC2RpibZstOo96iMhHl27xh+GoKk4iJWOKHhzlk11GBUdiNTK4fWXab3InOtMR
91+6yDLCyhyFscrjgl38MDsCyTxfbwcYq+bT9JcQ6GjluhThCyd2smQ+QVhWBHu6
JONv9htsiiYkImh1YhNT/QXO1yYNLQ/00rzaCEhk9gM/NFELuNW/dqG0YXb++1SJ
IhOkavG3osri6Rw0ZTN/G+dIBgovRk1f4O9N28HpwcuZ5QbyT3Phlh/XiCeL/333
/5d22byi4gkYScj7tCStuYA2o1gOQhhvJb00ksZ7YCzrGZHfSQMJhhLbb/6oTHnz
4Che84m6t/WddFtLXdj2/JBbwnH0BAO1ZIZPhcBbtjG2Imi0juRJTrKmYjF/INr/
yRwGgGFkBr5pvmEANdaHPj2Gx03rSu3YyzPQFjIthAYDNxoe0hetYBlduFuJGAVn
/ZnrsML+5J2zULgiJldjWvnOIx/gFlNED7KR8HM6/nH1KGWFu6xQR2ljARHpqs1s
fXLJQf1nQxVgJ6gtqCt5ig9wVrvBavs8Ltj3Kt9m0+7yL6APalI=
=pULp
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--
