Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66115543D37
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 22:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbiFHUEj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 16:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233464AbiFHUEZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 16:04:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3D8315DD2;
        Wed,  8 Jun 2022 13:04:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DCEA661C5E;
        Wed,  8 Jun 2022 20:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64005C34116;
        Wed,  8 Jun 2022 20:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654718643;
        bh=iEDtaw+UD7JzNvI4iPQwfWlhzPxIqIbseSeOPF4qN8k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z7YFKWilbACVLrz3oTq8C2wj6mXmEEBKQT2GY0+0j6yO81B/ZPe+/o2FcTN53QxyH
         MkNfXV/eI7FPT0Fftpqg+xF7qiuAApBdLfPOEBsHD7npaJ3qOIs/dpyyPGjnLW31IL
         JzLl+uZ4xOl8CSwO9lANxR2DnGVswsDdfU1sUuVYy6pgvb5dk06QWmsjwLnfcBOq4T
         sK8nqUMBKVffCOJSzT96UcY1J+xqSgSMbwYCwdXuvTemT/d/YeEkjl4LPZMbfaEdj3
         Tm+VhYWA10WjMhnO34EKvCHtqSi5Ygp3x9fYpBc5hPfarr0jI0Vv/ehpgTjja0tGKf
         /nKZO/PEC3Hng==
Date:   Wed, 8 Jun 2022 22:03:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
        sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net,
        arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] i2c: npcm: Capitalize the one-line comment
Message-ID: <YqEArxDJoUoPeiGY@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
        sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net,
        arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220525032341.3182-1-warp5tw@gmail.com>
 <20220525032341.3182-6-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Mdk8kH3E0NmNboo9"
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-6-warp5tw@gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Mdk8kH3E0NmNboo9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 11:23:41AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Make the one-line comments capital in the driver to get the comment style
> consistent.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Applied to for-next, thanks!


--Mdk8kH3E0NmNboo9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhAK8ACgkQFA3kzBSg
KbZktBAAg4+RgB7rQfxMq+y8HenPl+BlvnnQCMGtUyisQ4K+bRaegHOAByUmSUam
tdW7sicRzHSPpv1SjkAqhCu/U6OGiM8m2hmYGXH1DJmNoKG1l0OHaZhbxJP6FPS9
fIx9j6Nv8UqK/cEoid28k49Yyl7ZaxtsWTbhKk1PNh3yaOkSHQ5NMq87gaUhbqn9
1MAexC7g6Y1nfwCZTEvLAos6mZ/IhISS4Vp5GTb9KROAd2wClDzim3f1igqvOOdr
iJ9taWl1HlCEzPP/HKuS50ZFRCWZQOsieSTzqAuXVImXEX379t5t0bklqVf/xw83
f2i6cx0GSszch21T7XgnkjjXcavx672ZnZ/BmpRmiNXvgvGRt5CZACPPkJZphmJh
Sm2PUqUMID4vJJQW+Rc08IlXry28TYbTacIQs9QdWjHVyL+VhSQ/d7DAz2NkQX2G
RVO14tkAhPdk4cWS5wLjhSsy2ZzWmlO0kkR1hEyHwj/hYgx3xQdssT5z3+3JY4ls
AAz8ftBFEwNoSPjoclGc7Oalby+9gQ9i+xqSTfyJAlfkD4XjQc60o7R3iuXARrUm
QwXMYhvI7/iU1nt6sPHnV2OXGibbE6WzoI88sYKJfeRvTPOShYUdVEsh6Fo1QPBM
bJ+Fq+AYOyT6VHOsq6HYSB/2uk3bZ9iS+iJBoBg5SQ2Hkx224sc=
=RPDX
-----END PGP SIGNATURE-----

--Mdk8kH3E0NmNboo9--
