Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81E0560B69
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 20:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfGESaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 14:30:10 -0400
Received: from sauhun.de ([88.99.104.3]:53388 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726324AbfGESaK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 14:30:10 -0400
Received: from localhost (p54B334DF.dip0.t-ipconnect.de [84.179.52.223])
        by pokefinder.org (Postfix) with ESMTPSA id 363BA2C0398;
        Fri,  5 Jul 2019 20:30:09 +0200 (CEST)
Date:   Fri, 5 Jul 2019 20:30:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/2] i2c: i801: Fix PCI ID sorting
Message-ID: <20190705183008.GB4717@kunai>
References: <20190701131534.19537-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline
In-Reply-To: <20190701131534.19537-1-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2019 at 04:15:33PM +0300, Jarkko Nikula wrote:
> I managed to break sorting in PCI ID defines in my last two patches:
>=20
> commit 5cd1c56c42be ("i2c: i801: Add support for Intel Comet Lake")
> commit 9be1485accd4 ("i2c: i801: Add support for Intel Elkhart Lake")
>=20
> Fix them up.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0flzAACgkQFA3kzBSg
KbZb5BAAq8pR+vzm1qE/F47plUz3T28q0heAuPYw5k+obN4+hJaoGB3huxC1/0pj
tcTMTLhMUBmiVSGB3u8x2jXHuuLD/wnxEdH8e6D+2qUnfbmtMnNXlO+l7RePwcwb
ClBhuJXAUMr6XNaTBB/hP/91aPCArHVaBVr8nxWqi7M8SE1ohOdq32xCqHPpEmqa
q6KXgywm9nNPf3GwReajkgHZBzLkG3P47ZcDn/98wqzmL749EfLjm6peN2AQbpY8
Os7r5DcRY5aIHBVBNJbK+oeWEXPELU2RAbatdbmkFTiG7q21EsU03vUhbXzs3UXh
bZkWlIIEm7nhlrkVyNBeQ1vwVkVuqPIehkUF1BVds/7xd+DqvBvdvFYJjgYrXPTm
01GmCDwFCr/GXITuYiUKnpNas/SFdqPs/CyaulEZgsOxl2n+pFYMLS7UnSWKsEjW
+VwZZVV9uSFjuiXrFS8FYGYDO3ZgodgyMD/4Gf8sW3nGHrO0ixTGnjxfOmynsZuT
ciKYtVhpCru0CQ/J46wICkHBJ3fXIpvht/pFZcUYEfzRj3NLs8ria7dB15EZpseX
livm1X5YTed+gy92fA8U8WQv2nMV5CREmMh0Mgu6E0dY0ogViX+yVXz7VrfgDE8r
7O8TyWeJwqoO3rJZVF+7DUGYCmltqTD8cw6oJyVIM6LmdHltENQ=
=s5ed
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
