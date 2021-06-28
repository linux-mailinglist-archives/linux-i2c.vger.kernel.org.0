Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB6A3B5C4C
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 12:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhF1KQN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 06:16:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231935AbhF1KQM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Jun 2021 06:16:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7840F61C67;
        Mon, 28 Jun 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624875227;
        bh=xc6ZMpYRxnrW9nQ1Zq5NnDEAQ868wsvNoh+qThZ0uWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mdAgPtX4+glgCpYKxdpoROB+RfkksJw93REfnY8VMxUSs7+qtxPqWF+IM2oR+uw4r
         sjFAYF9jpJKqVfiocmSPv28e5mULJkecwoXma7t1FGleVh6CXtaWAs/sDvEGqhQhsi
         tXWEosT1c+QpWggw9WukELj0wwRmpEk8y9j9OWYaiCXSKo2qfJqX5lPveUkg5OeKsM
         dgrB1siNlXOxcckHphrRnQnSu2MdZkjmzYQPYEHsMPP6h85dOsgGYv3qZ8KU4L1SWn
         1UbrUFYiyJh4NKxpiFNVUhe2hSK8SdzXuoyUDvK0hnwi3grZ2xvDwpF/EDB632i+ff
         +qZ9HVsp3vccQ==
Date:   Mon, 28 Jun 2021 12:13:44 +0200
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
Message-ID: <YNmg2IEpUlArZXPK@ninjato>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3gmtKsZb/eceSmxh"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3gmtKsZb/eceSmxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ok, that's what I thought. There is one corner case that I've struggled
> with though: Suppose the host has an SMBus-only driver, and the
> proposed driver exposes this as an I2C device to the guest, which
> makes it available to guest user space (or a guest kernel driver)
> using the emulated smbus command set. Is it always possible for
> the host user space to turn the I2C transaction back into the
> expected SMBus transaction on the host?

If an SMBus commands gets converted to I2C messages, it can be converted
back to an SMBus command. I don't see anything preventing that right
now. However, the mapping-back code does look a bit clumsy, now that I
envision it. Maybe it is better, after all, to support I2C_SMBUS
directly and pass SMBus transactions as is. It should be a tad more
effiecient, too.

Speaking of it, I recall another gory detail: SMBus has transfers named
"read block data" and "block process call". These also need special
support from I2C host controllers before they can be emulated because
the length of the read needs to be adjusted in flight. These commands
are rare and not hard to implement. However, it makes exposing what is
supported a little more difficult.

> This is certainly possible, but is independent of the implementation of
> the guest driver. It's up to the host to provision the devices that
> are actually passed down to the guest, and this could in theory
> be any combination of emulated devices with devices connected to
> any of the host's physical buses. The host may also decide to remap
> the addresses of the devices during passthrough.

That sounds good.


--3gmtKsZb/eceSmxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDZoNMACgkQFA3kzBSg
KbZeERAAlxLVin/Zmc6B+XbRcyhltAFcvOYutvLVeWSbLZ1iJ6ynsZlMmsxsgoHx
7eeljnSLAYGXS0Nqv3YEVSC6gx07139YQHyLhitc3sxo15PES8TAdr0caAHnJPN/
QLsYZhl/NDELoHtR+ULqfaFRu84XhFxmGp0Yb+7Q/p8F+JUalLSsFB3uAE2Blo/K
YElcUrp+v6JdLV22J1dahQ1SvvQV/w922vJ9HeOlvbaVqxRSA8DvYyh48gDD8qXG
SGRaFIHOiif7HtyiVFy7FVEDYoZyFRoOz/QpG6VxNfrqlbaSTkjk/kUhy01rp5hX
yTQ5jm1bkE+2u2zc7XHHwqdzDb8WaT7r6C8dtA4LvDA44XDQ99vyUE//x23SnI73
PsY9Wyf4hbMwrZ9NC/CN9pZtLmRhSbSRKkoUSRdUj110Hk+iJZqHy9KuQfBgJey2
tpGYG5FC8kbMYKB0WrNpWQTTlHrCWRP8ULnhky1l7pqjsCLwIobMjC2mBk1uuqyZ
Vhk8YM0yUTsq8VA5cNJXnMpHtvIYnGnQj9lH1V1cnJjPaUpg3ZzrGW9tmibaMLdp
PnswWUWtSBv/kZZQQdqSY9zsTdpgQ6s6Dh0Lxyc7eAyL8UokFbRmlMkJx427jYWv
9Jzjro0d6MeoHZ116XtJ1zEZ3fLX4XPtZMr5LPvH2dNjbnTkqGY=
=vBE7
-----END PGP SIGNATURE-----

--3gmtKsZb/eceSmxh--
