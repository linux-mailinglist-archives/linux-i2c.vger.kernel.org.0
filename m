Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699731B8E16
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 10:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDZI5f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 04:57:35 -0400
Received: from sauhun.de ([88.99.104.3]:43910 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726108AbgDZI5e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 04:57:34 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id B40FB2C01E8;
        Sun, 26 Apr 2020 10:57:32 +0200 (CEST)
Date:   Sun, 26 Apr 2020 10:57:32 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/mellanox: mlxreg-hotplug: convert to use
 i2c_new_client_device()
Message-ID: <20200426085732.GM1262@kunai>
References: <20200326210952.12857-1-wsa+renesas@sang-engineering.com>
 <20200326210952.12857-3-wsa+renesas@sang-engineering.com>
 <CAHp75Vfw4_0ttE2F-WxdULf7hRGsQvqzCLdCNVy7RBaFdEsCGA@mail.gmail.com>
 <20200425205407.GA6774@kunai>
 <CAHp75VeRcT31WbVM6qXHFtT5aF+d6SbAVWVrH8g1_+ruNvv2sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bPrm2PuLP7ysUh6c"
Content-Disposition: inline
In-Reply-To: <CAHp75VeRcT31WbVM6qXHFtT5aF+d6SbAVWVrH8g1_+ruNvv2sQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bPrm2PuLP7ysUh6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Thanks, Andy! Is there a platform-x86-tree where this can go in? Or
> > shall I take it via the I2C tree?
>=20
> platform/mellanox usually goes via other trees, so, feel free to carry on.

Then, I will pick it.

> > Same question for the similar patch
> > for x86/platform/intel-mid?
>=20
> TIP maintainers usually take this. If I didn't tag it, feel free to add m=
y Rb.

You tagged it. Thanks for the heads up, I will wait some more here.


--bPrm2PuLP7ysUh6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lTPgACgkQFA3kzBSg
Kbb8Dg//RCWJJbV9Q6WfPGy9g9VmcsyK6+V5O/YA10m4mxzXVuPEZhB1sm2Lc40Y
TrTYA+BZEwCgzpkK0NKNnX0OrF5hvTl8vF9iIu4bhMrrw0aRNHKGC+cb3VjtE98k
zYOm9Q4hX+/F68101o44/A53+19nEG1Qs69VWWpsG5xHquJWTGFYQAEG3Z9Ht9sU
vOvMvGsNFRGKOItnGaRwse/Rqhhvsj5PLdn61OhGal786Jqk84KnEPyWjp7kFdFv
apKmaFgZ+hA32PY3RgqmvMduO4/VGz3VxgvIujbDnxm6UPNptgwBYJwaSozEAmU7
Up7/1iKM/g4lymnmrn8h4xSRYNW9BA6swLkQCNjimER+ulQ28tNdSo9dFmA2/Il0
/iGc8dm1lo8ufJ3hWsSZwAJzEqjnFs46jbZtS/XKF2dW81HGhro8u63eskRxCFhP
dO65rQLEV1iTCPJunz2h+TNWcmqnADqNJTWvF+CtaoAvEvhfnKJ0kkmyHOZWF7kZ
mc3P0RmaZlKVnltH2idjjipRdyZgxBGIn4xz4ashtbntgETtcp2iBulDWmqOpSws
Lo+2k/QWg+yWBnrfEKEXSpOU5q+5unhacdvJLFrmk4/N4VFDVIe0OCAjSgRAkgor
daPg8ZAWh5RES3mbACXsNaLWEh45tclp5qLQrvXNXGNohxARWFw=
=YQ04
-----END PGP SIGNATURE-----

--bPrm2PuLP7ysUh6c--
