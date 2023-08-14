Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAAA077BA32
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjHNNfS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbjHNNfA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:35:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C561918B;
        Mon, 14 Aug 2023 06:34:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 62C5464FA1;
        Mon, 14 Aug 2023 13:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337F0C433C7;
        Mon, 14 Aug 2023 13:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692020098;
        bh=KqSBDEeLJiP4oFvBF4smiLffPgdFT0gZQJsm0Y521xE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KG3QdeEdDz0Je6PYuRuKd5rrOhCQxjGlVdIBgq3bWIbpr1H6P7yCHfZtRdfXwvGD2
         pok0Hyw/ViW+UYYOhFWHhTKKy4X1enlR3cccqQNjj7Vnd4aYdgCgH1JeGo6C7MhgUv
         Im4xwdcfBd6UdC1ng+zXb2PR10ueV04EYCyBEEk3UyqxBOVsUnQsOpmL5plxk0nIkh
         QBLmz9s+lCkaByoiLn3oUULjPx9Ib4izIJ0CSXpDk9c0Ywo0Zad6Omac0eVpZL81rF
         6mF6hqmDCbpcwUE3AIIVXpmU/Bn+mJj/PWBKDs7chNMEkkugmNztImiriUagV3s/Wa
         m8j4b5NPYy+Tg==
Date:   Mon, 14 Aug 2023 15:34:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] i2c: tegra: Fix failure during probe deferral cleanup
Message-ID: <ZNotf9YcIoSMjarw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230707132619.2998382-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k0mhcplxfVfpH4uM"
Content-Disposition: inline
In-Reply-To: <20230707132619.2998382-1-thierry.reding@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--k0mhcplxfVfpH4uM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 03:26:19PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> If the driver fails to obtain a DMA channel, it will initiate cleanup
> and try to release the DMA channel that couldn't be retrieved. This will
> cause a crash because the cleanup will try to dereference an ERR_PTR()-
> encoded error code.
>=20
> However, there's nothing to clean up at this point yet, so we can avoid
> this by simply resetting the DMA channel to NULL instead of storing the
> error code.
>=20
> Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied to for-current, thanks!


--k0mhcplxfVfpH4uM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaLX8ACgkQFA3kzBSg
KbZ6Pw//YxrGX6Oku7C5roHRa0Z7E1tyEodS1nPVi69JV1G7zuOgUKDPx5DMetCM
GPw8fU3fujZ3rmVZ9Vz4Gv6Xa3fpmT65L7eMLAAq002NpZ2RopwpBKuMir71XsR0
d6ocrTa9appLNkIlhO/YK8V0TvZ8USyOKySXSiRCy/iGirdJ9dhFp+0PQRm5X48u
WxnQFnIZUPiJUOLoa4kip4nhyUfYfPOD6Z3qK3s30A7CvSiWUBeYWNxjeVX8nTTf
E1JTg4Kxv4qC7OjdwhurUoxcPlJIml44A3snpNZR9iYQI1Noh6D/1njZqdTAsdCQ
cF15ORPF02ntgAyn7mSJ5JAKh2nQJOqi8kCVsrvEx04tbMvuODyIsG3KeJUwfuKY
X73hzTfhCUFsTs4JRDa7twdfMigAc8VFUo+gDnLNCX5ygNyGdUXFAiNqjhz+abGf
wFHdFnBtbIuq67SUaZoA4YlSnueUVPTR1oyD12KgoTJH83I2RgCwe0ZK87NNcbcp
kWFUKfxz3W65INeAbZz+l982MN35CChtvj843LoCuOtToZT4RAyfRcvUBGWQxnlx
iEtryD5O9pM7dmjBPHW7cmj4BHj3sIv6YPli/jqW+N0l0AS9MChEvb69rKN+p9ns
iE0bU8z2zGMVwJkONTSz+32BukwBh63DepdkTQyC9Yt/F6gO9HM=
=z8kJ
-----END PGP SIGNATURE-----

--k0mhcplxfVfpH4uM--
