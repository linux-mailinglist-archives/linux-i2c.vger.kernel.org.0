Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0A278E3AC
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 02:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245549AbjHaAD2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Aug 2023 20:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbjHaAD1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Aug 2023 20:03:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A95CC9;
        Wed, 30 Aug 2023 17:03:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 42608B81FB3;
        Wed, 30 Aug 2023 19:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D67FC433C7;
        Wed, 30 Aug 2023 19:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693422784;
        bh=uU8jz8CQBwmLL0vOSDyI5mTWAC9kf+8dFJYH2BnASqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wupx5MtIRG4m5/jCyO6HwNCa2DXBDF29RxPC5K/QE58kpcphi6zlhqwiMgPGh+Wb+
         ITanFWT6kvAupO6TyP/L1afc6LKwLVkOmpqSfU/b2ZoDLDdcrmD0NNjjRV+xxoZLrf
         7fHMbfw/uWqHyVOit+aylJE0Ut6snxdXLPyn6VJar7qLbEU52OZdvmpQn14UUDKkMB
         /E/3VyT/QDhDyxL6HRmUpGbGBdjTIKhUupjU2gkhj3oG/urJaD2B9L/2jkwZv/GHIH
         4DlwfKf2QNhH/I2Wb9itT4EqblH3tiWeiXxHhXpcnS7rLLLdH9hAxRpnIVlhkdbEA+
         Syv1RVyQhtqXA==
Date:   Wed, 30 Aug 2023 21:12:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, kfting@nuvoton.com,
        broonie@kernel.org, linus.walleij@linaro.org, maz@kernel.org,
        brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v11 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZO+UucQM++smFBpR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
References: <1693284848-29269-1-git-send-email-wentong.wu@intel.com>
 <1693284848-29269-3-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h6i+G2Bl6szBYE9B"
Content-Disposition: inline
In-Reply-To: <1693284848-29269-3-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--h6i+G2Bl6szBYE9B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 12:54:06PM +0800, Wentong Wu wrote:
> Implements the I2C function of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA I2C
> module with specific protocol through interfaces exported by LJCA
> USB driver.
>=20
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Basically good...

> +	if (ret < 0 || ret < sizeof(*r_packet)) {
> +		dev_err(&ljca_i2c->adap.dev,
> +			"i2c stop failed ret: %d id: %d\n",
> +			ret, w_packet->id);

This was forgotten to be turned into dev_dbg. I could fix it while
applying. But shall I take this patch via i2c? Or shall all the patches
go via some other tree? I'd assume the dependencies are hidden away by
auxiliary_bus but I am not 100% sure.


--h6i+G2Bl6szBYE9B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTvlLUACgkQFA3kzBSg
KbZP1A//fE0HDeIEeeTVJKpYpscTalb1QUxnoDfiNRtLWbJMThbF3FIU7TGMP4EQ
7gfMjyKGVWlEZDvEhrmRoDrLk3zHPW34SRmyqz+HLZAWwMUQndI7UZhFmxiHJEJx
Px47Y8cwxFnQDHnJ0Xen2ZsZjMV/DBhhqL4Bgb5I8Whrs1ImFvMC7ZQx1wGvID4D
GvSrUo5QI5ZjbQ/9rgPOVQjUClH2e9NFF081y1kRoft901rttfUztAtBoNiYOo5M
bMlzycHh5ZALUpIx7Ha3PmnvZ7cKcjhzvrLfOBfpCy23YRDVp6xZmYGqdcmrHWga
FhIMcwR5BHAcyQ91+xhKhgNkvc28MeW0R6qVohMCXoDKkO9o3YvWDhDOE7W1akXZ
0Oq1SXlbWlJxMASWIRwFgKfEcQrsSb+W+WTqIPiRehVDaskHsdzoyzko0pBvPzgR
Mn8xueCMVUZaxPYlu4aZRzA5zBINazbASdLF/YCCsE/71c85gxB2AHIKOa4W+40O
1etec7iOdnmesEOgXLf6LgJkK+d+13H+xVvPstuCWY7XdPxDawzjAVmF08sdgtHo
jYAkkY5OIulWt2pWy7OyTojPUVL0pwZJMl7E04VIsSZAsBTRWqetfm6KfFOJ8LG+
YjSyM/0DgDroEUqLbBxRhITdLGHK+R6bt2zTdGgbmoZQvMesLnM=
=0N7V
-----END PGP SIGNATURE-----

--h6i+G2Bl6szBYE9B--
