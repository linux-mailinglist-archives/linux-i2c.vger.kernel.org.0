Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68AEA150CE
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 17:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfEFP7P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 11:59:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:60804 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726413AbfEFP7O (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 11:59:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D03DCABD7;
        Mon,  6 May 2019 15:59:13 +0000 (UTC)
Message-ID: <6436b4f65565e3fca6827b1c6c0b95f81b099d98.camel@suse.de>
Subject: Re: [PATCH] i2c: bcm2835: Model Divider in CCF
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Annaliese McDermond <nh6z@nh6z.net>, eric@anholt.net,
        wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     team@nwdigitalradio.com
Date:   Mon, 06 May 2019 17:59:12 +0200
In-Reply-To: <c43eb848-23cd-4b0c-638d-3bb0df58ed31@gmail.com>
References: <20190505034339.30778-1-nh6z@nh6z.net>
         <610c7594-85c9-72db-63a6-6e632e9586aa@i2se.com>
         <c43eb848-23cd-4b0c-638d-3bb0df58ed31@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-NF/oAISSXjVajL9Q6zli"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--=-NF/oAISSXjVajL9Q6zli
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2019-05-05 at 10:13 -0700, Florian Fainelli wrote:
>=20
> On 5/5/2019 3:36 AM, Stefan Wahren wrote:
> > Hi Annaliese,
> >=20
> > Am 05.05.19 um 05:43 schrieb Annaliese McDermond:
> > > Model the I2C bus clock divider as a part of the Core Clock Framework=
.
> > > Primarily this removes the clk_get_rate() call from each transfer.
> > > This call causes problems for slave drivers that themselves have
> > > internal clock components that are controlled by an I2C interface.
> > > When the slave's internal clock component is prepared, the prepare
> > > lock is obtained, and it makes calls to the I2C subsystem to
> > > command the hardware to activate the clock.  In order to perform
> > > the I2C transfer, this driver sets the divider, which requires
> > > it to get the parent clock rate, which it does with clk_get_rate().
> > > Unfortunately, this function will try to take the clock prepare
> > > lock, which is already held by the slave's internal clock calls
> > > creating a deadlock.
> >=20
> > i think i understand the problem, but could you please explain the
> > specific use case where this happend?
> >=20
> > I suspect bcm2835 is not the only platform which is affected, so it
> > would be better to fix this in general.
>=20
> Agreed, if you could identify i2c bus drivers that support changing the
> bus clock and move the registration of the bus 'struct clk' into the i2c
> core that would scale a lot better.

For the record, some time ago I asked for directions on how to properly han=
dle
asyncronous clk rate changes on devices like this and the clk mantainers'
proposed solution[1] needed something similar to what Annaliese is proposin=
g.

That said, I can think of more subsystems that could benefit of a generic
solution for this. I'm pretty sure SPI would, but also MMC, UARTs, and othe=
rs.

[1] https://www.spinics.net/lists/linux-clk/msg36937.html




--=-NF/oAISSXjVajL9Q6zli
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAlzQWdAACgkQlfZmHno8
x/6IsAf+ID13VCoGqWG4174whG3Ks3+bn8WWuz8UlPe23RRO9vXQSurDN9839eIN
Hyd9h8CNClLc1TCNJmaxKURycfwavKNuedfa+WxZXVV4iNLbVJpRjtCWsYmcuEY6
BFR+d2hpi7xN8CwK7NlXc64Yim81OUdn3ph0sONRn+PJDIOeJfZIfUpueibMQA/B
K4JDfPBaMoACZ9piTLL0NsTHOfjc4MRmksFPMxsYr3KnfZXy9lm0haUZPrIrNVni
egDuNK0ZstLwiaGPtXrUVl8QaRSZFNWaB/tY4oZ4bmDwPkxOtYzz4ZOlFupvg1aK
vn2pwH8TuTDQsgizLuKOOnF2GzCiHQ==
=fidG
-----END PGP SIGNATURE-----

--=-NF/oAISSXjVajL9Q6zli--

