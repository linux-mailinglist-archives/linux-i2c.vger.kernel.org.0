Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3C82D4C3A
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 21:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgLIUx0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 15:53:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:54890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgLIUx0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Dec 2020 15:53:26 -0500
Date:   Wed, 9 Dec 2020 21:52:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607547166;
        bh=yntw2EH6xf/CTjpQ7iWfMtsRq38lOTGsTOcpyKsbdak=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=hVM64dgpIzqLw66ju4llOJn5TrlQFlimjqCfJNLLJWoqMSN/Qk7k5Iy8e7+ev4lZt
         Lul47ZUqeykKVgDDh67elu8BHR3rmeOvWBz3SG8LQ0TOhXJ/DV/lkJuzILUij4FNVY
         h7Dy+NdEQ1PU6qttvaCa/9ZbWk6BppLw82DYGegOZpd1Z5nsSmsywmyXovHlv0t/j0
         AruxH69OcjWEmdfsRYChZTO3EKoXCY+FQWg00UStNoP0VKOJCRQXWVqPnW6HrGw+oR
         6rJMvFO639P7M2PclpMdMiFmvrvD1bcCd0G9cAgheppYC3H7Mnwnv9xOsjoXKHpVNX
         OsDkAfI6QZu7A==
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 3/3] i2c: designware: Fix indentation in the header
Message-ID: <20201209205242.GG3499@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20201208140337.33236-1-andriy.shevchenko@linux.intel.com>
 <20201208140337.33236-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iJXiJc/TAIT2rh2r"
Content-Disposition: inline
In-Reply-To: <20201208140337.33236-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iJXiJc/TAIT2rh2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> @@ -243,7 +243,7 @@ struct dw_i2c_dev {
>  	struct clk		*clk;
>  	struct clk		*pclk;
>  	struct reset_control	*rst;
> -	struct i2c_client		*slave;
> +	struct i2c_client	*slave;
>  	u32			(*get_clk_rate_khz) (struct dw_i2c_dev *dev);
>  	int			cmd_err;
>  	struct i2c_msg		*msgs;

What about using just a single space after the type? Won't need an
update ever again.


--iJXiJc/TAIT2rh2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/RORYACgkQFA3kzBSg
KbZV1w//dTG0M2RhmCkru6l8blS1FfI5u2QNOOhiHR3CRU6ZKOT/g7/VWiuMurby
1WFLGAjLx6UssxIe9jp7STlQWTh3KcuAJdvlsjQ2er0jlhxyIzs08Upr2kc+LSZ1
rpHr2dut2YNvYgGpYVj86DZjfIpEghpANn7BRvZQazswVLseHOGIJF/fhIRMgLQD
c0eSz5BassNhNtpxrvK3cpdNR0WgxKi6XsvJftX28dpc2n0QR3nCsfhcKWS7jU59
Ece/YLxKdXR+qRtGXJ0LYUDOhIDr+0Gz9sUbQidGPaqcgHIWz2gMorjlYHvOB6Kd
rY3CcSzXUtiw/KcK5wCk+ddp3gqxLD4O4XJ3FxzKt0O2coNSRG0JMfqFoTagsqUy
5TnupNGNPM6uVsh37f7DhKNEEs/sYhwAx42/tO5JUfb1U9BloQhvcwC4pBzIkkvN
nQ+n/NbG5iOGbKnT6blnejF1KWCXKMJ5hC2/Z4Cy3pNxQREG1d1nN2KVpXQaDZeT
1weEYtMYIPQcDA/nLcN6d/zmQhsuvXkwcVSDRZc7L3dH+r5FT++EO6B4WASBaaCu
QGKQh8RIGs7V/SrXXtM3/INkBClvqZ6U4k/DYBxS2WooebhdOm+ea0ZOgbuBGTO3
IF6gfgsWA9xMnSx4IWld4g6+f0PXYPcjBfoO1XTS4KoScKRX0xM=
=yGI1
-----END PGP SIGNATURE-----

--iJXiJc/TAIT2rh2r--
