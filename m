Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8225D1AF529
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 23:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgDRVgT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 17:36:19 -0400
Received: from sauhun.de ([88.99.104.3]:50606 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726459AbgDRVgT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 18 Apr 2020 17:36:19 -0400
Received: from localhost (p5486CFBC.dip0.t-ipconnect.de [84.134.207.188])
        by pokefinder.org (Postfix) with ESMTPSA id 8C6832C1FB0;
        Sat, 18 Apr 2020 23:36:17 +0200 (CEST)
Date:   Sat, 18 Apr 2020 23:36:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Radu Pirea <radu_nicolae.pirea@upb.ro>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, michal.simek@xilinx.com,
        shubhrajyoti.datta@gmail.com,
        Chirag Parekh <chirag.parekh@xilinx.com>
Subject: Re: [PATCH v2] i2c: cadence: Added slave support
Message-ID: <20200418213614.GA1293@ninjato>
References: <20200106104336.101987-1-radu_nicolae.pirea@upb.ro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20200106104336.101987-1-radu_nicolae.pirea@upb.ro>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 12:43:36PM +0200, Radu Pirea wrote:
> Added support for I2C slave functionality
>=20
> Signed-off-by: Chirag Parekh <chirag.parekh@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Radu Pirea <radu_nicolae.pirea@upb.ro>

Applied to for-next, thanks!


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6bcsoACgkQFA3kzBSg
KbbR8hAAtaGcFgQXAQIHqfZDfIoYRabM6fCfgLBRpm2udJBALyUMSmMVZvmam86o
WUTF1Qg029CXr9deJnGqQPTkCoeAVNn8WtkBqNi8RY/dWH+WTfDetQraQCKr9vRK
k4BU5EYT8i8o64q2lSnVwqsSTipf3sNozqmcAUr31gqlC/R0rFzQM+LsFFUIcPiP
pT4ucQGOgvlWTkCeTcHolM2agk+rNLi8b3bz4LIkAfgYxzcL7tRp5CN78XWiwsmB
9ZxiCacwYOHbLYhnFLzir7Lbuz6QXEJ6tdVRHGxWO6VjZ2tM6GUT75b1/zURsSvJ
Dbpr+XA3jfgVhyCoKd2P1tVpq8tuBHQv6aDAcuX2NxaddYBSVRIW/HGaPPAeUHrs
k/FmXmsuM/uv0fjOtmJpdeYqHWcAqplcljouEBTTFDhVNjL9y9tjknyAM8jnDWNW
+edQn3VJo5edWkC9QniP/HMJq4BNhrNaYjX1j3IkOqTdk6IzsS3eCs5et7TqnZLA
UEOOIqjXS0XzM9yApkImbv7eLuzXTEbS1nQCfUxlMqZuNY8nmbz+upf1f3wNFRiX
iwEjO23gYRC7EV5epnwyxOM5MqCqgMDXVy9IpKi0PdpNDvaFUh3rsMo584lrcOA1
5Ci1OGKNQckkU9fCo8+ZvJn5JNjgQwm0nSxGz3KsKw4MfPcsHWc=
=t45a
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
