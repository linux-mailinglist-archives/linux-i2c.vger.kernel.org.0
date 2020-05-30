Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26501E90C1
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 13:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgE3LKl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 May 2020 07:10:41 -0400
Received: from sauhun.de ([88.99.104.3]:60314 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbgE3LKk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 May 2020 07:10:40 -0400
Received: from localhost (p5486c6a9.dip0.t-ipconnect.de [84.134.198.169])
        by pokefinder.org (Postfix) with ESMTPSA id 65BD92C206B;
        Sat, 30 May 2020 13:10:38 +0200 (CEST)
Date:   Sat, 30 May 2020 13:10:38 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/11] dt-bindings: i2c: Convert DW I2C binding to DT
 schema
Message-ID: <20200530111038.GD1038@ninjato>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-2-Sergey.Semin@baikalelectronics.ru>
 <20200530093942.GB1038@ninjato>
 <20200530102419.gtgh77eaxoort3zh@mobilestation>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline
In-Reply-To: <20200530102419.gtgh77eaxoort3zh@mobilestation>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > WARNING: DT binding documents should be licensed (GPL-2.0-only OR BSD-2=
-Clause)
> >=20
>=20
> Hope you don't mind me answering on a question for Rob. That warning conc=
erns
> new bindings and bindings converted by a person eligible to change the li=
cense.
> Otherwise by default any converted binding is supposed to be left under p=
ure
> GPL as the rest of kernel code.

Thanks for the heads up. OK for me, then.


--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7SPy0ACgkQFA3kzBSg
KbbCnQ/+L51IlIS/74T3j3EIonKF4hRKdj3+HxRIwaTHqBogOTyJ4m/+zxQtAVCL
0S4nTOaCGvAQFhnIo6Q6TBVmwiD2Wo0dY9TV6Xa2jLVi0PNxNsNbNpp9cAolXPru
WUHYhWi5DHQuLqm7cn1QrZQcZ6YrgEIVOfQttMAd7EYz2IAU0p76gnVcIz0NWtir
bzqqsHMnBvCb6Lxd1d0gdXLUi+Lv96+09OBRBvj4h4Uddg7Ba1MyrEvUOykUWZtG
/fmeEP9FnVsu2MqjRGl4syN9nKYedAri3Y+lwVdYJFfzJGJj1+ngHR6BBsoRNztG
8U3tYOrLdpscfjwgAL4zQRIJZU72IJ3YfmzHiLz7kcN/E39HjG0Wzsru2DrXbIVd
xODC1qVcr2gnPvHc8U6nlNSG4ZnN5a++dSjNZkONKWHM/NIa8s9FrM16TtGfWr38
/7X6OGo0osovoVx+WdopRWViEBWHHWxyJ2lg+4bhZuNp0qUovFpNhpYHHZk3yp6R
UztqotzT8iDj0LGQpOnJA9wIi3sLwmhjldYNB5qu+rV0FYa5WN/Vw7hNsuL++xZr
DxUy8jx1inPM7gHOI+e2bCmGfzaYhuqaUITgQzt5MJ19I/oCYPRrx67p0fmb25Au
m3MesDJDjh7TjttGexqWmKX1eRE5ihdUsxpAmNPkhDFhudv0xl0=
=I36E
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
