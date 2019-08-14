Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC288D7A8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 18:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbfHNQHO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 12:07:14 -0400
Received: from sauhun.de ([88.99.104.3]:50418 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfHNQHN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 12:07:13 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 9C6BA2C311C;
        Wed, 14 Aug 2019 18:07:11 +0200 (CEST)
Date:   Wed, 14 Aug 2019 18:07:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Andrew Cooks <acooks@rationali.st>,
        linux-acpi@vger.kernel.org, platypus-sw@opengear.com,
        "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: Re: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4 SMBus
Message-ID: <20190814160711.GA5816@kunai>
References: <20190802145109.38dd4045@endymion>
 <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
 <20190809103340.2ef24523@endymion>
 <01de7b0c-7579-048b-312c-122dddc23c64@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <01de7b0c-7579-048b-312c-122dddc23c64@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Unfortunately not. I only picked up from where Andrew Cooks left, due
> > to me being way too slow to review his patches.
>=20
> @Andrew: can you tell us more about this ?

Was the info Andrew supplied helpful to you?

>=20
> > I was able to test the first 2 patches which fix bugs, but
> > not the 3rd one which deals with ACPI devices. There does not seem to
> > be any such device on the 2 test machines I have remotely access to.
>=20
> Did you already test on apu2/apu3 ?
> If not, maybe you could prepare a queue that I could test.

Maybe I am missing something but can't you just apply these patches on a
recent kernel?

So, the discussion stalled, but I think the series is fine as is? If
someone disagrees, please speak up. I want to apply patch 1 to
for-current soon and the others to for-next, too.


--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UMaoACgkQFA3kzBSg
KbZfHg/+PtVFnMuKKJxRrrr+D7Xz5UzKEh38nshbA37TJVz+nIbzDVVD7c+OoZav
sAGEgKPEskjpmZUlC823T18Z25hOY3PCysPNs+3yr0QlfXk1G2rdvnDzfJQYyV1O
QEhVeDqpGf92XKcX3dhshkev7CE524uAZtNs7fhUoz97ckcb+CMN+CrJnFVhA4lj
HdDRQ2os8ys82wAbxkRhcif+SP6Qvb/rzMHHEaUhbFjAXs/awy5cLVEHhdNgDabB
gnGPyXmg0F668DB5B0ZAMbWup8CJbVuUxg37usl4VsDN2HpTmUkfwWYqtdycDRUz
B2S2CPv39PYQQyhTzXqTUctg/g3hYd+HfKXLwEh2+da7UWK7OjEFpnVmhNc4dCcH
+0nEkBUfMox8t4G5/lRZrt9m1TiHPEbdMP+ZdeHYpoPMdmkZKb9vwiz6dZRa554I
Qyjquwg6IOmeGrbEeqPLu0ypeoS76sOJJ/pNQa2cePyqP53BC953Qpqo1cKGfSzJ
NjU5qQJiTivAxE9g7I5A3cIXq0SqwjW68keNWSphMY/9cboeDabzprP4eqqCWjXj
eR/AQcocWeQtyApSxzA1kmAF0oEcwQ4dwX04AvmKnQEpQSVEO7lQTif9Zh+Y6C3M
81PFi6pjHFsaIaw2oehutcitFwHGefowMlMSYFdmciY9/ZMwbsE=
=ebsn
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
