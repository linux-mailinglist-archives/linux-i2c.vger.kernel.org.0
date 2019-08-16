Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E47790577
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 18:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfHPQJU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 12:09:20 -0400
Received: from sauhun.de ([88.99.104.3]:46520 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727448AbfHPQJU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 12:09:20 -0400
Received: from localhost (p54B33308.dip0.t-ipconnect.de [84.179.51.8])
        by pokefinder.org (Postfix) with ESMTPSA id 4781D4A14FE;
        Fri, 16 Aug 2019 18:09:17 +0200 (CEST)
Date:   Fri, 16 Aug 2019 18:09:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v3 3/3] i2c/busses/i2c-icy: Add LTC2990 present on 2019
 board revision
Message-ID: <20190816160916.GA5858@kunai>
References: <20190815125802.16500-1-max@enpas.org>
 <20190815125802.16500-3-max@enpas.org>
 <20190816115112.GA3507@kunai>
 <513d49dd-70fc-a226-fdfd-598aadcfec05@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <513d49dd-70fc-a226-fdfd-598aadcfec05@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Braces for both blocks. Did you run checkpatch?
>=20
> I did, and it didn't say anything.

Hmm, strange, does is complain when you use '--strict'?

> Turns out I misremembered the CodingStyle as having a corner case
> where it doesn't. I'll fix the style - I dislike the above, too ;)

Thanks!

> Yes and no. Now that you mention it - the LTC2990 can be at four
> addresses (0x4c - 0x4f), and there are jumpers (solder pads) on the
> PCB to select its address. Shall I add all 4 addresses to the array?

Yes, please.

> It's also possible that there is no LTC2990 at all (because it's hard
> to solder at home), and that's why we need to probe for it first. I
> believe i2c_new[_client]_device doesn't do probing, but rather assumes
> the device to be there. Correct?

Correct. I assumed the sensor is always there. But it is not and can be
at multiple addresses, so updating the array of addresses is the right
thing to do(tm).


--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1W1SQACgkQFA3kzBSg
Kbb15Q/9Fxje8eCVKx3e/loxQhqvd9xaHapbEZXDrB6fF77czkPwsNASNvz/Coyl
Ru5qKJn3AErr8VyUSOXUDDnHDGqqdYzZwQY3uoaV6aN4xza0u29e7PokP7XeA/I6
zYMK5mIcC7D0Sk+0/biF/Xi3mjpy7pVMeYgOa/xo7Pv8QW0zEITd4u/if2EBzw6n
q8MCJDwZnqKQicmjdUMaYMl9yDDkEPrCI6HEYGkB0hgffYSwoxpxbeBbT3yhDqZO
bruA80sIcu3vOa6+kN7jmogcAq8Kg5CUTNWUbINsXMyxqUfJxxKrH4IhrgjjvarY
1FvmQOihKmkfE2Lp4NMR7tSciWQdRDlgW5gHrQqurr6msCRZ10E9Ylx/ABJ/hOvI
dJontetvx06hz6JV8nVDLpk7Im6EtT4wU5kzirdpY4un9lgVe4/fm++hwFgHADbO
ReUC6TBaqe38eVHJh2j1bYCgkMy42iNdwfRv4iDHsxk87diGRiJLIV69qlhxIWeD
ynGdwgxnBlF110mwyyHwzXwQ8Gi+tW5NVWWOTL4ibfjCUH4KYUU/iT0N4UkgNDfm
Yy+2u16Fe3GOLc6t15AuWmFFtP/lju6SaY+ngE6rArla1G4Iy/8jMdPEQn1ntTNr
vtoE4oH4ckD1aEbF39uTzGz6jTUvJPnl5vmgT+fmf1R/trrR/zQ=
=QAlX
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
