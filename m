Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058453B9685
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jul 2021 21:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbhGAT1U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 15:27:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:47726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233666AbhGAT1U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Jul 2021 15:27:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F420613FE;
        Thu,  1 Jul 2021 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625167489;
        bh=rjvVOs3rsdRYFkad1o2Kh6AvEVACKqzi3baeh1cC/Hc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SBDZ3qEGN3Pttppgfi2rUQXbIfzLXWe1fXTBFuVhL1PJSqnCiMvwpD2f5pfUwA915
         npWr3xiWSA+29JP6oDLcD/2CijzPfYFJxcLHmKdkCimlbeoJMMU4tpA9KFrQq1IoJp
         oEjVA8KZUNjU9fWKCV9kISgBzqhFX0dSJ9JtfFtHSsMst6n+D+meSZRqQwG3RK6XjE
         MuzhiZk1U3B6euRg2/1SYAjaMq300q4Wuymw8Pqjx+R1v7HjDCa9IJKwsAvlYxaAGU
         uJDwZsiH+qtA1I1c7OmcbRvOn7srzdeHuD3oHvc326mC99rTJroMylruF/T5/+Z5mH
         n0CL4M8h45wRQ==
Date:   Thu, 1 Jul 2021 21:24:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YN4WeJCepCrpylOD@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p/mQyAX/jtv/xPPT"
Content-Disposition: inline
In-Reply-To: <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p/mQyAX/jtv/xPPT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I just noticed this now, but this function even tries to send data
> partially, which isn't right. If the caller (i2c device's driver)
> calls this for 5 struct i2c_msg instances, then all 5 need to get
> through or none.. where as we try to send as many as possible here.
>=20
> This looks broken to me. Rather return an error value here on success,
> or make it complete failure.
>=20
> Though to be fair I see i2c-core also returns number of messages
> processed from i2c_transfer().
>=20
> Wolfram, what's expected here ? Shouldn't all message transfer or
> none?

Well, on a physical bus, it can simply happen that after message 3 of 5,
the bus is stalled, so we need to bail out.

Again, I am missing details of a virtqueue, but I'd think it is
different. If adding to the queue fails, then it probably make sense to
drop the whole transfer.

Of course, it can later happen on the physical bus of the host, though,
that the bus is stalled after message 3 of 5, and I2C_RDWR will bail
out.


--p/mQyAX/jtv/xPPT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDeFnUACgkQFA3kzBSg
KbbhyBAAqiwBToa6rq0zMH2xvLHCIQ8ckSt3tzhBiVZbthy9dP9RcNOPZ0itogCW
UNHHPtP5Wd+3x4Z5CTMmwZh3gGcKlADUhW2pYMAyg32PGgveIrKauHqR69BOQWXm
EZud7w7U7P/r9/KzhUxQTAwyqszZO8Nv1NpYfyq0C2HY957fjA3sKWDM5NdUY4uy
Sd+fFIz1cBUXCnwjRnNKT7Ov0mwgMO3q8KmombxG3+ENx6dOzGSCIWR26iZNVXBw
NiD+/vpe8FAnx/SQVE0ZJ1u08QxeFTYyGebljul33wYAAHfYWAGTRf24I54MYeuq
Lme4/7IJVclGXAeGB/NRwDNwDj84ANq/OlhukoTJLYfTujTGScje4apT4A9jyMcq
ECAEG4UMIL+jSIkbqde8igASyrteYVSHhSnqWDO/yWkgZTjgArA1/O6ulAnbN1ET
MpVN2gUE15o5KoK25zI36+vMgu0NQtUUJ1/zQCUT492iAIXq8LkZnP2Ki72lu8Iz
uwiWIq94RWVoo8BgHlksjsHHuehyp7aBGmk6FWdAb/E3eq0BvpqZrmuwFmniGywh
F9Xx24yQ0l3q8Gsw1Ijv2OSpILAM03yEYbN/WR/J3FS95H+rzvcJBX49wE7V0MiF
Cx9lO7ujNWh3Sc2558RTInGczg+Z7iL9kRbyaw9bWE7wuKNAAl8=
=I7ee
-----END PGP SIGNATURE-----

--p/mQyAX/jtv/xPPT--
