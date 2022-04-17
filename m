Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2D7504619
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Apr 2022 04:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbiDQCXj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Apr 2022 22:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbiDQCXi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Apr 2022 22:23:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCF93F88F
        for <linux-i2c@vger.kernel.org>; Sat, 16 Apr 2022 19:21:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E19E661053
        for <linux-i2c@vger.kernel.org>; Sun, 17 Apr 2022 02:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48D4C385A1;
        Sun, 17 Apr 2022 02:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650162063;
        bh=3Or5js1bHSpH4RJIQirdiRYbWCrSzV8WTfLcT8C4kQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qlKDgV7wPkiOfcrYcc9REIUB95IQjrh7Ajj2xJAt/OZz0BUH5BTPQnAKMRgmvfkr6
         MPW+cedTHRQ3dTqxvcEyiVvfwyj8f6ejWX6Z0/r49BQR78M5AJ1MAzVK2GCx5tuc2o
         lWaSaL3i3LPe3KFGP1aGXRXYmSoqodyqq97cdBsfs2nhhhQKWr1Vgez8egZz8he1Mq
         BTo70Xuv3FZ9zdCPvgZYBN9HiBuS9fZiVyEsXJgtCOERWF4jVGVhSchScpLaeL+g2A
         8IhcXjEUcIy5YSy0g3g0iZPDyW8pEFOeOo6V1HvGrJpqFyGTc0knaIfvRuMcs7dOjX
         Exdc9opIyiiiA==
Date:   Sun, 17 Apr 2022 04:21:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Boris Lysov <arzamas-16@mail.ee>
Cc:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 2/2] i2c: mediatek: remove mt6577 support
Message-ID: <Ylt5jNRmcuz3/rfc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
References: <20220120185853.24266-1-arzamas-16@mail.ee>
 <20220120185853.24266-3-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="07OTgMIzch1L49bR"
Content-Disposition: inline
In-Reply-To: <20220120185853.24266-3-arzamas-16@mail.ee>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--07OTgMIzch1L49bR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022 at 09:58:53PM +0300, Boris Lysov wrote:
> The mt6577 compatibility was introduced back in 2014 in commit 8452c80d5b=
4b
> ("I2C: mediatek: Add driver for MediaTek I2C controller") by Xudong Chen.
>=20
> The i2c-mt65xx driver relies on DMA since it was first introduced. mt6577=
 does
> not support DMA [1] for I2C and doesn't have dedicated DMA engines for I2=
C.
> Moreover, the entire mt65xx Cortex-A9 SoC family (mt6515, mt6517, mt6575,
> and mt6577) which share the same I2C IP doesn't support I2C DMA at all wh=
ich
> makes this particular driver incompatible with these SoCs.
>=20
> The existing code used mt6577 as a "generic" configuration to be used with
> other SoCs such as mt6589 (for quirks), and mt2701/mt6797/mt7623 (in gene=
ral).
>=20
> This patch makes mt2701 (which is *actually* supported by this driver) a =
new
> placeholder for generic Mediatek I2C bus configuration.
>=20
> [1] see references in
> https://lists.infradead.org/pipermail/linux-mediatek/2021-October/030333.=
html
>=20
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>

Applied to for-next, thanks!


--07OTgMIzch1L49bR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJbeYwACgkQFA3kzBSg
Kbaq9g//fmWkkWK0LIwVeoJtLBXlJYIswv6dgxNCOrHnIt+ddYEt0b7JiB4Tu6TM
q8zDoJEnCppxTlLTQmJWaKK8N9pe9+D2Zi5pjdIH+QsuRGYCsrPXs3rgMZZ9qygC
HMkWyYgZJOWwC8ON0rGGEJeFbcFKPmjUM4vltY7Ovf591744ZcT3YTkYbeu8L6cL
5BF1jxiO3HR+mF3ppDvOFUj7ssubHPaQt1u8ekExrpPJ/p5qcQA/qXrmX6odskeF
vsfrCWtt2Pm3ZhnnDmZZgtRYv0rqBgNLh3E27j2Whg7/dFZXipmIoO1esfqFv7D9
aCLVWZO4DK3DDTIfoTBeO2xFfrd1MWrtnKJQX5Y1djhAU2Q7arWj7Kv1FYtWWnhr
Zi0WoRTBfn6jgwt1DMHwGZa29p0VX8ms5ixvfInW2INiaITGhcwF2dnKxWm5fgGA
9MgNlvPk28IqhxpVh7VVoxlMR3tHDpVrlrMQVoU9NtgsSGTDrcgkfwCtB3DcWLF8
NLYTamUNf0rkiRsooqb5hW98sExSbxac+doVQ87RBXycWEtVR8p6uNVGIcu5CgUR
pMOQYw1+Z/tEEMh6jOmWaWmKeim4RigL3Sr9BOmlVwTEsEnv73TarKw1kmupRAUu
xN0lxxfHjZ/W5YZi8J2cKE6q3N7iG86Ui5Yp7YBZeXWLZAOZ0DI=
=gL9Q
-----END PGP SIGNATURE-----

--07OTgMIzch1L49bR--
