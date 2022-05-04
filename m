Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA4D251ADEB
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 21:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357837AbiEDTlk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 15:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244837AbiEDTlk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 15:41:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3F536E1E
        for <linux-i2c@vger.kernel.org>; Wed,  4 May 2022 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=T0SMZXN87mfbGYdslVIzxN731a69
        yFRI35AcyNOGoKA=; b=cJ05izlUVZhs3a/OGCJhfaEPDq8PXcukKlu8Il9yxvUk
        yBZmk8Rqb+YW7lWH/akUJAQbXT/au+b1AV3NRXOp9KEdeMM+HxUsj7/PQqiQeXoo
        gGmCVFhDMdmBFzurUEl0hzInZw8baa9qFG4wqyLb5xlTiZYy8VuOoO3J3wJO6PM=
Received: (qmail 1529521 invoked from network); 4 May 2022 21:37:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2022 21:37:56 +0200
X-UD-Smtp-Session: l3s3148p1@fBecwjTeCpwgAwDtxwyXAP9dq+3qRUcy
Date:   Wed, 4 May 2022 21:37:47 +0200
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
Subject: Re: [PATCH 1/7] dt-bindings: gpio: renesas,rcar-gpio: R-Car V3U is
 R-Car Gen4
Message-ID: <YnLWCzLESZ3NwNg7@kunai>
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
 <5628a862688bd9d3b4f6c66cb338671211058641.1651497024.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YNJ34uo+OPtBXoDU"
Content-Disposition: inline
In-Reply-To: <5628a862688bd9d3b4f6c66cb338671211058641.1651497024.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YNJ34uo+OPtBXoDU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 03:34:53PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--YNJ34uo+OPtBXoDU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy1gUACgkQFA3kzBSg
Kbacvg/+M5weBbp8eucQzeQfhiSXmoUq8Y085EPJPVnSs9VIxmDp6QiVP3OYgeZb
mRyvi3cG+gfUGSnZZs+0VDmQBPHCz2V7d731JxT0LVhv/uJz/ItLPzrlIWO50KcD
Qdeo2KKaVnm99fZLzjh+NLUEz3miB20m16D61q7tdMyJ4RoVPHV4vhks0XO8PBTU
c/reVsCjoxzwHbhNaRKmDbhzwtvOdLG4HyWDJU98ZD3p//Pakjb3E0ke//Ka6Jwu
CRVqd4iih7pq/VXCJRQfFihTRcWN6WQFu7CqtJI0zZijuKMRHrFbzB6jmao8D6Oy
GRiRFwjfgoc+emlOKRGUy8C3puUnn4zBJlSHdnHYjXyMdsHS2W0aCtrT4U1cXBuR
geyysQdp07zxfSVLA/4c7Ct+wF98JJXFlJ0ccFTRRwtRUrRpcvq0PuWEF0VaWoSM
t9OvT5PWv3wQAOTcP1En5UP0wZUXOJznRcGOOinvCVVYAlcjP9oDQqDTkdRFwYdz
HJXj7xpF290VMZh0uC0zleU632ngk5UA8N4mnEKLGRo6jppkZWRrxKt/CU0T4upC
MGnS/oywZKz2PKoQeO+6QX75pRe8DdVjYNiNHYyiFYMsc/gw1mJ1tKgplWZvdmZU
Ooarfwc9vDJQX5C4HeXnNLdsIKtmxzspIs2+nAM/tpIcVi3AZz8=
=k7OO
-----END PGP SIGNATURE-----

--YNJ34uo+OPtBXoDU--
