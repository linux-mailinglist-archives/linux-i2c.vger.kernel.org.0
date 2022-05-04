Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3BDD51ADF7
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 21:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357989AbiEDTmE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 15:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiEDTmD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 15:42:03 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B6D4D25E
        for <linux-i2c@vger.kernel.org>; Wed,  4 May 2022 12:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ypaHt/gCH7WLZLu40BT33XSQpK/4
        ss/4B4jmKMSFmDs=; b=IpqmC+h0ARmt4ZrTC/OE9hktcApK3Y0EyBODO53Em6I8
        j6uUQebYSiIZvmBSEvFlfL24uaADWgDrojDNLGcbtUUSIOJ+x/VpfSMq31SjgvyI
        LkeYKWIU7Yy6EyWK0Dna03f8/LPA9NRa2YshMjUxNspOESe4uBvWL/ELCpxcaTY=
Received: (qmail 1529857 invoked from network); 4 May 2022 21:38:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2022 21:38:21 +0200
X-UD-Smtp-Session: l3s3148p1@1jphxDTeDpwgAwDtxwyXAP9dq+3qRUcy
Date:   Wed, 4 May 2022 21:38:16 +0200
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
Subject: Re: [PATCH 3/7] dt-bindings: iommu: renesas,ipmmu-vmsa: R-Car V3U is
 R-Car Gen4
Message-ID: <YnLWKI96LJFyRpmB@kunai>
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
 <d351ca12724d5b306119bd8dcd9bfac09ba2a925.1651497024.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eMFhS0QRgLutzDxL"
Content-Disposition: inline
In-Reply-To: <d351ca12724d5b306119bd8dcd9bfac09ba2a925.1651497024.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eMFhS0QRgLutzDxL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 03:34:55PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--eMFhS0QRgLutzDxL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy1igACgkQFA3kzBSg
KbavUg/9GkMkKXNrP4y33nPOCLKwKDRM+QSTQrIw+PVdnvDGBsJAoJn8KZzs9rQW
/nMtxPBOYBYDV9sDpCG+dDl0HV6BYWVXiwYdqSjO8japfck6DPe0krshczW+zeV1
iWvRxt+8BL/UuaBuOXkWw6AeevZSqkDZu3m93FfFXi3um2AbxNV/B1MVmlqxnjzd
vrPLCaSjHep+/3DF5CteLJPk0+jcrDfF0fDduOEETw/flwsms1sd7X7NI7C62mlU
C/yPO+mKMHgV/87WcBrqkjUDFz0hTXJiZDOKFueJpXYTYObqxXePp1Rtbeol92dn
KQl08/XBnhi/ZZ9vMzp/ZZpNDCUNSHBB3mN2+vKTjYJphfH6XCpeZdp8Fb7DeC/s
h12Aeq6NQI6ZwePIhW3aZaCuWpCJUCPlSFb4E3BjlAXS0Itrh9p1N1AybNQZ9emz
G773cTTg0vMYc1NSgm+CDZUZ3nwShsiF8NeI3Qz1m4oZ4bNqB2mw8D1Do2IiG4N+
dXogXOIfOptAz2l6tdyhf3R+cKeZg8XYBENRRg7fQgRl0CWeIxX8g/GVDEJ1ebOM
6fjZxezJv/XvSFi7c9fwSqiDkzvgy9LGbXLUQL/iZvxbYIZs4RLst1TMRfqOF5pU
BeKGCd95d5RYRxLXBCM308u3kySTQENSKw+GxGqqyd0kJiD4A5k=
=3zCL
-----END PGP SIGNATURE-----

--eMFhS0QRgLutzDxL--
