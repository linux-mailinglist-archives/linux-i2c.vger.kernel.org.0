Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DC45A6063
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 12:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiH3KMm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 06:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbiH3KMC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 06:12:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C4FDCFEF;
        Tue, 30 Aug 2022 03:07:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D3AB6145F;
        Tue, 30 Aug 2022 10:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F063DC433C1;
        Tue, 30 Aug 2022 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661854065;
        bh=0ule+5WzyEygBe8iATsEAf9tB/RJhwc0NIW2A0ErpiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fGsZ+ONfw26h4kon0jztlOxjujyuemDua7jbCtD0jJDuKSODrRBQXSglZUcmO0tcp
         ixJF/IE6KRIWAaDpsySQC2U2PNTbGfnACMzsa14BcnSg0VDRCFJ7CjDk7GOEUw0qvK
         3r+OraZGoL481VP/QBe4Ts4DKARvY1Ct02ZvWZGIukxuQFUxK0MDikJ+YgBg6LdomH
         3CCk3s7IaH5P8wFGR06PwXEyu9K6RJL1LAziPzDscoN74KZl/cfZ16l6thy/ef2kyf
         sQQfpBNC0DALRtJV00dGrfEXATLlUJLr1hTVO9EOkTTwpWbv07EN+iTdIrrxd5PKrT
         NdtxfUgcaRqUg==
Date:   Tue, 30 Aug 2022 12:07:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V3 2/7] dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
Message-ID: <Yw3hbjCpUcZgE50C@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, aisheng.dong@nxp.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
 <20220823030215.870414-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vQISJsL2OgUd43cT"
Content-Disposition: inline
In-Reply-To: <20220823030215.870414-3-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vQISJsL2OgUd43cT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 11:02:10AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> i.MX LPI2C actually requires dual clock: per clock and ipg clock, so add
> both.
>=20
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied to for-next, thanks!


--vQISJsL2OgUd43cT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMN4W4ACgkQFA3kzBSg
KbacZA//XN0tKlodVlpCnQcnZW+SduZC5Jg3ooizH1jEzTqDHlfuUL0rdWd8yvQp
uf5VnrXfij1JrrzqhHHGikVd6CXyuWxu6jupbCFB0CHrA7RoBkH5tWk8BP8UYMYD
J2avE57pV/mNo/1uba/B86q76gzPq8Kr9To7kr63UETvKwPAijausv2Wy4zLEtQc
UtEPBzWXiR+aFsTaddpPDkNXyPxwPC+OywDCfQK44UM/NHc07ZcGMdIB8mnfjPGL
+i0geQuaFnu74/GZR6+TaixMZKAkx87PhK/mqmhgA9Q2s869PGRPKm7zdw6rTWLM
IlbbOMZM4yoWDHNbcZwKyrJK3fzG7K/LbSlITK23TYf9/e66cnFKxCCvqt/vOGGM
o2i3urX8H2p+umg2Qas+VKgRHvPANn44K/3CVNqvtUc23k++IBOJdxpBUTfbdWLx
i5zHzb1ktFlksDT1xfT9eAyZ4ZdHyryygweWVGg0jpRjx8VNAZ7ozLYWpm+DG6aI
uMS9dmGRyOOvCgtdSV/eFGAUqXfkLSmHZJfO4BvXuhP5GUnhrpSkeMP+nKLDJEkd
cxBI5U104G5Uo7myYUcYjIfIIOUm7gPGn/vKgBa2eYqzct6qGRCk5yMH7PHsTQyA
cde8M6Q2zhWmESW0ONa+9pUr3AtDo64LQxeIjbpsrhoAjjzjXWY=
=F5SL
-----END PGP SIGNATURE-----

--vQISJsL2OgUd43cT--
