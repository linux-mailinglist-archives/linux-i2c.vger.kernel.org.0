Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC65360417
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 10:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhDOISy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 04:18:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:58060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231487AbhDOISx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 04:18:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57F7061166;
        Thu, 15 Apr 2021 08:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618474711;
        bh=04tCYplq8b33RaCbWK7SxxaEvXNco0UanmD8GY9YAzQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aM4dAQzuCtw8Yu3wMD4DFcQQXBigLmdj6pjclWlnPFu1iqvkh6MnrrJxX0n69bRgu
         Y1G/aADxsBwjl+s9+CnAhstJ280gQ+kQM4lCmyJnxJ8E2KnRAaZGl+RtMNbVXBR4ar
         3l0nOAFcrnZwKa0BdBst2jB+U3t5OO9e2/O3Igoji6NTBRRalPZ4mB0qZbpJU85PA0
         6+a0XOgqV53gwmBrIAy5CZ3qdGCrPiFgzpDXnqdi0g3k8Fq6BWkDtg9x7ArvuRWK6I
         GIzIlnwyUYa5Y/f3SjPWS3KxwpcbKSHRrEbMO1UZ2yI/l/sBdU541mGbgEhi/SwN4/
         xov4rC7VTq8Gg==
Date:   Thu, 15 Apr 2021 10:18:28 +0200
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
Message-ID: <20210415081828.GD1006@kunai>
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
 <20210415072131.GA1006@kunai>
 <20210415072431.apntpcwrk5hp6zg4@vireshk-i7>
 <20210415072823.GB1006@kunai>
 <6849a8f0-204a-362a-ed97-e910065ab14f@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline
In-Reply-To: <6849a8f0-204a-362a-ed97-e910065ab14f@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 04:15:07PM +0800, Jie Deng wrote:
> On 2021/4/15 15:28, Wolfram Sang wrote:
>=20
> > > Now that we were able to catch you, I will use the opportunity to
> > > clarify the doubts I had.
> > >=20
> > > - struct mutex lock in struct virtio_i2c, I don't think this is
> > >    required since the core takes care of locking in absence of this.
> > This is likely correct.
>=20
> OK. Then I will remove the lock.

Let me have a look first, please.

> > > - Use of I2C_CLASS_DEPRECATED flag, I don't think it is required for
> > >    new drivers.
> > This is definately correct :)
>=20
> Do you mean a new driver doesn't need to set the following ?
>=20
> vi->adap.class =3D I2C_CLASS_DEPRECATED;
>=20
> Just leave the class to be 0 ?

Yes. DEPRECATED is only for drivers which used to have a class and then
chose to remove it.


--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB39tQACgkQFA3kzBSg
KbatuQ/9FJmqTmycTEQmAH+pHsmaA2xHRB61k+BmT99wuWU47Hvs0jlpHPnfBuF/
gqqhfGaTtYn56sBaEP8JYVh/AXeGqEM7VFF5Q0Ch2iJHahLiqccNm3a2m2SymigU
vGOccVk16DI7iUeZrCVVRYz1mlVTIdOND3YxTbOkTDiooLmWo4bNrZKNsA5/3+VC
Ebaq0z1kDGgwcyp2Y81u3rNSCS3FfUOA7He645nS9VpHLFv0fiJez0seNQvW5kJd
p1hRNrq/6vLocM+6z8mcwCATQiidcLOMVCFD6sujRkSi4TgFjENGyQ/qcNrprOAY
sOlYjISby9Pu8ZoC1RN2qAS+E2uDEsQWJuhBllJ0ob+z4Ai7O+6erwbnLCA+vcDs
y8hTGF4jCuPxk5nmD7BJ2uhON7+ixOhHcvQWQd0d2efZKqftZ+5FhlY4VvkuPKNB
QswCFUyZVKnBSXGCDqMP4sv7e8zYWf28stc+cUS41VSa3NM2BGEqbRPhDJBGfG1g
SL+FUj0LA0rJ72R+NrCVRKB2bf0DyL43uH+mA3kW6bRlKvw52JnMq4eaEJL0e4+I
S7KAaB+XNxptIf2LBfuAB3YtIvs+wEsdKo1UdW6wa8HIgm4sgWQOrDhA/fSpAZgP
DW6yUCoiK8VdrGeW0EAMytxZp69PQmYZpEz+uNPRLsxOs63g7aA=
=0mD3
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
