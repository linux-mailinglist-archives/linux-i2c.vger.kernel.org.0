Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 034DF60B94
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 20:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfGESwX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 14:52:23 -0400
Received: from sauhun.de ([88.99.104.3]:53784 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbfGESwW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 14:52:22 -0400
Received: from localhost (p54B334DF.dip0.t-ipconnect.de [84.179.52.223])
        by pokefinder.org (Postfix) with ESMTPSA id EEEB62C0398;
        Fri,  5 Jul 2019 20:52:20 +0200 (CEST)
Date:   Fri, 5 Jul 2019 20:52:20 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Joshua Frkuska <joshua_frkuska@mentor.com>
Cc:     linux-i2c@vger.kernel.org, wolfram@the-dreams.de,
        msyrchin@dev.rtsoft.ru, ying.zhang22455@nxp.com,
        leoyang.li@nxp.com, york.sun@nxp.com, kernel@pengutronix.de,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V7 0/1] i2c: imx: add slave support
Message-ID: <20190705185220.GK4717@kunai>
References: <20190628083101.103418-1-joshua_frkuska@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KjSGHOmKKB2VUiQn"
Content-Disposition: inline
In-Reply-To: <20190628083101.103418-1-joshua_frkuska@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KjSGHOmKKB2VUiQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 05:31:00PM +0900, Joshua Frkuska wrote:
> Purpose:
> Its purpose is to introduce i2c slave capability to the imx i2c bus contr=
oller driver.
>=20
> This patch was tested on i.MX6q sabresd, sabreai and UDOO boards. It is a=
 continuation of the work started in the following thread https://www.spini=
cs.net/lists/linux-i2c/msg27340.html
>=20
> The current version is version 7 and is a continuation of the discussion =
in https://www.spinics.net/lists/linux-i2c/msg30208.html and https://marc.i=
nfo/?l=3Dlinux-i2c&m=3D154202241501928&w=3D2

As said elsewhere, the driver is sadly unmaintained, but I'll try adding
some previously interested parties...

