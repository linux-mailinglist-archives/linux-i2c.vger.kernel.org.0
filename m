Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E4618E3AF
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Mar 2020 19:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgCUSdw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Mar 2020 14:33:52 -0400
Received: from sauhun.de ([88.99.104.3]:38110 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727028AbgCUSdw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 21 Mar 2020 14:33:52 -0400
Received: from localhost (p54B33C59.dip0.t-ipconnect.de [84.179.60.89])
        by pokefinder.org (Postfix) with ESMTPSA id E797B2C2E9C;
        Sat, 21 Mar 2020 19:33:49 +0100 (CET)
Date:   Sat, 21 Mar 2020 19:33:49 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] i2c: designware: Add Baikal-T1 SoC I2C controller
 support
Message-ID: <20200321183349.GC5632@ninjato>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132348.71E638030793@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline
In-Reply-To: <20200306132348.71E638030793@mail.baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2020 at 04:19:58PM +0300, Sergey.Semin@baikalelectronics.ru=
 wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>=20
> A third I2C controller embedded into the Baikal-T1 SoC is also fully
> based on the DW APB I2C core, but its registers are indirectly
> accessible via "command/data in/data out" trio. There is no difference
> other than that. So in order to have that controller supported by the
> common DW APB I2C driver we only need to introduce a new flag
> ACCESS_INDIRECT and use the access-registers to reach the I2C controller
> normal registers space in the dw_readl/dw_writel methods. Currently this
> flag is only enabled for the controllers with "be,bt1-i2c" compatible
> string.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>

Patches 2,3, and 6 have comments which should be addressed. Patches 4+5
can be dropped when sending next version.


--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl52Xg0ACgkQFA3kzBSg
KbYNoQ/+IqAHiu0yu6E7vmrFh163UulAWJmyVeL2xt5Umm6AqdBs1yTL6Oy4JB6w
9fMelMGKk4uybuL32UvtviBiNBlqdxPrmkNLfqJ3TkFvg/kSev+HR8QIRPS3WNme
UuHz5MCoYPfZK8Pbx8oJsaopI0Ad7/d0uB9MOmatEERHz6jrvQulhm42psN2/icM
wufLIsBr803+Ld1VxotTU/15lKfOXsYKhDj3LmiP6iUUtc7K0yQdRcD5KI+3+KZ2
FehsEcizI4YuexDTQrup4Ri6PFj7Tcc8ZXEFXjMYQIuVyYZP50Fs8USKSQcja0e6
Q0er8yM3BRqla5ZoCYQsbXqHYDZh70RxYnj6kOPsYFsjyzR54An0NUG9WERTjCaE
DVt0qoOfG6uQnQGX9fgJhzQA5TDlr1xcwxU3A4WS+VNgRuBiG1PI0pFkux9/oesG
jFSb0SHLxH9sHE6iH9nhb04hlLxPqiI0esFMtAc8PPW2zaH/ksxa70pc5T3QNJUc
poJGFzVxhyI9i0mgnWRYjcITPA5rQqIHAPNxzwNOHvkryDyv1L8dzMey2toJzvUB
0NF0i2II9y5nPt2AWm0ctjdRfmsaikLotwAWLHjNBp+mx+dKpOLtF74D/g/knOKo
sU0TkXTi56MjIz05pP6/nvbD+fjeVOUtj4MEyYNH5OIhrQQoibE=
=KXuX
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
