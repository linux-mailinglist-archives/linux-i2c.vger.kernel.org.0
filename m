Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AC23AE063
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhFTUoY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 16:44:24 -0400
Received: from www.zeus03.de ([194.117.254.33]:50888 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229901AbhFTUoX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 16:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=rPEDGrMnpzriAaduvLJy8olF7Ekl
        3L3+W37+QAmJ6rE=; b=OYmJuv9Nv9MTF3G+BaV/BVsmdH8ZjKAyy1uiMXaqlEMX
        dhgzq5Xr3+nN5GJiqZapeZK3aKDol435vHSqS/U5vZMKv6NT+IqsRlWeedsTMjdW
        9l1a2D0rTlT/TL3QX0kesdwYFZ1B+Q66RUqltAOMDxUmv8pbym4IKn0HOIz44KM=
Received: (qmail 1498434 invoked from network); 20 Jun 2021 22:42:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2021 22:42:09 +0200
X-UD-Smtp-Session: l3s3148p1@pyYylzjFuqAgAwDPXzseADJuEzJK6i8P
Date:   Sun, 20 Jun 2021 22:42:08 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: i2c: renesas,iic: Always declare
 generic compatibility
Message-ID: <YM+oIBki95i+M3m3@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1624013699.git.geert+renesas@glider.be>
 <760fec5fa71bfff4c7bfe944cfc385f9d8e1945b.1624013699.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XQAhqO+0zOPiVfGE"
Content-Disposition: inline
In-Reply-To: <760fec5fa71bfff4c7bfe944cfc385f9d8e1945b.1624013699.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XQAhqO+0zOPiVfGE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 01:04:07PM +0200, Geert Uytterhoeven wrote:
> According to the Hardware User's Manual, automatic transmission for PMIC
> control (DVFS) is not available on the R-Car E3 and RZ/G2E SoC.
> Experiments showed this really means that support for automatic DVFS is
> not present, while the IIC automatic transmission feature itself is
> still available, albeit not super useful.
>=20
> Hence there is no longer a reason not to declare compatibility with the
> R-Car Gen3-specific and generic versions, and the corresponding
> paragraph can be dropped.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--XQAhqO+0zOPiVfGE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPqCAACgkQFA3kzBSg
KbavKhAAieylew2XvqIj0S/fUzUjQEJYqEr++I7I/JUpyhP7IYMzrzrcrbGsFO2m
nsgjOJnLi0kYQyHEeLzdvY+qT1V2jQu8JXtWGUsaoHHAx2nu/rsIX5FvQDvI/Ojk
cp0EX0X2hmspmooScfPP0TzdBF0b/gZeiUQb8O56zWYtKSFG2PnkrvWD9Y8KbqKf
tnq5VMt6jxkasU/UGQr43d0E4BD4aN0RdVhosYmxkuxbuNQ0VMW8epuO4PpZv/KI
IvMOeQWiCd3HuTvE7a2lf7+yAzg3ZE0gsJSR5Ffzi7MF6/LLDvtgYSQ/ZIpCQbsH
ULe/9RvQIQJxRUDyMLTVO1O8lw0155iW+gPkaFspUvrIeBd8JOfqYtyK13oqjI0U
7RjLC58C3AX3+0tTr2pXGcozPTHkLt+bAgpMF1pwlnt1dzG8a7xSyJmHypiNt1du
lYLzcynOZrKnMncFEz71p0hNUt8t8DYG6SGngIOGGvMT+r8A+stpjIZeax//MYdu
Q49xKzS+S9bBPQO9lxu3Ky/P+UPMGIy+n5VvrDITqXDl0TAxjevXn9mxRqOvv9ez
9YHvuIJmGhIbATtoMNYmQGD8Jz1UcU2W38kR6MJImRWJOWyxcxd+lSOcO7A3MT99
soNe0D26K/XFfXYqxtbdVf2aA6pU0dtANCfdpidWi+Otol7oDak=
=us4T
-----END PGP SIGNATURE-----

--XQAhqO+0zOPiVfGE--
