Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321AC3B8527
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 16:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235051AbhF3Ole (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 10:41:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:48470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234882AbhF3Old (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Jun 2021 10:41:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DCDD61476;
        Wed, 30 Jun 2021 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625063944;
        bh=L8V2JdvEBC3OUGI9cx9YLOGRxBzDEGMRE1EedaGTRrA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F8wudrmJ7+4o2TNN7S2nlbf/SewXYxiYxBUPEKuPxY0FycN7ZJLRb9ybxw/Y4L7nR
         pS+SiRbWJ0udH596uiN+HTl1KVB4K/uoVKABgifye1I8hGBESqr36w9kZGd55ft/T9
         CCqKi1mptAishN67SPLy4fB0ZPzlgQyDWOAeRBjv56DDifMpr5ObLZvROuTyA9SXMF
         2J1IzjXQ4T3CqP+ZV0xUbnM46Qrhvo+Q7wclOqQMflZNAjtHieQTLzqvg30ZvR5rPZ
         N5e7tzefgPIFVVEaH5XrafDNM3Zl3hQMjNgq5qqj1sxJCMEQTTtJz/tvrbJL1X2jzp
         /QwT45zg3G7gA==
Date:   Wed, 30 Jun 2021 16:38:55 +0200
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
Message-ID: <YNyB/+fNK0u2bI6j@kunai>
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
        protocol="application/pgp-signature"; boundary="cnJsFUAyBPHKEwpS"
Content-Disposition: inline
In-Reply-To: <20210629041017.dsvzldikvsaade37@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cnJsFUAyBPHKEwpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

> While we are at it, this has been replaced by a Rust counterpart [1]
> (as that makes it hypervisor agnostic, which is the goal of my work
> here) and I need someone with I2C knowledge to help review it. It
> should be okay even if you don't understand Rust a lot, just review
> this file[2] which is where most of i2c specific stuff lies.

=46rom the high level review I can provide, it looks good to me. Block
transfers are missing, but I think you said that already. Mising Rust
experience, I might miss details, of course. But the general approach
seems fine to me. smbus_prepare() will get a bit more messy when you add
block transfers, but it still looks bearable, I think.

Happy hacking!

   Wolfram


--cnJsFUAyBPHKEwpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDcgfoACgkQFA3kzBSg
KbYF7BAAq1r7cuYTp6YJrMb46z5zZ5GxUA2lqtoo6e5LbokrlsQc7NGhGmIkHOJc
bsoVy3HfJPTDqhVrQrOMuUSsvID8IRtV4jOlENBGjvC7OULYSSZEqIGJBiKv0TM3
jbQstaKjpumImL+1SzvGmfTX4KhN6WXnxkWo1SHeeNP7/ykIh1au0abmk+LcTcX6
+pQJ2SzM+P2MMQiAqPq8FOrndPK8VSMyV6Mg+ZJ72jqnIW9IJVsFQv8vwHG2iH/2
zFC/eLOAD0JoOuA48xM9a3TSPMYaL0FjBNNcTeLULCV3TVlv4C82cOVSCIfZ59fO
K/94pJ3gLGuDmeimN7IiD5U3JbTmzwLH06Oitl88noLW7OwxQX3F1fMzu9p5jFjg
wIDPPjSkAOvu6ExHo/TLc7IaaRkZjBNp+SGbVuzRksh7hMkZB5PB2wtVpbwXG7uW
Mi97r7sEQQ0lX6+wl9ohIOOaE8Na2CYV1oBifTYpAtUxCFkuGuTo2iXAjjs0N5Yv
Mf5xUZJv9HjJfTHMbHoogJmdatLCluWGW+q7XzVI+l7YfauG7j4WZZ7dCqz1bLhY
Uz+Zrr4eZ0AwWUmd8QFpjwCqC8awkMDbh8SUPKE7rvNe7RqFC2XiuoRM3Oc1O/hx
XWvqF/0Z+ChHTb1cEdDb3v25ausl11SsQJt/j9kAkxboV9XNwEE=
=7H7Z
-----END PGP SIGNATURE-----

--cnJsFUAyBPHKEwpS--
