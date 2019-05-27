Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C8A2BAA4
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 21:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfE0TVD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 15:21:03 -0400
Received: from sauhun.de ([88.99.104.3]:36120 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfE0TVD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 15:21:03 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id 3FDF32C04C2;
        Mon, 27 May 2019 21:21:01 +0200 (CEST)
Date:   Mon, 27 May 2019 21:21:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Ray Jui <ray.jui@broadcom.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Michael Cheng <ccheng@broadcom.com>,
        Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH 1/1] i2c: iproc: Add multi byte read-write support for
 slave mode
Message-ID: <20190527192100.GE8808@kunai>
References: <1557375708-14830-1-git-send-email-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline
In-Reply-To: <1557375708-14830-1-git-send-email-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2019 at 09:51:48AM +0530, Rayagonda Kokatanur wrote:
> Add multiple byte read-write support for slave mode.
>=20
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>

Applied to for-next, thanks!

But please quote only relevant parts of the message.


--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsOJgACgkQFA3kzBSg
KbYZRw/8CG7Z1Z+wBxrrtn0OUKmMjvE9o6yvimMMlpJTX9+vVXBFIgCPOELjwRZI
ydW2rzDKmVA7ja8aVDAFvyihe4P5m3NoVlWcVVRT9bMalZ+mxKuz/zE08n6Ibfc6
Qz1yBDbA/Ruw9RtTvKDeEe9AHagPS4HU1THsxNUgZRX+tx+9gsfW+IgCme4Ny5VG
THgV1O+zuY2ot3ZYHURajeshnPu/n1IDamds/K9Tj9JXVtiheaFDjD64quytfmlN
J3VaQuddtrNUmf+bJqof2Rbcg01Kel15bJqgYYitbCB+nn1Tl/0jfR2gYg3LLUB6
uAyG3Qz0Dz4v/r+Vw/XyVzp2Iv30XLfH8TW6XAltIR2BIeG/GcyUKbD8eOsq7kU2
rrvbJP6FnA+M3PRF/CHdV0om9XswSwoLA/LqKYvu8uhFy9+pc9kvX97kMpMqh5tO
qj1Ds+u3usWz6BxIwkF86q7qsP9ysfrt96pkkkYPXZ4A5Kni48Dhr0GiBXDciq2p
CTztLh79Y72s3EK5L7VTwYWlqCMMmn4A8e1jWw74/+sQoK+1YPXAB+/1rPjaxSoq
VCCVHbYLTsorY9AocLTFcmZyhhvj/3Ia8wbaYfie8q7EI3EQKoTGhqi1yRZ/zv02
EXj3uz/p9PM5U0w+vlYpal+ptqSxP2UvavMRCxot250+cHDwtlc=
=uWM3
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--
