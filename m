Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDED262A29
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 10:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbgIIIXq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 04:23:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:58086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726414AbgIIIXm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 04:23:42 -0400
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 823552076C;
        Wed,  9 Sep 2020 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599639822;
        bh=Yk5f469iMe5uWClYWw+4w6OxQkIrjVVzv2bmDLHjXYw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YZe0HoVzUIgRWM3KPO86BpYg5a8BnYcAfxf6e82HppawaU50U9lxnIpf3Ku1F2IBJ
         jObg2dxqyvt7AiX/Ka160aLnUeZkhthwnYDAvdYfw2U8MFzL5rpKKB8+dpKMc0H8bR
         /0fPCUxZonQAHaQPNbKhylyl/BJASHCYkf48P6Oc=
Date:   Wed, 9 Sep 2020 10:23:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
Cc:     andriy.shevchenko@linux.intel.com,
        chris.packham@alliedtelesis.co.nz, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Message-ID: <20200909082338.GC2272@ninjato>
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 08:32:47AM +1200, Evan Nimmo wrote:
> If something goes wrong (such as the SCL being stuck low) then we need
> to reset the PCA chip. The issue with this is that on reset we lose all
> config settings and the chip ends up in a disabled state which results
> in a lock up/high CPU usage. We need to re-apply any configuration that
> had previously been set and re-enable the chip.
>=20
> Signed-off-by: Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!

For the record, were you able to test both, PCA9564 and PCA9665?


--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YkQoACgkQFA3kzBSg
Kbb+QQ/9E7gUmj6g6blrvZZpCuk9+cGTLSBERDhTHqADvFLASAzYwW6sd5ZIMYkI
FkYxSngIxqbhxLDPcPJGiTzp2m6+Fg/nkcAOEqePWHxlluhZ09E5pOPznBtdaoPa
OuXSi60LuHk8S9tUluox2UbHohlVOJ46gMtbzT7bW2/tcer3WL+I5Q1XHTqIsE9w
bA7xZStj03hto3GHT+gB9O2HjF/dgnkUSqAIkX/mlGj2RGenfpxAmuYeo7D87ozK
Br+1nb9ZiqYNdawSRXoI2xyvtuFkCNGUq+YWbwJYqHFiICdz7Q2+0mJk+uRqPqdk
XhMfmzc6OvFrqNLOw+o5Vd6m2INiLdo9dHtiWzT1B4eujliqZpfZ0ky1cCwNXU3Q
VojyoJ1uaX+PgdeAl4IczCDPrBv6dvz7nXo4bj03Vjdhzce40RpFXn3tfs05idnR
fciO//UlJNdjk2FR3qaK5dWWLGANrKtPcW+y7BXr5BNgMHBRXeUg+3g5pjrw0eg6
JSBud0OsqCCZv2V3Angg5pQI2q+FmSMW7q48MZJzNUmg8V7UI1D4SVu62Nf8mVDO
hluoM80Yfqs1PnXjQP3lqEQKSV35HOUMR95Hb7/r4oPsvAr6VB4EFwuRm7Hqit/v
fQpVPJ3cyjJP7GWPP26um0SLLz+F2xe9urjQLZ3FakaiY7fpFIY=
=7ey7
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
