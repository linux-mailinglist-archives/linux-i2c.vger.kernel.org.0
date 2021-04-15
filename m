Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B4436034B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 09:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhDOH2y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 03:28:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:46300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231266AbhDOH2t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 03:28:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5E15611F1;
        Thu, 15 Apr 2021 07:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618471706;
        bh=mjvUD6vfhbnXK06z/gt3jw0yoihCODbKDJx4nVkwwSE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dLuZVg6p4c30qnSxZnKJwQfnlSeLdvOaNiH4rScE9owp3gnGoc3b8MNmYp5abo8NW
         vma88d5K2yc1J2yUY/K4BLiZAvpDWMMiuoSvSHzXObZ0+4qjVSAu5Wgw1KXpylwfWx
         CZtqXfY05uSYHHKkqVnRDdjDx3vF/QOtgX7Xor8KDhOqnSfhuinupCWdK05aEFbFs2
         bPveDmFyZRXG0sNrZV3KN2/Q6GcrD5+HkFRvHkGy97ZsG2aNTi+l1I4Z6zrHPiPUoJ
         i+nWUcVD/0rlwcgQxCSywDdWDseSgQD5mCSZrIbrYjnUHRn9Kz2R9egGA1T+RWNmSS
         6SVeuib4kMFGg==
Date:   Thu, 15 Apr 2021 09:28:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20210415072823.GB1006@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
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
        shuo.a.liu@intel.com, Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
 <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
 <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
 <20210415064538.a4vf7egk6l3u6zfz@vireshk-i7>
 <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
 <20210415072131.GA1006@kunai>
 <20210415072431.apntpcwrk5hp6zg4@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline
In-Reply-To: <20210415072431.apntpcwrk5hp6zg4@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Now that we were able to catch you, I will use the opportunity to
> clarify the doubts I had.
>=20
> - struct mutex lock in struct virtio_i2c, I don't think this is
>   required since the core takes care of locking in absence of this.

This is likely correct.

> - Use of I2C_CLASS_DEPRECATED flag, I don't think it is required for
>   new drivers.

This is definately correct :)

Let's see if I will have more questions...


--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB36xcACgkQFA3kzBSg
Kbbtjw//d1Avl/BDCBE3F7BzM6lbrUQAKm9E5iF6KUd2zheL1crAlnIWbZSmfCEl
Y83i6FNw5VEK30Zaz83awOwMM0yAnH6tDyA7fX/ndM/qY8YVI5iRUpFfEbBO/zB/
LYGdpM792GA20Zw/uYquvuZDjS6Tly4EKOvy3M9NvgOWFlVIJS8Yr39O/NHW0L0c
I+dg6szBN17DltELcePzY50kjNsRI746n55PK9z2al1yEmKIHj6Pt39uSxadyGfm
+GUR0RQLjEgXd7GZbpb4r+AcPaHlUa0/Q3siZc1z9NtJZ3gWmWiS6WZCOeUegnJn
x7J00eQmYz27t6b5G38apy3GQsMDeyXIMlpVNZd4dG/opnO3TjAHl7gHgbjIwibv
mkPTfNBjrdbWXqnSDSNiWVb35M5QlgbPsc+p0v6sLnBb3vhBXztTs+OqPdxAYOum
6JYbUij3kGvcBhzbBe+fDXQGrYkHQ4YQA7PCcyRUv0m89rvB84/iqbSxVzDzUWrp
B9Pv2fFDvFDPJpd3szKim046pUbej9Cw/atdw+cJq6Ei+RaVLmD4pZ/k/+nDkBH2
OxJBrJQAaBf5vyBdJ/qv3Er/FUmXLzd/9bl2Cv4FrpEfAJ6X+yjAYnfhAp+6T7lu
fn0743SGyoJhSHf3boiS8im0w0LmJ9a/g4lg0EkiXS2qoIZPMXU=
=qlJK
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
