Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4071E73B519
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbjFWKUe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbjFWKUV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:20:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B711BFC
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 03:19:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D76AD61968
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 10:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96148C433C8;
        Fri, 23 Jun 2023 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687515591;
        bh=3/KyWpoBAHpjMkrt6jRLSwikjEPstuySQssdR8EY9Tk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LY72tRKCQ42SsVOS56rGhy3ovfPJ2jbLddSWZo4eQNQXcr2faymreYb/HoIIl7VXi
         jcljNf8cQeluKAAigX6GRpaYGMhWx4ugtOsVsMFJ1a1BND4sKvVXHAej+pFP1RXu3l
         dstfpJQjrHJCyoSY3ggYVIsAXW0bMsr3ttzdRxrWaPQS58PXfU61fsNU6W0N5VQEcb
         /AFl3SybbXhpwSHHzinu+8uvb/5QCrIwbNUJXJc6sg6Z+Dm7ag7UojK67seq1KInj1
         ZUEr83LuMyPTh49szSkrZKLpO5dsTtUMjt9r3i+CH2PI1X9tT6vipHwVv4/AiN90MM
         noM/bu8gvp7nw==
Date:   Fri, 23 Jun 2023 12:19:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 09/15] i2c: busses: owl: Use devm_clk_get_enabled()
Message-ID: <ZJVxw3WegrkTWF4p@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-10-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Sfh6lEdBbW/M7OBT"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-10-andi.shyti@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Sfh6lEdBbW/M7OBT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:56AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Andreas F=C3=A4rber <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <mani@kernel.org>

Applied to for-next, thanks! But I still wonder why this driver does not
have a remove function?


--Sfh6lEdBbW/M7OBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVccMACgkQFA3kzBSg
KbYVhw/8CDxeVpokAJkF35W0Zi808yaFx4PZSQZSXKm8dS+zH+SEkHqr8fETZdqM
3aBy2QDmY/NX1Xc8NcnnAaYJJB90WMKLag/5LK19kDVd8gaRPc+cK1Tl9gOjJEVJ
rephr4I6UXKqBH8UOkWrk5tHko0Y6jxh0rA11f4uubmzAAix/kgHK6UbM0rmNkE7
QlE5w3UBeuK8TZdgQXH28PQdy2Fy4mhRNRl+cPT2aofeaDLq2vD4TmCjIdVWTYJC
fleyueCzsR9+Q9retWbupzWclHLufBeIkSD77SwmiNSt0g5P3HhltjItlzBz/B0z
boNrfj6Txr0kmjFayorSClw6Z9HbjHgk4GGKiq3n28LmhrK8Svn7RVjHT2Kb7oda
hYWf54AwzaoKILRK9MOM7rZbwko8poxwR2/r90iMurV2UaVLVT3fdSm+YILqebcy
GJb6WVG7bj3sKn2Vzl6PqCOVChl9z9Lx+pOfg+IwbPAbZYGu3cttsoTVPxDO9+jM
Uwdqn/TtFYOuPKrbVt5+Obxqxo2uhqUYHoYXZk/mVqeSTXsNkEs2zQiwsvenWgNN
M1Jl0tia4mwIEVWIPKNtzeaAwISEfsbYfAXa2gJpJH34OObZGZrpRo/IyTE7s5u4
rqUdqEiH1j9NhWI96FDde5X9Xr6KyAUnlhDv6pA00FqqtzXLwTE=
=ox2P
-----END PGP SIGNATURE-----

--Sfh6lEdBbW/M7OBT--
