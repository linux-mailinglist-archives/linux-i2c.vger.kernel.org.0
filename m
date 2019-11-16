Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0858FF4A4
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Nov 2019 19:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfKPSTb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Nov 2019 13:19:31 -0500
Received: from sauhun.de ([88.99.104.3]:53710 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfKPSTb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 16 Nov 2019 13:19:31 -0500
Received: from localhost (unknown [94.230.152.199])
        by pokefinder.org (Postfix) with ESMTPSA id 5C0342C0523;
        Sat, 16 Nov 2019 19:19:28 +0100 (CET)
Date:   Sat, 16 Nov 2019 19:19:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: of: Populate fwnode in of_i2c_get_board_info()
Message-ID: <20191116181927.GA1765@kunai>
References: <20191115045049.261104-1-saravanak@google.com>
 <20191115053201.GA800105@kroah.com>
 <20191115091035.GA2227@kunai>
 <20191116125711.GA451566@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20191116125711.GA451566@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > What would be the advantage? I can also apply it today if you ack it.
>=20
> I think it will not build in your tree if you apply it now as this is a
> new api :)

That's a convincing argument :) Have fun with the patch!

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3QPasACgkQFA3kzBSg
KbahkQ/3f2JRV7424gIx25doZlB4FhqA7AD5JsVtXrddNJsewD8Fd48/7624UqaB
f7+4cQ6530aeWhfwhirI+eKarHZ1ybzNX2BjDuzs9sF6LG6Vseuo/1B+b3pOBf6M
7aJvBoxEnFnYWV4eB9S2LdzCgmojjJJ4Apl1M1S4qnbJgJ4cd6u3RqlcWnVdiGgT
h0Zl/tFEPAHsxHpWMDTHzuTZ0N1i7ME6PmFq+FLDHArBGib5ZiFyEd/ZQ6a8EOIB
dV+f/bGhKuscHgqclIiK3Sc4Edbwn1IENz8IXH4/Gu1s0rVZ2QdKACspP/RlTf1F
YQUG198xxT396oQXT7aEvp4wiM7MZt+d+8YU9GApjpJjUw3GnTwE2UU/hJQN3J4g
Heizx6zDFctoalTbe9jG/6htdKyvxs+jK0NTafM0uIZVV52/F2x6Ga0KUBQnYs4n
muBsl+9ct/F9HjGEb2US1WCjQnf+NLPfLoVv96kCEaUp9poV3ic3bG4+i2vvph1v
i3QGzBLq96QjueeAZc1pzYwbarJI1JcDhVDiN0TW5uSwo8qgsTnc+HKpfk+obErx
Q+1qWK0dqlcWlYX7OykdUmAc1SBNN0qB6yAATog1vr0m404i74H+jaABZ26OPiP5
MEezS9E4MZC/1qlK0hShxOciMyGU2u3io/kt2q+yS6UzeKRQcQ==
=D88R
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
