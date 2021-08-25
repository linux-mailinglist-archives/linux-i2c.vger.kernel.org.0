Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00AA3F7D6F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Aug 2021 23:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhHYVBu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Aug 2021 17:01:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:57946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230455AbhHYVBt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Aug 2021 17:01:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50DD760FD9;
        Wed, 25 Aug 2021 21:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629925263;
        bh=O491Wjstd55ptiItcBQmMStGcPeTVu8i5bDRYlMHCUk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XE/g1Hy5xcXRzDs1m6ymA8x4Jz79ug6PGGR86pE3O0aQDbWVNi7Enm7XU0h97k7NX
         c90XDOAsgfhQOY3kjPX0rfyM4lcXBSGDwcLhY6sWh+aQoR44dhhOTMzQPNbjOAd9VF
         G/AumvbPhqT/O12DKigfbH+jL87G2KQgNn0ECkrGPKBScaYSkHGcUmq/Jq1vWHPYaF
         EitDyPaUIt3bDzSb8lfNW2Z9aTFNBsjaBOMc6H2tx44axBmchrgf9FNkgYre6pOEG1
         XRzJSoO0w1co6cu4s16KdItfkg16mfzPhQZhd5cqGba3Uy2FISUT1rNssH294whOGn
         UHuCh6e3GMKXQ==
Date:   Wed, 25 Aug 2021 23:00:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/5] i2c: mt65xx: fix IRQ check
Message-ID: <YSavi8ZKhi/a0TR9@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kwNgeN+Mlw5HimRj"
Content-Disposition: inline
In-Reply-To: <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kwNgeN+Mlw5HimRj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 04, 2021 at 05:38:45PM +0300, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0, the driver's probe() method will return=
 0
> early (as if the method's call was successful).  Let's consider IRQ0 valid
> for simplicity -- devm_request_irq() can always override that decision...
>=20
> Fixes: ce38815d39ea ("I2C: mediatek: Add driver for MediaTek I2C controll=
er")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>
>=20

Applied to for-next, thanks!


--kwNgeN+Mlw5HimRj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEmr4sACgkQFA3kzBSg
KbYYnhAAtfxroMXkfK8KgUfArohFxjwTVzFF+hA8xULBOhOTDQ2QfO6JESKDMV9S
VLU008TXfBzwTlM7Q5QIQqbQ4GmfOiyIJXWHOt2pMQ5njdPp/hnFOTxvVMWKZTJH
6vTrUiQ7wZCPl9OmzLngDNBwEjNr0/wUhMHXtJAkvLUF4ZKJFsD+BOucmQtb1xjA
XCmvmm4ewPNXyRlfTEXIv8zuIL/szUns2zjr3vO6f/l1imG1Ow0PRd5VsE3mnvKt
Jd8hRcZnNLu3NJ+q5CEUk6mOzPOJkC7rsute+YuNGpAqZuqdzPCEoVDb+dlLb1tg
HSDq1rQJ4D/a30/axFNdEv0CHzmDYd/cF2rv1L6MCpaTB7RyAaaU+muMH/7qU8Dz
BapEIMuYZztIaS11OJJ/+JmfwPkyeSclbXtOYd+JwBCYIQXGaK4+DrwxkGs2c5iG
4IfbY+vmaRdufyF3ia9G/4RyyCaT9/U8DxVY+BofwyuZHqT0KsP3Q/MfUS79zD3d
EGZWEse0kQfbkMRNrYLcU+W/4yz4aGZT4Del3NcUtb7u5Rj9uf/g9lNwyTARiYHr
jY8wXfGZFwcPBYCAEFruDtR8Jio1lI+sZVLg3hN4eMfxaN/FO0500W2YjLsqtfpE
UoBvMDvvGq0MEEgMXmnxx3c6YLISzV3KAxsEHB670YkRfSCC6Ro=
=drRF
-----END PGP SIGNATURE-----

--kwNgeN+Mlw5HimRj--
