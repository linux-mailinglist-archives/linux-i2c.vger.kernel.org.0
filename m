Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D866FFF96
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 06:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239825AbjELESZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 00:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjELESY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 00:18:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBB41FF7;
        Thu, 11 May 2023 21:18:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D2DFE64FAA;
        Fri, 12 May 2023 04:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883BBC433D2;
        Fri, 12 May 2023 04:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683865102;
        bh=b2zg6KkKU4wMLPA/lt2MFpVz5BtQ9ce0BBjFejvgA0s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DePhR2wEmkgC+Xx/d8YBJwYezYFyRKWz8Tu83hAHeLHrTZ6QW23wR1Nbi5FxAjlSB
         9sIBnmyXZkjsVlT1gcXYP0MIV01NB06Y1K9GYLbDPFB4myun+mHWL2kKvkdfGLYBfg
         54yzHOIPkUj8HMU/WGbz7TEHOEtYfCCK08TuRuBJe11G2YWqBp0L8D3/QOBrwbxLMk
         yGm/eZGW9r/bLaj+DJBqyf/Uu2q9YAQbVjv36sQjlbQQmAIs98W2ZlfcR7d//20Kb6
         ged+tsRnbsxfkBSitIFSIBgiK9YG87VYOESWFlHoBlkowaCjuGnb0+mA3qhapjy//0
         ic+RKMkQAx/+w==
Date:   Fri, 12 May 2023 13:18:19 +0900
From:   Mark Brown <broonie@kernel.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v8 6/6] spi: Add support for Intel LJCA USB SPI driver
Message-ID: <ZF2+C0CqaBff2hl+@finisterre.sirena.org.uk>
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-7-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iDLgAwJ74STo+Yb8"
Content-Disposition: inline
In-Reply-To: <20230511175844.185070-7-xiang.ye@intel.com>
X-Cookie: Avoid contact with eyes.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iDLgAwJ74STo+Yb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 12, 2023 at 01:58:44AM +0800, Ye Xiang wrote:

> +++ b/drivers/spi/spi-ljca.c
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel La Jolla Cove Adapter USB-SPI driver

Please make the entire comment a C++ one so things look more
intentional.

> +struct spi_init_packet {
> +	u8 index;
> +	u8 speed;
> +	u8 mode;
> +} __packed;
> +
> +struct spi_xfer_packet {

These should be namespaced, especially since they look likely to collide
with other things.  Otherwise this looks fine.

--iDLgAwJ74STo+Yb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRdvgoACgkQJNaLcl1U
h9DNXgf9H7gFOZGlxttpn5v/IJdK948NNyKBgpz2AkJQVHOk848wbYpxrFsuWD5D
1KYc0NYmt4CkyGz3JDwQbJy6Ipo3A38uzzn2OGphxlE35SVsoMgI4htCJ9X3gnU/
wi9SPTlKbv3IH14IaMKyiyTWgmpobEV8lQ7VOXJPtwBwzGOQ8xPi3nbvCeGfkDFV
/UPuODRaIBbBbABVC6pibA+GklJGO+i1q2cPGydqEk8gP2OaUbdWG8tpm7Bv2lQG
ziu6dzm5UaDiIR+KAtbBILrdFvXInL0f14wK0xRgmHv9nYsMfxG69AXv2GsMI3iP
OnTTtJ664+d3gz3fk27WKjuay0OZ+g==
=G2/K
-----END PGP SIGNATURE-----

--iDLgAwJ74STo+Yb8--
