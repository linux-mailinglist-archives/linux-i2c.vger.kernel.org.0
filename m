Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B497F77BC64
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjHNPHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbjHNPG6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:06:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECD510C8;
        Mon, 14 Aug 2023 08:06:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3464F61528;
        Mon, 14 Aug 2023 15:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A20CC433C7;
        Mon, 14 Aug 2023 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692025616;
        bh=+NIKQGsKmMMJbWFy16rBGIgRnc+Ftb898/twa/T7r7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iguzc7DllXfmP7krdyWbHbMkYboZP7rMjJtswoyw5kS5vxprid9l9xOYb6xNpnCzr
         AEJVOetq7XDHHXuSKOd4mTRb5KyBr3CdWdremFn4n4EYE12cF2r6vP9i8hn3jh9srl
         MeYbnYJHbNfND77dHGBaULNEXEiR3/xH7zEb79lZ1J6Y/At/0iNmuSN1kzJaveQno7
         +5oSrtFk70ei0SFBZ97WzP2qH1NSNTH7on9oqtmpSegd1trHNElUPnWsn+PivJB/w7
         hqu1ejd69/RfT2HNXM8OZAgKYKxxAorQufFasTlrrP4Qo4zZnPvegnJAsYxTVb73h4
         IQ27ogWNy1muw==
Date:   Mon, 14 Aug 2023 17:06:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Jean Delvare <jdelvare@suse.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 00/22] i2c: Use new PM macros
Message-ID: <ZNpDDWiqpGlZ01fb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Jean Delvare <jdelvare@suse.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Zapolskiy <vz@mleia.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
References: <20230722115046.27323-1-paul@crapouillou.net>
 <169100562778.1919254.5355387350651563678.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YOrVHCxcIjSDhBYQ"
Content-Disposition: inline
In-Reply-To: <169100562778.1919254.5355387350651563678.b4-ty@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YOrVHCxcIjSDhBYQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:10:34PM +0200, Andi Shyti wrote:
> Hi
>=20
> On Sat, 22 Jul 2023 13:50:24 +0200, Paul Cercueil wrote:
> > Here is a revised version of my patchset that converts the I2C drivers
> > to use the new PM macros.
> >=20
> > Changes since V1 include:
> > - Previous patch [01/23] that updated the amd-mp2 driver has been
> >   dropped per Jonathan's request.
> > - [09/22]: Unfold _DEV_PM_OPS() macro
> > - [10/22]: Convert to use regular device PM instead of using
> >   platform_driver.{suspend,resume}. I figured it was OK to also change
> >   it to use the new PM macros and keep it in one single patch.
> > - [13/22]: Rewrap runtime PM line
> >=20
> > [...]

Applied to for-next (via Andi's branch), thanks!


--YOrVHCxcIjSDhBYQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaQwwACgkQFA3kzBSg
KbaDMw//VbdoB1uujcbHlW8pgRVSqHqnF88zf15UYW4oQMPcz5HTf2NthklikoXP
VZotOIw8HpQfsLEJc9ZOw6WaA+g1/1A0kJ6nft2+w4lXiT1lRRF0Nbq9VLDJ8iXS
se9KGtH9oWoiaDSRWT3rcpPTW2C5sPMBl9nz9Uf6zzx43rq2ATtETKSp1qi+tNXe
D2QeZ6Rq8U7xak/PyGO1DSM0IEHMygAQNWn7xU0GM8x5m/OREG1z4nodwrfgo0eO
a1iXMQ1yhJWFE2bVR9RncJqOcq+fIjnQs9ckAHbVB3E4qjO8N9jW577W9AEnmxhi
tAnS+LmXLz1exjmqAfeJ+R+KHUkT/Bj3eTNdnYk2vEdxR2OV+a87dfJMARmb1E5f
/92dgijhP2RRi3gNzIidpmHVqFF2L0jEDkWjd9OiZtU6gTmlt1oi815msusEeYic
AYR6Xr2bvlNuw0VCPyp2hn0NvhvzG3JZnTdZ3m0KYuqvX23wVf6Kp6PI+xnHqF8h
tqW9h1oqXlbhY2BsoWgVgiECeVbd4kUNhPh4nKiA+BPov7NFkFs7lU5jz8qqvpEh
d2O/6g2bL9qLQWmvOBMmQrLLtCXH5OQWSJMT+Y6gGtpfDlXYXZGVpGkPF3XWJCNP
hwQhPiLVTevWUMJgFmIPd3hxyb8Brn6BDBx1qb8G1sciMZxYULw=
=Jr5W
-----END PGP SIGNATURE-----

--YOrVHCxcIjSDhBYQ--
