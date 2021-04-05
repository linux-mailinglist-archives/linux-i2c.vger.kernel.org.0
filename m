Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1D63547E9
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 22:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237352AbhDEU6W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 16:58:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:58860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237407AbhDEU6U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Apr 2021 16:58:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE36261074;
        Mon,  5 Apr 2021 20:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617656293;
        bh=Aa7LKcliKxtEhM5X3AJRlYvCUetZMDK+/icmFpYxWUI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nq1Dmy26siYkrr9fdTQ4/W3Ee5AR8P+bAIhMh/mJuubQLSq5N5TwzAl0cFSU49jPr
         TaeNQodU8H/hLlz6sKFA9OVj5a3BMu5YHWtpNvkXcut9PefykNZodam+SLdIAxYs+e
         EUKTe2OLqpKR23E6cBCyxiKGRpmdV0Pmz7YJxWnkwGPNe+Feh+C7imUOkpceil3Chu
         DNuLHQ/poVLuTWy8HhHtKg9Jq4lVCQkS4p6nW2mL91R3E3Hj3jacH5yL3Z/udi2sY6
         XS3b8/wHdoN70DXxzfQFet2qy7TN3ugUzMzIFOvy7kC4JT0EWe698zAFGD4M3X1WI/
         kyhhgrNi2gs1A==
Date:   Mon, 5 Apr 2021 22:58:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v2 1/1] i2c: drivers: Use generic definitions for bus
 frequencies (part 2)
Message-ID: <20210405205810.GE3945@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Loic Poulain <loic.poulain@linaro.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Robert Foss <robert.foss@linaro.org>
References: <20210331104622.84657-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M/SuVGWktc5uNpra"
Content-Disposition: inline
In-Reply-To: <20210331104622.84657-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 01:46:22PM +0300, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
>=20
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Khalil Blaiech <kblaiech@nvidia.com>

Applied to for-next, thanks!


--M/SuVGWktc5uNpra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBreeIACgkQFA3kzBSg
KbZfsA//Y0mzW9X4ck/8iaFbGK3GOSvEBerEoIkyxBCMNHvI1ajbpTMVtNkagY+w
Dt95mYBNBrKADzA05Rf1ISleUvR7rA6cxjFzn4zti1mgaLbnGj0rwv4B7IQBGo7i
20F/TPN2v2V83VJ7rOqDOBkPvKeD66uJqsD5eqTwh1/NQg5lnnZh2kAAXh1d8Qwb
UupxyipUAV0oFQ6D0mbRdpQd5CRfdK6CxNQ+sBVGHMfJbGj/3BAa3PhUqweGRav4
kpInPYCF+/4QL4lAjWxUUpU0nHSIzk4Gn+rtOI3AwiZDaKSKWlnLZVuw0yy7B38r
37keOcGhZ5cQyxSpbrubKP9UPMY0tThn31dzV23AnuYJ+Vo3hu2CBo0ffLtNDQD/
ctuYe/359HJB5MjmIah6p6BJehjHyh2R11DGuVWXRomihyio4uliAzaPYpQRkntk
NhBb7Bq+JcfdMbXK/B8ff1q2SPu541nDjnuxNoPBBLTIyvY60Fcq7CzShpd3bI+W
MFkW4Dpgl7sn7xU2BZPRMtSX40EnsmGtvQUYsWJwNKXskZzjAW649n2xJvXsvJGs
wp70Lz8CQ7gQVDBOFpait9N79hKJiOMdb7Ox20iVMlbozWlnJn5QJLCveFiuyNYh
m6hrzl5Z33x8lVLHPSL/np/9yAMqjtsZ24wZHIrMd8+NRGMDTwo=
=U6iS
-----END PGP SIGNATURE-----

--M/SuVGWktc5uNpra--
