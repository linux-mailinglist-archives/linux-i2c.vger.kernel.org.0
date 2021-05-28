Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130C7394480
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 16:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235528AbhE1Ox2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 10:53:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235068AbhE1Ox2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 10:53:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A466461077;
        Fri, 28 May 2021 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622213513;
        bh=Lrxe/TMWyvwmf7ygo+QyhMj9j6Pj4RStvX4OYiza9iQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pw+ffeGOmaT9kjVirBL6kxSrMaBcn1c6VozdXANZlU9m9w9ZeJ7RFf2hFyuQocw9v
         U9qrto9vSopKHUgZ3bqgz4faWi7g/NOpgWCfKHpRxc7vBaS5oyqMXOLb4cFnSIojSs
         23Bc6at18vFjOP6K+qOvcCYJR6om4Joc0NdwFrcEfh8Ya4ie4uIRc4cnUv6HfBv0yp
         RLAQ6Be9KvG9MpHD9NiuHmcpUr5tRrozk4I3F6mbLC5byHxBmuo1W0mqaxRIWKRSo9
         OyUJ2Kdv5L1N2URCV3o8lL11z00Y1RQGyXV8TRV1M9zTospTqR6XRTCbcUIaDJdS79
         rpSKkGsbUE2Kw==
Date:   Fri, 28 May 2021 16:51:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Peter Rosin <peda@axentia.se>, Maxime Ripard <mripard@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mux: Remove reset-active-low from
 ssd1307fb examples
Message-ID: <YLEDhlZjJ8aKFzke@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Peter Rosin <peda@axentia.se>, Maxime Ripard <mripard@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20210528111049.1804800-1-geert@linux-m68k.org>
 <YLD5N1OMXFg3yHp9@kunai>
 <CAMuHMdXKtbp3zVO6OY3NugVA3wUQjmvy5rLKJPrTjOuYS2wMOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3rNw/NSNDxxB1tPO"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXKtbp3zVO6OY3NugVA3wUQjmvy5rLKJPrTjOuYS2wMOg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3rNw/NSNDxxB1tPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Now we have a conflict with this series from Rob: "[PATCH v2 0/6]
> > dt-bindings: Convert mux bindings to schema"
>=20
> Sorry, I had checked that my patch applies to today's linux-next,
> and wasn't aware of Rob's series.

No worries. That's what maintainers are primarily for :)

> Alternatively, can you just drop the second chunk?

That I can do as well.


--3rNw/NSNDxxB1tPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxA4YACgkQFA3kzBSg
KbZYFw/+L24o+zUp0uVd9K0F+ioVDbij5ayNbUe3SFiNb/JAy+UxdtGAL+ypD9qZ
gDqDVyycN7aYGxWbeMwSAOYjXm/AN5xMqZ79xrKYm6u0WADHR+ptI+LAdUPS1cqW
EZ37q76ouaD14ixyZQjcsMWg0BzgzMbVBLtCfRAJ8GQe72B1ddDXi8K7GHPELZpU
rTulM1XWQApClmb4Op47nscLrTxeT4tJEI/1nSVlyieH3gV+J5MDlWp/+tvwnCRa
5bjcXua4I5OCPrVwSOJiW8C5yUoME513dL06B5Rq6ow91dbOKBMV3ZfGQf6JJpPy
bSOe7QKhdIInnVH68geYp7GWOw+ZMq/QgR0/8BCpwv5my0bbt8zToir/n3ugQ90G
Fhi50coKzvvwEvUIsuDxieMC2kJnyIYIGNlRL2vaIaYMbCDoEzQb999CP/tva9gI
eRuQ0hI/QsYJow3u8uXqaEPrg55+Dd9oWVvZRsStb3cfeVlLRnYhtNQIuydQqrkt
dXICStBii5RGLGpiN5xo5nHvWZIduQTv/1vE0ZWQZvCo2X1zVI7iFMEgG7vJWCYA
9LZfNGzpN+gCQ2WNrK+kJPzl0dtXtPQXzJe9o3MvZInzG1kun49mDZK6ti9gvNIK
brPud1bpiE48PYGQBEHQdpnlB/Csw+jhkVE4ZnlmiYlLjygjeRI=
=WXzz
-----END PGP SIGNATURE-----

--3rNw/NSNDxxB1tPO--
