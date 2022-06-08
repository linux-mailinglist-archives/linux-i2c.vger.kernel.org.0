Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00D1543D35
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 22:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235738AbiFHUEi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 16:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiFHUEA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 16:04:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3E519BC1C;
        Wed,  8 Jun 2022 13:03:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 17891B82AC5;
        Wed,  8 Jun 2022 20:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA1DC34116;
        Wed,  8 Jun 2022 20:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654718632;
        bh=wQ4rfPIpVagVQ3QT8pEsLwCxUHgmosnjPiIiTGUJX/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OMH2DLW58onHtg6XT4XI6AVhrm9/HKYtuzy9jVNgUgXc/hJa0TRxcEBesmDeE0toh
         RmGCrxE4o2aFz8LhsIHXXCBVT3bVJSk4juEinfMdUDcvjaEE6A2PPPlJsHTTj8x7Ez
         GE330D5XzW24g0bRl4ZcuqXXARDIOzXxa9MZ4d5jg1+c3zoB4RP2CNMYwCJEhpRVKe
         RrKzzBzUjszVxVJpAHqI6TbnkhEa+djDreE0lml3SSuHk2eBNNQ2r59+wgCAMwtE8t
         179pbrkTbzMr9KzCmQKOl2ZcfKikQfREcAcSOnFyXzYVbECi0VLhpNQ4tB5Fp6XzLV
         1uoN+zszgrrWA==
Date:   Wed, 8 Jun 2022 22:03:49 +0200
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
Subject: Re: [PATCH v6 4/5] i2c: npcm: Support NPCM845
Message-ID: <YqEApWattWwRIS2H@kunai>
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
 <20220525032341.3182-5-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kPJC/WFnuB86hUei"
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-5-warp5tw@gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kPJC/WFnuB86hUei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 11:23:40AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Add NPCM8XX I2C support.
> The NPCM8XX uses a similar i2c module as NPCM7XX.
> The internal HW FIFO is larger in NPCM8XX.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Acked-by: Tomer Maimon <tmaimon77@gmail.com>

Applied to for-next, thanks!


--kPJC/WFnuB86hUei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhAKUACgkQFA3kzBSg
KbYQ9w//cBr2k5EfU2chzotArllPjkfze2BvQOoDT/QrNM4SmzFk+6/12/IZq0hA
ix38ggW1Qaa4HX14GrqqEwHkgI7FRbt8ISrpYOwA6zTZCf8rUAUcmBBM7YT4Ccqm
HsMVgoJfeWKusIDOFJ44hIcFDc4sN4qIUmCXNk/u6+cIX95TePt1lcx7E2fZo+Bg
YHFxm759oUTxtfrUYJNMM/F7lP2Zl8qzTHshBoeHwwsGA7o+5h8k8+Kf7gc4UnGf
m+BOdy8uHEjF0L53nlsj0Acg0eAKUryGwUMYjdZssxmcyR/tgSJrmn5AEG8/YvoD
OgO53WoPVyVkAa/jWHaPdGT0q8NrK418g4T3dTjWBcq/0fBMe3bDMVzNq0Wohoe1
sws46hWbBGRLMEAK/Y5tktwqUpvUrUG1mTZZFpEQBJRLuhuTtS3JIljqfgFfwto5
oeCRs/toZkEjmMNsiAUdNJui999XzwWvwBdEx+DMlkvUmbIBmz5CmyE9qszuVKQa
pgmJ+ZhcWI2S+dbuoYWapE3voz+uE+6Htq1zH3F8X3hWJ1a1WwTCW6Cvah6CmDVy
W8WKWdWyMgY32ii8IUC3PqBs4FJj1mgs9ee1cSKaVejh/WH1/qkrfts++nSefiML
zVZht9FVqq0Oi0rVgN9pZoJACAc9LDuxCf36U9N9mrRJ27OPt1A=
=FUS2
-----END PGP SIGNATURE-----

--kPJC/WFnuB86hUei--
