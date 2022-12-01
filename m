Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91BB363FB97
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 00:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbiLAXFz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 18:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiLAXFx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 18:05:53 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD403BD0E9
        for <linux-i2c@vger.kernel.org>; Thu,  1 Dec 2022 15:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=yipVKPNs2j8Iep1ygWdkOKkYn7Al
        KHXAae4EHbage6o=; b=LBgPV3bKK+ZYH4UYq/ijNCltP6BOYGIB0zKn66v0Gre0
        WM6XqyCEkDMj2JkvhMIKfB27r/RLah7RiKc0EcZ+cdYamxNIubiitrn2p2GEj6fv
        KEEtDOJiKxxLN6/1jb5y1rkW7sIPIJAwbWcR2USHWN9oTaa6PlyC+kG81E9IMsA=
Received: (qmail 821666 invoked from network); 2 Dec 2022 00:05:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Dec 2022 00:05:48 +0100
X-UD-Smtp-Session: l3s3148p1@n337QszuQM1ehhrO
Date:   Fri, 2 Dec 2022 00:05:47 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/Five SoC
Message-ID: <Y4kzSzL9167D2pRE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221115123018.1182324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gxXpcdmxfbIsO9nR"
Content-Disposition: inline
In-Reply-To: <20221115123018.1182324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gxXpcdmxfbIsO9nR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2022 at 12:30:18PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The RIIC block on the RZ/Five SoC is identical to one found on the RZ/G2UL
> SoC. "renesas,riic-r9a07g043" compatible string will be used on the
> RZ/Five SoC so to make this clear, update the comment to include RZ/Five
> SoC.
>=20
> No driver changes are required as generic compatible string
> "renesas,riic-rz" will be used as a fallback on RZ/Five SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied to for-next, thanks!


--gxXpcdmxfbIsO9nR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOJM0sACgkQFA3kzBSg
KbYKZA/+NbUXqAOGLbaxBJT2wXjnHrlBRnlQ09/BSS1PdlN1XbMPN3rFMFvM6D6D
Xxaa5g2WpeqtdGagUs1CX0PK7o+VkXV7gZO6IA7YR1BK1RUkD0z5sX/LRbgAP5VW
k1kfCtM9ggyKBpkhvyBk/UB0DyPnqIsdGQV4SksuHi3TNQvk4MXcVx2+pnEJeNPg
bSWXvXsznOu35Za08PatA2Pik3gWayCdh6Qno5egl6r64IrVSEZ3OjFKxn9ZFMM7
eNO7+pOOKUBnquqEtyNtNR+P2qgTAjvcv/H65F1uyih1uCpoXy7eGECWDceY0toA
a/xlbIwSbSsVA9lC7kH/UrwmnioECb0pg9bHLsYT7IvC4RjWeHb8+akCFtSKCigr
xFrMpaZegSE40ebGQvNkMiCH8+1SD7jLO0k3EYWw0gCRNz1YybnA2YfuNIsH/uQU
xXXaAwpzAZ7naNsSUMOgRpunfPIa9uGjBJLJorOVlu97vEFg0V/qpnKtkUvL9nji
bUigtr+gnvhZec4j0CuaZA/LycULOqSqb7aRPUf2zap97fJHm1eqJMmyXTYrtBRK
L646cbZvKiakeByfcejiUHQCeOxxqpyZO08BgB3Ya0ZJMGQu5xUNrdRdlbrZ5DWb
eqpDKfK96R+zOJMummLxyKdlwG7fpSpO8ibS2mTspLF/50ENvN4=
=azFl
-----END PGP SIGNATURE-----

--gxXpcdmxfbIsO9nR--
