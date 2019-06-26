Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3988556AF0
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfFZNnF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:43:05 -0400
Received: from sauhun.de ([88.99.104.3]:56364 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbfFZNnE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:43:04 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id E84C82C0114;
        Wed, 26 Jun 2019 15:43:02 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:43:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: i2c: omap: Add new compatible for J721E SoCs
Message-ID: <20190626134302.GM801@ninjato>
References: <20190605084504.2777-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EOHJn1TVIJfeVXv2"
Content-Disposition: inline
In-Reply-To: <20190605084504.2777-1-vigneshr@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EOHJn1TVIJfeVXv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 02:15:04PM +0530, Vignesh Raghavendra wrote:
> From: Peter Ujfalusi <peter.ujfalusi@ti.com>
>=20
> J721E SoCs have same I2C IP as OMAP SoCs. Add new compatible to
> handle J721E SoCs.
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>

Applied to for-next, thanks!

Sorry for the delay, I was waiting for an ack to show up. I totally
missed you are the maintainer :( Won't happen again!


--EOHJn1TVIJfeVXv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TdmAACgkQFA3kzBSg
KbZ9dBAAo919nA+c20of0MlgEZW7UedZulT6dQ4dEQarjiBxvSypxnuLFf4GK0HU
49ES8y9RFx/ALu1w0tuB2X8tdnymyeURHhKamiRzI9uQckdWdG+bq4CYqJAbjyRn
wrqn09bsPLR3X7tW5Ivcn5p0capglvGYbKMfSG4sM43b793RglSxydF2XhDoZYlQ
jw7ixZikzVY1hl7fz05zhjXNnOpEF/M3HdnqpkcFf/PrAlZH+NycWnAU3LbERYVa
hCIo98A7lqgfuGgCsiifSwc0M9fcLu7ddf8SVPnS5V39//H+8oW2BpR5U8tDZ4nW
Iu3l/R4mBdZ68Evda2mQHNbRGybt3cV4e4VdyuxeKjGPe+kAxBUaEsPNwYF01k2A
StviNSwbGPDkzHOLP4/Cw+1cb++CsduUJd06e1xocsqkpzLoaGUTmy1g0TiL1hdv
ehM8d+zmZfm1l4RMF/bXe06+nOlMy4JvT/4yB1a4XoptrOdOJ7gKvAguKQkVfwx9
yopMdS2cysDNu2ny9258EnAls1cfFJCbysBbl3/lX8HNwb8yUWSrD/EleroF/35h
2H/awiSEuDDGXJRXoUxXlJQpS/kXrw3ehpplkFptKKhpG5s1U+EZNXZk5IZHWw8c
helXxIcFR4UZUuMefJ/5NzB+yi6v2VJFHmZyOHmnRwxdtqNDekI=
=T4Na
-----END PGP SIGNATURE-----

--EOHJn1TVIJfeVXv2--
