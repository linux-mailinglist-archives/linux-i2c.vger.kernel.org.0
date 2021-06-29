Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E131D3B7084
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 12:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbhF2K0X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 06:26:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:49794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232692AbhF2K0W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 06:26:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E855161DB3;
        Tue, 29 Jun 2021 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624962235;
        bh=WI/UAppXOdbESXWr8RhaWg+kL9hjURC+JQQV6ypPhGA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JIHXDWq3KLwh2q542tAe7jCNTsG9jezgcWPVY5blh7S36WxukITw/V4gKBTCgP010
         djqflO18PYvU8O+YyVB49QzTnpzdEDk/7qcAUWLQsGTwxtTXGq8dGaT8A58IDT230j
         0OSk+vsZiJWVSZaSfCIIi9ff6rMTO7/IXfEQeSYDKHUV60vT53FGTOo5dTxB5YnWjN
         HNjVC8BIvMQGeVdX6BcSzleAOaJuV+WpkdoDYJ1liRzookk0BvhGgpK4Dp26RD31qh
         aHqYZCMMK6HEFmuTwHFKQ0m6YxWdl7LW5KxThtabX4G4nWRQQXYJzfew7HEb5C5EOB
         aNPhQ/QT25C1Q==
Date:   Tue, 29 Jun 2021 12:23:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNr0uDx1fv+Gjd7m@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com, jarkko.nikula@linux.intel.com,
        Sergey.Semin@baikalelectronics.ru, rppt@kernel.org,
        loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iTOdtFFZlvMpSSzc"
Content-Disposition: inline
In-Reply-To: <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iTOdtFFZlvMpSSzc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > You are not emulating I2C_FUNC_SMBUS_QUICK, so you need to mask it out.
>=20
> What is it that we need to have to emulate it ? I did use it in my
> qemu and rust backends, not sure if this was ever sent by device I
> used for testing SMBUS though.

The biggest use is to scan busses for devices, i.e. use 'i2cdetect'
without the -r parameter.


--iTOdtFFZlvMpSSzc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDa9LgACgkQFA3kzBSg
KbbzoBAAmOEdNXW8icMnkSzbohgKRINC2D5gEOYvji3EtJKabbWm3ANmwOJsDpr6
KxB0ccjGmNLSDjJNNZcARKyzBo5GfPdWayK/vmrWTITkDglfYm3XD/9XQ2geZrfk
7jPrWBStYM+EXL+cSBOKTu2UnV8FgsbUQEpWYnreblgCkRR7RMtvRmakalELb2CJ
r5hCcM6ncSfNQM9OW4iBpJUFZr0Obk0gjixfz+JAmlr+KHSsncdvhESSQZLzQljX
K15ODeh/yilJ2/8gjx4vnz66/Lh8USdvMyPJ6FAFZZ02CjlnL4BFFW14dY5FfPhN
9nhk0k2SYJQ6UzvxcqVDlJ7nyzSlxHBldp3Y27feoO5/cSEDHuJpHHyUAdUE/JHj
rxpiUD2+1ri3NDCmgrnsI2ZKh+owCpwm0JmsVFkk8QQJw0xtTgM9sn4J497tePJL
c6TShRjvI+pY8OaBzsTcGojUuZ5Ac1WRnnkvyY1h8me+xJ7kWNO0aD5vj++gnWe8
75I/uA+VqVEJzIWt9dRNNwkZgzpdtRK+bvf+5Vvp7j8WUzowS98Z/NSJaIIerzTq
oOXg7tV6IiA3jE+cqc5gca4OG4pdDG8+Tbw9m1NAF7btXYlfSgc3jtlAy+l2J8jL
mU4mV2oHDvOhxlQjWNQsz7fy8UuY1yPUtkKs5VV/SGgSXpcwtOI=
=GQdq
-----END PGP SIGNATURE-----

--iTOdtFFZlvMpSSzc--
