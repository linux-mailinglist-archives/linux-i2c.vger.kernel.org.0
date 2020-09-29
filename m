Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB24127D70A
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Sep 2020 21:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgI2TiV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 15:38:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:38574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727740AbgI2TiV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Sep 2020 15:38:21 -0400
Received: from localhost (p54b3311a.dip0.t-ipconnect.de [84.179.49.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 91EE720774;
        Tue, 29 Sep 2020 19:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601408300;
        bh=7ti0k1QxftuaCymWAszyQJo/dfKpx/9H5/oH8x18png=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nAj6DYZrmJtYb0ulDXN9Mdxb3RKE8g1/XiMvAqwpuxo3cUUIUbpJC5K7O2ddA1bZG
         GNkExe6RavG+YYg9Y0S/DFQHdzmoZYDDtWbwAmmU47li7mLBGjoNeH8TOhjoPaG95A
         0oulqQeXj1gWTKRP5jcCwPmKY6hrZZsxqKAK1UNc=
Date:   Tue, 29 Sep 2020 21:38:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wang ShaoBo <bobo.shaobowang@huawei.com>
Cc:     cj.chengjian@huawei.com, huawei.libin@huawei.com,
        u.kleine-koenig@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] i2c: efm32: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20200929193817.GC2010@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wang ShaoBo <bobo.shaobowang@huawei.com>, cj.chengjian@huawei.com,
        huawei.libin@huawei.com, u.kleine-koenig@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200918082508.32427-1-bobo.shaobowang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline
In-Reply-To: <20200918082508.32427-1-bobo.shaobowang@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 04:25:08PM +0800, Wang ShaoBo wrote:
> Make use of devm_platform_get_and_ioremap_resource() provided by
> driver core platform instead of duplicated analogue. dev_err() is
> removed because it has been done in devm_ioremap_resource().
>=20
> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>

Applied to for-next, thanks!


--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9zjSkACgkQFA3kzBSg
KbZ5Mg/9EhEE1ppX1oAKe/+tK/Z2BiFSR644xUlhKEHGcmucvTr72OIjGvazoxiU
V0K5SKe2W4FHTf1pjBN/dKKjMq8ov6hGeK+rSR8ypQ2RjciOVgneJFtA/fSCqmUc
JGDP/ANMAHw8X0Au6ZIIjdlKu5kv6Vwmr+lVI5TdPNG3ACFZlqcOL6bZGmgHy+b5
ubTRF6jIBbdunCYSpIiJE49suIJKEicayk8EFvbayJQkyCjxYvcLAzEmvoxXRq0D
cojEB/Gt4RJ4C6n12pP5h81esLXtDy7pGmj6PnpaExjV5gThQBJyZJD1qfqTaDu8
QbiwFobZo0KvnUZnl9UZ81M3bYjvDBEZaHQbVJRWZFHiCluoHwgfq5L0F/nu3DSr
E1xsET8Wreq0YqwWIHyzNtDM8+VdHY3HOrDKMNjc81m8qF4dA/a99lqLQ/8RH5jV
NfWZItIZfFgGwY4QpRq8ti5cUqVLAd8qrFlrCKd8c4ocRS1YDQmTbG/roJ35DDsz
MHB5ms9aNIaetttnjBjnvBcU5jpebgpZ12Gvl2/+93TRE4duEPQ1fxCb5cPZJLf/
lF0GWp/IJIaZz6kD9TFPC/hfQH7U+8TXarW0p5B/RELtzvCNTEBc2plVgwf5SlqS
vanf1glXm0V3CTMnplaAmsuxeJjuSS3zQQRfFvGX2ehkBsgfMjo=
=qG5C
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
