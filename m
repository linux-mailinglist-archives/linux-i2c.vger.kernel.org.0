Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326133B6F61
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 10:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhF2I3h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 04:29:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:51394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232405AbhF2I3g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 04:29:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CACF61DC2;
        Tue, 29 Jun 2021 08:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624955229;
        bh=BJv47wZhD7c7K7mQ2u3aJTFjR3tz/PO02Qt8OFbfPHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TpvJbBKgY+eGmfC1VpKqGl7Cz5c2+3WBM8W0EOOqZColZn0ZrRDqzO9VfBLc/r6Xi
         nD3fj483PeJe+RkPi5M0/vR87RwU2qZ+dFsdoCeJdv2CVmtY3I5l5G5W2F5razs9j6
         eKoTe+HCh/AyEN5oOn7b2hb9tMntDLy9RcGPOg2+mGDKsSk+Y4n/Tj3Iw6fmO5/oq+
         L8AQyaqUVo0t54tvkU/42iGje/zHUYtmj3M4I1f5mtxYJTuHNJkQ2tV6L3+l5g3RYc
         jJLENCrn7G6SZza/+2pSGG1E9btMGQ0Zh8DvY4q9XRolSjXaCQTzNaoI8evFYSqc+E
         RE7Qk1/7XO8Eg==
Date:   Tue, 29 Jun 2021 10:27:02 +0200
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
Message-ID: <YNrZVho/98qgJS9N@kunai>
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
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato>
 <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
 <YNmVg3ZhshshlbSx@ninjato>
 <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
 <YNmg2IEpUlArZXPK@ninjato>
 <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
 <YNnjh3xxyaZZSo9N@ninjato>
 <20210629041017.dsvzldikvsaade37@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1vTBJw8EkETbuhBQ"
Content-Disposition: inline
In-Reply-To: <20210629041017.dsvzldikvsaade37@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1vTBJw8EkETbuhBQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viresh,

> While we are at it, this has been replaced by a Rust counterpart [1]
> (as that makes it hypervisor agnostic, which is the goal of my work
> here) and I need someone with I2C knowledge to help review it. It
> should be okay even if you don't understand Rust a lot, just review
> this file[2] which is where most of i2c specific stuff lies.

Can't promise I can do this before my holidays, but I will try.

> I am not sure why you say I2C_RDWR isn't supported. The spec and Linux

This is how I interpreted Arnd's response. I said mulitple times that I
might be missing something so I double check.

> SMBUS. To clarify on an earlier point, every virtio transfer may
> contain one or more struct i2c_msg instances, all processed together
> (as expected).

That was the information missing for me so far becasue...

> If you see virtio_i2c_send_reqs() in this patch, you will see that it
> converts a stream of i2c_req messages to their virtio counterparts and
> send them together, consider it a single transaction.

... when I checked virtio_i2c_send_reqs(), I also saw
virtqueue_add_sgs() but I had no idea if this will end up as REP_START
on the physical bus or not. But it definately should.

Thanks for the pointers!

   Wolfram


--1vTBJw8EkETbuhBQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDa2VEACgkQFA3kzBSg
KbaOYhAAsrQpZyup3q2dEoiRgApCV0qzRs+qeaZ0XcI4j6okAX6eh1zRUPH5Uuf4
6w4O6PEm+mZ7PLBAX4Z4NxD7WX5LFygSKrKXKexSw5oNs4x1+TlNgvvzEC1jcfbP
lxqDBCz65TZGGuccykL4w5lwmdL6noEg4vK3Mvf41ZZNjPuULDcF4okW4TapMZma
HjVpyOjufkg3zNzY7xNOIqRhUMx+SjinCy3kcrQoFpfqZg/YHFReYQSDS6XOnhhD
2HWX7MYAHDOCiXnE7PgubXy7Cs6dDIlD67TMMV5ZinaNyZolyrcWbHuYwmh3t0ro
xsxA3S0HmxuK48pzlkjS77zw6LYgAsWcZgVwRi3zXQ9j2+ytedkKh9PKSWXiCuFp
qDtjpJo3tk3pJxeg19yAQJ7HAzkpWQR9qZUh5R3BkI/2Qgt6QgMRXPZxCDd3UP7B
WIvxgetPGQCk70CJngEkXXKUYiriqYID5+G7v4y9CK0iWnH+cE7V0CywZJc6idE0
1clLogeYhhOEzvo60Md0q4s0rhf6PDTf09PHhGnQnZ0URrEJjbYoci4lzT8pu9Cq
1GGI07ovJYX8srb1wPHiEop+7ARA/tad8vEmoCrjq2fo/B3NzmghIY+CKi+FgauM
+E7G2/ayupMrJZxIVQV1me9Y3w0iijdS92drtqKcNXQxJKFPnK0=
=L8hs
-----END PGP SIGNATURE-----

--1vTBJw8EkETbuhBQ--
