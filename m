Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE5F23D213
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 22:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729192AbgHEUIl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 16:08:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:49472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726861AbgHEQce (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 12:32:34 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D433D22D01;
        Wed,  5 Aug 2020 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596626231;
        bh=Lj/S8Vw1nYyw4Ou+vbz7LnsdC/j4JdgvaSVpWQyYUec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1JCdrLt6M6Nh+FuzymcmpcmS2DjsdAUb1RRpBCGQskvJAa5m2HGRx3kdQ0B0IBC1Z
         0k8BBPYxfMa7lQjqfpd0ClYYl78xbUjB/x7fZRzk7mCAFOPGjHORTR1tirRFlfaq/S
         U4TdScLzPEAN5Ur4tgxdBTB4b13Ix7BRAGz/1aJs=
Date:   Wed, 5 Aug 2020 13:17:09 +0200
From:   <wsa@kernel.org>
To:     <Codrin.Ciubotariu@microchip.com>
Cc:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Re: [PATCH 0/4] i2c: core: add generic GPIO bus recovery
Message-ID: <20200805111709.GA16287@kunai>
Mail-Followup-To: <wsa@kernel.org>, <Codrin.Ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
 <20200805085236.GE1229@kunai>
 <a776a0b1-dcf7-0e99-7076-0fb791258058@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
In-Reply-To: <a776a0b1-dcf7-0e99-7076-0fb791258058@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The other thing would be to convert the PXA driver and see if our
> > generic support can help their advanced use case or if we are missing
> > something. Codrin, do you have maybe time and interest to do that? That
> > would be awesome!
>=20
> Naturally, these would be the next steps. I can do this, sure, but I=20
> don't have the HW. I'll look for some development kits. If you have any=
=20
> recommendations, please let me know.

No need for HW, I think. Just do a best effort conversion, double or
triple check it, and CC the patches also to Russell King. If he accepts
them, we are good.

Thanks for doing it!


--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qlTEACgkQFA3kzBSg
KbYyRA//VMk49UkMfHPopkeGQ81lmWhwtOm5OSvxYQNaTDwIaZzQQepXUaKWar3J
sqlKl1PfSy+LmOJRgPeWLIhbkWQQQRfTV4tppBbjjKXSZ8zeZQD9+FrptIrXaQpU
H7noRvk2tSIBrYKLQQFU98XU+c8VmJIGs3LkWPDjjC+s7LmnOSZCgosoZlJsTPQm
9cs30EmWNu4QHb4I+3j+Doe+rObyBDElO3gpr10cRTcUQI1V4Pu9DW0SpqMzeKTg
vHTghhMWePAIqorJapzPG2H/9uMNDzG/e2lgwG868XMru4nilrLXarPeqBAJ+wHQ
ckdfrLVhQCymzFr0USFNa654sYL8A6S1ViNCZmJTXBtTMmYoAgQMNhVpjA/zK4g8
EJWLI6uxhQaPYc0TVHKHz0iD27Ti7u71G/1fMDQ0k+YJZsAtwrX50Es68GLHGbKm
X22Bx3sv4NjPTa/kpu+hgwAOIAoDTeSsdoJ1vreJyzHMyprCyVqQFF5wDVM6GU9z
CGYYC9wl8pBMCEgRogdVmTj+1OCEhZb4b+2yT89MaogpnJP6hUPKbNXzEU3jPIDZ
pi9cfVKh/BDMGXKQouHH37gBhp8LP0bQ36H802VidZy+0A8dOVtk3lgjSAqNLP5Z
J0LTEHoWU5Vsur8g3LZmob91u+tEWWElOwlTe+xWzn9LI+loU+Y=
=vVXL
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
