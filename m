Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3BDE722124
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 10:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjFEIgA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 04:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjFEIf5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 04:35:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB4FF0;
        Mon,  5 Jun 2023 01:35:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B79F60D30;
        Mon,  5 Jun 2023 08:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4E5C433D2;
        Mon,  5 Jun 2023 08:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685954155;
        bh=MDyj7xKXBRli7gBfGmpPDEsL7ak8wYtgiHhNz3PDRFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iv5Mu2jxJoiRhp7rkw5u/6hCYceEWJlu7GzeIWqJlVOoa1qeehMr9kprCCtDB951b
         YPYN2jwszr1sijTetbO9SDWhjdTBEou5aueGfkxy2ydngK9y3C/dPgNU89VkLiqmVN
         9O/qeeOUpoaDk9TYd3/Kbu/NF/vR3yWFksFXJAZRNB+o+DfzgKa7E8dUm2EIAmnhgb
         NWgMNAZCLGzBWxV1y9/8zC9Fi7mw08EHVFVQKBK9nbfQqj8TtRPFnjTcw2NCeDjdIe
         5LHTo8m24G68eaQoxLVrDTHzoBPhzsVWcNLmZVQqONTCvSnhqRHlCVbb7y6S7P8NfO
         7704rVvelxlAg==
Date:   Mon, 5 Jun 2023 10:35:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: tegra: allow VI support to be compiled out
Message-ID: <ZH2eaMlCq4EhL7jL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <cover.1683407699.git.mirq-linux@rere.qmqm.pl>
 <0248c0737ace5db7be4e04f97985f3e7874ff1ab.1683407699.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ab8d/9CSzKu7KjpS"
Content-Disposition: inline
In-Reply-To: <0248c0737ace5db7be4e04f97985f3e7874ff1ab.1683407699.git.mirq-linux@rere.qmqm.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ab8d/9CSzKu7KjpS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 11:19:02PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> Save a bit of code for older Tegra platforms by compiling out
> VI's I2C mode support that's used only for Tegra210.
>=20
> $ size i2c-tegra.o
>    text    data     bss     dec     hex filename
>   11381     292       8   11681    2da1 i2c-tegra.o (full)
>   10193     292       8   10493    28fd i2c-tegra.o (no-dvc)
>    9145     292       8    9445    24e5 i2c-tegra.o (no-vi,no-dvc)
>=20
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Wolfram Sang <wsa@kernel.org>
>=20

Applied to for-next, thanks!


--Ab8d/9CSzKu7KjpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9nmgACgkQFA3kzBSg
KbYLLBAAoi+cpEGpCS2VMwq07xiTInazK7eHCg1hY7HcYrcEfqCs6UV5Jmk5V86I
hBxg/JGc1g3PbEVW1GMcbcdYn7PmbrMqjkxmg8QOUF6UBnfHKgifUgadpq58j062
gSD2vtXdaJSrCw5/XEWcgEZZhTDWRI1l15dxOQ2OzhqG3W0Tkru1EHbAGDHHoig2
JZMhqFBZUbuou12gIMw5JY35mEQprzsYymgqH3APfENHZeQ3AOJG+H53SKOfqACP
r/83cU9Lm9QRXOfV8DbNm0NYtN6zhPwrIpPTo8+OnT1PvN/rH2OlUFkNVASO/fif
zDZ1M9GTvJ3vmuNlPLABfIJf5paQWMFKIdYzSG+iftJ2WD8h6igX736SP7V24dtY
g7uCgmQENSGmuBayMUqemtZaBzWDlMVHwDvza8eIKUIGMaFKGHdIvnZpDIst4YxM
f0XB7wWT3jt9c3N7iV3sgpgrQPUUO5SngL5vhiR35yPCgi3kJBA2anPTa9Y4DDvY
6JVwsyXF6NmaFuMwJBuRU4MF7q9EcHrFqRdDiP5QvL/x6fXBU5+SeztCIw1ID6ms
Fzj5Xpj66Hq6ZD5mrbdVP1RvVtjhE/FSXztqpvzJaQsxuEzmQA+wC9l5o4ck4DUt
0+z/SGQ5MJM/6SRqMnSeV/j00ktNdgBn8LJlljCjvL1nmvykXvI=
=3Gn2
-----END PGP SIGNATURE-----

--Ab8d/9CSzKu7KjpS--
