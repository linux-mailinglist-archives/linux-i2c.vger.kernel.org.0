Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F081E90B9
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 13:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbgE3LJe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 May 2020 07:09:34 -0400
Received: from sauhun.de ([88.99.104.3]:60296 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbgE3LJd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 May 2020 07:09:33 -0400
Received: from localhost (p5486c6a9.dip0.t-ipconnect.de [84.134.198.169])
        by pokefinder.org (Postfix) with ESMTPSA id 773A72C206B;
        Sat, 30 May 2020 13:09:30 +0200 (CEST)
Date:   Sat, 30 May 2020 13:09:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 08/11] i2c: designware: Convert driver to using regmap
 API
Message-ID: <20200530110930.GC1038@ninjato>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-9-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline
In-Reply-To: <20200528093322.23553-9-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 12:33:18PM +0300, Serge Semin wrote:
> Seeing the DW I2C driver is using flags-based accessors with two
> conditional clauses it would be better to replace them with the regmap
> API IO methods and to initialize the regmap object with read/write
> callbacks specific to the controller registers map implementation. This
> will be also handy for the drivers with non-standard registers mapping
> (like an embedded into the Baikal-T1 System Controller DW I2C block, which
> glue-driver is a part of this series).
>=20
> As before the driver tries to detect the mapping setup at probe stage and
> creates a regmap object accordingly, which will be used by the rest of the
> code to correctly access the controller registers. In two places it was
> appropriate to convert the hand-written read-modify-write and
> read-poll-loop design patterns to the corresponding regmap API
> ready-to-use methods.
>=20
> Note the regmap IO methods return value is checked only at the probe
> stage. The rest of the code won't do this because basically we have
> MMIO-based regmap so non of the read/write methods can fail (this also
> won't be needed for the Baikal-T1-specific I2C controller).
>=20
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mips@vger.kernel.org

My codecheckers found these, rightfully I'd say:

SPARSE
drivers/i2c/busses/i2c-designware-master.c:427:53: warning: incorrect type =
in argument 3 (different signedness)
drivers/i2c/busses/i2c-designware-master.c:427:53:    expected unsigned int=
 *val
drivers/i2c/busses/i2c-designware-master.c:427:53:    got int *

CC
drivers/i2c/busses/i2c-designware-common.c:127: warning: Excess function pa=
rameter 'base' description in 'i2c_dw_init_regmap'

^ means there is an argument documented which does not exist in the
function declaration


--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7SPuYACgkQFA3kzBSg
Kba4lhAApobHb6268AOmql5Sc1j6Hw5lSQChbkLvmBWJDJ4CUAMGlItfPuItWl09
0KTU0xFSs9FbHNuNkQC3wPoepu1EvCp909EfbjA/f/GZEYa4qlRpF1/uerg60v0Y
99ZPmJau41mK1Es33BjqiodWjPbvDDDb5eEeMqGnwA4wnvmjLjfBuzmzuymjh2Lx
G+uE5P9XokSRxfqO3MlpmLYFvc6hOqr85qfiCCOMoC7MpB4OZ62qcj9bwhXYl8C+
AAsf61LQ4++c3h9+BbWjvELveDmg4rH28j0YAyoHBF8jND/ZzQUh1BZopCMuPmqK
ATEpFjIxMiWJkAloAQAlY4AeStqqtT3j+CsYyAiMdxHvEbJ9m1BGXwmwqniVNQ8M
hir8G9gWvRij64KdYbygG4Q5h46zj4eeUsyZq1emZwY1qbJk2GQXKu80duLievGR
KJouxra2dNct3LYM0CcPmoDlmK0rBFf549l9kIF57rjEQRt0OvYr14GGpiLKrsYx
eeCpdVv51KEi24OOADEIPcpsKKS+RnN4O8sWonGs+l/nXIXHq0LNBW8HX5RF3KIb
w/cBohPraJfvXUUKC11ZPlAuv6VvgDGGf6mUG8caS0VMyIgur5bCL9nGd0CIvx1e
/kzU0Uj7d+uCEsuKrpmMkZLDV9REQ9z/w7hPNODtjFQnKaMrdZs=
=V3Pu
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
