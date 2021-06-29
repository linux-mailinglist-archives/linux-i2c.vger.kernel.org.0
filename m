Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE603B6F6F
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 10:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbhF2Id1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 04:33:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232429AbhF2Id0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 04:33:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FA8461DD6;
        Tue, 29 Jun 2021 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624955460;
        bh=WMixuGumL3PT+re8X/mL9RDQXPtT05ExbGgrozjw9wY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r7fcTdnYceN/ZBPv3+32PEyaoXTPTJr7RnO9JIiwpoFB/vKznUgXf+8DO2gIpvLcY
         PZKKf2wc0fPQmrYgTdz+bosFzJwQsiGyF+yVA728aH50Y3sW7jTlUfvjJ9Jd22HxLd
         CL59E/cSuMWULhhP+3EyVRvJVCbFi2uOUxgWhae14xZZRrRWz/qfd/GTd0W3EXYDcl
         oanmxN27jx1RkyaaMIezpmb9+Cb3IhIVe7dhFw8AuN9MafmzOj62GPhUDxHrLs6ee8
         we1dSTC8e2krBYceXmIHT2Z0/vi+TVG1VDUfpXbY1S8vFQsmijegFVSYoz/Be8iT4F
         zl7HoXM6/abhw==
Date:   Tue, 29 Jun 2021 10:30:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
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
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNraQMl3yJyZ6d5+@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jie Deng <jie.deng@intel.com>, Arnd Bergmann <arnd@arndb.de>,
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
        shuo.a.liu@intel.com, Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato>
 <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
 <YNmVg3ZhshshlbSx@ninjato>
 <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
 <YNmg2IEpUlArZXPK@ninjato>
 <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
 <YNnjh3xxyaZZSo9N@ninjato>
 <4c7f0989-305b-fe4c-63d1-966043c5d2f2@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="himF4s7X5GcWXH2S"
Content-Disposition: inline
In-Reply-To: <4c7f0989-305b-fe4c-63d1-966043c5d2f2@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--himF4s7X5GcWXH2S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> =C2=A0=C2=A0=C2=A0 3. It seems the I2C core takes care of locking already=
, so is it safy to
> remove "struct mutex lock in struct virtio_i2c"?

Looks to me like the mutex is only to serialize calls to
virtio_i2c_xfer(). Then, it can go. The core does locking. See, we have
i2c_transfer and __i2c_transfer, the unlocked version.


--himF4s7X5GcWXH2S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDa2kAACgkQFA3kzBSg
KbaOyg/+MfSlmjCv9RssnwcRh4U1pYNvIRh6vfIabVWslAdylk7oCAUTsiVqi3cr
uxIcH21GIqENomvOJoBuIFJ7FdX8NDh+Q4hz487RYmBAYRgJB0fORmsVEHhPSmnp
rnlQiyKO9Aw/IdS621QickQbV0vT2qapsbnn6t1xbwI1i/48tDELoXYwvg5SDdfA
crKXvG22/HdxQ1H0L1S4Ej8wvEjGwwE5rMadDbKrdJaT9ohAPnvhTPyiSjjQyF5n
oFnVPSLudlm/U0yjnvgQnNjiblEbCDgm6iJYwwW9ynxOzAtvDoJvsGAkCfrA8FfG
s8Kb3bp7T2omm56+xI4lsxt8B1IuKjOV0r1IimCtkMfPNH/Ehxw2+zICTNpcdusn
zgLm1nR0F4hj3hM1rZeyMRY/yVPpsdAzN6rmszF4LCHBZ24yv1e18iJx9iZ20vpO
WjhuADfRUZQXwSz/cjMtiaZY/fqeZEKxNpBnKWumEYONZVFf4lNz/j1MehSrhtSV
xFlfm0X1zLslLrU0+c5H3YEoqKsg1uLBEu/5aF5thPym5iXZg7i95XY+v87VqDfJ
OUIEwBKtxYDFTt6q0Tu7eYcA+ytV8vEaKTD34V1ELSE494GCJqpsTyFnxUHOMq9m
iOniNaDlyy/cyG7hdVzDhqwH1rz+vvvVrRWlsFZk9j9MSmAHRqs=
=/s2v
-----END PGP SIGNATURE-----

--himF4s7X5GcWXH2S--
