Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58AAC2D4BAA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 21:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733019AbgLIUXR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 15:23:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:34920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731168AbgLIUXR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Dec 2020 15:23:17 -0500
Date:   Wed, 9 Dec 2020 21:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607545356;
        bh=Sj/Ifkegpq5pOyTqYEaA1ENoKNQ9a1WpWcnJklEhcOM=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=LRvK+5q5Vfgz0cOXi2iKNFotQFdGHWWqBTHffZVRbvv1PtfAu+kJXzNmgfDUnqFVA
         4Ioe96uzenZ1M/N5XPPfuTER6KMVP+41delGzOYVPu/OncMjDOGx84KVQTVX9rKEor
         townxC9ZBF8rV9kuSfYOcQl75QQBQKRnE2WxghTnH4WAKAfX2Iz+u0lzlN0Zy6a0IU
         w1Jb/ok3aOfBff/VWjOs5YMOEQDx4GK0YitM1/4wdRDeg2WB72DZQ0DAnZYA9D9nff
         quzLWp70kAl2O1JLjvEUhgzD7nb1COTU9ygkWQXFelZbarExWqz6ch50j4wtb1RWJC
         bhZ5wHO6XhXnw==
From:   Wolfram Sang <wsa@kernel.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 10/18] dt-bindings: i2c: owl: Convert Actions Semi Owl
 binding to a schema
Message-ID: <20201209202233.GA3499@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
 <2521d2e63efcd125a4fe93ee55435f399157ab39.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <2521d2e63efcd125a4fe93ee55435f399157ab39.1605823502.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 01:56:04AM +0200, Cristian Ciocaltea wrote:
> Convert the Actions Semi Owl I2C DT binding to a YAML schema for
> enabling DT validation.
>=20
> Additionally, add a new compatible string corresponding to the I2C
> controller found in the S500 variant of the Actions Semi Owl SoCs
> family.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Applied to for-next, thanks!


--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/RMgUACgkQFA3kzBSg
Kbah6xAApvbjrFXBo/w96ABjNYKPV1ycWExS0wGShqyQ8XHj8l4Z0aQsoHVMvIfc
Q0v1Tf8bd0q9PfK1IMw4Lry6ssBoiTrqQ/SIIorOK9G/zkkcBcGWv9nUQcExN8hZ
MT+zwkvDC6aiwsED9yHLRJmvTXDV4esRK0FBmBzZoZUx6QLTW0+wkhQdB7ou7N8Q
DKIUlh3Dud2UD2JIE+E7BGZQOaYLbt6YVt3/8Ye7QIH40dVSFAe25QIX+KNewKc5
ewwQz9GCJAX8Jt9Kyq6hDbry03rac72s8mKZEhNkkZrPe46SE64/8n0Dsfze+9r8
iCI64JngP7Dm2D28s1lO35k7HhCHw0IWzxVWkBZXhcKCHeVlTLpWue3hjBSEL3F+
Nu/SGHaMszca4G59O7blvtZcZo6tQ9YI9yUpGY6902KzY/w0IMmIDwGVeeb0vNBi
yt8vP5X4sBm8aC1QohKqpmkNtlySCfuj7RO69myLF9h7EBwZAPUgakYBV5Jit+nK
9YsMrWCGAgyNxp1jVIhQ39Av+FQM7NinhuOMn6Ep0t8gfpMB0WqXUrxHM0SxBnG7
wdVeGp9W330YVzDd2AGhB5G+33hDFE4JFDxlXm8wMNfCGaMHK180OX13JTZ2Rj4r
VibyNh1BdXIfMgEbKsXt2GTU5bnwWPnxznSrl/QHiqYuChHLPtQ=
=Vs7O
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
