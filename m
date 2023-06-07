Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3079E725BA7
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 12:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237056AbjFGKbL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 06:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239230AbjFGKbK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 06:31:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4555C1BDA
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 03:30:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D247361610
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 10:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9709AC433D2;
        Wed,  7 Jun 2023 10:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686133849;
        bh=glTlGhPMsKMl//nzrIJpv+mjk0C2ePcFeVHTdvFulO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mg6AOdfNLZfHT+W4fJp9S+tqEnixXHTHzwbBlOgua5NZ4iSGRIP0Zbx3QojGPwR2Q
         xgDI3Uf18xVmAtxl3o4BYlsLe5MWOruKuGNsFz3Q8xmiAbQy1ZXTAxIQDrCDddEZhv
         viXaVSb0yTqyifpPnBEjJCJaY0jPpmRh53fP6cRZC8oYNpd0p+nJb9qjGWFbXX9Bvi
         w2QV/eXrFWI4WN33bgsfTd080KDIKtM0BSgqbjwz5y93FwHy9nJTrAZHmMQN+zMnSH
         uKzw1rJCwptXYbNcIOeCfxzSTphWqrM2DJNebKRblhCWJWD3jiCFu+m1FrMH5ALjWd
         LhOv0sBkA9kXQ==
Date:   Wed, 7 Jun 2023 12:30:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: sprd: Delete i2c adapter in .remove's error path
Message-ID: <ZIBcVUiEr4VprXt6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org
References: <20230309095819.2569646-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H50CSXNCIYOboh17"
Content-Disposition: inline
In-Reply-To: <20230309095819.2569646-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H50CSXNCIYOboh17
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 10:58:19AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> If pm runtime resume fails the .remove callback used to exit early. This
> resulted in an error message by the driver core but the device gets
> removed anyhow. This lets the registered i2c adapter stay around with an
> unbound parent device.
>=20
> So only skip clk disabling if resume failed, but do delete the adapter.
>=20
> Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-current, thanks!


--H50CSXNCIYOboh17
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSAXFUACgkQFA3kzBSg
Kba2+A/+NSIoWVd1e+xrmyc5QHEtM1Mdjw6ffejxuoy//XiQkzZ2bLlLhwcoSpOr
Rw1ETA7aEIswmME9OC3xUsCREjVlE/MMr+a7hayYosPfmZxpNqymPrgLbEpwbiHI
57LrL3kj0X41qssA3BEP2E0/pz9mLvKTXexsTyxroL1NYamfIRls8T/nU00yDXy+
+EOUKvU3v1En2HyrsTbcIUMDoMmitUKty/UHAfHt74bLASjzvKZjKCTSHTws2tKL
EwgSyWtRMpGxMKIMtp2//9AUlh1CcaD9loq1qB1lcOsJpKA69IjlXxXeLO3OBy8a
TX3vJufOPjp2SbW48a6K5AF0Vs1Ns9BjKeqdFB30GJ1+kW3kl+WsfBDVwLQasPo2
wwqhgF3WtJQ9/Kjpxl26YhA0ed/JVATJr/LB3a04ekydtLWKz6wPjuU8kQnFT7V/
zSb5w9Fn4GeuzBzFv8zlGSIAnsi0g+gEaINBXC2/Rty/QxdA2vonOsLp2dB+ULab
oAwSamDfFmLEUvS9xjjnfuybyaSXN55RZgW8o5NGJ0LAXz6DW+meAYiFIrf34rA0
5tG46d1qOhVWSQOimPTlF0C5TyozaGMhHYMDJCN1DxDQ4ku6QR0UtVaqwYvghOnG
8oG+k5qvhwHKZrjElS+eqM8iE2GfTC5fuhoQnhA5p3Ox5FwR4Uc=
=xweG
-----END PGP SIGNATURE-----

--H50CSXNCIYOboh17--
