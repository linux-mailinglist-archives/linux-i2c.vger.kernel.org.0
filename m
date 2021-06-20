Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDBCC3AE066
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhFTUo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 16:44:28 -0400
Received: from www.zeus03.de ([194.117.254.33]:50926 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229901AbhFTUo2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 16:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=q4kklcMSCjeEZDRjP4J0pXWVCBBy
        8pf2UT874XhCs34=; b=ZcM7c4rFxYQWsv5x4HbTNE3VDCivh/I/GJr+VjwchRRa
        qfV2tFBR7r4JTkOHm2KWASFjgUdZz0ozltARvxErxudJ1CY/cCOt+D/A8npzffCP
        9i3cC2FtuvrD0xUqJKWw8gCYV53oDd3+He1/zpqcMvf/tOkvIRxDV2dVoTsBAyA=
Received: (qmail 1498487 invoked from network); 20 Jun 2021 22:42:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2021 22:42:14 +0200
X-UD-Smtp-Session: l3s3148p1@mQV6lzjFvKAgAwDPXzseADJuEzJK6i8P
Date:   Sun, 20 Jun 2021 22:42:13 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: i2c: renesas,iic: Convert to
 json-schema
Message-ID: <YM+oJa0XQUXv6oU/@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <cover.1624013699.git.geert+renesas@glider.be>
 <8fc6fdb175d65306e601a4209944a99e1e6fcb09.1624013699.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nNEq9FDnwdehK7cS"
Content-Disposition: inline
In-Reply-To: <8fc6fdb175d65306e601a4209944a99e1e6fcb09.1624013699.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nNEq9FDnwdehK7cS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 01:04:11PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Mobile I2C Bus Interface (IIC) Device Tree binding
> documentation to json-schema.
>=20
> Document missing properties.
> R-Mobile A1 and SH-Mobile have multiple interrupts.
> Update the example to match reality.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--nNEq9FDnwdehK7cS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPqCQACgkQFA3kzBSg
KbYCqw/+MQaqPvtGgBaK6TjJgAhsIqknfi978bFzU/JthXHRohVUwKuFpkrXY7U1
6hfnOxB2OR8FcASt06anQ7yeAZmx58EJU0DN5iwEvYolwb6O6eoAeGV3uR8cRxVu
xfFigO2g+s8fsdhoFgQOgAC5G5mjJWm1HXLSTAh4yXkJD344SUcb7KauK78SokH5
y+7U/DGnZGTqpRXPHurMoSR9Yy5KnU/YjNSIbdS3ELbMOv1oh47mPERqR1y47fwx
EdqbvNjx31mIraW0reTUE4DXZfzJNnxUHERZscz7cdSZmMKNgURHJsrdgaFcfKTK
1qZUxcJQnh1JD5JIb3NsmKDXlA7eene07gNQJ29FzlLP+czqDFePZ7okuwK1WNqg
4WZjhBPMWXOF83AqzxwBzFRlf0KXHE+v8E7Ph4MHohqFcfG0BFulBMaKW1zx1VJq
BFTCZO0zluczQH29W8zy9jPeg4RJrSq+o/LFQqouklTxGJvBuxfgG9ULENYjwhWc
hlHFQhleR2C1Jl7/U/t6u0wD4H5Dd7Ohu1TDuIh243XfBjPJpubvAXHvkXjHAdTB
R0uNpZWFSXMfPLI9/Cu6a5J43/9C1BuaJ+Qt9/uzyPNOdyLK7Ygr9yyVkfIIh9mg
flhYLCjgO+6tgMQUlQmEeKQqnu5ljbPC46wqdq/bbGboajNRrPY=
=S18R
-----END PGP SIGNATURE-----

--nNEq9FDnwdehK7cS--
