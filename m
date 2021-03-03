Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1698732C877
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 02:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhCDAte (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Mar 2021 19:49:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37258 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234127AbhCCRu5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Mar 2021 12:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614793734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XgGS/s/8WlRgw3FyEQZnL/peYUyqO0Kr8QQUVUAZzb8=;
        b=ftFRIBwovZRHT7TuWcyJYVGeiLx/xpZyrcH3L3+mOwrIOMrHrMNq8IBo/9pY94xO8AMWH5
        H3PRZSksOhcVxgpjq0OVOav7GdMHO+JzukejuVpBZQ5u4hxYzlar+qge3ZfA7K7TsO/bbR
        z2AIUFYOiwcMr0twLXMOPqXEQf5Afo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-l-AnTYKWMH6hyIacArNycg-1; Wed, 03 Mar 2021 12:48:50 -0500
X-MC-Unique: l-AnTYKWMH6hyIacArNycg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D9101846097;
        Wed,  3 Mar 2021 17:48:47 +0000 (UTC)
Received: from localhost (ovpn-114-24.ams2.redhat.com [10.36.114.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 965E37094A;
        Wed,  3 Mar 2021 17:48:40 +0000 (UTC)
Date:   Wed, 3 Mar 2021 17:48:39 +0000
From:   Stefan Hajnoczi <stefanha@redhat.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YD/L9/Dj+3dSZJXa@stefanha-x1.localdomain>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <CAK8P3a1ZXbodV07TTErnQunCLWOBnzRiVdLCxBD743fn-6FbXg@mail.gmail.com>
 <56fdef9a-b373-32f2-6dac-e687caa813c8@intel.com>
 <YD4KovxeoNG/c8QC@stefanha-x1.localdomain>
 <CAK8P3a23L-Y0vzJTb5w1MkumaYAJQ6Owiq6RZ2XE=i8gBMTUZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0Z13hpXB9yg/SJqi"
Content-Disposition: inline
In-Reply-To: <CAK8P3a23L-Y0vzJTb5w1MkumaYAJQ6Owiq6RZ2XE=i8gBMTUZw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0Z13hpXB9yg/SJqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 11:54:02AM +0100, Arnd Bergmann wrote:
> On Tue, Mar 2, 2021 at 10:51 AM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > On Tue, Mar 02, 2021 at 10:42:06AM +0800, Jie Deng wrote:
> > > > > +/*
> > > > > + * Definitions for virtio I2C Adpter
> > > > > + *
> > > > > + * Copyright (c) 2021 Intel Corporation. All rights reserved.
> > > > > + */
> > > > > +
> > > > > +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
> > > > > +#define _UAPI_LINUX_VIRTIO_I2C_H
> > > > Why is this a uapi header? Can't this all be moved into the driver
> > > > itself?
> >
> > Linux VIRTIO drivers provide a uapi header with structs and constants
> > that describe the device interface. This allows other software like
> > QEMU, other operating systems, etc to reuse these headers instead of
> > redefining everything.
> >
> > These files should contain:
> > 1. Device-specific feature bits (VIRTIO_<device>_F_<feature>)
> > 2. VIRTIO Configuration Space layout (struct virtio_<device>_config)
> > 3. Virtqueue request layout (struct virtio_<device>_<req/resp>)
> >
> > For examples, see <linux/virtio_net.h> and <linux/virtio_blk.h>.
>=20
> Ok, makes sense. So it's not strictly uapi but just helpful for
> virtio applications to reference these. I suppose it is slightly harder
> when building qemu on other operating systems though, how does
> it get these headers on BSD or Windows?

qemu.git imports Linux headers from time to time and can use them
instead of system headers:

  https://gitlab.com/qemu-project/qemu/-/blob/master/scripts/update-linux-h=
eaders.sh

Stefan

--0Z13hpXB9yg/SJqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA/y/cACgkQnKSrs4Gr
c8gvvwgAl//yH6nIM39C8033YVTMLn56fBWlMw7olnJWN4P4JpytEX5MLIkIoRrw
vkM13V7TSV0lHJKKDc8erHKfahXFJFc7vJV5cn69icEpv+HCzB8Knfk+wePViUAF
/vpfFH3K4/nutqb3eWfJ3yUQqFRrqXa4l7O+20e5H5j8REBK/R7NnOs6i3jBJ5su
eW1XJKy//Jwnyih0Bxifxxf56JIOgNz/82Zg1sF0BY6TGF9uVwyYcSzTm3dny5tI
E163vh02TFoNtMODr1aEEuQrR1gay5Cd+dE+YC+ba/Q0EBNj116O9yLid2xbipyb
B5MY41s7CLQj5ESoEgyO2pKStZ0H/w==
=2uM5
-----END PGP SIGNATURE-----

--0Z13hpXB9yg/SJqi--

