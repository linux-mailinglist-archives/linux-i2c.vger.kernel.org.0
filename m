Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F95766250E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 13:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237128AbjAIMIB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 07:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237110AbjAIMHy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 07:07:54 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A25A1A3A8;
        Mon,  9 Jan 2023 04:07:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 26EFD6102F;
        Mon,  9 Jan 2023 12:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356F3C433F0;
        Mon,  9 Jan 2023 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673266072;
        bh=4xCS8SMRbYF0izXOPugXxXKb6TJYQmzcsXzJyntgByo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bh0Qh8NpeUnJm0zRetSOuHzoqhoR48DeCN1hIDL1yANI9LnhypvBgJeovffWy+ZfJ
         EJymDz+UQyyhsULKjOOxbwL4Nzvq4mSgR7mybHFgsmpMAr2GFTuI92ysvsQt/orVFL
         Ea0IQPqIefdle8VdO/sOSJyBQ4Y9+mvSmL/R3VHxM3jWqzT368WVL4kADXHX9uQ4x5
         xYNjHUz83H3/Q0X0Q1q6sMMcz+bWd4PkKw2Nk2Qd5C3+pHTjKQB/XdQyiXtdHvo4Ss
         sxTAw6rXiCl6aPlnIQWEsYb1ZsmpZVb2RfOCFB2HmdW8i4Amhkdeb8hCHC1KZHsnEl
         LFG4FUTk1LWbg==
Date:   Mon, 9 Jan 2023 13:07:49 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linus.walleij@linaro.org, ben-linux@fluff.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com, lareine@amazon.com
Subject: Re: [PATCH v5 1/1] i2c: designware: use casting of u64 in clock
 multiplication to avoid overflow
Message-ID: <Y7wDlaOX8f9LhkCI@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hanna Hawa <hhhawa@amazon.com>, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linus.walleij@linaro.org, ben-linux@fluff.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com, lareine@amazon.com
References: <20221221195900.23276-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wdw+qpb2+KvBw02n"
Content-Disposition: inline
In-Reply-To: <20221221195900.23276-1-hhhawa@amazon.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wdw+qpb2+KvBw02n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2022 at 07:59:00PM +0000, Hanna Hawa wrote:
> From: Lareine Khawaly <lareine@amazon.com>
>=20
> In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
> by depending on the values of the given parameters including the ic_clk.
> For example in our use case where ic_clk is larger than one million,
> multiplication of ic_clk * 4700 will result in 32 bit overflow.
>=20
> Add cast of u64 to the calculation to avoid multiplication overflow, and
> use the corresponding define for divide.
>=20
> Fixes: 2373f6b9744d ("i2c-designware: split of i2c-designware.c into core=
 and bus specific parts")
> Signed-off-by: Lareine Khawaly <lareine@amazon.com>
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>

Applied to for-current, thanks!


--wdw+qpb2+KvBw02n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8A5UACgkQFA3kzBSg
KbZHyA//epQ1hwTlx9ELobS2Ytyu3/pQdlzz7w+RhyMK34KnoMJzC/DGte5oreqI
x5VPqeFJ3qQy+Qr/yKrTXzA6ag5zAb8t1iFqWmpPYAj4EHRsGdc4qlwr7bax/xOF
vxJ27Pu5TMEiNQCy4jpYCMMGF9IWPnfMZdDiK2Xl86OKhLAgHBTdLViu5ARCjFSR
LNGHXOXuyjSx6+FfaVnjta5VJoyTrSX/HojLotfXBQ5HmkFTUEC1Z+Go5by2+3jt
nXWwZnzrk1oQvJ/UBkca1gLLQHxliDWtCnm6L+8Mwg+59yJo3anAulf0Vf5zVqIG
HcBWjxie9lHEhRCEdOkTy8e63c/6AYL7b4VERcxmmSkw7qnYKT4NrbaSpRVqbbiN
I4diroaLoEqmE5a5+YmIgvjgpcGVCQJrnOLoG9yWZTHUmqef5/XSiob40+RCRqLH
5jAnl7jBRjF820BkMkbZ5tHgYneI8ygNHgK6KWOH+75KiYe4tixrxl8SMylSij9B
fIVAF/61FM44fEespPXpH4gLLLhpC3rVQkBrTt2yyY8kjmUVIgV+qQyGGrcRILET
6UOo6f0wbmr3Irpu8dut4Mcz66HOzVmitq9MBHlZqpcfjDidJkKPSobr1KoyITK6
F8X1nxSoGeMTrPlPvQOmjhr3CUX1ZX1yLmQ0iYLY05ihI2FAu+E=
=Ka1V
-----END PGP SIGNATURE-----

--wdw+qpb2+KvBw02n--
