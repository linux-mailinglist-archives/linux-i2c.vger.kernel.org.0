Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9E7340416
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhCRLAW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 07:00:22 -0400
Received: from www.zeus03.de ([194.117.254.33]:41032 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230232AbhCRLAR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 07:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=PmVijPTSyrznYL0QMZjDdPM1M4Y5
        mo/47668e+hbsXk=; b=PkSN32mOfjGeAslQeFrfa3pe+o0eq9QaRu60l8o7sRGL
        khF1le6n0nkRLEDwxKbP6/qjbeVvEoF4N73qlJfTRiFbF6Mx0pRtXP71BvPEQUsF
        ws6mnWjWZZIJpPkc2lS5R1kmQ7QJAtkl823u7mQYk6gFvOiJ8/4AcnuFO9R6FCg=
Received: (qmail 382718 invoked from network); 18 Mar 2021 12:00:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2021 12:00:16 +0100
X-UD-Smtp-Session: l3s3148p1@OrAegc29YLsgARa4RaSzAQBVtUgvoxMO
Date:   Thu, 18 Mar 2021 12:00:15 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: powermac: remove uncertainty about SMBUS_BLOCK
 transfers
Message-ID: <20210318110015.GI974@ninjato>
References: <20210212170350.2491-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3eH4Qcq5fItR5cpy"
Content-Disposition: inline
In-Reply-To: <20210212170350.2491-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3eH4Qcq5fItR5cpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 06:03:50PM +0100, Wolfram Sang wrote:
> The driver does the correct thing, so no need to question it.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--3eH4Qcq5fItR5cpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMr8ACgkQFA3kzBSg
KbYm3xAArGPFhxKJApQm+H2qXz4i1oGyCvTSVENdeEoSNEbdD+rZ3dXVCeKfq08T
L+pX3c0YIRxopmfv/ZlFJ2DBH97YPyjzeq4nlMMzhbCh5s04RX5K5omkcxQVhrgm
rKL3sYNiH90cOMxAdgbAjAxWKZ2K4hjyboGwv6SkEDc+QRk9ZfzzFgVbiEwudpMb
wp4bfnj6SVYfTr8x6gUAjsDfvOFQYYADNiITVuwBCriRiT9viPuFka1Dgj5GVI4i
Ouh+tatcQ2hP2XtA4quSD9Q34p+9FXI5VFP08ZIyiebdZwaktZ2nCfQRubQF+0Zl
CXoTACex9IiPfAOqjJZlvtcfXx6e2EtEDNWpN6lUfYUOZr5hjYaXh/eqGO0C4JWb
ginyNeeR70An9Y5fWr4xNemsq61277jII9ex6c+JoYBvhfYC49wl94xgcPsKbXKS
tr+hIR/JDoQHV1sQwEfkI+TWmAIzAOxQrI1U4Q+CIXAJDY656GjRO6avrKksOXJr
z9cvvxIPgJ0nLUCXb6u+IuC37UncQX1t42+ibTjzyeCQeMdzCAzYJ3BLSIofHQRc
9gYQHoy016u38GDqjX/rR5iF5/cBHeLehdij3rT4S/wPMIlE25EL3MDBg1BmOhvR
tCO6lZCT2+fTElY0m4FkKKCWdX3lxw2iLzt5KIlyGdGubsq3A6k=
=oAbr
-----END PGP SIGNATURE-----

--3eH4Qcq5fItR5cpy--
