Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB64E18E3AB
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Mar 2020 19:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbgCUSc4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Mar 2020 14:32:56 -0400
Received: from sauhun.de ([88.99.104.3]:38052 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727015AbgCUSc4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 21 Mar 2020 14:32:56 -0400
Received: from localhost (p54B33C59.dip0.t-ipconnect.de [84.179.60.89])
        by pokefinder.org (Postfix) with ESMTPSA id 4C6E52C1ECA;
        Sat, 21 Mar 2020 19:32:54 +0100 (CET)
Date:   Sat, 21 Mar 2020 19:32:53 +0100
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
Subject: Re: [PATCH 4/6] i2c: designware: Detect the FIFO size in the common
 code
Message-ID: <20200321183253.GA5632@ninjato>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132151.2ABC38030786@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20200306132151.2ABC38030786@mail.baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2020 at 04:19:54PM +0300, Sergey.Semin@baikalelectronics.ru=
 wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>=20
> The problem with detecting the FIFO depth in the platform driver
> is that in order to implement this we have to access the controller
> IC_COMP_PARAM_1 register. Currently it's done before the
> i2c_dw_set_reg_access() method execution, which is errors prone since
> the method determines the registers endianness and access mode and we
> can't use dw_readl/dw_writel accessors before this information is
> retrieved. We also can't move the i2c_dw_set_reg_access() function
> invocation to after the master/slave probe functions call (when endianness
> and access mode are determined), since the FIFO depth information is used
> by them for initializations. So in order to fix the problem we have no
> choice but to move the FIFO size detection methods to the common code and
> call it at the probe stage.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Applied to for-next, thanks!


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl52XdEACgkQFA3kzBSg
KbbDHw/4rF8enKtmpvMYhWXPtAfQWQsbh/LKy56ASKgJzHsDgaDP6k95R819zoxx
mNtD3nvIotGgl9YO3SeaVZZnBf0KTAgN53qLY8/h920wuwzGxnB4tGc2+1dE3e/x
Iix4Z5aXXMSgRL5LHvbng18IYtt4xPlrpZ+YLelZsTSKzO+GDpDGnAOmFp843xS7
kwh9tJqsEuSO8fzyS/tAOix6GZvxlTu+06sMX831S6rFdgC5tfXQBTgzq5vchlHL
tK/MJfXeJ/lF1lqr/4n88cBYyWyvyps79B2fsYcVBOQ67AHHCZWqu9m8ojYOKArC
tLCAgOnleezVIGlWAilysd4a46lmFbp/bJR4d4ooV2m/m9n1M03tN0nFcA90ScwS
OPT2sZxqCRsUYtZ7D6p30S7v6Hc9DOVUpzvVRtHgxDxFFAhqFzSwmkn2q/OtpT4J
0yy+TakopOAQWWlJP5EHhLZKWFO1rhg2x4Cge4L/+Ixx4BNw5+Olfg6WaIq66iJT
QJ/NvjH9Kq+pXtEYV39e/QRQyNn7TkPrUKsl/YtdKT/s+W9izlF2o6EjZROXhzwt
lrMRE5ZZ0ipzNkEQ2e4kN1Imo5aK1MlaZe3H7WN6CDV536/X7+jHYyTT4uWxJhYf
/7j7odybyP0cXny85bjsTNm4eqhDEOFZUcdF+TpZ/D3XX6Hp3w==
=DD9j
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
