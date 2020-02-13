Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D879915BB37
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2020 10:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729551AbgBMJKC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Feb 2020 04:10:02 -0500
Received: from sauhun.de ([88.99.104.3]:45230 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729515AbgBMJKC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Feb 2020 04:10:02 -0500
Received: from localhost (p54B33627.dip0.t-ipconnect.de [84.179.54.39])
        by pokefinder.org (Postfix) with ESMTPSA id CD4352C07AD;
        Thu, 13 Feb 2020 10:09:59 +0100 (CET)
Date:   Thu, 13 Feb 2020 10:09:59 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        David Laight <David.Laight@ACULAB.COM>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: altera: Fix potential integer overflow
Message-ID: <20200213090959.GA2123@ninjato>
References: <20200211144704.GA6461@embeddedor>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20200211144704.GA6461@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 08:47:04AM -0600, Gustavo A. R. Silva wrote:
> Factor out 100 from the equation and do 32-bit arithmetic (3 * clk_mhz / =
10)
> instead of 64-bit.
>=20
> Notice that clk_mhz is MHz, so the multiplication will never wrap 32 bits
> and there is no need for div_u64().

Was there ever? With

	u32 clk_mhz =3D clk_get_rate(idev->i2c_clk) / 1000000;

a later multiplication with 300 should not wrap u32?

>  	/* SDA Hold Time, 300ns */
> -	writel(div_u64(300 * clk_mhz, 1000), idev->base + ALTR_I2C_SDA_HOLD);
> +	writel(3 * clk_mhz / 10, idev->base + ALTR_I2C_SDA_HOLD);

The change itself is OK, yet I wonder about the comment above:

'clk_mhz * 0.3' will not give a constant 300ns, or?


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5FEmMACgkQFA3kzBSg
KbY1uw/7BhPcgJIcLbjs58paXf+DrYXcCzE4JXUpsxHft1b1iZ35nwkka2gUVbj0
S2Hi9JqDetiMdhVWHYPjFb04Qe1vyfZa69zwWYjMCwMgLZUUBTDCd8a2enehWBAD
DAE9DClhtvYWAHbl4BoQTqgFCjwmP5mit8EZjKY79SgfS7ZVPuKWCFOYUztWPBtc
1UnG2ZtT8eHTl/rrOMND+8+c0HYDuXBuNPCK6QVNX80yhtDgNfVpufQDTHXGgGV8
CMCmrvHu0To49H2Qj4sSZs/wQQX4u3eMqsS4PARW0UQm8jB/6+EmYoHJH4u87XBg
7KMQMPeQbMFuU998ns4R9Z32ouhwK+yQunjxL/Fezn9dhX/p6TxdvYu9difsmnPG
vTPSs8yHSq2AYgfQ0DwWivV6cNEvfdFd7PiAnBBZCO+JDfziPfoqRGFz+do0O9Fm
SHCm907tybkTtilG1EsgrSWTO04H9V9L7bq8mWc7eG+V7u1+YGkEwKH/38EgnQx1
em1FinZ/lLglFc17TEvEuapeRO5Nec120q6MHCEkHjuC6cz4SbWesLQnWStWmsBa
1TTBJT6D9ED0np3F8N7cNKHqbaCTB6V7rCLGgbm4PMKHK81TK/VL+Ya5/WluMv2f
UtzX/DEoqDxsARBstFHP47bYJlPJCMF4a4CQcRR5ko6kWKXWjYE=
=R290
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
