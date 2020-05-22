Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3BF1DEB6C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 17:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbgEVPEV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 11:04:21 -0400
Received: from sauhun.de ([88.99.104.3]:33326 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729929AbgEVPEU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 11:04:20 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id 19DE52C203F;
        Fri, 22 May 2020 17:04:19 +0200 (CEST)
Date:   Fri, 22 May 2020 17:04:18 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     o.rempel@pengutronix.de, u.kleine-koenig@pengutronix.de,
        ardb@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH] i2c: drivers: Omit superfluous error message in
 efm32_i2c_probe()
Message-ID: <20200522150418.GG5670@ninjato>
References: <20200415135734.14660-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nhYGnrYv1PEJ5gA2"
Content-Disposition: inline
In-Reply-To: <20200415135734.14660-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nhYGnrYv1PEJ5gA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 09:57:34PM +0800, Tang Bin wrote:
> In the function efm32_i2c_probe(),when get irq failed,the function
> platform_get_irq() logs an error message,so remove redundant message
> here.
>=20
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>

Applied to for-next, thanks! Please fix the issues Uwe mentioned next
time.


--nhYGnrYv1PEJ5gA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H6fIACgkQFA3kzBSg
KbbTkRAAp/bBktGb65OPHwU8EoUeqX5rb9FE+CjDg8L+pI2bqEG50BJdokEsKf9a
8lwJ+WL+Vl0gmek9bC4xRuMJ7JTc1rMSi7JaD+4YWvW+JC/KzC3eVO5BVNYV6TJ6
E7BWb0lI3lYm+WMMDOxG1NbJ8SuhpRKPdVdXuy70a0zGk/czf9EyqZDOXvZOXF1P
TASBupXIKh9zB1Fwa4Sl6NoPKhWu4gzgAFfjAwawRumtFBzxCudr3swcdW7XEX/J
ZrVeXj310miDjF4Tqyd8s9ELATGLmYy77I5gRlv7Y6XShCrY07j0+Ae1pHIhc9v1
PP2fuOYPQbzEcDULuxIviCNsOCPjy2tlBn2/CI6nde6vtsvxDQJpyWTejgslaBZ0
MDyRu+Jnhx9othSUHpG9MTPvrjldJLZAxiuLwwQv7YumjbJ21hi1kIXzv8dG4bYq
HrfoDuLI1IPf2fvXWNh32YpSi1jFj2Lxgcl6oXpaffmNwOkwZCdqnJsDibgc4SLQ
7t7oUjtVYV/+sU/7Rjsvv4d5BuDvKnuVJ3vjUgDucQ/kN7YW6PixgwvKg5nwPbOw
Y69ApdUoX3sSAZ/ZSkGMgjh6fsO/ko+FPPAbcAeO5wSWQYkoISCRwfNHQpG1MBNt
fo4wU8PjjtUJ6Tbo0dQLUk6HKOpl7Kihfng+8k4jV7YdShnr3fA=
=TGs0
-----END PGP SIGNATURE-----

--nhYGnrYv1PEJ5gA2--
