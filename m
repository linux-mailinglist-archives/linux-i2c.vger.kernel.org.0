Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7898F52F8FD
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 07:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354609AbiEUFvg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 01:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354605AbiEUFve (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 01:51:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67E855343;
        Fri, 20 May 2022 22:51:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 74663B82E24;
        Sat, 21 May 2022 05:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7C8C385A9;
        Sat, 21 May 2022 05:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653112288;
        bh=K2MHfb/cUJpXURo3lPofD9f0y9SQuR2AtarJHMSKeNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RIB+ANSnROxwABAR0zcIRNR0crLoYKxOOqGsOAYfOq4y3RPeDJcDdFhQte80rCg45
         IieQb+mG9G0ucWb4kqkZfO36mKO9+ndJnyA/L/iVneQOLKfdh8aEWk/lOXPMJMRkXT
         +uBtJk9E1mwFuypAhts6PEF4jxxc3XC/iKm11yuV+t+2SQvFV7Jja9SG6tDDJ0fQii
         lQ3O1x1zerTrf5Rod59HEHSnyotz9cqBh46X22PYB7Za3vKnnISa+LgQduE2XSyXng
         rS8s6Yi9xPIb1LI3UPaLjkRcOxmcFc1uRkAis70vkAuikCYKJGNvYETnFOOSqQ+E2L
         F/B1Lx7hXAXhw==
Date:   Sat, 21 May 2022 07:51:23 +0200
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
Subject: Re: [PATCH v5 03/10] i2c: npcm: Remove unused variable clk_regmap
Message-ID: <Yoh9208mogGeWPYe@shikoro>
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
 <20220517101142.28421-4-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IH57joRUMFEhmIfc"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-4-warp5tw@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IH57joRUMFEhmIfc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:35PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Remove unused variable clk_regmap.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Applied to for-next, thanks!

I dropped the Fixes tag, doesn't look like a bugfix to me.


--IH57joRUMFEhmIfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIfdsACgkQFA3kzBSg
KbYV0g/+J6kw0YqKXl6ogOJ0Z9VJBIyF1Qdn2ujna4rpXeo8oN3dHcujBsksG1tG
CdHOMTJFfdmV+7qXNBBI3LuzhCky3uV+MmulTUXuFZugS3ik+VUtYP3AHKEpXfKo
rZiF6leA0oO9hAq2mm042B0WxjETC3Co0MoU7YjYT1PLRgjJMAOechSr6YqY9bI5
zBy6q6aNYHs1hosyT+Ryhc2iBZJ6aHBzQnQkrK+cbwT7VbSQzoT+ENw7VWlonFSC
v46gPpHdFsiZgRkl4dL+QIxoiklCcfDNqwJJ1FzzlEhHBgx5d5G8ss46CCK8PNfB
les+Qj9bd7oJk6MmeG3e2HugD8cpC1euw21s20O2jYL51/f1P0pKFlVgz+KX/Mle
Rbkk6+0DEHi8Nf2NmWdR5CNx8yCoXKZmnLvtf3g+5uv8Y3OVvPwIEZjIvC4aywtK
crkJNKQhCdsR2XL5ktDk8RmUyKnCUynWmFjMZXAFpQ5plB6cf1TOvNiUyTFPC2/O
HPrl0zzX3BFD0LX3hJUGxrtZvXlDc4PPfc/36u2Ks8TsiZL4SQKRI1s4gajAgZAh
2f54h+2JUPLj4F6rjGBY9P2/jQ/AA4mAgOl7oHtc0Yj5FokFYBqUej36nIScrI4R
IYvF8JJuIfQG0EgtzGhJ5je6MOXirO74AGqQsfT1ei+y1hA6rIE=
=xb4T
-----END PGP SIGNATURE-----

--IH57joRUMFEhmIfc--
