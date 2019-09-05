Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A689AAAD12
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 22:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403980AbfIEUeT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 16:34:19 -0400
Received: from sauhun.de ([88.99.104.3]:60782 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391682AbfIEUeS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 16:34:18 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id CE5C42C00C0;
        Thu,  5 Sep 2019 22:34:16 +0200 (CEST)
Date:   Thu, 5 Sep 2019 22:34:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: uniphier(-f): use devm_platform_ioremap_resource()
Message-ID: <20190905203416.GD8989@ninjato>
References: <20190905034533.9842-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline
In-Reply-To: <20190905034533.9842-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 12:45:32PM +0900, Masahiro Yamada wrote:
> Replace the chain of platform_get_resource() and devm_ioremap_resource()
> with devm_platform_ioremap_resource().
>=20
> This allows to remove the local variable for (struct resource *), and
> have one function call less.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to for-next, thanks!


--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xcUgACgkQFA3kzBSg
KbbMcQ/+Jr9iIT92eTkVORqSGM/7JE4CwwhsTe4KGq3qRycveqVovJQRQpJ6U8bj
vw0A446lnnjg+ePvFO2qkH5yAq+ylIAuGwfuH1Z8Z6W5tSe/FjGEtK/G+R7BjJ75
jti8iCNRa8rIO4Y0eZpg/k6U8biQrBY8+k5Tzl2OEIEwOB0eKui1Hs6wbLQg+cb4
mTSTdX6ItocIipVrrf96pq3b45VGbnDHnP0zawNfCUdP8JjfoGPYIV/pCz6hMVxH
1VRDOqfMGjkVx2BfI/XAnu4fSzE975JiFdlKZ3v7mw5P0N5UCdBNWTuiG0D16dlm
yeZQzXjrgsODccaPYU78Wif4Qb4l47ZdLmXNd6R513O45K+nr/2rRTjZE1fbToe4
hiaQfQLvLTgLZSNfaCcpf2xGeswNkzs1u72PKjQQvXD3HY5oYzLq2wc0pceaCeK4
ry5DkixrquDXupFtOu6AzNM7MNU88pLMqdZqk94p/99bEXu7AQMrsFkZ+5crr/06
mZyKF7j55PcBKtcpgCfSrLGJr4rYUvY8WXmQYf9LQaZ52Y1XNaDJiDUgD6E0wgJR
nsYDXUfZH5WpM1Vkop9rbgew2U+4jfSJ9at0IneHdLLcH0kUscdQxbJHiZQPzbye
XSAbfUBdhSWpJN2pGeodY8ileHb0JAsIRLn9Pn4hfSBHh2ri98E=
=iZ80
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
