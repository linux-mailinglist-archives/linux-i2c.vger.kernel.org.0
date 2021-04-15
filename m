Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B9836032E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 09:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhDOHWE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 03:22:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231143AbhDOHWD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 03:22:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6390D61019;
        Thu, 15 Apr 2021 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618471300;
        bh=ANtW8C28zwPXlFacT3Q0OH6yx8N/U+gwGOFCD2dpbr0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QrSQHw+BcOboi9t/w2ErSS30JNb3MvbU37R2RDje/Lx3g1OjiBn7A5vbZU0FopZ7j
         7cgeOJ+cG94crFLBI+6e+X2YuI4PzXmujbwmJlXexHFnHPMLGcXVm1/LWEuOtBnrKW
         MBh9Nw3yP94EpkrkByyuxfsIrvJ55SV4FZ1ayIhSL5zlEhEI2f0cJqJUJwFNg6guiK
         yEj15uilUmD+/QI3Nx1jQNCe2lstK0/y3zvBRyI9sITRErVTgmCfh1tPatpPYGXEsR
         7g2DFUTxemi2XBTgaW6V+Na0f+4E/Sf5BVnHsauk5srsX6N/GiFV4pue7boCHMvsue
         P/hoX6IRn5ZQA==
Date:   Thu, 15 Apr 2021 09:21:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20210415072131.GA1006@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jie Deng <jie.deng@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I didn't forget this. It is a very small change. I'm not sure if the
> maintainer Wolfram
>=20
> has any comments so that I can address them together in one version.

Noted. I'll have a look in the next days.


--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB36XcACgkQFA3kzBSg
KbYAgw//ZALqEFi+U4OWNgzN5og6uPiiwzFwCwT8WEpZ0galxg7zj5WeHBMyROAr
0bGRhtCUrm6be+aF2sE5VaEp0+ehVO7vkLGizTydR4M73yJUwFxY5IPGoOlfYttQ
TNU7ExAccGkk9oCfRaYcofAHh+U1ulgP7nC/PjMcCocHGXRV2ST/CEIhVoMuCI9X
KGt2J2PDDh6KGqPCQsQgDznSMK6cGoE9l/T6KU9nuea0Qlb0/GuJL+rPtidIguci
Ng9EzRPhDscnMK526yIClxbxTdM+13Lxp498tgptwVjqQ5EdaRakYo7A0IgSPI11
Ttt7zIlumHhdIFsYzz9eQt0e7WNzxlH9ZpGf3tRJoxAxkfi4bXPLtNrguwzBQt5p
Lf6JItqGV+4biiPOLvho/MCA5LlY5qOgNE7ewOlIiqv348G+ZbgmGfKoZ5pHxuDK
q76sQCadM/vLtSjBUaMxrY7EK+DOsBVisR0oXPhEYFRI8q/yHQ6X3dk1/ttUw1RT
d9SmWK51FmYAE6AzhrLam9BK6E4NS6FCTMWBYGBsCAGX1tsE2tjBOxEQG7feNabP
w3l3+rtqQxHHtXB9G6EMWYAnpRrNb1PrLsokXRWPYZbpN4k+CjqndQ5ab3pDYEMR
SICXl09SSuJ1U2yIj9rFDCvVYbz4793XTsM0i8DNaaQsKCCDiDk=
=+EoA
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
