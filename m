Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD21851AE5E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 21:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377701AbiEDTzU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 15:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376487AbiEDTzT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 15:55:19 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456C54E399
        for <linux-i2c@vger.kernel.org>; Wed,  4 May 2022 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=roOe+AeBY7DP+Q6uo/3NlHB6bacD
        iF8cZtCOKwDNtfY=; b=AVvmqY7D3UH/BWMnn7wIorUCqnrJ/+VLUtw394q8E+Om
        FcZj38Meag68aRXJMZqBMV/ykDiAbYkJb7JobePTVSDwsJScwk5GU/y4NLU/d2X/
        TtjYV05OBt+x37dH92tXFElqcjQbmeUxdL9XANm472CsC+dHuhk7AahZPz9ANQE=
Received: (qmail 1533983 invoked from network); 4 May 2022 21:51:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2022 21:51:39 +0200
X-UD-Smtp-Session: l3s3148p1@aBgC9DTeXJwgAwDtxwyXAP9dq+3qRUcy
Date:   Wed, 4 May 2022 21:51:36 +0200
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
Subject: Re: [PATCH 2/7] dt-bindings: i2c: renesas,rcar-i2c: R-Car V3U is
 R-Car Gen4
Message-ID: <YnLZSNJh7rdH77Lp@kunai>
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
 <a0402ff46027196953fe9c13f60576d40c5aea4c.1651497024.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="j/bfMYaLl7xWqyb8"
Content-Disposition: inline
In-Reply-To: <a0402ff46027196953fe9c13f60576d40c5aea4c.1651497024.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--j/bfMYaLl7xWqyb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 03:34:54PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  I2C on R-Car V3U also supports some extra features (e.g. Slave
> Clock Stretch Select), which are supported by other R-Car Gen4 SoCs, but
> not by any other R-Car Gen3 SoC.
>=20
> Hence move its compatible value to the R-Car Gen4 section.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--j/bfMYaLl7xWqyb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy2UgACgkQFA3kzBSg
KbbbBQ//bHWIRu7MnsRqfYi9eFC5lxec3M3uiwvykedIMxXDdWQCC2qXlAn6efuH
qv9GS22D0TLykN9cUMh/mwkF8j4CpK1hxncdTz7//FyzfDcEhuABgks83Z1Z1Vib
X8oYEjRjx5kRJD+TC6OXer3OVwKfFX8V+6FpRruFVW/LWVEZa/LTKFqlSLw1sO3A
fy4Mw5pcBbKlDiXWmyTiAjk+Rv+apo2VXaO9nV7UxAJSICixTe0GmOPZzXHCem/z
GvqpFKcaXWXtQ1FHt1zwxuscEhTf8YD4XDB3S1iCvkh1BXwN7xK0BW5vLQYtwxKJ
c/F9Zwwg7dz5VHAy8Sf+AFIi3Q5Iv9gBJ7kjt6G4hpYG4itHOpCopBjmfxQu0YcD
J5bOb/F1jKOVjPHfnE2IFzyH4Alsy+z7hAMk3R90WM/AumDfVB1d1msG/1V3rnFe
IRRaP3yu9mmcPkG7rRWs3oi/HH3SWzeDCywaqJgIMwJWE0oFHuw5LA8KzKvk5rbD
lVm+yJTMx0GyyhqV/dl+fyPdLTHj+5O1grgopDg6xjKDiN+2EmbstKJdGKtocA6N
tHNzcp80bFOHV6eO3j89GhutyTdL0ma8z892LN/+Lk7dQDpyoTKLmC51fvE7BHBK
+yqozekqkqbqe/qUVYEV0UCB/VkIEgSIoJJP39lRITx/rY2F404=
=hJCI
-----END PGP SIGNATURE-----

--j/bfMYaLl7xWqyb8--
