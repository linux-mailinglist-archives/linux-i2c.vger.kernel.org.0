Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00B79398C6
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 00:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbfFGWcU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 18:32:20 -0400
Received: from sauhun.de ([88.99.104.3]:46592 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728749AbfFGWcU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 18:32:20 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 65C593E43BA;
        Sat,  8 Jun 2019 00:32:18 +0200 (CEST)
Date:   Sat, 8 Jun 2019 00:32:18 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] hwmon: pmbus: protect read-modify-write with lock
Message-ID: <20190607223217.GE869@kunai>
References: <20190528090746.GA31184@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline
In-Reply-To: <20190528090746.GA31184@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 09:08:21AM +0000, Adamski, Krzysztof (Nokia - PL/Wr=
oclaw) wrote:
> The operation done in the pmbus_update_fan() function is a
> read-modify-write operation but it lacks any kind of lock protection
> which may cause problems if run more than once simultaneously. This
> patch uses an existing update_lock mutex to fix this problem.
>=20
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Please use get_maintainer to find the people responsible for this file.
It is not my realm.

> +out:
> +	mutex_lock(&data->update_lock);

Despite the above, have you tested the code? This likely should be
mutex_unlock?


--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz65fEACgkQFA3kzBSg
KbYJ0w//UZ891A5ERJxc0KfiTONdubv82Tq6XlgvMzF6NBLXovXj4QGY/Cai1j+u
d4yIv6YReQoS4Zsd5hNKoQk2vTtI7TF2yCTWjffQWRvXyOppQ8vmoAOlxUsCV4lU
UJAotgCnlwo4KZKjKEAYMv0X5cbwByWcswyz8W3ZAKEVfVePw3EiAj37EO2bfRXw
QG66Y8jBPzphQU0BzxZxq5xlv+tYJnE804uXnOrqqxDaKA2jo8lyEO7iRPrTSOP0
UvA19GIA5Tgw5wLLfHxRR+Ewday9+hcAr1pWhpqYKrZvJadXJgZ4wVVOql9RNkMe
PEJe5aGxPCvgvc1nRe3lN49iGE/lKAOA6zA5RJPfmXf46S4lQGi+tDX46hWzxNh7
SKM5Fkc+ieWs1Z1BidMlDmYvXwdeCALFcbMo6/HBdeXkOob4Y1j4PrOysCd936u3
Kv8zSvw2z0qbd/2mdqjanFzIGABXPZAuS65cs8yci9P6pLdyu2siBIEDIKUf2HDm
OI8TBwu6y1DwER2EW8l07njzo5CzvTWanYwBi2sh7pJsCxGKGaszFni82C+pNPOh
pvdmoKp9RI+nWZ5fLDIiq7TQk5mPmVspw4zKlqB48MgVAUrH163NPWyoJSeGyBd5
om4tv4lmJTWx5no5UPg1oj7U6hJojFoFpyg0tE48bfIFCUE+uLM=
=6s6f
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
