Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6EEABED95
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2019 10:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbfIZIlf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Sep 2019 04:41:35 -0400
Received: from sauhun.de ([88.99.104.3]:37168 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbfIZIlf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Sep 2019 04:41:35 -0400
Received: from localhost (unknown [65.39.69.237])
        by pokefinder.org (Postfix) with ESMTPSA id 5B2052C01EC;
        Thu, 26 Sep 2019 10:41:30 +0200 (CEST)
Date:   Thu, 26 Sep 2019 10:41:27 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PULL REQUEST] i2c for 5.4
Message-ID: <20190926084127.GA1862@kunai>
References: <20190924193054.GA2215@kunai>
 <CAHk-=wi1WroG_uZ44au_KdEcujkCvcwz+d05EDR_=6vHb8xQaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <CAHk-=wi1WroG_uZ44au_KdEcujkCvcwz+d05EDR_=6vHb8xQaw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

> > - new driver for ICY, an Amiga Zorro card :)
>=20
> Christ. Will that thing _never_ die?

Well, a couple of happy users there...

> I don't know what the proper mutt incantation is to make it join the
> modern world, but I'm sure one exists, and then your emails would get
> names right too. Even if they are some funky Swedish ones with =C3=A5=C3=
=A4=C3=B6.

Sorry, my template for pull-requests had bogus header overriding the
default utf-8 of my config. I fixed it now. Thanks for pointing it out.

> (And no, don't use Latin1 - it may cover Swedish and German etc, but
> you really want to go with proper utf-8 and be able to handle true
> complex character sets, not just the Western European ones).

Heh, no need to convince me, I am all for utf-8!

Regards,

   Wolfram


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2MebcACgkQFA3kzBSg
KbbPew/8C5Cg7gXflRpP7sT2XwDafwFNolQzyA1KoTi1TGR6+5p8iQvo8fGy76dr
/iXIa97HPKpr/QQvdp6hYAG6/DNgByOf5FrbYv+5IQ3zOwOhdAEi6Jz0hZ/SCKTI
V26eryi6oiDX1SpSY0pFo6mODxP9wAb3vC/omiPEFhNHz4bA+6ljdehWb31c9J/r
wk+CbKlXoEdB1BhgSfuLpu/wemCBDu1cW3hFoBXRnIlKipHyDIpQukop9jwH+zxg
lCN32U+LRm+h+6GuMzQ88RjaD7BTIHINijTsgZywrsZlC5sERjCgU9nNVSEhMqfU
QqY57I3Y+nPC6gh0jt5mE5a8QvOcbTLJ+ClvGiDLq0A0a2x2SWrpkPN1B0HCWxfB
8W0517CtbH6NgG1o54fbqOtSWhWmiDOu4/4uWM9qwEBvvPwJFROVCIproO4rKde8
dude8sgYNIK9nuh+u+H/irYcTk9t4xPsiRt2YhC/iWJ/0I8XUQeBN18wC1fk+lP2
HixvCV42/Y8OwdlWqDHo5WWlnYRKo4xqKSZLzz5BtUri/U84LnDcQNoT/XKtytzM
33qbZaMm6QMbHBpkz3+kx6NUTXHgzgqSkLP7bmXkGOktErCni7fVKMXMXOwWy9JO
U0jZoBogEVXTEIZpVLVAYPIPsYLytT3GDFoVr/hhQJ14kSeZtg0=
=V5uj
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
