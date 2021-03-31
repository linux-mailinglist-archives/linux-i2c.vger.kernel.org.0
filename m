Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20CA34FA57
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 09:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbhCaHfc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 03:35:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:44856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233999AbhCaHfL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 03:35:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D95A06192C;
        Wed, 31 Mar 2021 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617176111;
        bh=5KMF4y/hIDgH9vvgxs9/JeMHo8NV9usFpT0D3GVzQx4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gcomuHNbKBcjyRasOZOqRDhyvOzsAK7OaXh0fbkdi8PhQqz44ExkqtMzAuGgq641p
         Xc2f42VaRbPLpEFKjWPDg/8AvcCTYn6Hg89gB95qr2o00nxgH+0EdqZYwAN7N+Stpx
         zTrgJ10C6oGa3bVM35AMTKYji+1cxBSQ7VQ8Srxyy/MURU9ZgI9o26j7jbIhjfxz+Q
         zcKVVd9mfa3mn0ldYCQ9ntmQYio7ySI+fj4ZQUdjpTXxNEuwMvP9Jx9lSv4il8Ffw8
         hpb0txw3WVCtq4/XgMA4luRzKnIjLcuVJlW0AA8C0ZYMDAM1WFk5xkA+dOc1oUdliN
         F9weFqu/Y5i0w==
Date:   Wed, 31 Mar 2021 09:35:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: bpmp: Implement better error handling
Message-ID: <20210331073508.GE1025@ninjato>
References: <20210323155713.513864-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Content-Disposition: inline
In-Reply-To: <20210323155713.513864-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 04:57:13PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Inspect a message's return value upon successful IVC transaction to
> determine if the I2C transaction on the BPMP side was successful.
>=20
> Heavily based on work by Timo Alho <talho@nvidia.com>.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkJiwACgkQFA3kzBSg
KbYZ5hAAhQ1D4axdaQlbKhafeE67zUppHMxLSkl0B7um0Xdfp0yvSXqYNFK9abhB
legyxwsJ5lSs1nEyDHyUKmcN86TfyGk5NSt8Mz2HntZQRctUVDmLlFH6RXJZxn4L
eor7Eq4GYeRLDs98CXsH90cE4tToYZcx8sdTKYsiw+tb3Nqy1QlrgFrORtPLqY81
KCT92fyL9HrzEePaxqF6L9ltacs3sx1sJiE3HLZwHTO5L+K9I0CDw1fRpIbOmKJN
F5z8HdlRAopkIq95n5S0sh915BO4wI1YYPqCHv5u1x5AYwsMzhZpUhS99+GtE+GU
qecDYOxZwpIfBexa7ncxQ+FbtGyTFij3LTx/m0C8BXipEQ2jZxiwMWuDFgO0dpGl
rFeVGDeUM4mULPJA3USRjnlgLt12GfAcgMPQeP6Y1uKmbXSN/DToFFJagXTnkq7S
rOcDz4V0sEUmL6Gmmi6P2tDmV5kMe/mAopM5ybTNrZVwTUrlZUCpa0JslG47gKtE
qStvF1doWo42ZtFfjQzIFJBfXw46MgLQLsgcCwE35dmAxcFH8h/aj4kl/y2vFFXB
uA/u5Dx/Va7T3BVtOB2rJj4ZTZaQFfMyGUIVCZibRaiFOqNIcQqiPRTPbLdaNdzk
MYKwqsO8RM+2OsMJBt3tnVM7sDz+kfNOVdaX2qnWV1pp6NxSDFI=
=K6k+
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--
