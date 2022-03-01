Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48A384C9066
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 17:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236218AbiCAQdd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 11:33:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236046AbiCAQdd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 11:33:33 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB21B17A8F
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 08:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=a7xZZNqg70zc1ELrqB3sPdab+5VW
        7WN/5OAqtIbWZZA=; b=VXeLFVHdIZbUwTOT7C4kQrZ4yEtvldu9pqY0fUSG7433
        6MlqhsTXTMTJJtOsjNsZucItTTYYNVwxZ2OzST9+Hlk5wGvX3fg0OJua0XV4bZ5y
        8lSbegNooJiyKSMPZDsLw5w5BgVIB4qS7p7ibXk1a7oiDr5JKcZdTovMDNKL1+Q=
Received: (qmail 3933407 invoked from network); 1 Mar 2022 17:32:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Mar 2022 17:32:48 +0100
X-UD-Smtp-Session: l3s3148p1@HeAstyrZitYgAQnoAGI9AP6D0HJXVmR3
Date:   Tue, 1 Mar 2022 17:32:48 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,riic: Document RZ/V2L SoC
Message-ID: <Yh5KsF7zpcAiasim@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org
References: <20220301125046.17737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q5ze+JLfrrDhvaFy"
Content-Disposition: inline
In-Reply-To: <20220301125046.17737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--q5ze+JLfrrDhvaFy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 12:50:46PM +0000, Lad Prabhakar wrote:
> Document RZ/V2L I2C bindings. RZ/V2L I2C is identical to one found on the
> RZ/G2L and RZ/A SoC's. No driver changes are required as the generic
> compatible string "renesas,riic-rz" will be used as a fallback.
>=20
> While at it, drop the comment "# RZ/A or RZ/G2L" for "renesas,riic-rz"
> compatible string as this will avoid changing the line for every new
> SoC addition.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

If Rob wants to pick it up:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--q5ze+JLfrrDhvaFy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeSrAACgkQFA3kzBSg
KbZngRAAiRbyJwmReo5IvpgjhXx0eZHWrs1ceCuuI49fbCi2lQpyEJ5YZuZDcr2W
u/D2y/K6+ha/XrseY8dV2wIsGhQ+V4r7T9bLmkD37YIrsSITN+qDZe/M1kOqcrvo
Hg4dfcL7SCtWCbCII0gMiN8lDEFwgWLWGaWF+VXrESd4+4hqkNGULKqmRI/j97+i
sY46vHnG9+eWLzbYWbuBdwNORoJMvGeUmgMLw4gFFXkfPBNOsdqkvV0sicuSmPw6
bqiaXZdZXbT5wVqZPDZMTqtKh++IASfpahmBbfFEopQ0z7S/YzMkWfgSmES20Ffh
gLUdIw9bktpHAchzra0FQmPFe8MWfhEnJs1ih7yqkeVJRp4nXT+ZpRjMK0+1ZjVp
D1TP9yMiuTt8oclXSHXe4NfC9B0cWGhXiBfOO21cR8XZPehwstdI00uqzPv1qt7t
QSL5LlW+edzNd9O/+TjApTr1l+tyk/jENjuTSWB76JX4B5uMoUQeV07dDPuxFDqr
2qoOvOaBakaqRbJ7ATK6TmsRbMWYlht5kCeYHsjaHp/tNNCPbpM6XO4ZtQbuEjJ3
4nXx6Wq1bMqCb+b7i+rGZIcxDi0dzS2qkiB3ja9LBB9xJqPD49xaW4MfrjDZxpBi
muvlXS0wMadSmHhafdBnPlPDeuq2aDW3ci1Zp5bC/mPSFBfl5wk=
=Gtmn
-----END PGP SIGNATURE-----

--q5ze+JLfrrDhvaFy--
