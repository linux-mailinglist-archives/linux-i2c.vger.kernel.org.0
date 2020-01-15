Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0E8813CD27
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 20:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgAOTdQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 14:33:16 -0500
Received: from sauhun.de ([88.99.104.3]:40806 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbgAOTdQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 14:33:16 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id D51362C0742;
        Wed, 15 Jan 2020 20:33:14 +0100 (CET)
Date:   Wed, 15 Jan 2020 20:33:14 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: iop3xx: Fix memory leak in probe error path
Message-ID: <20200115193314.GA23789@ninjato>
References: <20200113172954.5096-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20200113172954.5096-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 06:29:54PM +0100, Krzysztof Kozlowski wrote:
> When handling devm_gpiod_get_optional() errors, free the memory already
> allocated.  This fixes Smatch warnings:
>=20
>     drivers/i2c/busses/i2c-iop3xx.c:437 iop3xx_i2c_probe() warn: possible=
 memory leak of 'new_adapter'
>     drivers/i2c/busses/i2c-iop3xx.c:442 iop3xx_i2c_probe() warn: possible=
 memory leak of 'new_adapter'
>=20
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-current, thanks! Please add a 'Fixes' tag next time,
added it for you now.


--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4faPIACgkQFA3kzBSg
Kbbk2w/+NtYh/9pzq1Cay6U7CbprQKH2/wmfdXJH1ycJteHmo394nhmZh7mvJdrw
/6aSQTQzibxn7nzttVDC24EB97K+jgoOeGpS4pcePvMV0WX8feDvDeV6NQOkTAxx
64sbL8nej0ZBKiB6OnxMDkbPq1Su3aQhUWFC1U1COjpGq7VoiEv9TOT/ybtjgr3i
Wu4eU786wZhYCJvvs/fdfCMTTxk7EGARLxPXKgw/B2RPWnQyla7egPbkUrfUSebr
PbrJPHNGAqzc1+W6dM61TVW97nT6ORe0fHnII4ysX4NfLBYYIyduYuVBGmzkknm/
LhmhTdsMix8XJ0AxLLcMMeX4hKvWmwVrfTymW9wJZL/Kj1HDgwCYLmSLYwwLqyVg
JZsGMGpl6/NvttTWXVQ2UbQlBGyL42MXsWRN1JpgzX4iNnl11C5oVagrVJpP1C2n
NmofwVqeSk5ufvxyTO8kEduNXPEYPevSeian6eC1FqMT/mjk5MH82AwebpQhLy27
ROP9F/g4yL7ZHT1h+Bi8NuZ3Aj+57r4c3nXUku0bnH6dCWo1QKOdmxPy8x3BymWt
+Lskzt2E1OCK/90PWg7CsnRIX06QYs7cVLFNk+xCEwSyJjibJukqFmZu/iD+8qre
ejGlqZ/mF1igswHCxNwxM3R71LaXDPkNEY0uBwa0jHULPRpAgwI=
=0i7M
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
