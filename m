Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F1645083C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 16:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbhKOP3L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 10:29:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:51546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231819AbhKOP3L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Nov 2021 10:29:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A31D61B04;
        Mon, 15 Nov 2021 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636989975;
        bh=eUM8nh5M+J+Xyi+ghRfR7pLG+uMUG9uqMGGQaGZ7d4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b3ALJC1+8a3W3KhaixGxLlLbW1hq7YTPfYnIwt9vAAc/DDJwwgKkxTy9mKKbHOdYc
         bTVzSPSn++dIEOzTQxoSCiqr6njOi8AByZMpaaiErnxDe3U3V88S/nkMh6W6gs/xRX
         2BVqD42QceFvynL+yCnJ1K8R8c0FriftY7Bxro9sJ/CHFghoM95Y8JFqbAMlARBZVn
         S/TRnCTFPTUbuRRi3yagULXRL2d5BSQ85nFcYE3DVraYtTG8R/fuw7+bV7i1fHB/XF
         6GC0ak9fE2MpQgeInTBdnJvIiZUNEoXw+c9mL1Ev1FY4X1ENP3gyyPQYZpTkd196RL
         pDzpDY96MnE8g==
Date:   Mon, 15 Nov 2021 16:26:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description
 for struct dw_i2c_dev
Message-ID: <YZJ8FPDDQ4PqDtTF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
 <e62bf878-03df-1b93-2177-7b8a3be293c4@infradead.org>
 <CAHp75Vd71WPosA8Sy999Mb5ZiGEGg-y3vxYsYz3st5Ng2PJ98A@mail.gmail.com>
 <07932f56-ec2d-46a5-7c8e-3f4aab7afd35@infradead.org>
 <YZJsUHVhGFsImNvt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BvXqiEanE7JDdHew"
Content-Disposition: inline
In-Reply-To: <YZJsUHVhGFsImNvt@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BvXqiEanE7JDdHew
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Yes, I am aware of what is in the spec.
>=20
> Wolfram, what do you prefer?

I prefer I2C. But it is more a reading habit. I would neither enforce
I2C nor I=C2=B2C.


--BvXqiEanE7JDdHew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGSfBQACgkQFA3kzBSg
KbYKfhAAlId9kFNfFr8y53JyPOsTxdJ6h521xQpki3cD89L/+f57D/saomjQUjp5
TauAzptzTJSIlDMzvdrayyEASdr5Ca8KWTeiHZ///GvMJlaPzFVWt7KNk01BCCZk
odYj63G68vU5i5+CDPAabHDOuqTk4Nqbw2tbBjoeyRPOuPQCRfspQZ6BbYvbuxuB
57wGURpyjV57zb68EDsJCUV5sEWwq8sxZvU34i8eANaLTdJaosKTkcQraqwIQ4Pw
WwsVw3vsNwIaWAZ6cuxJz9PybX9N46U7+Hv0L6+eUtE4530cNSe95QnWTZG0fvs1
6v/IAvaqo6Tk3lALjj6aUx+ab8fkgENH8NNyx8JHTo3XhzTD0bkNTHB462skgr8U
vS0VLCw5AjMZZdr8Av8u9hf9Go/rmYhKPxyF1ImTM+jxeIa91NKgbsShxD4KA1VA
K2X0i3buJRUEFfIGEWSdx2HYNt6fifWCNYheXDTvmOibQ9EUCEEQVNr7tWJkXK/W
YT4FdjLJRzsVZWyM3i7b/zG75cL6FueQH3YhfeqtS0u8kmEa7+u1UsP71U02k2cM
5ERgoO1Fs6EyqETNcMhGVl//fpuDmbQ0Jaewvrj9KIbqEozkupDVXSN57WVkTuZh
4W9PbirslmNqpbHlANUFkFxtR8akm1aEGWJA6hFBLpeZ4YMLn90=
=/G3W
-----END PGP SIGNATURE-----

--BvXqiEanE7JDdHew--
