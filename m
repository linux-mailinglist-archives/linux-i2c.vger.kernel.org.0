Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C0552F90C
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 07:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbiEUFxQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 01:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354621AbiEUFxP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 01:53:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F4365D29;
        Fri, 20 May 2022 22:53:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0428760907;
        Sat, 21 May 2022 05:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4C3C385A5;
        Sat, 21 May 2022 05:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653112393;
        bh=iX9Pi2bth/V+RGM2dJYoBQ26QIhpiDtMo5DZsLehBgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nhTtta1ECsTEl46sn4g8fFZSIipDJsyCx1y++uNWWMyiaAFBTNYzscnPgFmdiX+k9
         +G/ZWq6l+Ik5FA0OG19NT151bJiTfmptF3RzW1N/MH0TUA8BWmpeWs5hz9wjOO/24c
         tfwLUGpQ2uHh1ynv16+j6Nwzeq4sV8LObL0XZYyFJnIU5dmgCN/C7J3lB04ITuT9y4
         te2QmUVqER+R4Mtk2C+Ag4ERoHvJ+F4oRupw+Qz4nyOUJRH7N7jiVAK811w2IsfgK7
         4ExK3UuyBy4fIpaOK7EnLehM4nGy1tcghCDAjEETWjwRtEYW2GMfoFLXB/p0agBDtf
         0QDVt6WsgI1pA==
Date:   Sat, 21 May 2022 07:53:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 06/10] i2c: npcm: Correct register access width
Message-ID: <Yoh+RUTtmiQsrCg3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-7-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z0Rhw3MBZlF7sJ34"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-7-warp5tw@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Z0Rhw3MBZlF7sJ34
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:38PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> The SMBnCTL3 register is 8-bit wide and the 32-bit access was always
> incorrect, but simply didn't cause a visible error on the 32-bit machine.
>=20
> On the 64-bit machine, the kernel message reports that ESR value is
> 0x96000021. Checking Arm Architecture Reference Manual Armv8 suggests that
> it's the alignment fault.
>=20
> SMBnCTL3's address is 0xE.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Applied to for-next, thanks!


--Z0Rhw3MBZlF7sJ34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIfkUACgkQFA3kzBSg
Kba+/BAAtTezTQoSDncJg6b5TCsg7LsiGP++AO6as1MckJwdkhiRpKJ0lVs/2t5O
YKubTbFDGRnVnPKLbvZO9xIKWfXCN/bM8p+91ZLAWI7AiFzJVgN2HSmZLs9a23LR
tql7JXlUiCpmdtc7O2E1xwUhc6nvBIapZoIT1/U6eEsDG8m4SWenJ4kMlK8wR1/C
UGc+Un6nmRDEWnC6yOX9NrQof+MuCyWyy21y02DHNASAJwpVNzHLDGeay5zOH1em
72W5Gs3sOq98rOsH05ozyfBjZv7xtdjizoqPkeqYzdM9GHVHZNhZKGBFuvMGMmkE
kzfC8J0L7j6VkB+1iRLxW3+soWaGrFwFsSpGsyRb/VcrGhnsu1R8o5xf3plL62JC
DrXLHHY+2Jaxus2JgvWXGMVGY/sxX7WOenq+ZvpmFhsYsNGHPCdNJbNwNgXnxQq6
hmd7mqunOm0yCCEeUwcDCXFN1z1Uy6fVSfv98vT34yG5r6u1r4sFSrl/xF6Kq8GK
tGoKi9qlDTx01vXRMdTsNJAQ3j2m798PcyR4wLGt9qGup+H+QQHdu6mNCjJ/AltL
Gz4PNrPfvYGGLun2vzhKdff/fZYchMj9+F6ibDTyHmLQ9hLLluYp6Dwm8w/VWIuk
i6Gf4eQTOLYsglNZY/eY87lAGggc61xtVsWCWK+suT4rfzTGorc=
=aLre
-----END PGP SIGNATURE-----

--Z0Rhw3MBZlF7sJ34--
