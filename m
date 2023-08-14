Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 115FA77BA44
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjHNNib (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjHNNiN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:38:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87343106;
        Mon, 14 Aug 2023 06:38:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1CBB8616F0;
        Mon, 14 Aug 2023 13:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BAEC433C8;
        Mon, 14 Aug 2023 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692020291;
        bh=t7icBauJBJbjfgpWzY440IllQTVH/6HK+tv6+c4cYTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q0G/P5u601yj55RWvw2gClmvEfBdOUAylS2eaRLXMus/fyWigWFE/GpQ+DPUHUq58
         pPY0V/OeQctjK9hIm8mykfKxY7nQELOSlN0SE5secLkkz0HscZWs6J9h+qgEi9ikuL
         rLXBBo0QzDBJP472uNaAXVb0QlMrqHN4deU643CFXjldoAo+aTE9jyLGjyJtmhpWkt
         k+XGFNuqRn9NG/x7Goxg2DzxkPUTKozm4Eidij2eB4/Lqhvib5IhtDANNspTQFacFg
         9islMXR565w6J62g6e4ryznnSXTIpsRt0m1lH5BBt3vQQ6tEZYU5/VrIhhzSPjV+bY
         ybjdWQDrjzTbw==
Date:   Mon, 14 Aug 2023 15:38:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Parker Newman <pnewman@connecttech.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Message-ID: <ZNouQE7JpkGXdwvV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Parker Newman <pnewman@connecttech.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Db4jKuiAS4AKOy/g"
Content-Disposition: inline
In-Reply-To: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Db4jKuiAS4AKOy/g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 05:10:02PM +0000, Parker Newman wrote:
>=20
> This patch fixes the Tegra DMA config option processing in the
> i2c-tegra driver.
>=20
> Tegra processors prior to Tegra186 used APB DMA for I2C requiring
> CONFIG_TEGRA20_APB_DMA=3Dy while Tegra186 and later use GPC DMA requiring
> CONFIG_TEGRA186_GPC_DMA=3Dy.
>=20
> The check for if the processor uses APB DMA is inverted and so the wrong
> DMA config options are checked.
>=20
> This means if CONFIG_TEGRA20_APB_DMA=3Dy but CONFIG_TEGRA186_GPC_DMA=3Dn
> with a Tegra186 or later processor the driver will incorrectly think DMA =
is
> enabled and attempt to request DMA channels that will never be availible,
> leaving the driver in a perpetual EPROBE_DEFER state.
>=20
> Signed-off-by: Parker Newman <pnewman@connecttech.com>

Applied to for-current, thanks!


--Db4jKuiAS4AKOy/g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaLkAACgkQFA3kzBSg
KbbFJg/+NI5XqMJpKaWLfSatM0gW6FIo79Uim8p8ap/55ijuzAnBVsl4x4Ue//L5
+ebfAQ65hOS5P8+08RR7IdRuAD6iTAOHSXHE/Fj5Yvs+VKI847lxcSNQ5T2k6ori
pycBnmAkolhNU8TLMsSyJEheOmeBfPzyLKmc6p2DxmTokltKA2C92IABycFCaNPC
yVuPx0pKsotWyk7ANA28n7nQyZA+5RQn2+oUo5ZgGLZTuMM52FQEDGF8lSbVuaOl
nLkoBmmgTZJDizNBcjydYDWGowzoLxHtwHGTAkmQv17GmM2sPb8EMWNkC2HW9GLD
M4jNdgm9BQuoFnHzggmtKLT5XE3myCcx8zq/0ldO4MUGwteS3PuwTj8l0jsX062N
pPca3Tv02FI3q4YQ8rfR2aupqpfxT7MpLF3Jfv/LTGhpKXRr6mnFda8xq3OAIixP
sISl4p3ztVk6h3dOtUI6mqaIKsiUImB3Inus28K1L+SPz0bnmPdcUPhXpzlWpY1p
oUOVUyEMNVXCzXP+W5UYmQyfxokOUNwhPNjk9MqhSChsjsoupmUcEp8eWJkUYaDg
iwvmyT5tqyPwMZ/I8LPgxw6QX8nRqRwH+TJwByW6MiUpZiwmUWCgeMB+ZLwFFwVq
rL0CrMnOA1jxSYjaPctiAdC9A6KXk3r4FPxQ1jEkKygDWCxx9rM=
=+wNa
-----END PGP SIGNATURE-----

--Db4jKuiAS4AKOy/g--
