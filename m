Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C393943CE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 16:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236474AbhE1OJa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 10:09:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:44390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236436AbhE1OJ3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 10:09:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84BE8611CA;
        Fri, 28 May 2021 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622210875;
        bh=iyB+zXEfKoOLUBLJ6l4+sNK6lu0AcC+Ota61YjKmV18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=thpUzJ2MbVAqlNv/rs5x+TXe91Knga76ol/gJhZkfU84tLH39Uh1qS+UUy0ByFGDf
         LlTUK6yc5lyCg6seLj+EfA/js+k/rHOiQZZREMBqfxLldh6usxKeeTeT0SW7wkumXO
         LzagjgBCInJsq58ToMjr8WNui7RXObyVp/iHDUXJ036GCyBhtGj8EGOpFuO0nhBWbw
         NwLZmarT3Nt7pPS/xcazaNRFradlJElJKoTFLOFuHDKAu33ynum68GcdYJFgQ+VcRb
         wpGc0XNRQN7Uo/0y3cBooAGrRMvBqXIK48oIKw7WkczhYS9b+HmbkYKS6L4gISCk48
         /b9uskLlN8BTQ==
Date:   Fri, 28 May 2021 16:07:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, Maxime Ripard <mripard@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mux: Remove reset-active-low from
 ssd1307fb examples
Message-ID: <YLD5N1OMXFg3yHp9@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
        Maxime Ripard <mripard@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210528111049.1804800-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9xSq53ETjVfImI7D"
Content-Disposition: inline
In-Reply-To: <20210528111049.1804800-1-geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9xSq53ETjVfImI7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 01:10:49PM +0200, Geert Uytterhoeven wrote:
> The "reset-active-low" property was removed from the ssd1307fb bindings
> in commit 519b4dba586198ee ("fbdev: ssd1307fb: Remove reset-active-low
> from the DT binding document") and from the ssd1307fb binding examples
> in commit 7d7e58d30e046d34 ("dt-bindings: display: ssd1307fb: Remove
> reset-active-low from examples").
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Now we have a conflict with this series from Rob: "[PATCH v2 0/6]
dt-bindings: Convert mux bindings to schema"

My suggestion would be that Rob adds this on top of his series?
Or he provides an immutable branch for me, so I can apply this patch on
top then?

> ---
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt  | 1 -
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt b/Doc=
umentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
> index 21da3ecbb3700c06..1bf267302251bb63 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
> @@ -62,7 +62,6 @@ Example:
>  				reg =3D <0x3c>;
>  				pwms =3D <&pwm 4 3000>;
>  				reset-gpios =3D <&gpio2 7 1>;
> -				reset-active-low;
>  			};
>  		};
> =20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt b/Do=
cumentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> index 8b444b94e92fde83..51356fdf2becc3f6 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> @@ -80,7 +80,6 @@ Example:
>  				reg =3D <0x3c>;
>  				pwms =3D <&pwm 4 3000>;
>  				reset-gpios =3D <&gpio2 7 1>;
> -				reset-active-low;
>  			};
>  		};
> =20
> --=20
> 2.25.1
>=20

--9xSq53ETjVfImI7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCw+TcACgkQFA3kzBSg
KbaRqg/8Dh7X/oMDCos5e9jW2tODdCiw0+2xG9KHq7eNYI9Na9R2P9WkDLqkOMpk
VIs+1uvtSAP0O2ZlsdbvCGkyZD7Eqjg/bU1MKmSAwtPoVO+mjxFbdSQqKTxfsMOw
rhYTBlW/Y/Be5DbwJYPNuKL0RuC2UzVMRE/vr5jOb8rb65fMpoyz4hpZtWLBuavH
PGl5CznG18azNM+P1JV9V4BfrzF4kFqgpLew+tSDOgZ4rhpqDh9SdsdDw5w8XAxM
yLEduVinEqwNn3gV5vXKbbgrbXSDUZzpmlqItDSQa+O0BYYv5ryJLCFjSslxr3q4
vN6lJaRxYmhP/ddwzjYkrVsnEl8QszLFVrL8D9RuAfjM0/BKCCx2Pw92XECJ76oh
nx8tbz3MbQPF+irH1VpmGrJ9/VHWGNrp1Lqfn+v0ptXogdEEjHHg8zGTQiQkilwV
mBjxnE3GafZiXq0GHS2c5ZCt4+/lFrHxYJOH6dZcqdX4wSB5LS0QQzYlJr4FpNH+
Lqu1pbS0VJqwMU9ye6GpRLdcH/5itAuW0/rfVZ6AWh1W47ly02W94tRV2+VD2Ya1
LoojuUoaZNzSCU548Xc6DkIaj5CZfseJJpRu0RpwAg/roS+3/h7FYEX3+SEWBx3H
HeCrv3uRlNS+QNPPKCO6Ri65iDceDp91lWNmpghdxY+Y45bd7/I=
=zijl
-----END PGP SIGNATURE-----

--9xSq53ETjVfImI7D--
