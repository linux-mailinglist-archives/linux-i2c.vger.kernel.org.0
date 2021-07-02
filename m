Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134823B9C23
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 08:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhGBGYy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 02:24:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:39816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhGBGYy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Jul 2021 02:24:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CC21613FA;
        Fri,  2 Jul 2021 06:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625206942;
        bh=+9+44rB/9RcT9+DjjfGfMY5WQvks+ySXpU6PeYPkon8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M/LH+b3HktzFxuCnvsn3c2hWtGMNr9OFVVf/CE62QY3EBrcR30BOuPLaxvu3ikg/J
         CxWFeP//q3nmIoe+uXo2Q5ysxpOYzo55/Xj9kIbSDyS1DtaI3U9WObsZd9V098hjb8
         AlwEFtYDxR7/rvSzBJGOd5+z3CHz81LovwyuWyOZwqdut3F7t9jonhKyu8ROWkt6SP
         DrRjemMKFdJHoy+eqGbzU7Sc8PbYIwz24CS1DqoX9sRsx7vdOMDqsoayeesLyyFPT/
         4qTh7stU2NyGSBc4vhPmKUHmjVBuR7l1o+EzunE5HHd5xQudWbYlIZ3ai3OH3jm+Hm
         dGa3thQkyegCQ==
Date:   Fri, 2 Jul 2021 08:22:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YN6wlXw2KhALAyS3@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
 <YN4WeJCepCrpylOD@kunai>
 <20210702045512.u4dvbapoc5a2a4jb@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SotEO4qp2V5IcJ53"
Content-Disposition: inline
In-Reply-To: <20210702045512.u4dvbapoc5a2a4jb@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SotEO4qp2V5IcJ53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Wolfram, what's expected here ? Shouldn't all message transfer or
> > > none?
> >=20
> > Well, on a physical bus, it can simply happen that after message 3 of 5,
> > the bus is stalled, so we need to bail out.
>=20
> Right, and in that case the transfer will have any meaning left? I believ=
e it
> needs to be fully retried as the requests may have been dependent on each=
 other.

The client driver handles the case. I'd assume most will bail out of the
calling function and at some higher level it will be retried.

> > Of course, it can later happen on the physical bus of the host, though,
> > that the bus is stalled after message 3 of 5, and I2C_RDWR will bail
> > out.
>=20
> Basically we fail as soon as we know something is not right, correct?

Yes.


--SotEO4qp2V5IcJ53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDesJEACgkQFA3kzBSg
KbZOhQ/+NdCmNPinhpL6SdKc6r1zoX7a8w6FmzzQqKowP11lIlFQrnYz4gdlCWiQ
c7auvFAY3ExcnZsxclZIfjuW5GEBV1W2QVx6i3Uk7GUqAUPb34L6mcmBqDZY6PyL
Mw8TbpZBq5PegAW5c39YYCfeuLe3hotMYvxrTciwghhZb9ikqlGmKeP9hkx9EfRD
ZCGfaiMFUiwBYqHZtf36E5fuVipLuu8FNUVInqeCmpZYY1eCAeAeQXh+T7GDPVLe
N15pQjoFftokmAksoakfgSFr2B6QXrLkaIrxv2bi6FnhfFRp9Kei+2H7vV9q23hT
kH5YYhyCi5kN85TM9NOXd7JFgSDZBt0yEE+0uEmOa7oFDz8m8jGW8hB1rc0PiY2M
bY6XAwNaUsBwtNOZHTr/eSCQcwaU3disNJfft27QfaZrudsY2+6K5Igh5sOfGUiH
7rsomHl6sp4FL2oEzqYzsiPSurtgulbwpZEh53wKDpL75AxAR/+tfS+u410Wpoie
jQUHV5ndqrW9z2P0Y4Qvea0Fd/PvIepAqSUnXVRXMqxpDzY3zQwSN/NgJNARKDWo
FZnbWSjaO0gNIUjMLra3vOdbrkLxQ3Moayzol0/KgWdDyIuQQpKKnzfG0fq86fda
yZRPQCwNhdeKoXvwRA4wpZ2i3btTeovkMCWdTdwtBeO1R8L9vfg=
=vze1
-----END PGP SIGNATURE-----

--SotEO4qp2V5IcJ53--
