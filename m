Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99978A9D32
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 10:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732722AbfIEIiy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 04:38:54 -0400
Received: from sauhun.de ([88.99.104.3]:53718 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730914AbfIEIiy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 04:38:54 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id 21B702C0509;
        Thu,  5 Sep 2019 10:38:52 +0200 (CEST)
Date:   Thu, 5 Sep 2019 10:38:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     Bjorn Ardo <bjornar@axis.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
Message-ID: <20190905083851.GA1157@kunai>
References: <1567497091-18270-1-git-send-email-bjorn.ardo@axis.com>
 <20190903174359.GB2171@ninjato>
 <ea04722c-81e5-1fb3-d5fc-0ee24e073025@axis.com>
 <20190904154814.GC1157@kunai>
 <f8629df5-c1b7-aa72-c403-9de393e87a93@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <f8629df5-c1b7-aa72-c403-9de393e87a93@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > /*
> >   * FIXME: What to do if only 8 bits of a 16 bit address are sent?
> >   * The <your vendor & eeprom type> sends only 0xff then. Needs verific=
ation
> >   * with other EEPROMs, though. We currently use the 8 bit as a valid
> >   * address.
> >   */
> >=20
>=20
> The eeprom tested is from ST, model M24C64. Should this be added in the c=
ode
> or in some doc folder?

I think FIXMEs should be in the source itself.

> I have another question. I'm considering adding a flag to set the virtual
> eeprom in read-only mode on the i2c side (but writable from the sysfs sid=
e).
> Should this be implemented as a separate i2c_device_id, or by trying to r=
ead
> som configuration flag from devicetree?

Hmm, not sure yet. There is the "read-only" DT binding which makes it
easy but I see two drawbacks:

1) I am not a big fan of describing slave functionality in DT because to
me this is more configuration than hardware description. I know mileages
vary on this one.

2) This is a DT only solution. If we want to support read-only when
instantiating from userspace, we'd need a seperate mechanism to
configure that, like a sysfs-entry. This adds quite some code.

I currently think a seperate id like "24c02ro" will keep things nicely
simple. Obviously, this solution doesn't scale with number of features.
Having a look at the original AT24 driver, I wouldn't expect other new
features coming.

Thoughts?


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1wyZcACgkQFA3kzBSg
KbasFRAAsmjgJ5ll0jjdtIY5pd9M4Bw79zPcg3GHmYbFpleoPY6otMRLDpR5x8u6
zvVmoNBi+4HND5Nr7/lB2Ku9D96ttdgFGc8SlgV1cAoswlOad3zwxDiRqXhbAxpd
oJDW6Po1RwJXqLPCvuxfwYB7BxhsrzM4cZ9W65rJzGx7kzh4IrKESq7XyuNWaB2P
6G6zfOZmF5FA6fUv8RmzQQheYPMhKvKP0nIUz796ov6pqRifQKvnPB0+eYurYmkw
iL575dOgDY0tqDrA+ZNpTE9ivThqinapLg9PlJZHSColz7aP1Ce7ihO2XS5s1Klm
Kx43WpsBJq2pUggYXPp4C3FUHs8+PyPsntyJBAKL7JgwvX2GlPd7XAHquSabOKO+
Q9ZLe9XUa1niBJADBOarTlUZdHB6EPKuER8WOAUu3ZD3nshr2vwNO5dec88WRsLR
YIFPIZtNZwDTKGXcCKruCbO7c3SBNsimxXWVrD5cA4h9usQHy8sCaAEeGjwRS72T
SNGS16QhIKhF6xbszaQTVMa/sR3pnGd4GfrgcrH2zACACv+I4U5Q/F+5iir+wRqQ
J62UalNAor9ZL3oTWFZLolxQweANRz79lS0f6DDXTYNlcJqSVOKqS8QBZyzbAkBy
L+iv0E6MX1YOlxgh7TTe3am9FLXJKZehlKALu+jxQNkKi0iPZ14=
=Drkh
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
