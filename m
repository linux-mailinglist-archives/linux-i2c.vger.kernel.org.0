Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95FF21230FE
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 16:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727737AbfLQP7d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 10:59:33 -0500
Received: from sauhun.de ([88.99.104.3]:54174 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbfLQP7d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Dec 2019 10:59:33 -0500
Received: from localhost (p54B330AA.dip0.t-ipconnect.de [84.179.48.170])
        by pokefinder.org (Postfix) with ESMTPSA id 1E75C2C06A5;
        Tue, 17 Dec 2019 16:59:31 +0100 (CET)
Date:   Tue, 17 Dec 2019 16:59:30 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: rcar: Document r8a77961 support
Message-ID: <20191217155930.GC14061@ninjato>
References: <20191205133956.6191-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <20191205133956.6191-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2019 at 02:39:56PM +0100, Geert Uytterhoeven wrote:
> Document support for the I2C controller in the Renesas R-Car M3-W+
> (R8A77961) SoC.
>=20
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
>=20
> No driver update is needed.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl34+2IACgkQFA3kzBSg
KbZshw//XHsVKhoran69BesnkOsqZqrYWgoDHQbxSpl+DT52SyQLelYfUyTsQ+Lc
q5nS6gXjYcLNrgXbD0p868tB5sEtlq6RPnWOXPDHku1j2Lcw2Xr0MPqgMU4w6uYj
57mbtsrX4woBklaP+pzpdDpv4ACow6aQEMuh8T7svvnetYgbFWZmeiS7BQ34u33j
2PIWgiu3nVadY+PyB1VY58ajM/79ByS8cWkmpPWAlGrR2h8ierSFFMRLI8MCw3LH
3vqHm7kiYY8N4yc/erYfawnrBQzxiGm4hiYuCvbbnN75B2Mq76CegaAus8aGYdhg
Yu5sVjwdlqU0thTkLXE4kDTBTtCHYAd2oW52Ci2anLcG4xGi3gUjAVc7u67UJaSF
uqBqtiAudL7F73gl+pokkWjqf8MrpfZs4y6k0DFGnFj3kFtOfGCgPcJNvfxVM6VY
IxIGBdL8suPqfZDywyRecg3TY1vQhzf3ThMqZd/oIZPXMXnkUZmS8gNI6niueKFD
nl5bINwPpkYgm2wqGq5hm7lt20z++ZBESgacnIbHE1QuyAy3Nla91A9Kz1TYnPtS
uYRF0q+eS0yA85QE9N3mxjXZa76kCYPvJYyxjIHsDSacoMVXPaiBFuMMhbpgmNFs
MxDIe9LCzYx5EgP1t8twMdkaiCM5emZjk/9uejXL5biijHxz6XQ=
=A/So
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
