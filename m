Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4F151AE0C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 21:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbiEDTmh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 15:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377571AbiEDTmg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 15:42:36 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C8A4D61B
        for <linux-i2c@vger.kernel.org>; Wed,  4 May 2022 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=DKaJkQV3K8J6IK/vWUurE5CYeW7R
        St0BNzaWbBXGQbc=; b=BL2m2kdxPuy/v1XmfB9mVrNsR1D1KKnRdFJw3k5vHxmT
        T+doJV6S2IzBaWiIIIb8v5wuppUVuNltQ6VSmA49dImytrY6aXMYwUu5F5RIlWPa
        ON7NwamnjQkAkrudaP3Q90PMpIAq34yZv2z72LvAI8B10XglZyrlpT7OW0/Inqc=
Received: (qmail 1530318 invoked from network); 4 May 2022 21:38:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2022 21:38:56 +0200
X-UD-Smtp-Session: l3s3148p1@FFZ7xjTeFJwgAwDtxwyXAP9dq+3qRUcy
Date:   Wed, 4 May 2022 21:38:53 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 7/7] dt-bindings: watchdog: renesas,wdt: R-Car V3U is
 R-Car Gen4
Message-ID: <YnLWTbWHGTiLgcl3@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1651497024.git.geert+renesas@glider.be>
 <2882a6de3905a57ae62d91060d27521af43c4068.1651497024.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o2vO8SntDaD9QMef"
Content-Disposition: inline
In-Reply-To: <2882a6de3905a57ae62d91060d27521af43c4068.1651497024.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--o2vO8SntDaD9QMef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 03:34:59PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--o2vO8SntDaD9QMef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy1kwACgkQFA3kzBSg
KbavkQ/+OmT7GWvPk6VRFi3/rfH2FDUsWHjN3KFNjvSThc/aPxG8U6I1sQ0xVwhu
tVm+XuHDA/RifUFDmkFKl0kU6RXCI7UCCfy4Ica2g/EKKq7AvS2YBlPnQJwumr7W
tMlMOj8oQ1kazcC2cyAXWTeeQwkG050rqzTfDw90CBLGtc8YLE1grfKdHuE7rCcV
3Bmex9atRvkCjaVm3fgmLri81M9vu8i6B4X0LwPW97MOhWOCZJcfvlW1glaK3x44
9076ncP3Gh6k0A6oKIyX3p7XQqrCzwoQ7pL+qPwOLiJdhsz2JubuwI0HeYqJhYPI
VgwUqwVZYU66SL1lBgX/4HBkYUine7WprA+3gIEXFwX4LPx275l14HLMdFaKGouJ
qYrlXDgDxW5x2J7SliOtZgvePO11W9tKXNEJ+0oBQXI8c0pPRCGbpcQQGO0tKFRX
djfzEK42Y+II2GEXjvKrKGv6vTbQG/gURzdamEsnTiu7RjRM+h6yqoF74PkbVu4A
BRfwgHSG8LTugfrxl+bR0Ciz8HdDx2b0OC4NwMU4eTE9VhR/+cqtsQAYEbv3NXAK
FTQYTHbiR6JJf3B9E0o/cdpM2v+MkybqAqkZGUAu0v/ErTursF+YTXLl6PSxJ++V
MhNJbDijy84CRo3cvncTBgRjxHWTyNwMlbif6itkeP5GBqcFjOU=
=tLp8
-----END PGP SIGNATURE-----

--o2vO8SntDaD9QMef--
