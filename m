Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961B6A449C
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 15:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfHaNW7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 09:22:59 -0400
Received: from sauhun.de ([88.99.104.3]:38484 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfHaNW7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 09:22:59 -0400
Received: from localhost (p5486C98B.dip0.t-ipconnect.de [84.134.201.139])
        by pokefinder.org (Postfix) with ESMTPSA id 1314C2C0093;
        Sat, 31 Aug 2019 15:22:57 +0200 (CEST)
Date:   Sat, 31 Aug 2019 15:22:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
Message-ID: <20190831132256.GG1032@ninjato>
References: <1565675708-15434-1-git-send-email-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline
In-Reply-To: <1565675708-15434-1-git-send-email-bjorn.ardo@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bj=C3=B6rn,

thanks for this patch!

On Tue, Aug 13, 2019 at 07:55:08AM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> Add a 32 and a 64 kbit memory. These needs 16 bit address
> so added support for that as well.
>=20

May I ask which Linux I2C driver you use to act as a slave?

> Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>
> ---
>  drivers/i2c/i2c-slave-eeprom.c | 36 +++++++++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eepro=
m.c
> index be65d38..35bff28 100644
> --- a/drivers/i2c/i2c-slave-eeprom.c
> +++ b/drivers/i2c/i2c-slave-eeprom.c
> @@ -18,15 +18,22 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/sysfs.h>
> +#include <linux/bitfield.h>

Please keep it sorted.

> =20
>  struct eeprom_data {
>  	struct bin_attribute bin;
> -	bool first_write;
> +	int write_nbr;

What does 'nbr' stand for? My gut feeling is that this variable could
have a more speaking name. Also, at least unsigned, maybe just u8?

>  	spinlock_t buffer_lock;
> -	u8 buffer_idx;
> +	u16 buffer_idx;
> +	u16 address_mask;
> +	u8 address_bytes;

num_address_bytes makes the code easier to read IMO.

>  	u8 buffer[];
>  };

Code itself looks good to me. I'd like to test it, though, hopefully
until Tuesday. What kind of tests did you perform?

Kind regards,

   Wolfram


--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1qdKwACgkQFA3kzBSg
KbZZXg/+P0fp7D6ivx6mh78/KBh1AOqtTx9GNc88LhJ+Jvme3pJXzlQ8vjDI5tNr
KYxDbj+gSSr6kR8mKetVYK1QJHv0nqTF8b6CAlxDbV91U6cQoGsJMRok+nsMVmOt
vXMjU5TAIGZ1GHmk5ePrnRSwlZY3zK/PxzPUvMtoznRB1+Hp1YjDOaTiWHLNqwvq
GX/cKjLCvSb/T7yHR3dVCoDRS2VUAXNsDrRF8793toGtZOGm+u32SSJ5U3YlJXa/
gezmQ/2OtmOy91La3yd5nFRZHsUF+D3w5ZvFSggCc+QKisMHpb0h9qPmcRvWg3cY
b4CNP0NI9Il/ipfTGIyoFzfko4Wg0adVabep3yjm41DdOvxz9Hm9Od7Zg9SPp8ym
zT0i0M4mfmrCjzJYrtU4VYqrVGoabkJA/35ixZh27TY/XResKV4zlj87HMYrMBa2
L4VmcCBgajAg+fcdgr1dS4poPO+dFfUClPGIbb42AK1G6Ddq1wwENKqdoriALZ0o
r+mcsx71KXTpRhSgFgZa0SRHZpj2gejrvIYML7mLZ7Lj2YFZsrHenCbkfgF/304k
O80KbCeDkMnD5tgO+ud+NxqinE7DX4ZkWgsMnpo62fu1PqR/23omkm+VHyftwKs1
og18UyZGocoGrSesjcJiFrRtVlTyf+clFTafWZjtkLSFyzucgHE=
=uXUk
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--
