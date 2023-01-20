Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECCB674FD4
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 09:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjATIw7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 03:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjATIw6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 03:52:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C9A3F290;
        Fri, 20 Jan 2023 00:52:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D2D261DD9;
        Fri, 20 Jan 2023 08:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE1AC433EF;
        Fri, 20 Jan 2023 08:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674204775;
        bh=pF8eNbsbCUeLrwf17GZGAEG7iLgKy0Hf8Yaml2DZ5io=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s7kE+dQvqASEqAsrZFKUpB2dr5eN58tfyJlxiWzG4ni9oOYmtuIbMuWMwtJTEinWc
         6CtafCXFNeS+uP8cjHGKtqasX/oVLAxEoCzqWGUFmNmmU/HloJ38OqIwwduEZsX6vz
         ACYSTwKK1atxPWAR6KI8sRLO6l5WTcJZcnhQH0sXCeLdxvtAbKxNvqU9vuIhAnlDQS
         jf5sdHxhkK2dzlqwTTTCHEC+BsS9CmoCzo44ZZ5BplFVLnpGjPBr0IwXhiP8jJNL/W
         lUgC3/ixOG70bsApLo+bMG7/rGBHoBDkfgy/cQw+AgEAhCxGmZQXQs5PyOYKDAqc07
         t5vq2EjKcU+qA==
Date:   Fri, 20 Jan 2023 09:52:52 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v5 1/2] pinctrl: Add an API to get the pinctrl pins if
 initialized
Message-ID: <Y8pWZDH5zvYbJYCw@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hanna Hawa <hhhawa@amazon.com>, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com
References: <20221228164813.67964-1-hhhawa@amazon.com>
 <20221228164813.67964-2-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aeP0Kk5FbIutfRbm"
Content-Disposition: inline
In-Reply-To: <20221228164813.67964-2-hhhawa@amazon.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aeP0Kk5FbIutfRbm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 04:48:12PM +0000, Hanna Hawa wrote:
> Add an API to get the pinctrl pins if it was initialized before driver
> probed. This API will be used in I2C core to get the device pinctrl
> information for recovery state change.
>=20
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--aeP0Kk5FbIutfRbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKVmQACgkQFA3kzBSg
KbatEQ//Q33yje2jGseaoCmxNlQ4L9ZDY/yzBGml4DO8HkaTb3TrBpa1C7DJ4lZ7
0vm8kdsvLq5ubR8pkRMO0hItw3ijhn2/47scPDlhdtHfweyb84aHC5R/82PM+Ms5
47OY5qryHS2SWp0p9EbwQNmF8x8GmRz3dAPkKjgp+XWG9aZxnWdyIlckVhcNqJiu
uZEMkxBQV+3yav6BP05lchV+hXqLQASBbK25N5xkEfF0RWN15o3nEknTBfusAwgr
9QVI9E2+WGM6Q2lK2uTXhCU3Mv9qO/+JKk+e3FngQbg8BY3m8zLH8ENczcVO4L0y
kr/Hkq3t0L0Vr53G6OrSxmylU+Q3ZTaBg2jL60I4PMgR3w4TwK+dQ04kyf0h5TnA
ciKwtPd6dclz4RzvZMKB1e2qS2ZbBoI8a88fR7q0R2PLEsBrrMR69OFzuKaETx+A
BSxfN1wgNY2QhoIWNs+WcNJ58b6EEIfbUiIHLRqLKr3AmtsvWHiPa80hckGjWZXB
Eqh4Rfs7ES+Ea1ClYLoAiqAyqm221x/pAVK6wSFBxQu0gRilcmbgafmxxjRKJdpo
hJ0e7Hi1trq7QrAEpqnIJBTg93lMWRRb5VGsUyy8C2iNj5qT5gR+3r+L0JTQknvZ
lvbxQcMstd7MPAtqHVOGkr5iLXJY4me+Rh1kzO32Hc/62SFvwDY=
=Xcpp
-----END PGP SIGNATURE-----

--aeP0Kk5FbIutfRbm--
