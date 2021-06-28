Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFC03B6491
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 17:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235665AbhF1PKh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 11:10:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:39702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236104AbhF1PHk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Jun 2021 11:07:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F3ED613FD;
        Mon, 28 Jun 2021 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624892301;
        bh=HsQz+eG06TzAb3HbY3JdUc6LQkxeCoRIcHF3y10TQ+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZVOvoruMYHVhjj1s9pjQE/Aw1s+xTb2/9/1JCF6tZd4BsiX9Bs6Mp9zskJOHy7VF6
         0mLmmtpq7YBd/uzGdrLBiHS0f6dWAhtedwzFyed+Zzcw/+t7lmYxPUbsArRJFoz64D
         G77Oxmqf0KbyrItRSd9lKiAwxLg+RSZRSZsRJW13BpwMOPMsdekuet042fL5vYi1rM
         fKgiWJSku7nULuw544GP81w+ZRqhlKfUqoFbAi1ujEDDkog/GgWbanclu+JPLy/mm3
         K34g7zrN5YdeJYYjf3PTy/vWpNAfuSBjm9H3Yb/BeFGOnYDsw7lZYCy4lW3wWv4rtQ
         2UFPIbWnIlwFw==
Date:   Mon, 28 Jun 2021 16:58:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jie Deng <jie.deng@intel.com>,
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
Message-ID: <YNnjh3xxyaZZSo9N@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x7HUe2JbQ8ROazkf"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x7HUe2JbQ8ROazkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You can fine Viresh's vhost-user implementation at
> https://lore.kernel.org/qemu-devel/cover.1617278395.git.viresh.kumar@linaro.org/t/#m3b5044bad9769b170f505e63bd081eb27cef8db2

It looks OK so far; yet, it is not complete. But it might be bearable
in the end.

> As you say, it does get a bit clumsy, but I think there is also a good argument
> to be made that the clumsiness is based on the host Linux user interface
> more than the on the requirements of the physical interface,
> and that should not have to be reflected in the virtio specification.

Makes sense to me.

> Right, this one has come up before as well: the preliminary result
> was to assume that this probably won't be needed, but would be easy
> enough to add later if necessary.

If adding support incrementally works for such an interface, this makes
sense as well.

So, where are we? As I understand, this v10 does not support I2C
transactions (or I2C_RDWR as you said). But you want to support all
clients. So, this doesn't match, or?


--x7HUe2JbQ8ROazkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDZ44MACgkQFA3kzBSg
KbZiNRAAg3+smsUmLAlo8w15thKTdKhG6yNDBD+TxkLusukTvHLa5j7KBjzDW+8L
TgeVVbK6h4x9T21E0ofnkT8wUFquxCDC+h80FYIS/wMcISrLFDZAjW6M9Gjftzho
pMW6jKibH9oKHZdvfnE3S5wCHGveCcBtztoTxUVELJop2HXj3OXhyCgtlo52PR2u
rNIEjRsp+gSunOpu3c6U+70Hh+gmvTuFBWinAuelHCVqjoC9WbHbP3l0khP72y6A
bDWWZk5e0Z3AHEoPlOXEWScNB0b/ScL6ZAkj19Q/JOrYFeDAAc4FdkE33HfX4J8h
TbbwDRLxejCFyIfKfoIXGYxjihWwjdfZDkRspPy9i5gLCK6tfEcFCw/g+vSmisBh
Xp6eQMqgFKiiFsBljSGRN8rEHrJKcysQXrL34QAPb5/ZK7PlRNtdBJBG6kWNkKLJ
YjuLf2zkB0dD4fOwhHEYs7jbA2WDSNy3vJHVkqxyVOLClX67KTZMO8ShhHSFnSsA
YZRJhbWAYvpZTrVRr54uvaWkv8VYL/BSx4N9DJE6ZbtHcVH2ixNBduqgY5SudnOt
nQGq9SZHYY3VCZyO4d1U3rhPP1LFyHTkDA06AwDMV9I2jImA/I2Vofqy3ORWjBUZ
ZF7xGiZ3jWuEOGhtyESTDYkfRIxir1zQKywb/1p+21f2lVFx+wc=
=QsUe
-----END PGP SIGNATURE-----

--x7HUe2JbQ8ROazkf--
