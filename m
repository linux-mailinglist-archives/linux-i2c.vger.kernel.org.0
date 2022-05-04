Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6F451AE09
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 21:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356370AbiEDTmb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 15:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377570AbiEDTm1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 15:42:27 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66AC4D614
        for <linux-i2c@vger.kernel.org>; Wed,  4 May 2022 12:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ngAP9WaE103CcVR6TpfcCwecyQ1Y
        p9lzXNJqrlwo9Uk=; b=tdc9vEkSlQD5hLFKQzQXP/qOAGjuSjiAPwf3CNwUEAUy
        fC1ZJkKynTmGZiVtn1wsl9kwWDWCB3t7w2ZxjuW9BN+8Xgxq1I9ynv02dFS1w2Ir
        BK/2Hh6cv+6zlXAVasinTy+ywbbZpCgd4zbdkxyt/duZjiJRhVxGootLB/6cmVQ=
Received: (qmail 1530193 invoked from network); 4 May 2022 21:38:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2022 21:38:46 +0200
X-UD-Smtp-Session: l3s3148p1@yOj4xTTeEpwgAwDtxwyXAP9dq+3qRUcy
Date:   Wed, 4 May 2022 21:38:44 +0200
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
Subject: Re: [PATCH 6/7] dt-bindings: serial: renesas,scif: R-Car V3U is
 R-Car Gen4
Message-ID: <YnLWRBd+0mBz2Mlu@kunai>
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
 <c57ed00e85778380776330be6183c6861d843c22.1651497024.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pq/4T+atuXnzKk57"
Content-Disposition: inline
In-Reply-To: <c57ed00e85778380776330be6183c6861d843c22.1651497024.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pq/4T+atuXnzKk57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 03:34:58PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--pq/4T+atuXnzKk57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy1kQACgkQFA3kzBSg
KbYhXRAAheR3oRo4kTkVTqR4eUJWkgxmlymaB5ikgDBkUJ3X+8rJeTP6Mwhwz+z1
KD1VMBmTQHrOKBmZYlxicXmKz8pT9AKo3l6E8EyUV++1QOXM9xsZOTUq2w75En8W
Hwme0UIkglapbvbTxqeWPDGMMdCjPGITU8jhtvaXRBgmbaURItmbDaS7Xf3a2jE9
MCA1zC67LTEx6HNDXqIgK1A2y6YUGbKg1U7LiJr+nVkDES2EdWvlddkx583+QJYG
txboM96b6UHT4w1p2gybsBOLqbvHeNxZf5n7owzdjt4Mds5KY71Ke8oHj6gfYmht
sTALjTQQDNGHiD19KuP4ZFhMoZTTY83evZO1ImVP5zLRTga4YuKaT7fEEzBVIOMp
4yApV7mo1QwhWJorwDFHPCsmg4oT+xu4VBkwC5PZ2WIWQ0TXbTddKoMTYdq94wpH
8w03Mk48dt7RTQ2oMzsPt6/R5irhTmIfna0mOqdBxD1sFibVSpaRHlp+fIKof2ii
XYrqaidIYux5hKVaUC1xQ3XRy8AoJs0LYlpo8wu10Vekc+r8rnf8MCWlNnORQlwD
Q8RYR8zPj2QBNe+FQrbWV53O4K82LbMsGCPWUlR63O747yhWPgN2oBTJFSgEI6rj
OpZWdzQrjWFECbdER6SJPg5Vwf6z/ReooJwyMXf2IBrQjiWXS5s=
=GRyn
-----END PGP SIGNATURE-----

--pq/4T+atuXnzKk57--
