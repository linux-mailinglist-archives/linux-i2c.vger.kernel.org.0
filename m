Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45488722120
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 10:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjFEIfu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 04:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjFEIft (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 04:35:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6DEC7;
        Mon,  5 Jun 2023 01:35:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6301260F56;
        Mon,  5 Jun 2023 08:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A130C433EF;
        Mon,  5 Jun 2023 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685954147;
        bh=1F/1yuUMdCDvUyJ4Qcy3/w+FQ32NpxWt4UClc0xwcHc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EI/L/fx/hhQovxbSdPex+A1tQpduASrvaTVq9GIw/lD4IiMsfVuIMJATPhAOy0JH7
         CDtOiL0C4uJXUI3N1K4wnYqNEKqU4M5MSEo30frC6LP5EvddT/7ryscBOO3AuZgsvY
         Pu3CANM7cAd4oIXq4V4PDTTeWVTR9JCW0uwBAVQhiTfYDBxcqJyn5fOue4P9JWGzxh
         23XXOJFsp37Av0zT4k+BWCYSCrKXcvecF616sZ2X8npkvmX+5xdkJR4z/2ZMkGPNkN
         F8WVI1vNY/5aCTupLgLm/0dH7g+7iVTC0hcA2ZrrTfmvg0SAg9MA/JduXWZG9evqy6
         qCNezFrxr81uw==
Date:   Mon, 5 Jun 2023 10:35:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/2] i2c: tegra: allow DVC support to be compiled out
Message-ID: <ZH2eYAIkKzbaZPff@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <cover.1683407699.git.mirq-linux@rere.qmqm.pl>
 <857cca81cdda30c1a2b5fb87e81cc50ec6c51e63.1683407699.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5cWx0N6riBYJe/5T"
Content-Disposition: inline
In-Reply-To: <857cca81cdda30c1a2b5fb87e81cc50ec6c51e63.1683407699.git.mirq-linux@rere.qmqm.pl>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5cWx0N6riBYJe/5T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 11:19:01PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> Save a bit of code for newer Tegra platforms by compiling out
> DVC's I2C mode support that's used only for Tegra2.
>=20
> $ size i2c-tegra.o
>     text    data     bss     dec     hex filename
> -  11381     292       8   11681    2da1 i2c-tegra.o
> +  10193     292       8   10493    28fd i2c-tegra.o
>=20
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Wolfram Sang <wsa@kernel.org>
>=20

Applied to for-next, thanks!


--5cWx0N6riBYJe/5T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9nlwACgkQFA3kzBSg
Kbba/w//bBYk92fFQ6lvwRyQbHv6pp28Oka643dFX4qwpgtNgesXSZrySm+9O/jU
z+PdYHXXQpZyH2mBU4Kkm3waRMAT8elI0qsaHUTDTLx+YaikL4Y1L1DD+PwtZltH
3Pz1AV9q/lApNNcWXMee3/T2Isq6J885LHUeyFitFXbZOPKcOYDmpnn8MbApXGUn
iLJg5WIdCnCswjYQToC6rUb1CrWXO7kwhfvZadtRQDNiI2qtL4J+sJsAPGz5SZR5
h846A/DyQiRf+qwMjZ81r8EhuTrSKhvD+9M3hFN3w6yEg/y1T3DtiVNKUtd4y2In
WIvnsPELkM+CFml4GYv3Qs3O4ADQAxuHThVbcXRinJ984lTGCXa4lkJd9MzjcM12
oabKSTV4kYAM3tWNqbF4lLmkpXg2X6kLhRBsJzHeVARj9K875vn4EtTB3sxhTLmw
MIdZP5/y/4wmgqBBnVubaTkgkovgCP1Cp0IAURNPBxGa6WEpSzJ0gB/++m5lfFVa
pFINJfGGW+xQ8WZqPDZb+1wdBDUCBneu8OGroZ7M6LZr+JkbwGQ9EKK3KQwDs+cH
9yNkW/rEKaa3oiXhnR7D1YOFBlbukTMwqxMEKoNaWmKRx5HmKYIbuhLXulDbGJSm
wm+GrUV3TGn0CuVg8k5PZNyh2HVVQc3RAt/iNx3Z4jBap2VimI4=
=E9z9
-----END PGP SIGNATURE-----

--5cWx0N6riBYJe/5T--
