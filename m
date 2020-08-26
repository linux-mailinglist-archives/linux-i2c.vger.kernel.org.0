Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FC5252C63
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 13:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgHZLXy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 07:23:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:34634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728927AbgHZLXn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 07:23:43 -0400
Received: from localhost (p54b33436.dip0.t-ipconnect.de [84.179.52.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7694720786;
        Wed, 26 Aug 2020 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598441009;
        bh=XjWiltlvDLTSBB6KiZZ8gzZ9+KLlp3UZ1iL481kqZXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b4bV6T1XD1TxGTE4F0MhG2SNkFCwZPiSdpvziN65N5AMejO6NvAsROqZSUW4/O8wq
         Jme7HlaZ7p1o32w6L/AKgC207JjlbwCw7oo69WMRDjIYc1tH29cTdXf79Ja8nRRDU/
         kjiAK3gXhgIvuCQ/r993ie/yAdvqAZc4Gz85UpiM=
Date:   Wed, 26 Aug 2020 13:23:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826112326.GC1081@ninjato>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
 <20200826052544.GA500@jagdpanzerIV.localdomain>
 <20200826095356.GG1891694@smile.fi.intel.com>
 <20200826095617.GH1891694@smile.fi.intel.com>
 <20200826102411.GC8849@jagdpanzerIV.localdomain>
 <20200826103807.GD8849@jagdpanzerIV.localdomain>
 <20200826105426.GJ1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline
In-Reply-To: <20200826105426.GJ1891694@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 01:54:26PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 07:38:07PM +0900, Sergey Senozhatsky wrote:
> > On (20/08/26 19:24), Sergey Senozhatsky wrote:
> > > > But then the question is why we have this code in the ->probe() at =
all?
> > > > ->match() is run before probe by bus core, no?
> > >=20
> > > That's a good question.
> >=20
> > Everything seem to be working OK on my test board with this patch:
>=20
> I'm okay with it, but I want to hear Wolfram about this.
> If it gets a green light to go, feel free to add
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Sergey,

Can you send a proper patch (with patch description) and me and Jean
Delvare <jdelvare@suse.de> in the To: field?

The origins of this matching code are pretty old and Jean is more
experienced there than I am. Nonetheless, I will check it, too, of
course.

Thanks for the work!

>=20
> > ---
> >=20
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 5ec082e2039d..77eea5c0bc71 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -475,17 +475,6 @@ static int i2c_device_probe(struct device *dev)
> > =20
> >  	driver =3D to_i2c_driver(dev->driver);
> > =20
> > -	/*
> > -	 * An I2C ID table is not mandatory, if and only if, a suitable OF
> > -	 * or ACPI ID table is supplied for the probing device.
> > -	 */
> > -	if (!driver->id_table &&
> > -	    !acpi_driver_match_device(dev, dev->driver) &&
> > -	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
> > -		status =3D -ENODEV;
> > -		goto put_sync_adapter;
> > -	}
> > -
> >  	if (client->flags & I2C_CLIENT_WAKE) {
> >  		int wakeirq;
> > =20
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9GRioACgkQFA3kzBSg
KbZy4RAAn6aFpd7s1gWp9gMH30jYS9LbwKQ3auZA2AtR+LZgzudzdlAjVeQ4HKlk
XU1KRp5lw5HR5FdT8Ggsy2+89L/je5AkGr3ijJfbE6XNsBhPNQDrxnf0ljDeX/cA
yBMCpqAPSyrl16KUXK42Fz9XaLgQxajbF0gtsmunLX2FpqE8pE4+SNMNTJnFJyNN
280p/hxGja8qmONcDJFZlxaYP7aHwpMUy/YcOTFWgGBwyXzJFC+JU1qquDfQ90G+
7v8V5eDfQJZaYLL2iFgrQmfBDMlp2kqPZxJrN5TmWsuHsz2lrsTnhPW5xf0CmiPk
YZh1z+X7VVulc8vvOXuh1njSJkBth1U2e51GQzQdIVVTe7Is8DR6EDhiWymXQcZX
L/iF6XkI7wgfOvbWUY5xitcXdTOVk8Dw6HKBFKbUa85Vmbj+yx8J9/0kbVsQiHK3
2jGtON2FrjOrtG6DMga2xDH+SLp84WdKFdfICWBk+v7sDa8BUGgL9uFWROe8zr5/
49Adgj2VHEc6oDgq83SWJkfbpJcEw7cvH6+YLZjINM/KaWkO96cBuoSOCHw6Pah9
Sb6q98gZf/XkU2AHeBR8E4jbb1fx8z3mD0AupOoRVKtoBgjJYxODG0Nbf4LczlCt
SiGBItQ6pdTPN4jRtvXOr2mCtg2rQ09PNoFMwlH6f35r0wJ+G5g=
=dgCM
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
