Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9E639C96A
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jun 2021 17:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhFEPPm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Jun 2021 11:15:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229930AbhFEPPl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Jun 2021 11:15:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E446D613DF;
        Sat,  5 Jun 2021 15:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622906033;
        bh=q32TmPFHFLcbVcbZPuwKpHBVSsjdVYl/vMKBcDp23I8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VTrjaJV3bhae6c+jmXmQY3npLh/jqazRkfYlJFz0el613zy6L50Ye76zcepOPG0+m
         bbYI5kUKSbIi9pcGrQ2nW6/6zJokKvYCirpRV59voLTbhpmul2ipxWsi5iMYsNd4CY
         3/mXsRGH90DinAz5A71h9ZApqSiZiMXldPvRRPM+a2NrdUJg7jSEwMwjjo2+6TCuK1
         nIUDfDNMIFvIUJYc+Ko8IOHZXFpwMUQrmhuu5B/cVLToQxcjnsmVRIe9RyO4/Fh0lf
         sNFQeA+/3p1sqq3Si1wh6RIkqOPqbK2xcfkTY1HNEyDWyIKgWBDrwMrWgyRJ+Yud/h
         4M6VYnV8OGOZg==
Date:   Sat, 5 Jun 2021 17:13:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 23/34] docs: i2c: avoid using ReSt :doc:`foo` markup
Message-ID: <YLuUpxl6tGmym4Qs@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
 <88f7b2e2299cdfba4c3d00d623c852f18650d1bc.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="B8Piwll8ivrSiePv"
Content-Disposition: inline
In-Reply-To: <88f7b2e2299cdfba4c3d00d623c852f18650d1bc.1622898327.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--B8Piwll8ivrSiePv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 05, 2021 at 03:18:22PM +0200, Mauro Carvalho Chehab wrote:
> The :doc:`foo` tag is auto-generated via automarkup.py.
> So, use the filename at the sources, instead of :doc:`foo`.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks for doing this!

Acked-by: Wolfram Sang <wsa@kernel.org>


--B8Piwll8ivrSiePv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC7lKMACgkQFA3kzBSg
KbaLaRAAgL3qwWjkIDARr7I5Oe2cIwUWRMHv8ndxbjCDfVDzaTnKMhkb1StLZBSy
ePpAz+HnLGYqV4zSVfadHsrS/RP5WDNGLhaqydEknfd329eIQ63tcCOCvPZknEqu
xHuJdf9CUmSimIL4ZJc5rsHDpBRCGVYxZpa0OAR0SgvajNjm1L9PFnwqgrDOZFjt
J6Lf55trqHf6QkDdulMVI4kU4SmUI0HyOJaIiuRxnjupc5S7OZaysDJGmtYKB5vk
uuRAaQ07VJdVlcbxN1e6d+0ThZgSkplsgcZs8LZPE4R+SgFxelUDqp1ukOJEF39Q
MSRhwM2xrE8VwG1gHpPq6ZbqRA27MEIQHSUJn+s7BiMM8YZeNPVmYF9SfR+7+4ek
hcY6YXKlWaYXqJXTLbIQjVpn3MAcz+uGiiC9rWUbyDsMJX5pN9koQqvAtBlyti8o
rWhPONwAcHpDrV2Wv7l4ovKkfZlWP0qejXplqrd5fMzbP+Bp6LmOFeTv2gj710Vy
f0sXsdfCid84MKJHUxwRhyeOE/Qo8+X81KyqorT+wsPBTtIMXv5cKYTctBAnQjbJ
LWfQ+rFfU1t0iXidvzBavApc4tQdpV8DbLDy/GMy+S4xUvDwo56G0qv+FEczcbjI
vWYSPP7A9kh38EsQzYg2Yvw9GYX2uvGY/XvZ6bhtnr4htfeHOB8=
=3GSv
-----END PGP SIGNATURE-----

--B8Piwll8ivrSiePv--
