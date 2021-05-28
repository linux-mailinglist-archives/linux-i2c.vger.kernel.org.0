Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B0A393E3B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 09:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhE1H5g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 03:57:36 -0400
Received: from www.zeus03.de ([194.117.254.33]:48558 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234430AbhE1H5f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 03:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=TRrNhEM28j0tW8rfbV/wDGPaK4AI
        H0duCAcURt1t5RM=; b=h8Qm3bVnBhL1jok5pHIkpSCZOTKDAVjG6NK8OolRGu7j
        2eTBqqibJWD1sB5J09UDwG+xEKQKRrf4eHH6xmLN7yTgy3qQBov2SeNTLF9eVA8X
        5N031ScMxWWAyylWhby0ctrCGgHYRCYDwTLmGZtja/oGqF22AGu20e9y7x/a2Sk=
Received: (qmail 2272086 invoked from network); 28 May 2021 09:55:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2021 09:55:59 +0200
X-UD-Smtp-Session: l3s3148p1@4ovPNF/Det4gAwDPXwoXAEGfoBQqamfc
Date:   Fri, 28 May 2021 09:55:58 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/6] i2c: rcar: Drop "renesas,i2c-rcar"
Message-ID: <YLCiDlXof6tv3FkV@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1620138454.git.geert+renesas@glider.be>
 <a847c1866a006b4a4fb24ce4c97131493696c524.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nbOHwkaqOaI42V6K"
Content-Disposition: inline
In-Reply-To: <a847c1866a006b4a4fb24ce4c97131493696c524.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nbOHwkaqOaI42V6K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 04:35:53PM +0200, Geert Uytterhoeven wrote:
> The compatible value "renesas,i2c-rcar" was deprecated in commit
> ad4a8dc3fec6485b ("i2c: rcar: Add per-Generation fallback bindings"),
> and never had any users in upstream Linux.  Drop its match entry from
> the driver.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--nbOHwkaqOaI42V6K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwog4ACgkQFA3kzBSg
Kba6sBAAsUVCGBrfKNnzwm45uyOxVmiw6cNayaS0atmGM+PKDv3eb6E1qLx1etIz
tQtnDJ36AmbdJt7tBahsjqObDyp6uXbovvVAm9u2nNiCkOMwqIn6884qNux+Foqu
jrbR3OOb3eL9oBRWIIKknODB4xkb/OXwQvHxVKOxfDglfuRSb/eodzyr2JnqafoY
df+v5zUgE50f7g5CD4sRcJBap8vHpC9EdAkmEgdmONsnn8Cyo5/oalXNbYKO1AKj
IBBHL/wJHdS7vmjdEqrbR0XJZ9jJ/cZ1OeK0V0+pdYRhD2KZ840nidyndsHcVKh0
Z40AZ/PseKxaCFCpJ/KUM9z10Cuo6EKfRIVYm86F0ki5ZEw4eCtcdyw1E0nhvJ+b
7PeyE3oMFQ/HRKNdgRAaLrwHYCkP1t8c+InqLpVztAbUhmCTKSosoK6M1x/7afVy
j3Vps3xX9RSS/sZjOFWnpP24Bs4Zme7PtGukMCU2YdSJ4mA5UfKSVRo153IA/uRu
xozvDLU7EQN8BK4aNjhuLG+i4w2t8Bu4yBUdOdrplPZXUn6HmDiiwheFnjQerfdd
EiDuy2dN3FHLN2lZqAJ6A9FWz2tXTO0HNCXv/GH7cyIyJ4U2y8T7au6tNYAbd8Ek
Lfl3k3rI5SmjLk/9P2OxWNlNOZHz5r6HmymkwUs9v37me0wJyQU=
=MifB
-----END PGP SIGNATURE-----

--nbOHwkaqOaI42V6K--
