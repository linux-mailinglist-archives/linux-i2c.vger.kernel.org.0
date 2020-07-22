Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525042296B9
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 12:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgGVKz2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 06:55:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:53664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728171AbgGVKz2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 06:55:28 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8F15206F5;
        Wed, 22 Jul 2020 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595415327;
        bh=M2x96i5KaNWg2BOe51Db2AB9asUsaUmui/319W5e/u8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dELiU8CPE9hqRVfSPybQBVNB884h/qxqQJlJuvlEf7JHtUl1yPoVMaW3MnyuyN0Nm
         XvX1KTLSrKxItM8phvuUWdj077x0beca7IZbfZ39z9fH/Q2ALVNxkQv76HrXC5A4Tb
         Lybr6y38aUQnXP1oTHZeYYcMUCPXXHN/lnOU9+Nc=
Date:   Wed, 22 Jul 2020 12:55:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tiny.windzz@gmail.com,
        huangshuosheng@allwinnertech.com, liyong@allwinnertech.com,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 13/16] dt-bindings: i2c: mv64xxx: Add compatible for
 the A100 i2c node.
Message-ID: <20200722105524.GO1030@ninjato>
References: <cover.1594708863.git.frank@allwinnertech.com>
 <2315816045fa84057968ec6b679d0df611a3b1d3.1594708864.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HFD/Dq8JdnjNvyuv"
Content-Disposition: inline
In-Reply-To: <2315816045fa84057968ec6b679d0df611a3b1d3.1594708864.git.frank@allwinnertech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HFD/Dq8JdnjNvyuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 03:18:39PM +0800, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
>=20
> Allwinner A100 have a mv64xxx i2c interface available to be used.
>=20
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--HFD/Dq8JdnjNvyuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YGxwACgkQFA3kzBSg
KbZ5QRAAi3zqkJXhL6j4BS1FZDrdNLKvyyxGd80R/X2rplKFshFPBu2dnjdSolJG
efmbYtvEQN53OHkeBWxj9/TuNP6Pkok5yODeqKGZvTIVUHNjNP/d36cJry3P1uaC
hmtlYJlzXDybuKvGoN8Zt78ERnA5KkPBf12p9sg4mJ3llaZwm/TWJDGfiGDYWZOz
DWzb16NLy4W0QgHXXODd4GXLfq5uGf+kwosyHU8dlc6iMS1zTOEO2UPnb7nVAFKx
qCbh4Kp+Yg5TXEJsCIhbWpmZ4/j/eIU8A9+N5Gtx8kEERfLoNg8yLcdP1M1Kh510
WV4ngYtpiKaoD1rm4K+wVKA7K3Cg0KeCj1qxc0zFzEmpFHhfpPBg/4YbgYpYM7D1
gTltn2d3TDGPMRSgELE+fzt7ir1YGCeHMZIsbyq/OaBHhLh9Y8dFAqcJfMIiLm11
nSwCLXsEcCvrClyNwMF5JyblG8cjfdnAMXcVKd+lWoUEdadONK4yaC/39wUZCOdp
Dw6U5/X/LqBAn0BIv7i237b5jNNnNRxLz5Jixgvw8hYPymhUjsMZXzlDB5ZwRxPD
Q1CC2QP56n7h3oeXa5yvc6aYhrqwQuErxhWsBqFOeZ6L0lnB+lsrfkccyh/Jh+Zn
VobysQnU0Hkznp2B7Ylcgcj8a96KBowvhcDnTFM90mo3y19jB14=
=ZObD
-----END PGP SIGNATURE-----

--HFD/Dq8JdnjNvyuv--
