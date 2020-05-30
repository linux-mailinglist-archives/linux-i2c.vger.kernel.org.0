Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95CD91E93C8
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 23:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgE3VF6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 May 2020 17:05:58 -0400
Received: from sauhun.de ([88.99.104.3]:37032 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728741AbgE3VF5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 May 2020 17:05:57 -0400
Received: from localhost (p5486c6a9.dip0.t-ipconnect.de [84.134.198.169])
        by pokefinder.org (Postfix) with ESMTPSA id B79692C206B;
        Sat, 30 May 2020 23:05:54 +0200 (CEST)
Date:   Sat, 30 May 2020 23:05:54 +0200
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
Message-ID: <20200530210554.GA15682@ninjato>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-9-Sergey.Semin@baikalelectronics.ru>
 <20200530110930.GC1038@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20200530110930.GC1038@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2020 at 01:09:30PM +0200, Wolfram Sang wrote:
> On Thu, May 28, 2020 at 12:33:18PM +0300, Serge Semin wrote:
> > Seeing the DW I2C driver is using flags-based accessors with two
> > conditional clauses it would be better to replace them with the regmap
> > API IO methods and to initialize the regmap object with read/write
> > callbacks specific to the controller registers map implementation. This
> > will be also handy for the drivers with non-standard registers mapping
> > (like an embedded into the Baikal-T1 System Controller DW I2C block, wh=
ich
> > glue-driver is a part of this series).
> >=20
> > As before the driver tries to detect the mapping setup at probe stage a=
nd
> > creates a regmap object accordingly, which will be used by the rest of =
the
> > code to correctly access the controller registers. In two places it was
> > appropriate to convert the hand-written read-modify-write and
> > read-poll-loop design patterns to the corresponding regmap API
> > ready-to-use methods.
> >=20
> > Note the regmap IO methods return value is checked only at the probe
> > stage. The rest of the code won't do this because basically we have
> > MMIO-based regmap so non of the read/write methods can fail (this also
> > won't be needed for the Baikal-T1-specific I2C controller).
> >=20
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-mips@vger.kernel.org
>=20
> My codecheckers found these, rightfully I'd say:
>=20
> SPARSE
> drivers/i2c/busses/i2c-designware-master.c:427:53: warning: incorrect typ=
e in argument 3 (different signedness)
> drivers/i2c/busses/i2c-designware-master.c:427:53:    expected unsigned i=
nt *val
> drivers/i2c/busses/i2c-designware-master.c:427:53:    got int *
>=20
> CC
> drivers/i2c/busses/i2c-designware-common.c:127: warning: Excess function =
parameter 'base' description in 'i2c_dw_init_regmap'
>=20
> ^ means there is an argument documented which does not exist in the
> function declaration

Well, I fixed these two minor things for your now...


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7Syq4ACgkQFA3kzBSg
KbY0gQ//YKOc7BeIxNJoEgL1mTbEvdfy6VyzbzoS8K4/J/XOSLeftwBr6tSTUNVQ
37AcCaqImPPbzUz3EOL9mkfyduGNeVlY+BomsSqABB3SzamwSzo5GajCb64zizjj
PlrA2ki7SjHINrO3vIIvsxMyU9gqVUR2v8ImRmnNPVm2qzmbRs+/IfnokRxbwZwT
CHefaToS6go4dCGuCCA5MXPbWlI66j1YH59sewh6IxI/eH6gi/vRdFrJIzhlnyef
TqHGLeypN0rewdrv1jgr53UF/pInKr9k8XC4xM35TZXjfh5FaQTgfXS2q35c1wYi
72Cm30DLz9m6YBWEksiCBPUl22oJY3uN//W7SE+d78B1Y5rgszbU47xB7DAXEtUx
uEzSVx/yUVobrfwuJn5BQHJRS18uQOl6I61X31qE5VFkDqaRJNjAX2E7+XhaQVSr
wqGzm9AnFmCmNHbanNjW4EnzObW8mq23LXLAWJbWurpEIFL3HinktUN0JliSBysv
AV67nD+0H0nBSBYul6aEi5EWgK+b4PyvaW/GEC1mGzT0jwxqiP+585SGIAGlMcLd
8CeXJo0aPPlvGoZZxR1SXv7qlsyuJVIy3PauXfyZf/obw0+wkFZ2Gl5oyaKOGGTA
a7yvUdM9AFaJ2zzgO4Y+cmOFpg47PIZ54nhyKwAOmD3iGSyx/HI=
=PIEk
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
