Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235BD39C179
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 22:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhFDUnA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 16:43:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:40040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229913AbhFDUm7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 16:42:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AD82613F9;
        Fri,  4 Jun 2021 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622839273;
        bh=0P10WfzGqEW6mL/Dx3LE8Az9NlMnMiyptL8StZnzYJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ga8oZxdLMdZ9aYcUelh9NICZG5+oaSdWxIwPscMS0FO093QiPbTY4Qqpld5D5dbth
         T2vE6u32mPjMA2P0vbgOqF96IB7Q3wFk47uf4OyzGALs4AYYc/hnt2TNO4wvjGGzp2
         eUb2LdxLUWYYBTJB6+q1scxd5ZZRmikipdGA+cWjDJCPfKAI5+qRNdej4C6DKYbpQY
         pGSFPt3jJJj9W9qVQlBawwjxI2V6hoBaKJAuwjPghnxHajsQ6qjYEMsh1Yy9jA6fov
         TKllky5TuQ1UPTyToosjDRYGJ47/JwWqTtb/77cg0RMsGLVjtsPhaKmXOuIQpk9xF2
         n71YVeXMQnUpA==
Date:   Fri, 4 Jun 2021 22:41:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
        Maxime Ripard <mripard@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mux: Remove reset-active-low from
 ssd1307fb examples
Message-ID: <YLqP5GGjrNtCJ2Pq@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
        Maxime Ripard <mripard@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210528111049.1804800-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SH0kaXeTd8eMCD9v"
Content-Disposition: inline
In-Reply-To: <20210528111049.1804800-1-geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SH0kaXeTd8eMCD9v
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

Applied the first chunk to for-next, thanks!


--SH0kaXeTd8eMCD9v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC6j+QACgkQFA3kzBSg
KbYEfg//ZaOOj3nTUrNJPfgcOrlmWuVKlhlLp3HAwqhy1mBemv3zQJf9+qXeZFla
KTq3CSBp27y/skhixjzQz8EVaQJA3mbBuknsbDjF+MnEsepqMjSCICnJoRnqFX6T
/7CowhvM8PDuQIU1ylpBTdvLr/N7gLCWpNQ5dF6km2OFSQ2UEdK9evH9ahpbQY0c
158gvHIkqPa7CNY7ihUy63K+4WSWQeEVZYyL6dA8BHtWlU3kWzQgSSyiqu2ItVbl
O9JtR4DkHztmmzHfS0L6HcjSKLdJg6Pc3JvlPMT2nwhG+69YEuKYcjE8mVoHFais
j2PBxkPecmKU9X5o9veIvRpyH6yqE89cVn/YsYiknvBZUeF7SqmytGipBzkYa1by
yrTcR+82Cb/iuUiJyQ+OU9eb3RuLGBc+G7k4rD+zAWDZBo2BKa4J2u0uFNGkxJGS
1uCWQGTds6Qhy1oZKObpgRZ+Ocqd9uM8kl5Nthe0q1oZ10ZPDotGhk7bCkUKFZhk
Xgx3Krlry/+s0Mr+4ya2Cswib4iNuX2m45F5MKX6/j33hlCWGdTf+/NE6cvY0aqK
qaCkuOEEvufbSah72VrnsCCuxp1U4jibmfiyoDTtAuc10NtbQ00eLPBCwsw2M745
3YyBu/h1SoOSIZkjwKKGBKPfBEsYyv3nI9sd+qrAZ/rx3/vuL/M=
=inDf
-----END PGP SIGNATURE-----

--SH0kaXeTd8eMCD9v--
