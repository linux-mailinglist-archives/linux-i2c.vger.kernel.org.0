Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB82856A44
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfFZNUm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:20:42 -0400
Received: from sauhun.de ([88.99.104.3]:56068 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbfFZNUm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:20:42 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id 9DD442C0114;
        Wed, 26 Jun 2019 15:20:40 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:20:40 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/2 v4] dt-bindings: i2c: i2c-mt7621: Add bindings for
 MediaTek MT7621/28/88 I2C
Message-ID: <20190626132040.GG801@ninjato>
References: <20190617083117.1690-1-sr@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yZnyZsPjQYjG7xG7"
Content-Disposition: inline
In-Reply-To: <20190617083117.1690-1-sr@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yZnyZsPjQYjG7xG7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 10:31:16AM +0200, Stefan Roese wrote:
> Add bindings for the I2C controller that can be found in the MediaTek
> MT7621/7628/7688 SoCs.
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--yZnyZsPjQYjG7xG7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TcSgACgkQFA3kzBSg
KbbzJQ//WfNbh8QbMVXVMrk2e5+TNafNmYcvzlDr93kgUuT5q+QBiEKCC+ld+syH
7zeGsXcRuvKSGFp2rcB9q2Sfe07lv7g8RiJRKWlIN6Z7ejs7c1SXeY2NJTRwp7im
AOF39QeRhs0XPh41135YTw5kvvdT1aXw8+nardrqaM9xfOzpWujarq5oZknYuks9
ZjQGM9Megd7v0+27ltgByLuibCO1Gijrr4R9gdnJy85Xu/s5CUz9Y7LtL663zfsj
9nJckMJLo+iR6Zm+tvcE72IFcFdNQ4Txrf5u+QHDpJ0ysQN8mF8nApVaw9dUwws0
wNBXi4nDWwbzgj7LEirJQDreB0uqsiFtdAds8Z6toUg+xpFuNNIuLCO60rSNAVXK
qDfOR8uE5C5DbOvPOzcIA6UUA3vvpXyMqAwbF+cQOsxs/2LhHZ+SsiiTt/iU8Cpb
OxVwiyyYTpjH4h5+vk5xfuPhKyWkuBcXiBOIcrLv7tSM3DPwBUD0DomdunPqpubA
y9iAhVo7tEBUV8w9RN96TvMPehgwaIPYNl+1xGioL76wCxO3898gDddKF4xlPgse
aQ52iLUVcIOxBFxBUMdcv+7JEp+5SwM+ZKOSTXBAbh/53hYswx6Mm1oKNtUwuYIY
SHfUeN8GIzFswsfxwt2Tgp1kkpX3ZaUdLUWThDjlBdxUA6oM79E=
=0ECP
-----END PGP SIGNATURE-----

--yZnyZsPjQYjG7xG7--
