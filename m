Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27CD66250C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 13:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237124AbjAIMHr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 07:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237112AbjAIMHo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 07:07:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9232A1A3B2;
        Mon,  9 Jan 2023 04:07:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2F9D26102F;
        Mon,  9 Jan 2023 12:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2B8C433F0;
        Mon,  9 Jan 2023 12:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673266062;
        bh=fzoqnbF9as/f+6ads0wIarE7gUFEYkwrPNGe2TN9rHo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OufIaVMbMzUnIHD0Ed1oD7hn+ipGQUxYX8XTSQmhvC6gl4BP9U1R/EnMVg01egtXM
         UogCO2EO/0VvVOApIQipzVKd025JhuQ0NgDklX0ysKF7vGI9PlClDYBlOMCn184L67
         a7lXtC0woeGGjetryu2n7/90Xi4eiZ9v0tBCFaTpIQU4SsHkrLw5fDC7enh7g+3sf5
         zOPzRyvnmdGGWzqnM4k4WcOjsSrOTEFYS0RTqf3FXBVzRW1TyoyW3VxntWOkqbPsf2
         nAxmjSsZSRpwlGkiN0zB1KDNGQVWzvE7dRdLFJ38jzgAwus/Fw4mxB3o1NU7zxQbUH
         32NHEOMG2NobQ==
Date:   Mon, 9 Jan 2023 13:07:39 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        Suravee.Suthikulpanit@amd.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH 1/1] i2c: designware: fix i2c_dw_clk_rate() return size
 to be u32
Message-ID: <Y7wDiyON/EiOu8++@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hanna Hawa <hhhawa@amazon.com>, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, Suravee.Suthikulpanit@amd.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com
References: <20221219172345.14272-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EIhyEvdWYQRZy+L8"
Content-Disposition: inline
In-Reply-To: <20221219172345.14272-1-hhhawa@amazon.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EIhyEvdWYQRZy+L8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 05:23:45PM +0000, Hanna Hawa wrote:
> Make i2c_dw_clk_rate() to return u32 instead of unsigned long, as the
> function return the value of get_clk_rate_khz() which returns u32.
>=20
> Fixes: b33af11de236 ("i2c: designware: Do not require clock when SSCN and=
 FFCN are provided")
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>

Applied to for-next, thanks!


--EIhyEvdWYQRZy+L8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8A4sACgkQFA3kzBSg
KbaeqA//WGa2n+GXhUEI3LRayxYor3qgEK6uZTpHR47GS7C61FmfwY8mXW1rspNX
8Y3mIHPknT/w3Dx9o8NuK+YF+KELFg6V/v24gNJcmSr50GWSLH1/O+i5VwF3TcR+
da6TQaVgOs5MigCRJi73h2OTan8uwKcTFwPHrAUqlGIHdmMFtwhtHTqFWI3R1Z0R
kGH4dIDZXloTJ4JRc0OG+FM9FVodplyRXkTrhy6Sq5t0BWpUOsRtJx6QsH/ZHClU
Cokd39DJjHpLb8M9TSKtTYkA6uIYb4rG0/CXcuIbE+Dc7aIhpocwBcrrvsHZ3uU4
9F6DND07O43swr6oUnlPsDM9aG2/sj7GocJ4IJET7lY8+bLLEsP+UkY4y8bxwfx8
KzwFylgITP9snmZQKmoBGrVgJt22DmrbHXnFYFJqJFwRqUSsHdMTQiBlDU3lTiww
Txk7Mg7xsjZc1pfLHPC+z96t1oWoUhc1UMqbTwcVv3wFJzcz5M6qfpFFfBX6oX6N
VCLXU0AumJnqAKN1PMa2YKO6q/FkGXwYXr11XM0IiZzOmKXvTl9HYbENDLz/fZEi
DIuOT0qdHC9MQ+ws4b4AUHnJAeS6ULjgV/fVIAHbTYIIMLAU2vHg495Di6HCopYd
/zoPwAOSkteXIWLVlW+/oBEla32FSOMLlGIdFIjGF/4oTejsF9c=
=J9da
-----END PGP SIGNATURE-----

--EIhyEvdWYQRZy+L8--