>=20
> v7 change summary:
> 1. rebased patchset on i2c/for-next dcd4072a2e0be81b31f94c97183e938b051d2=
4f7 "Merge branch 'i2c/for-5.3' into i2c/for-next"
> 2. reduced #ifdef usage for i2c-slave and replaced with __maybe_unused
> 3. re-ordered i2c-slave functions to remove prototyping
> 4. refactored white space in commenting
> 5. removed scheduler priority adjustment code
> 6. updated added function names to use i2c_imx_ prefixing
> 7. grouped slave related members together in imx_i2c_struct=20
> 8. removed v6 changes due to different co-author and not being able to co=
mment on the changes (cc'd co-author in v7)
> 9. removed cosmetic changes
>=20
> v6 change summary:
> 1. rebased patchset on i2c/for-next=20
> 2. Add STOP signal process in slave receive mode.
> 3. Add CONFIG_PPC_55xx support
>=20
> v5 change summary:
> 1. rebased patchset on i2c/for-next 5ff37d1a67e2fed0cae537ad682abb7f6647c=
ca4 "Merge branch 'i2c/for-4.13' into i2c/for-next"
>=20
> v4 change summary:
> 1. preserved Maxim's authorship, added rework note with signoff
> 2. re-arranged #include ordering
> 3. fixed check-patch warnings
> 4. redefined MAX_EVENTS to an integer
> 5. removed introduction of error codes
> 6. changed last_error (atomic_t) to type int
> 7. removed white lines
> 8. fixed multiple parenthesis alignment issues
> 9. removed explicit casting
> 10. replace udelay with usleep_range
> 11. removed multiple excess spacing issues
> 12. check for return of wait_event_interruptible_timeout
> 13. simplified conditional statements
> 14. removed dubious pinctrl handling
> 15. updated commit message
>=20
> Testing: (validated locally with 3 different imx6q devices) For the purpo=
se of this test, any 2 imx6 boards were hooked together to form a multimast=
er bus. In this configuration, slave and multimaster configurations can alt=
ernatively be stress tested. It is rebased and tested on the i2c/for-next b=
ranch.
> 1. enable CONFIG_I2C_SLAVE=3Dy
> 2. enable CONFIG_I2C_SLAVE_EEPROM=3Dy[m]
> 3. enable CONFIG_I2C_CHARDEV=3Dy[m]
> 4. build the kernel
> 5. install the kernel/drivers on 2 imx devices
> 6. wire the i2c busses of both devices together
> 7. load kernel modules if needed
> 8. instantiate a slave eeprom on device 1 with address A on whatever bus =
it corresponds to (e.g. `echo slave-24c02 0x1066 > /sys/bus/i2c/devices/i2c=
-0/new_device`)
> 9. instantiate a slave eeprom on device 2 with address B on whatever bus =
it corresponds to (e.g. `echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c=
-2/new_device`)
> 10. using i2cget/set on the appropriate bus, randomly read/write on devic=
e 1 from/to address B. (e.g. `i2cget -y 0 0x64` OR `i2cset -y 0 0x64 0x01 5=
`)
> 11. using i2cget/set on the appropriate bus, randomly read/write on devic=
e 2 from/to address A. (e.g. `i2cget -y 2 0x66` OR `i2cset -y 2 0x66 0x02 7=
`)
> 12. confirm operation between devices by observing the input and output o=
f the i2cget/set functions as well as dumping the contents of the eeprom vi=
a the sysfs entry (/sys/bus/i2c/devices/i2c-<BUS #>/new_device)
>=20
> Any constructive comments would be greatly appreciated.
>=20
> Thank you
>=20
> Maxim Syrchin (1):
>   i2c: imx: add slave support
>=20
> drivers/i2c/busses/i2c-imx.c | 753 ++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++-----------
> 1 file changed, 708 insertions(+), 45 deletions(-)
>=20
> --=20
> 2.5.5
>=20

--KjSGHOmKKB2VUiQn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0fnGQACgkQFA3kzBSg
Kbbj3g//ff2BdyHbkjhvlWQgv2d1tJjXNit1bkvG7Fm63lOK2eEHstmrhQ9/w1BC
k7kO5iy//uCIoBQCWozpKqv/d+CNpMT7zcvH+XHKH+RlPaHrbbhuZ4QFvWsgiZsT
UI6X4xPOIJIJEqQxUYfJzxVGtUqa3sS7glKRWtdgNhZ1IySOcTAXa4apU9tV22vb
mkpr8pnpCVEoDX4pcyViQguiz0u2RzOJQ9CKtu6iuhohIL8ZhEFVZJbC9FtAv7uH
s9a/CMy2025SWE6cOWmSd4uRP02smbjiF1K1WmpPYO8K7YfIq2TBUD3JiBxRipOv
NrpbGRFTuv5Er9TJHN636AfIFh7VFF5JR7snt60OTW8qYBYfQMJUjrrv+YTDX1Ah
jGw3V/CUZjlnr7DmfyrQJYtyHnfjeJ5/56sHV4+HLiY/kW3ikTJgRxahrCkxXVLN
1ooWxUPkVruIP+cxkZQDpExGUBYwcH5BWgfssHa/6t2p0352l7w6NCTdmFoZFPHx
TFHEl5DtEoWoiwMMAarHJevxtnLrBq5MAyTtQORz7i7wLUv0DngUjKam6BNXp2pb
eAZ74/SmgSzInIa8uvAxkUdTu7mttWqgxS4IpzseEPGdou1s19+j6rpOOm9/TaYK
snmSTwLYuFsy2UyifeVzWH07FmSP+JEu5UkTr1Xvzp0/RStgAyk=
=IZ86
-----END PGP SIGNATURE-----

--KjSGHOmKKB2VUiQn--
