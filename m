Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4CB2F9209
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jan 2021 12:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbhAQLey (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 06:34:54 -0500
Received: from www.zeus03.de ([194.117.254.33]:53644 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728146AbhAQLes (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Jan 2021 06:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=DRjLBzlugVyRFgHbAl+7WyqU1KT6
        Cz2wp0ufG+ggSyg=; b=D39/xSPinGbSJMOsIOgHmratE4n5jnqNBity3bHCt1ee
        OWS0UALHAYjAl7vJHALJtInZovaGSbExKke8Y3Dku/ZjLbP2tvTVStwtuBWWdtmQ
        TkLY1/PZ9HArvbDh0q2glYdejpYiFy/wY4dkI0bVfQgpUOS+gU881Aml4zuiksU=
Received: (qmail 303685 invoked from network); 17 Jan 2021 12:34:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jan 2021 12:34:06 +0100
X-UD-Smtp-Session: l3s3148p1@9WWr+xa5pJkgAwDPXy7qAHeYPdzlZkhM
Date:   Sun, 17 Jan 2021 12:34:06 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: renesas,i2c: add r8a779a0 (V3U)
 support
Message-ID: <20210117113406.GE1983@ninjato>
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
 <20201223172505.34736-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Content-Disposition: inline
In-Reply-To: <20201223172505.34736-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 23, 2020 at 06:25:00PM +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAEIK4ACgkQFA3kzBSg
KbbA6g/8CfRr6KrsT5OkwW09YAr3LaBvLPbVM83l29Jz8j3EAuEt1knGXj4vA1mA
mnVqsjOYl5uvohskOtoHQjlQPQj53xSQcTZFL4ErHC6Td8nZqQABGByNe47tgWFf
xMn4HPbo+3KQk0jpyIJ55LnIYLPq3OZMD1Yb2J3OdOg4kugNsL/QkrPNc81xzz6I
jQQMU8rgQpI9Vt1e3OeZekYdfRj1HPSRmIELNhcargFW5VXxcvyp2WYDDfB2E40f
gRsl7VJiV6GOdOsY2lstiFiinjoBs5S66EXLy7vbtrJ/mBCSAoRMWt+IPif8JslU
wnGILpPM5GDrIHBz56AC3EYBrg9WnHA9PVqA9gPW6H/nfjdB7aWd906ScssewOn1
pFdMp9CtlUgb6d+CK+rf8GUGELoSld05xeC3GH7/LVFyw8qSAffymIxS2kFp2nzr
N2o6oVyNALOJ484wTdF7JhhgF8A02EVo2wiWckiLFkOK5xaSB2Q1prtyfLl5TKEL
dVo2WfBJmn5pl8ZoDULooFeCXQ9BrFA+KZ7JOGQxZeBExJ2IvDaNzNZ95twPn1W/
/4/xYVLe3jW5DXSTbwOPM2/1HaAnp8M9/1S0JqL3vXclbCXpv3fDYd6r0e2IW9xk
xN1APGSgpL0a5R7EkbRWUTBUAxWDKUF3yrwbnsCkBn90A2FLf0o=
=c1eu
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--
