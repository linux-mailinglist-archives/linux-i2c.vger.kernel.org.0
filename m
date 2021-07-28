Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C393D8AAC
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Jul 2021 11:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhG1JdW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Jul 2021 05:33:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:50334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231256AbhG1JdV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Jul 2021 05:33:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBC4660F01;
        Wed, 28 Jul 2021 09:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627464800;
        bh=ZJd3VOfrFDxymz7qfLfVUU3s6vC1xf+U+JBJO3Wror4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d3H2SssGyVuAwBB4Fqtyw5jcEKM6ZE+rOf7vzOw7M7Tsp2PsOwLtMAx49Fz6RwvdK
         4MNg5VPUQb8u/wyRnCK9cpyje9iOGTgPUljsmPWdcUa+6bZQMYxPZjsqFqNZap2gxE
         jX6Yr+rcb8ZmDlkBxv/iecX6RlakJX6FJlRO1ecUAygsuoVWxuZyB5v3G6bj9zyOOY
         RhnYQKcXDe+5EjpYiz2Y7/ghZk/+6uJAnkrtQI3sRQZlyKuJLMklg3FnawpgIaFXAu
         q09Fl6lcseuX/itZcZKKPAG3Hx5gYq0A/TsRTrNWApWkQsrwBDjV6/HGUJajA5T3vV
         F8+MrBdgE/LUA==
Date:   Wed, 28 Jul 2021 11:33:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, conghui.chen@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        gregkh <gregkh@linuxfoundation.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        jiedeng@alumni.sjtu.edu.cn
Subject: Re: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YQEkWL3ZQzbiMVl6@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, conghui.chen@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        gregkh <gregkh@linuxfoundation.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        jiedeng@alumni.sjtu.edu.cn
References: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
 <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
 <20210726035902.b6zo72r6mdlxyf7w@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7EUEhvqAaCG1TyDY"
Content-Disposition: inline
In-Reply-To: <20210726035902.b6zo72r6mdlxyf7w@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7EUEhvqAaCG1TyDY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > This will now conflict with Viresh's patch that adds all the other IDs.
> > Not sure if there is anything to be done about that.
>=20
> An easier way of avoiding all such conflicts can be:
>=20
> - Michael applies my first patch (which sync's the device id's from specs=
) for
>   5.14-rc4. Rest of the patches can go for 5.15.
>=20
> - And then Wolfram applies this series over rc4 instead of rc1.
>=20
> Or we can leave the conflict there for Linus to handle.

Or Michael creates an immutable branch for me to pull in. I am fine with
either approach. A bit in favor of the immutable branch.

Other than that, I am happy with the virtio driver itself and ready to
apply it once we decide how to handle the dependency.

Thank you everyone for the hard work and the patience!


--7EUEhvqAaCG1TyDY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEBJFQACgkQFA3kzBSg
KbY+iw//a396NJ/rn3iEDduh4RUnxyS9zl3xSFvuddwTXyV7iy/guirhbeN1tKYR
At7NV63JgYPo5P2DZqEW62pUfOkMjtLao6fQZFNa9tDPcrCjK4Jrh0sA74/cR2vM
i6j5kKTU7I9Y23rGBVTBBf4TP4WN/pkDGTgSHZ2VNWTTC2vo0ODfoQ6qfP5u9KLI
6ljhUYyfung0rdapjfWg0w2xJ6wFXVG/vA3Qg2KqLVzQ7w4nIm/j+5KscFC3Fv8J
siVUQuQ+k64RfSuOCx/tshMQATJB1pNK7QTYI9mRM5Ie+efo7unsX0xVjfqK2geY
s91d3JdUrZZDJcKfllcjA/6tOKYLI/XFScCeuuY4vLjK0b1OjHYUglpxbf1TrDLK
mRBbavYjbqcRm30k8JToiAf03fNgw8DPm7/kxTbDwbzrn63f04iG9eSljFKuYbOk
bdPdk9Sbc0WMph4QTOq1WylzgrsIc3x/HsTEeaN4GWunRmeRg/1f9kATdYkGcibm
VIaV81azSroTWnEpV6sDR0jWnPhny+p9m/5C9jXerb7eI6Kjt8jxVr52K15wQUNz
YCDvMfN08nW4HgfJF4HODs0+Tbv3EpXTQEYiVX8m6hLxa6jn3nLg8XxbiIT1sukY
ZSJrs4jt46Tfcy9LgV0SxKESkW2zhRNoiXpyMQwwXWjB2EnrW/Y=
=BidO
-----END PGP SIGNATURE-----

--7EUEhvqAaCG1TyDY--
