Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF51A50314D
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 01:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353599AbiDOVSl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 17:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353572AbiDOVSj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 17:18:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E60DEBAA
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 14:16:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BBA30B82F3C
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 21:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5949C385A4;
        Fri, 15 Apr 2022 21:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650057366;
        bh=7GcfSVm+yvSQ7f672oVb5kT5KQW7gdzrPo6Q/aVpxQg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mLjUet7gyiuZWTqfSJXroQY3KNwSHqMOfyvsWeK4otuRl4w3tYDWrqeVMTg3OwPDL
         88Vw2KEF2DyDsht2sfCmnlAjaNQd6ON8LNW0ANQuPgOIURb4TnZzzp1VHqypdBy4Cu
         U3mlzM8hi0PPOg1m28qjBBGL/NjbHH3QWxFLoLIxK5HMIMRphiAxda2wOc45kMslXx
         hOVz0bSxFsw4Bz8ETpHUPHFk+ni/BpxG2aPByapyPRPN0cQJ8xo7jSPtkGniUVbKVb
         xTk33PVpvn8gqmcRQH66vUNFHljr3lIKv/D7ooehR+I0wkWmc4HxUTkM4ANDhpYmQm
         i/cuvhZlkYD0A==
Date:   Fri, 15 Apr 2022 23:16:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-i2c@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: imx: Implement errata ERR007805 or e7805 bus
 frequency limit
Message-ID: <YlngkTlsJ8M1gB3z@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
References: <20220408171524.73551-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jkduWrOVzShXpNz9"
Content-Disposition: inline
In-Reply-To: <20220408171524.73551-1-marex@denx.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jkduWrOVzShXpNz9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2022 at 07:15:24PM +0200, Marek Vasut wrote:
> The i.MX8MP Mask Set Errata for Mask 1P33A, Rev. 2.0 has description of
> errata ERR007805 as below. This errata is found on all MX8M{M,N,P,Q},
> MX7{S,D}, MX6{UL{,L,Z},S{,LL,X},S,D,DL,Q,DP,QP} . MX7ULP, MX8Q, MX8X
> are not affected. MX53 and older status is unknown, as the errata
> first appears in MX6 errata sheets from 2016 and the latest errata
> sheet for MX53 is from 2015. Older SoC errata sheets predate the
> MX53 errata sheet. MX8ULP and MX9 status is unknown as the errata
> sheet is not available yet.
>=20
> "
> ERR007805 I2C: When the I2C clock speed is configured for 400 kHz,
> the SCL low period violates the I2C spec of 1.3 uS min
>=20
> Description: When the I2C module is programmed to operate at the
> maximum clock speed of 400 kHz (as defined by the I2C spec), the SCL
> clock low period violates the I2C spec of 1.3 uS min. The user must
> reduce the clock speed to obtain the SCL low time to meet the 1.3us
> I2C minimum required. This behavior means the SoC is not compliant
> to the I2C spec at 400kHz.
>=20
> Workaround: To meet the clock low period requirement in fast speed
> mode, SCL must be configured to 384KHz or less.
> "
>=20
> Implement the workaround by matching on the affected SoC specific
> compatible strings and by limiting the maximum bus frequency in case
> the SoC is affected.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Cc: Oleksij Rempel <linux@rempel-privat.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> To: linux-i2c@vger.kernel.org

Applied to for-current, thanks!


--jkduWrOVzShXpNz9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ4JEACgkQFA3kzBSg
KbYM9hAAoNKILElPg5IXVXTUO3x9X6jGdmTsj5Zl31K75WLfxIbOP3wYHkecCV5r
ozKE4Xk15zDMm9NVMItgtjUszGBOTToyuTMBrs4Otsk1rGO6gSyA+wZRmhlPEHah
BOT4gxPB2xNPb7p9IGhSLzncmoeWyRofG/AYNzqNHANM/pesua74cXIK9R/uQJ6A
astP9iCcJnzC0Dqwo0gn1mpwVvtCBOyMHE5oyx9Y0ak0ndisX8zEWCPstV3VRrjp
TGDdKJ41iYw8V2gAI676tI0VfG56NnaLP3FnbSgx5cU6AFegSVa+Qx/3UblGuOHL
LDRDCpoqv6OOYREK9unADN4+78rOgCfp/pdWGOLTr2E900FQJG6GBV2iNlxESoE+
mCQgWOJ6zfitXJ1Be8xyxrLtikl/Dk1JSd4tI+RRaVnu7lsYxUQo2eoMgZ5n3QEc
jIyRSg0SvXiBJg4zcJl9HLtX278kj6y+xWHY0ZjxhTbZCt//jQ0dKFRolH4K1Bve
+D1cWgwbYu27DjOCIm7U17D904Y8W0rtuVyNYLEHuu7a3UVRqyi34HBOr3rLx2Nd
BOuVHNZF107Hx0rUtr3mKt1Dgyl4SaJF0mlN2mirkM0lzP+3b4QQks+KymTFE20o
UdQ+KYpsFLozzuMBqEbijUDgaRybE34mQe1OON+NjZAg4Zsn7V8=
=NdlU
-----END PGP SIGNATURE-----

--jkduWrOVzShXpNz9--
