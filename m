Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173E55A6074
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 12:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiH3KN7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 06:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbiH3KN1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 06:13:27 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34B86588
        for <linux-i2c@vger.kernel.org>; Tue, 30 Aug 2022 03:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=8XjgrmpmbPsbV1sHUjOhGMM5UKY4
        NHoGPlZbLi/czoo=; b=NcdmYPZ5h0NKc359TAHxi6WBpIiqkflAyxuIj+IdA83Z
        q23q+yfr5CXyqDS5fllrA7a9Pxh1UjBCYRz7/Qm1AMSqSJ4YlXme/UNTk5oeG4Zz
        TTWPlnbputzjAIlxdod/DPLvC5VbSYVes4XTYyb50TTwZ+MeBncwoTEf0xJ7SmY=
Received: (qmail 226316 invoked from network); 30 Aug 2022 12:10:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Aug 2022 12:10:03 +0200
X-UD-Smtp-Session: l3s3148p1@szRwlXLnztIgAwDPXyz6AKlRFcsoQyrD
Date:   Tue, 30 Aug 2022 12:10:02 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Fix
 'unevaluatedProperties' warnings
Message-ID: <Yw3h+onH9ValyKGJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220829214730.5752-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OdPSzfltkbbAJOzj"
Content-Disposition: inline
In-Reply-To: <20220829214730.5752-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OdPSzfltkbbAJOzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2022 at 10:47:30PM +0100, Lad Prabhakar wrote:
> With 'unevaluatedProperties' support implemented, there's a number of
> warnings when running dtbs_check:
>=20
> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: i2c@10058000: Unevalu=
ated properties are not allowed ('resets' was unexpected)
> 	From schema: Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>=20
> The main problem is that bindings schema marks resets as a required
> property for RZ/G2L (and alike) SoC's but resets property is not part
> of schema. So to fix this just add a resets property with maxItems
> set to 1.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied to for-current, thanks!


--OdPSzfltkbbAJOzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMN4foACgkQFA3kzBSg
Kbav+g//UDcPtTrUKRiBvZLuos4JnS5tSqRj1j8O+YnHgwcmHr8Wcqw2gDFFbdXP
RWqapxgZ/a8murGzEjobJRy7Z9/5UQoufHc8JLWjvlVqm2xyNwNd++5vpq1sYAZJ
ikM0W3uDLhRYrmrLSKWZDsL48TawHXCerKJbfCCw2yabadCSp3Pe116lQtTM3jwy
nOywncnlPBperr4iDNYhFcm6tGZcHFi6ZtbBz+zKFnCAsIFRtwqK5STS/4/ixOIJ
oaDBskRewfugq8qZbW4mTH+NJW/gqDRdcrEGKgCXgEN9w0fYq6YwW6NJSNffqBBY
7j0wPRrZCRdL33mEXWddjHynZR4ruuF/yriEdYfxGDtur9FqUf6dQS4hmgKeVIpD
eEfYCbB6eCbFCPn0UyACVx2lYj/Q4+YbC88PVxWQWqH06rB+X4CUwgCc8ZlClYsC
V5x2OjfS2gpuhtJpqmix8n21M6LVDaAKDPgzZR8dbqnJmd7ahgUsNfSnbWzuCcZh
ODov7ojennrZJVOkKFGhFm7WYc6eCuew5CJ46AzYYmOLZWlY6Z8cDN57dPwnbhup
ysAgJsF6WU5EI5bSOetiKA3hmy7WLc7x9UPdf/gj+3VE8o0xNZ8jlRMfvQYuVFo7
0F2mpZPGYgCx94Y9Xuo4fICtdA12NYwakwb0FUY6dcz4wB6yvOo=
=ur4c
-----END PGP SIGNATURE-----

--OdPSzfltkbbAJOzj--
