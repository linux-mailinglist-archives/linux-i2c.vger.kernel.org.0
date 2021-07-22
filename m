Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AAF3D267D
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 17:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhGVOfQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 10:35:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:60700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232431AbhGVOfQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Jul 2021 10:35:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34D5E60FDA;
        Thu, 22 Jul 2021 15:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626966949;
        bh=LHyClktO0olkBxejwhQlj3KRJaiyoxqWGamgswsCGQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FerA6n00ifmtjQhExl9SCRsTOIiZzkWa5pt4RH9Ss5naGd9BsLq4nzXNJRYjmIMV8
         xcURk98cJ4OGpNr0I0kgdSdwp8FoxUWxLUEZZKjBXes5fwvT+TTSkqv2Jn9YUM97WZ
         Uw0/eba8TDrm8/OV2YYVcrlOo7HvumYVavevt1chey9+ealAFo2bETM1+qk5wjepl8
         GvBm/rQVtt2xuElwgo0WNk3ojhE2R+tN+LDCvzO6Qp6csNwROHv7LyKBHLJ+hqSLro
         qoxsoEjguWFBws85vmt1U0DC4MCz6TDKabK/IC8SlNdNIMiR+Jn3O5rjQJ/FHxGpcB
         tSPkOREYSyotg==
Date:   Thu, 22 Jul 2021 17:15:45 +0200
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
Message-ID: <YPmLoeLSPS1tfYUK@ninjato>
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
 <YNr0uDx1fv+Gjd7m@ninjato>
 <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
 <YNr5Jf3WDTH7U5b7@ninjato>
 <YNr5ZRhT3qn+e9/m@ninjato>
 <20210705121832.fmye5xnlbydoc5ir@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1c2QqIvEKcpDgz+f"
Content-Disposition: inline
In-Reply-To: <20210705121832.fmye5xnlbydoc5ir@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1c2QqIvEKcpDgz+f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

> If you look at i2c_smbus_xfer_emulated(), the command is always sent via
> msgbuf0[0]. Even in the case of I2C_SMBUS_QUICK, where we set msg[0].len =
=3D 0, we
> still send the buf. This is really confusing :(
>=20
> Do I understand correctly that we always need to send msg[0].buf even when
> msg[0].len is 0 ?

Nope, I think you misinterpreted that. SMBUS_QUICK will not send any
byte. After the address phase (with the RW bit as data), a STOP will
immediately follow. len =3D 0 will ensure that.

msgbuf0[0] is set to 'command' because every mode except SMBUS_QUICK
will need that. So, it is convenient to always do it. For SMBUS_QUICK
it is superfluous but does not hurt.

> If so, it would be difficult to implement this with the current i2c virtio
> specification, as the msg.len isn't really passed from guest to host, rat=
her it
> is inferred using the length of the buffer itself. And so we can't really=
 pass a
> buffer if length is 0.

And you can't leave out the buffer and assume len =3D 0 then? Otherwise,
you can't do SMBUS_QUICK and we need to set a struct i2c_adapter_quirks
with I2C_AQ_NO_ZERO_LEN.

Speaking of adapter quirks, currently they are not exported to
userspace. So, you can't inherit any quirks from the bus driver of the
host. It is not too bad, I think. It would mean that the host driver
will return -EOPNOTSUPP for transfers it cannot handle. Otherwise, if
quirks were inherited, we could bail out sooner at guest level, but
well...

Does this help?

Happy hacking,

   Wolfram


--1c2QqIvEKcpDgz+f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmD5i50ACgkQFA3kzBSg
Kbaz9g/+Onw9fYHTB0cPLqvOp/x9hmGYyFEPQobWn2upTKtbNJSe7kTzbtTGRPqt
n4xKY/tnhONOhwyR3bas4k46ibCJEvkPCxZNqh9K5PTT0O2jbuyXmYfnIFfXpyLx
G2caML04sSp/e/v5LJl3nn52Mrc3F9bwTVTv+FO0xie6raxmni9goC1sJQBMfvE2
K0Vlqm988+iq/AjnKBHBwKCODCviU2G7Vplmq+dp14kEzh+beUkA+Cyok07Zc0zE
XoCefckWVvGk3gec15KJF9R2843jL4yrUuHl7gf4vdqlHTzFhIeYm3O4HXRMOoZF
bFsw+zN911cbsWKeYelbFTiu/LVFDDwGAedUTeIMc6BqUCDpNSDmBbae9oLFN7ft
Q41pGtRZuj3jbcXSK3SkDtATTm4PJsUh4uvHtnmeXZuT3M2nHT+mKWrHGAmwccwR
lGhN3Z7lIzXvuUB8PAWYJsRLernuM7uRume6mQ/OePWKKCN8YkgRQgZQ2+J7c+O6
YHxLtTJrAyFBQu6JR1YHtdfzgEQ8yslkLkAXcwqNd9q/kXDJCjxMg8hzlGF1yMwx
GmaFjPsYwpKDrBQgVXgMGXZ+V4Y/cnOhB7sYRHFCuKH1pmVcDBfK5ZVdPj+PrdY6
xk/btuVqkeVnEAxvEs3BU+c3tpkEC5jDcmQiso0M3aUy270BBpI=
=zIfV
-----END PGP SIGNATURE-----

--1c2QqIvEKcpDgz+f--
