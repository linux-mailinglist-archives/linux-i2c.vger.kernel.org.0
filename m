Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F88B393E3F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 09:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235479AbhE1H5r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 03:57:47 -0400
Received: from www.zeus03.de ([194.117.254.33]:48674 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234430AbhE1H5q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 03:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=g6cQeSyrRjAF1PDO+Tp1D//cfRPJ
        fbWLKPHWUxbw6k8=; b=GpYtG/V+We85rBsnEM946a8ruAb/iGLwJHp39oAPyNJw
        byXMxqHz7zjovL2Mibj6VU64aiB3EFU+dGuecrlUUI1xOo8NAZfeEEt6YUptqoFH
        GEWuW17Dj0dHg5S7w4qfUt7WhgqoI4Zn4dQPLeMv7Z1dhgyY103a4JG9t19LeYs=
Received: (qmail 2272305 invoked from network); 28 May 2021 09:56:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2021 09:56:10 +0200
X-UD-Smtp-Session: l3s3148p1@iW1+NV/Dft4gAwDPXwoXAEGfoBQqamfc
Date:   Fri, 28 May 2021 09:56:10 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: i2c: renesas,i2c: Convert to json-schema
Message-ID: <YLCiGmH5kqNrtdAt@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1620138454.git.geert+renesas@glider.be>
 <e80b6d1825d280b25f00a980c2caf778c9907d85.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pd4J8KlduPZw++UM"
Content-Disposition: inline
In-Reply-To: <e80b6d1825d280b25f00a980c2caf778c9907d85.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Pd4J8KlduPZw++UM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 04:35:55PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car I2C Controller Device Tree binding
> documentation to json-schema.
>=20
> Document missing properties.
> Make the clocks property required.
> DMA is supported on R-Car Gen3 and RZ/G2 only.
> Update the example to match reality.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--Pd4J8KlduPZw++UM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwohoACgkQFA3kzBSg
KbYrqxAAmrgWOIa5sZ1d3NFnmiB4Y7HVl96af58+TU/SvW5kudXDgDbS58baD2qn
ARzVVTdL2x6ASMks3cK3C/aduqltKg8ieR6HhKVUPc5rge7gMdqwH+i4MAuJf3bD
MhVBc0uNHhLFdgUWtq3xl2U053DVy9MRCvBSZoE43XOOU7zH2psCwjlAHOF9skfv
tq/nfhD0exo9dy/FbVRPES4jBWKquFWNJki/QB3mAmJxUZB3rlY2C6WBxamxMcyN
z2ZI5G0NsIn9zCjw1n+9aZn+Ng8ZElVEMR2aECX4Q23PGsABNDfBww6Aanie+99d
b9qGNkPovpvdr/20JxEKXnw2PE8TvRGLUhW7j22/sD3wCgXe2K+FyaPct1A17hTv
SkZ/1ZP3WJVHf289DcFl1FcFPw3Tap1MWcOUMR4fRDxKmVR41H80I1AqUWSp7TAK
0RQCbfleQupciufYUUScWf6JgDpiZnFCbMVvFenJgbw+pkrWAGWiqlNKolfIbHK7
2m8FEkI+WemMGjtcRm7Kmy71OYlt41Rvry0yE4B1u8w4SLWct7+ye9pb+Em32iBQ
WSe/7p9DmQGeSQdGHDkX0JHV5ZI6811RbShGK1dlinJb3o8veacEmGmSwg43wtjQ
zDA9NP+il7cbHEF97IrzP70NrOc5HZnijCSAUdWIaMIi6xJuoI4=
=fiQq
-----END PGP SIGNATURE-----

--Pd4J8KlduPZw++UM--
