Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85AD777BD79
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjHNPxl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbjHNPxd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:53:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB24ED;
        Mon, 14 Aug 2023 08:53:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D939D61B7A;
        Mon, 14 Aug 2023 15:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11F9C433C7;
        Mon, 14 Aug 2023 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692028411;
        bh=QeBjVxnV7WT8mRAO2BW0JAlyyfb0qIXuQJE+4alUsS8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dAjdBrOQNN6M6qQCrLpW2MGhazBXn4N1rPpn/rNd4JBX7eCHT4X1pb1bJOpsMgpqu
         NdrBnlpmD1Wq+wjz2QFfQguKJ0BP6ZcU9AazHTmUCTI5vGdlkoh2ILz9zXh1fEjHEu
         WY/d763bZCT7WOWeQjZJoGqINvPeARzzYllKjUqkWNt3ZJk8QaE49mBRPpBv2qwlrK
         jRcwP9Kg2Qwm5DyiVI/bwaps9CB7/Rd8ZEgWj2jnBtrNuZM6YombAxI9Rknm2slYTe
         oRQAVptxeH3A7U8TUwjQQdI18xD6QvJvLuEWJqvcM+12XT8v7wsDXCCVwLLg8Fvc4Y
         Pdd7WK9Z3Fvpg==
Date:   Mon, 14 Aug 2023 17:53:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: sun6i-p2wi: Fix an error message in probe()
Message-ID: <ZNpN+Lv7mR2cCEun@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel-janitors@vger.kernel.org
References: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xcB87gd7QtFay+4j"
Content-Disposition: inline
In-Reply-To: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xcB87gd7QtFay+4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 10:12:36AM +0300, Dan Carpenter wrote:
> The "ret" variable is uninitialized.  It was the "p2wi->rstc" variable
> that was intended.  We can also use the %pe string format to print the
> error code name instead of just the number.
>=20
> Fixes: 75ff8a340a81 ("i2c: sun6i-p2wi: Use devm_clk_get_enabled()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to for-current, thanks!


--xcB87gd7QtFay+4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaTfgACgkQFA3kzBSg
KbakpxAAsVMYJOIQWAKvPEtX90YHGD2HuqPNw0RgfoH46avGPoAkEwKoFyiIPXY9
a571Nfcn3ETJh/o74XE2s3QiC8uzA9UZAh/eCYdi/lvWBcZX4GQMDVpyTQ0WxTw3
ujR+5Wqrw/OaBcSACbquqQ0HDe4w6XoLGqzXc2dv29P5yHBDhxkKDb+MGuMkVZJ6
G4eZpi3QIT7T5z4QJrIKKmVg7/zpeUBxFOPy6vOxgLRLudZp6MSxvOuWLLnAm64J
mKKXV+Jottc/jjGaiWrclnJWgjY+Yj1HOa+Frr5VgHv3bwMssqmfwJnl0gsPy4Rg
hO272xeaA4aIR22a4d8XqDW7pf2WDxigSOy3cuIXePPkRnk6avD/bexXKp7a+4vq
Zc5tfh/WuzbO1kBz3rY7Hz6hqdogunbths5C/+p6LkwC86j0tOR7wKl6OQ2Apd5L
m+/Bfyy3lqE21RH07ITsVvmGQIGPeiHwBWGiKf4/Z9ky6PBAMeU2wdvLqZ2p9thc
DxZZBFMd/Ju9o+1uGmIn80sQNsrWASPBq9zNIM4vi/PNM/s37t1kyipqFiP1Pztv
vT1tKvPq+zOM/KyeBFHSOykyy5C1Fu9gmlazW04oFG7gu672VxH/uL8AmSuWtHkW
n/kM2TwIwUQZO2WzoOUgVf6FR43/Tknk0QdunnWOTOFdXACkr40=
=6351
-----END PGP SIGNATURE-----

--xcB87gd7QtFay+4j--
