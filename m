Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDDF15CE20
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2020 23:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgBMWfk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Feb 2020 17:35:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37954 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgBMWfk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Feb 2020 17:35:40 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 74471290551
Received: by earth.universe (Postfix, from userid 1000)
        id C1CCB3C0C83; Thu, 13 Feb 2020 23:35:35 +0100 (CET)
Date:   Thu, 13 Feb 2020 23:35:35 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-i2c@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bleung@chromium.org,
        enric.balletbo@collabora.com, groeck@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: cros-ec-tunnel: convert
 i2c-cros-ec-tunnel.txt to yaml
Message-ID: <20200213223535.j2ronp5jicxwa3mv@earth.universe>
References: <20200213214656.9801-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mekopsgxbxuqqg5i"
Content-Disposition: inline
In-Reply-To: <20200213214656.9801-1-dafna.hirschfeld@collabora.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mekopsgxbxuqqg5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 13, 2020 at 10:46:55PM +0100, Dafna Hirschfeld wrote:
> Convert the binding file i2c-cros-ec-tunnel.txt to yaml format.
>=20
> This was tested and verified on ARM and ARM64 with:
>=20
> make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings=
/i2c/i2c-cros-ec-tunnel.yaml
> make dtbs_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/i2c/i=
2c-cros-ec-tunnel.yaml
>=20
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---

[...]

> +examples:
> +  - |
> +    cros-ec@0 {
> +        compatible =3D "google,cros-ec-spi";
> +        i2c-tunnel {
> +            compatible =3D "google,cros-ec-i2c-tunnel";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            google,remote-bus =3D <0>;
> +
> +            battery: sbs-battery@b {

This should be "battery@b {", since node names are supposed to
match the class of the device instead of the name of the device.

> +                compatible =3D "sbs,sbs-battery";
> +                reg =3D <0xb>;
> +                sbs,poll-retry-count =3D <1>;
> +            };
> +        };
> +    };

-- Sebastian

--mekopsgxbxuqqg5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5FzzcACgkQ2O7X88g7
+pqUqQ/9GuMhk5davOpFF2G5yyFA4XxDClQX2xS3ZwIm/ZhjexGqwJY4nHOALGrq
wY+waf/uO/St1kcxRplnbInLSvztdJdwGOYGX8nGSnBA/IgUlA32S/b4TId6R6Bt
L+BgDuigt6KAuoL8SXfYBaIBwLlIUggfQtqgizfVygyy0NIFp+CeRoXnuOf80MEh
eTe7Mx6hnBlna0U1c5zLoRvqmzkRcMtFY8koTnBkPhrQTbzGd3AuA3YjPVQjJdpf
DM2Ze5fzCcimSEqSEoygZ2VMaGU1tMHfKGN0bRccwu+dpAo38JjwNavTRjFMks0T
Tzr+rTkSfXywTsl4hGQ2D4zUn0F0NhPIdQ/dDjnBLVf3HSFW49VonzhvxE1dV1R8
ZpY8/i8MdVnSfp4q6qLnKZdB3u6uOg6IhxA9WdYb2/lmn7cgiQkRYfW0ON6HkOA8
kmLwGikbDPKw+iFn56ut5wS4011HLKSYE5vYdudLg5uphBanJfOydh3HSAL3cRGO
Lp3Uw0fTy8l/gRoEhdeSAld8afRxXiXeYBLWKur4Y+408eymJY+PnhNjlt0yUSbo
6xm2Ps1xe030tAjjCKjGzoXGVXKjQlPD1AzTNfZkYQoUOPH7yuJ1nwa8CZ0MQvGW
BLak1h2FccIuMgUV64zrDaKzI1MuQZ/d7YeS+B83zTaaBZbG8Y8=
=A5E0
-----END PGP SIGNATURE-----

--mekopsgxbxuqqg5i--
