Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 771128D429
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 15:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfHNNEZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 09:04:25 -0400
Received: from sauhun.de ([88.99.104.3]:48802 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726865AbfHNNEY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 09:04:24 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id C003A2C311C;
        Wed, 14 Aug 2019 15:04:22 +0200 (CEST)
Date:   Wed, 14 Aug 2019 15:04:22 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/4] dt-bindings: i2c: renesas: Rename bindings
 documentation files
Message-ID: <20190814130422.GE9716@ninjato>
References: <20190809213004.31181-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline
In-Reply-To: <20190809213004.31181-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 02:30:00PM -0700, Simon Horman wrote:
> Rename the bindings documentation file for Renesas I2C controllers.
>=20
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
>=20
> Based on v5.3-rc1
>=20
> Changes since v1
> * Accumulate review tags
> * Correct changelogs
>=20
> Simon Horman (4):
>   dt-bindings: i2c: sh_mobile: Rename bindings documentation file
>   dt-bindings: i2c: rcar: Rename bindings documentation file
>   dt-bindings: i2c: riic: Rename bindings documentation file
>   dt-bindings: i2c: i2c-emev2: Rename bindings documentation file

Applied to for-next, thanks!


--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UBtYACgkQFA3kzBSg
KbZF3RAAl3ti2HXADvpla2dqsgWXkmDKC3k8d6+HXzP7VnACAM3PkJg6NMLd6fGB
nERGlCdW16qN7mdWVUv5P1C+Heo6wz+qDqL/uB2+3c4gz5IRfpKsEOSqYXrMMWdu
dVRyIAztADedcf5aX2Nf3VMdUV7r7UBuvyC3wjmC9LO/e1vOJP3Hyd64RIdF9raj
JAn4dzAgTOavBvYPLwvxYnOubEwWxB7fO7BvNbrt4zpKaI4G98TLDjTDoaC47wE1
3TyABC4JAkT3k/uQ6KKxgMo+SLl+nGKpTN66MzxuG9+f77RuHNsk0xnn8Jf4bMNc
wXrkJxnhDNgb5t+wG2Ot9Q/areD6Fy5CoT3eGlcp43CwULd3E+cNoobviLXpOjkI
btgOm5wNaUsAV+iCaFfhgZ+vE6ysEwMWlrQOhi29OlIvjiNmEtmTnhU3Qd+V08SY
H5sSwJhLF63XKqW3UJd+LiNsFyJ63skRvLKQlyPHS0tSPMu0qHuc8VhGFKAch3ks
QCimcp+KebzTw0yEbOq+sxrk//6Q4w1guPP2Tkhu5LL9tyzB4VSCAEVSxUnzp/KV
90xqccXKL8U/oE9QfM4R8T+5/yRaG15HOcvjOc1FXKEBG2xT84hdHeNmTzgXHiW+
XUsA4uepS/snDg6b6QsiwrorHMfcYqN66/DSZjpGKXlIcf4LKM4=
=SXyW
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
