Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D319271F35
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgIUJr2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:47:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:33550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbgIUJr2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:47:28 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37C73216C4;
        Mon, 21 Sep 2020 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600681647;
        bh=i8s1jctz2K/ZUHJ8QZ2lmRLesxTIyRiopb6ppGpjSwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x+JX7PecopXEH+wJEA2OYTyrEkYLbb6OYOPC91c3nloDEzfMrHTDvECInXKPfqWRD
         YGP29m9bCgLK+HsJ0DukSt+2sdUTK4qwzJhLg240ocpWberJITNdiCKzX38P7ogsZ4
         mKlXkWK9WzGy1tAKcXQ/3ZcXqqiS0Rs+TS4dbNas=
Date:   Mon, 21 Sep 2020 11:47:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: ingenic: Add compatible string for
 the JZ4770
Message-ID: <20200921094724.GL1840@ninjato>
References: <20200904131152.17390-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CqfQkoYPE/jGoa5Q"
Content-Disposition: inline
In-Reply-To: <20200904131152.17390-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CqfQkoYPE/jGoa5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2020 at 03:11:50PM +0200, Paul Cercueil wrote:
> The I2C controller in the JZ4770 SoC seems to work the exact same as in
> the JZ4780 SoC.
>=20
> We could use "ingenic,jz4780-i2c" as a fallback string in the Device
> Tree, but that would be awkward, since the JZ4780 is newer. Instead,
> add a "ingenic,jz4770-i2c" string and use it as fallback for the
> "ingenic,jz4780-i2c" string.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to for-next, thanks!


--CqfQkoYPE/jGoa5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9odqwACgkQFA3kzBSg
KbbKVA//b+ciEqs6uM564d6FOkF7YJ3tQFNnmKg3FaKm0pJRh37mCpZm2tQqjzE1
JoLseCR5ne2bZ5YaHoSsUhfZ4udwdB9cRaRtg8R2FJKhwx2o1LiVOk1ww4s8IJvO
HmPSQcj8hA+C8Uz6x/3MZTYbeSA0z1VI7H6KZV9d4kd9vKs4brlrD6Q6Gj50gf4D
PUPNjxH2xqTEtg0nlQ/ZPgKE8EnSNJYj2OzjRWLnykfBGBrvpXIEU5gE5YOI4rX9
4j2+qW7SPif5f8EKBsSaSsYcmX1Xr/iefXqSi2NlxKvaFmkrh+/lLzyunev6HRcj
NJS8LoBQF0dHLTYeT6H/o/41psm2Kwr27JQrIff5JrKllPeqm/65cEEugzAnUpHx
IKyC6gXsaP73XW8hpkcqOVriBCyaHX87LRMN+BJCwZuyOdDIjcEzz72tCUyNVSFy
CQ7k6mjDbhrofCFk8fIuU1Xrp+md8+43lb2R7PcRLff61AHFKdqkgLzB9zSo44L1
A34AsEeX13ykjXOrvxAQ0u+u8hxqPuUCuXvUAWVWe6pHbGTpS+dmPqsZiBEZsY0S
nOlL2jFKPKE9wKeJH8LuB0bwFAGbjmNWB0SxYrXNGe0Rg/PGhd1kYlsJtzy2Qemg
MfnqPiJ/nKD9JYYi+d4H4XhuEYCSDMuv5xOAcNCH4dXFMvqQ6cw=
=A89B
-----END PGP SIGNATURE-----

--CqfQkoYPE/jGoa5Q--
