Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B4539438D
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 15:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbhE1Ntk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 09:49:40 -0400
Received: from www.zeus03.de ([194.117.254.33]:56202 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233040AbhE1Ntk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 09:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=UMQ6Y6L9whdOdP5hmipFXztLZDz8
        B7KlNP8ObTf/r0o=; b=Kk1hBI3IJMPk8ThdeQbEXgH3MLhYj2XBtfAMhYj8uNos
        zrHe0H1kDKFm4k3wJr/NbUnDiPmfOC9nrcZVu6LOEAomjE1lwMSolTSP/eTKT9ER
        ZYKu52N0iDPSQbRyuQjaWuFAcITFfSCny5hGY4m88Jbrdh+C69U432bqfbPU8bk=
Received: (qmail 2390285 invoked from network); 28 May 2021 15:48:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2021 15:48:03 +0200
X-UD-Smtp-Session: l3s3148p1@xyTvH2TDCuEgAwDPXwoXAEGfoBQqamfc
Date:   Fri, 28 May 2021 15:48:02 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,riic: Convert to json-schema
Message-ID: <YLD0kthQp67CF2Np@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <5938b2d35663d4b9fefeeb2e60ff19e3343c51de.1622193505.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yKCkKloB69118HYo"
Content-Disposition: inline
In-Reply-To: <5938b2d35663d4b9fefeeb2e60ff19e3343c51de.1622193505.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yKCkKloB69118HYo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 11:19:48AM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas RZ/A I2C Bus Interface (RIIC) Device Tree binding
> documentation to json-schema.
>=20
> Document missing properties.
> Update the example to match reality.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--yKCkKloB69118HYo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCw9I4ACgkQFA3kzBSg
KbYw8xAAsJtJ2+WZWpOV3VQmfEDia5o9WVaE1KB8IKsSYm2ER6rXS2Fuo4Gub3Wa
+/7m0ImzZSxWPV+FMRKEcfndsbrOW74wpBoNg25HVyWlxfz9JN8cr2AD90hhN36V
D236jhfsky1WUwk9iepg9y9QM/U5O5Ne88kxvOmgBVBkvvt3FrDN1oRTbntU5UpM
F2h+pbranp8hpRyhdFpUszGLnx2yKKCa4tEq1utxWZEJYl1aM45B677wOkW+RFEo
+fiLiRgPiadqpuAGiAy4dyZyOBbuodLkZmwDCpgXx+24m+jCgXFq0s8qlRdhMGca
bqQwxKD8xOLpfa5ibv5IZy1Qm5vkuQyhgqKEcAb0NGZjnNb/l2SjaLRZ8FJTN0On
TBpSHDz3dG30KipQCJv+j3MrYXlLkqPnFW/nvtRc17Eh/cQgNZBOqpXD6Wn+xvgM
9IHLowUKDjBG8W1eWFBXhgovX9pNELqQeyDusr/XQRo7YDxPvZZQPyv/RG9O7oFU
eFHF9XyhEFQCRr2gO3M5w94qk+00V9bBfqzYfvdAkNgy/c0awRoqyU9kJUZp8vGA
tG5BFgbK9Gq0E8bqfb8GsFqPD/1FHBR0qF4VDsfSIH+vyIdmSqJZZwag4GhCcL9N
zUU/Wl/3iVh2W20DJ0pDkyLpvI2iQrIaX3kJahuUnFZrgvB279g=
=zBxz
-----END PGP SIGNATURE-----

--yKCkKloB69118HYo--
