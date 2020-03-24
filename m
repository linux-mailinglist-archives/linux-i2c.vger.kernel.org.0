Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E42E419074A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 09:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgCXINe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 04:13:34 -0400
Received: from sauhun.de ([88.99.104.3]:47070 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727163AbgCXINd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 04:13:33 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 7B4FC2C08EF;
        Tue, 24 Mar 2020 09:13:31 +0100 (CET)
Date:   Tue, 24 Mar 2020 09:13:28 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] i2c: rcar: Consolidate timings calls in
 rcar_i2c_clock_calculate()
Message-ID: <20200324081328.GA1134@ninjato>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-3-andriy.shevchenko@linux.intel.com>
 <20200323215420.GA10635@ninjato>
 <20200323220353.GZ1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <20200323220353.GZ1922688@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> > Here, the initialization to 0 is missing, so some values are broken.
>=20
> Yes, and this is fine. They are not being used. So, the idea is, whenever=
 we
> pass "false" as a parameter to the function we must take care of all fiel=
ds we
> are using.

Can be argued. Still, uninitialized values look a little sloppy IMO. I
had a patch on top of this series to print the generated values as debug
output, and '0' looks much more intentional there.

> > Why don't we just drop the pointer and init the array directly?
> >=20
> > 	struct i2c_timings t =3D {
> > 		.bus_freq_hz =3D ...
> > 		...
> > 	}
>=20
> I can do it if you think it's better. I have no strong opinion here.
> From code prospective I guess it will be something similar anyway.

I like it better. Easier to read in the code, no need for a seperate
pointer. I can fix it locally here, though.

Thanks!

   Wolfram


--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl55wSMACgkQFA3kzBSg
KbbZshAAjo6h90zEoefTYiQHK2WtTdzzPLA5mRkgvntt6QUYeBEdNUzOdIRkZ9FH
aTIcesScVXoUiiy6gthgUql+BNcI0bCY6W+3X5rWVoVreVGFS3uUizsmXIkY9EHr
iHU7eGXYhXSj/nwNtT+yYjlX7QccJqDwjIM1OXmc5PGk1CbdwFUkppsjXng6HxQk
SYVjxQZlyB8JwD6LCZD0XsI73X67oFoknwPAysgOh1TCR02vSilVJk+oIsUl+xtI
78iTHwhcY/8Y5Wfu20hs+BAbAI8oAflzpblzwvypICkLJPMdFd7DBVYrNq4jLxiF
/MgBg+uIskTn5eS0KHqnl15IdDAF2WzDJVKAZkG9uAFr5cd7B0tYOkZ2M3hNVf46
j0MO3WELVDoDqhuBOwJgJuJsi5Yvyc7fw3O3OruBJB8z8SefGcyHfzkmb5PVWpPj
xlvZgAkE/44i+N1yBCCKzxvR4kdssOFxkvdLRAW2//PaWH1Cd+OY5WoHk5VXOLGC
x55x46eGJl80gnW5G9PojADqyZPrgTpT5yieN8rFDeyGgiupHSjI7BduBMcKe9Gn
YQ/5lSgzCnwEkt4vNvblIxuMs974+2a31YoBRgeN9UjrkqSuYmC/l6HMVHpiujFB
liKE+jqMvpCVr9+sz47K2jijyUWPfIzQamv3I+dZWxIF1k5B43E=
=QNrw
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
