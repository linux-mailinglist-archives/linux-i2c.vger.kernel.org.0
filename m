Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C04F3B6FE6
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 11:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbhF2JJt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 05:09:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:36182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232671AbhF2JJs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 05:09:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D49C761DD6;
        Tue, 29 Jun 2021 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624957641;
        bh=v+XYSmN0yCDjibhehaFRbA46fo8oLE3YUszwBIdDUbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MBfu8+ezTNoltkY+dhiqlUYf/3U9VlbCciSKbIVSchMh567SdiNqT9USI/0AFPsOf
         nin6zAb5qFbwJr9yFTlpeLKs0bghu4LAIbKBpuEfXJuTMmhlA6O3nEZWLEGmPeIwX0
         JjKO4Jx1qXkGewzmE+ZCZFUb0wFTQ/dwGRCB6tw3fcNlrfxnthR3XITpeYQishkE65
         lv+z3aPR9aSVorviAGyWLYEwxzGQjhvn8t5mMhV7hHIaeGcEdkzwTSXgP9Nnqy/qQb
         dV5qgksTlorqBawJDI1vWbaW7dZXWf7ec3fjdxOd3C9oGceNw44A4NMXql/H23KQiu
         1QJntUy7k/+aw==
Date:   Tue, 29 Jun 2021 11:07:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNriw0teFmOVnU8T@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, yu1.wang@intel.com,
        shuo.a.liu@intel.com, Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <YNmK0MP5ffQpiipt@ninjato>
 <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
 <YNmVg3ZhshshlbSx@ninjato>
 <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
 <YNmg2IEpUlArZXPK@ninjato>
 <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
 <YNnjh3xxyaZZSo9N@ninjato>
 <20210629041017.dsvzldikvsaade37@vireshk-i7>
 <YNrZVho/98qgJS9N@kunai>
 <20210629085213.7a7eqcgkmtk5y7nh@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Xlew4Opvjp4WjDav"
Content-Disposition: inline
In-Reply-To: <20210629085213.7a7eqcgkmtk5y7nh@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Xlew4Opvjp4WjDav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>     struct i2c_rdwr_ioctl_data data;
>     data.nmsgs =3D count;
>     data.msgs =3D msgs;
>=20
>     return ioctl(adapter->fd, I2C_RDWR, &data);
>=20
> So we will end up recreating the exact situation as when
> virtio_i2c_xfer() is called.

Perfect! I was hoping exactly for this. But with my limited experience
of all the blocks involved, I decided to ask for this instead of digging
into various sources. Looks good.


--Xlew4Opvjp4WjDav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDa4r8ACgkQFA3kzBSg
KbZc2g/9EicqwrDKiZCv3MQ/VV7liEhzflZ8+f8S9rVtA/qxqLHRA4pRxqC6AyQn
tlj/8jomNuGdFYrqJ9sW/Wbt/5YAj1FrX5xCK5umNPfRvNvDsLz4lwSSKur/KCm7
Fp0S+aebL877JsQZ+5W/6hOm3Jk/+gksSCY1PPPrH9eKHsyPws9BVTfyPVogzhLY
PsjENDnXCftjGLTKptAkegD07L/1b5Ep4PYjJ4ms1ISgXyH8RWrwzP+4t1gQ6i9S
PONYs0XE/i/kJK811PM90WAlG0Jj1YeTMxMcTTBy1TWAr6t3dUGKEvNOu+/VlTZs
f8uqa8VuQ8U4tm7AGLxk2OOuNBk+DeMggBobw0ZBp16VyGf4qqM5pOQO+XFOGjeG
dboqhBGcxGaatkxMtqYBfwt9bH6SP4jqE/tFW2x2fLjFWE5SyAZj1iawRchSDPXi
2NMJaMgtzWS9u5iQYd1iVTtQ165M7lEKTD5iT/Z3ubXh2Rk3kCJl4ByynZnlOZrA
NSLHz4Eqqbi9cWzDh34t/3dwjHbKVHmTqizgY2BGtaPoIlJsLY+qmZnLaFA97xDx
t/KILTSFILbsKICINw2Yq9xhZd1Pm5ZTOiPQU/zkbWF6VO5wKKaF3jgCm1pO9Q5U
l1XnENZg1CWslfJIHJySMS6u+C5xSL9QbsQJ+O7JsFXI1v6/q8Q=
=Pe63
-----END PGP SIGNATURE-----

--Xlew4Opvjp4WjDav--
