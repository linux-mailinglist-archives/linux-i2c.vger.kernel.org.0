Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CDD543D2D
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 22:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbiFHUDD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 16:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234704AbiFHUDC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 16:03:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1583614B2CE;
        Wed,  8 Jun 2022 13:03:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B2D7AB82A86;
        Wed,  8 Jun 2022 20:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0494C34116;
        Wed,  8 Jun 2022 20:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654718578;
        bh=Bp0cnGXVgFina4GDFPPH1yUOOzmqgYeaEbbSj4nOtZw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LimDepcGADFLM/UIhYLzlLIUiz7AYL2mIDMaEFTBs3VzwqOTkn4n5UPCIB+nC8cpd
         zkZfV9uyKT2TpYzP9/QCFcVYaH6LvPF/U+8w5pR9RctFWJLR87xbaB5MCivkSGwOPr
         UKOU3Y4yo2MMD6u6IG/lGVaNVgk/fmvGpsLxIirsLA/zsMGwOnEEeZvvUkhK4hVDvV
         nEkBSb+SnIIK+DIDjeSv/IFn1Cu1jnGR3XWiWNTLTnFYQ5mVK3Nyoan7aAItrN3E/D
         St5auU+hrkTgqHr2iCjTaqxxHQKVWrMv3vNF8/ttN76cwR8Tnc1i7QTEUhRCb9yIGs
         c5Kd67KRfVRcg==
Date:   Wed, 8 Jun 2022 22:02:54 +0200
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
Subject: Re: [PATCH v6 2/5] i2c: npcm: Remove own slave addresses 2:10
Message-ID: <YqEAbm2T5zKmk/Nw@kunai>
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
 <20220525032341.3182-3-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WJDYl7eghNYS++LO"
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-3-warp5tw@gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WJDYl7eghNYS++LO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 11:23:38AM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> NPCM can support up to 10 own slave addresses. In practice, only one
> address is actually being used. In order to access addresses 2 and above,
> need to switch register banks. The switch needs spinlock.
> To avoid using spinlock for this useless feature removed support of SA >=
=3D
> 2. Also fix returned slave event enum.
>=20
> Remove some comment since the bank selection is not required. The bank
> selection is not required since the supported slave addresses are reduced.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Applied to for-next, thanks!


--WJDYl7eghNYS++LO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhAG4ACgkQFA3kzBSg
KbYjlw/+JxeYIE9NzBvLklncHaU5C/1IbJpAlfr8h4GbRD6nvkF2gBe6ALnUDO0d
R2yS094ozPEr4y3AsfZn4ZmIRWjtDe7ns7hm2AogChPqlHeIExQl36ZomCvhtuj8
Opb7tt9hoP5DvQjY1a/lujeCf1fVeR1uhoTJWPZ00rXJiUxPYxcbTkpcmZXmNh8S
lUdu0ImKcioYLFIkWRD8nCcBdCeUFwCVNFmlG5o1Cq+Rhsu1jxOXVCgWP5DEioBl
ZsWSYHz9a3mZtlNB57bD6doVps6DLcXRcVS21NaWEXPvyIRsKWDdNSMZWYozFGyF
P1AfgamFYt0YVyqe0zsvERdLQPFTgcfC3cAM2cu6gox55blclVQk42oDyExI8s/8
C2jOK49lRBQp3KnxAiIY7SexPAHdgO6fiikoGjpw47kaH6z7JcLcoBFSBCmgYQsU
9hQ6wyZA0apBpOKCPA991Ri4FEunDWgi9IV3ZLGCkt0S3YAsWRJGfoCmU7wi4pVz
/DR7TE1tH12U67ktdyFOJ2CcDeLn5D49wag6nvvQRekcufzogtwOofwUSRQSLYBg
15cYRjFNps6L/3qaHJabDxNPKuu0CECHfzQuOGZnC/atw7dwdXNFF4p15LUDgpt4
XRJdBZHel7c/LCeMJiT8ocdd2KiGzPA1H3hiwAFtq8A+ARwb+dY=
=a6AF
-----END PGP SIGNATURE-----

--WJDYl7eghNYS++LO--
