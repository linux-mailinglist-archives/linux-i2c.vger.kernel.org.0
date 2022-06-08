Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979C9543D34
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 22:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbiFHUEh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 16:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235788AbiFHUDt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 16:03:49 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32AA302227;
        Wed,  8 Jun 2022 13:03:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 24AD4CE2BA8;
        Wed,  8 Jun 2022 20:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80088C34116;
        Wed,  8 Jun 2022 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654718624;
        bh=2YBOOzDcHV9YKatCnZg6tuDE1Z9gZ1Em1HcbE7wFvVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TRi+X6ISAS2AYsUquXZb7ZS4tsHenGEw8J86GI+nJR/KEOep44TF2LCctaxL18sUF
         F8QmqEFVF75ymCbkgzWmj9tdgoufjXusPIdA2iky6WIfhf7OMsqnblWAISYD7mNtXV
         8GDwq/iOGJxz8AIr/yXRi6kfJ7y6Qut8wW7rM4m8erc9KwMKv3MZdN3Kp6jS+wh9Sb
         0mP9/nXGJGSrq4zR8DJTO3yo/Qpg6VvuxF0EMCBoVRZhOlaG1jbk3/PcSH7wVZqtRt
         tgWMnjGf1JgMEj4WbSBdlVG0I3ms0yWK9yeoo0dgus/N8GQfc998WfYVB025Xj50sF
         UBMP6lGBtG97w==
Date:   Wed, 8 Jun 2022 22:03:40 +0200
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
Subject: Re: [PATCH v6 3/5] i2c: npcm: Correct slave role behavior
Message-ID: <YqEAnMTaHTbIDQq+@kunai>
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
 <20220525032341.3182-4-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qo+XL6tbyZ/UK+9f"
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-4-warp5tw@gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qo+XL6tbyZ/UK+9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 11:23:39AM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Correct the slave transaction logic to be compatible with the generic
> slave backend driver.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Much easier to review this way! Applied to for-next, thank you!


--qo+XL6tbyZ/UK+9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhAJwACgkQFA3kzBSg
KbYgkw//faQJRCtPr8Tb8HKWy5/dYrz0v3Qn1W2bFsyOpkiK7ZGaagL1CWrcoA4B
U/8cC3me3vdBzjcBhgOtOW10Af5Zlwt7TN58x/P6Lsr8fS/I/pGz1dLSo9mHlZuL
juQY8dI/1GMt1k/AcuriTjclCosUbpAiikNq8iXPDr2xDmUVT+6sI3RsU3CouufJ
id3tZPx1GKuAVz9tcqzPpEPNdmU/yBmQ6fKKJEWV0a7a/KFmXrjqjvqujhwa8Iwx
GTXAhyDyfV59pI9fiYkL8E4w8f8HDqMInRyZFS+wPbIczvx69oasHGIdRS8nxQf1
kSiN+tY58U2ux/ejw9k1xgOTnUgBu0SiF5Oqh2lBPK03MWiO6vIkwYE/k8Dgrwkt
W2+5uxvH71m25M9SBoZ6sxuA5nzq0aNAqpQbgpZO4FmdTqMeOX0k/XtfiwoXjvTM
Zw8sAEnSbCp4ekSs5XvP+L+IKvUmllH6rDQ2l1PpF+BvtYNO1Rb8smPTZy/5f2PT
HW4HcYzzkDvG/qI42bsqNfRXVlrbMA4XRgPofR8Rj6Kty15BRyLwKM6O89nvqgfA
UaI8CFP+zzIxeBqnKqmdYbOxWKoKLipX0DwegcxwpRm7126R+Ec/k2WinIpK9TyT
Zbiozv7Nl+LEn63WRxEUONHrob5Vf0ADo5NUmPjoJgkyqKfs5Mk=
=N9+I
-----END PGP SIGNATURE-----

--qo+XL6tbyZ/UK+9f--
