Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A5C3B7EA6
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 10:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbhF3IHC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 04:07:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233035AbhF3IHC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Jun 2021 04:07:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1042F61A2B;
        Wed, 30 Jun 2021 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625040273;
        bh=7tnwHLbYqbXhx2qSLXJfed/m+hgZ3KoXLS9UtXG+kys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FGrO7tGW9nBPQrO+mjGUXH6tT7IuaO9G8j/D88IjDx4ETayniDQ5UQeg7AnQSn4jz
         dNNFsMkbXjFDU5/7sQASRfXVhyMccUQnrUc28sBtS1Z/PZS/aSQJuQrTo/DszMzxBC
         x+pxRaWWh5DmB8x1YkiXF43ANSdteJPtKiaxbpH7j43St8wQbVepKiBmDjdoQHdD1u
         ObSB/CFJ0xbMBjvp0X+0LA58PiNiy5qpPrifzTcj480fT8iNIR2n/UQZwVA2ts9EXp
         vX6qvMQRK3UIjcVXDzIpWjNGUQfy8/j5fuwcOOorjQhR/TrIBniv6bb5DvLxcUhHpL
         /rdvPJXfFrIoA==
Date:   Wed, 30 Jun 2021 10:04:30 +0200
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
Message-ID: <YNwljrHzOmD1V5be@ninjato>
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
 <YNrw4rxihFLuqLtY@ninjato>
 <05cc9484-f97b-0533-64fe-ff917c6b87ee@intel.com>
 <YNwd/t3DMKSOrTAT@ninjato>
 <3016ab8b-cbff-1309-6a1f-080703a4130f@intel.com>
 <CAK8P3a0Ew+RS_1buR+1OneH8XEqVjPOr0FGCF5d6CvFQuJqg6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kdQpy3ObinWCWOTi"
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Ew+RS_1buR+1OneH8XEqVjPOr0FGCF5d6CvFQuJqg6g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kdQpy3ObinWCWOTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Is that position stable across kernel versions? We do have stable naming
> for PCI devices and for platform devices that are the parent of a virtio
> device, but I would expect the virtio device to be numbered in probe
> order instead.

For me, it would be good enough to know who (= which device) created
this adapter when I look at the name at runtime. I wouldn't require this
to be stable across kernel versions. In general, this is just an info
string with no guarantees. But maybe you have reasons to insist on it
being stable nonetheless.


--kdQpy3ObinWCWOTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDcJYoACgkQFA3kzBSg
KbYsbxAAmlealqAbiVXEdd9mmVIZA//KjCbOIxz9zGg6QyZhThboDHDVm6Kaf3D9
wMAZR/u8sWqAJXUAN2jfAndOwggGD+JWJNRfl6eggWz8kV1LztEzJuvEiftRPkUh
XHXCGIoZAGjeooDE3QMsvejrerWlNqjAB8u+Grf1mfEC4u5cU+5AFX51xGvpdWh/
MMhyNw65LOK1mQdbh7Zc16bzxPpQAOP4k6YNGGlt+IYto9gpIonqADoX7aILjZL+
+j+L4UWfvTCEY/+5TzhVKtJ/lVPMdmVgAgDWMOflQO8cpGyMzlrLUemmin7fYaeG
2V/FZp0GKMhxCMA7g8ySG7SljbHUj+jBH7X+5Kh4ngJRdLpLpY66+6v8Jg9rIleM
GRbA8Qi4SYyFRQ1Z+lME65rt+7WnBv/uWr+zbhisDT04GBWFeofIfFHFvWH5DKaf
l+8iXOOrstJ7RIHK9d446jqV7lsO1u0P1YSxFgZJQPpYDbfXNFD3QOwvcb/9JK3l
2d6x7LrvjZrupQQUCjb7P/MAo7kZ5cxRbe1D9kjyicEAMgr9xiHek0BJIqd+js1Z
IrASEC82er/YLwBdAg1gudSBoUl3MZTIiMH22XLiglixKfatZPMEZSVA1i+f5sff
qJE1EpqDY4LOr5teWHiyJwpahcIKJkf3uMS4OZEkXAPV5Vhftao=
=DQ2b
-----END PGP SIGNATURE-----

--kdQpy3ObinWCWOTi--
