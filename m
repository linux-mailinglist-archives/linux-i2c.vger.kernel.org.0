Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF37DEEBA
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 16:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbfJUOFX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 10:05:23 -0400
Received: from sauhun.de ([88.99.104.3]:47916 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfJUOFX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 10:05:23 -0400
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
        by pokefinder.org (Postfix) with ESMTPSA id CAB422C0076;
        Mon, 21 Oct 2019 16:05:20 +0200 (CEST)
Date:   Mon, 21 Oct 2019 16:05:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     peda@axentia.se, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v5 0/9] i2c: add support for filters
Message-ID: <20191021140515.GC26782@ninjato>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
 <c17182ac-67dd-d11f-5daf-066bf446b969@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline
In-Reply-To: <c17182ac-67dd-d11f-5daf-066bf446b969@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2019 at 07:53:21AM +0000, Eugen.Hristev@microchip.com wrote:
>=20
>=20
> On 11.09.2019 11:24, Eugen Hristev - M18282 wrote:
> > From: Eugen Hristev <eugen.hristev@microchip.com>
> >=20
> > Hello,
> >=20
> > This series adds support for analog and digital filters for i2c control=
lers
> >=20
> > This series is based on the series:
> > [PATCH v2 0/9] i2c: at91: filters support for at91 SoCs
> > and later
> > [PATCH v4 0/9] i2c: add support for filters
> > and enhanced to add the bindings for all controllers plus an extra bind=
ings
> > for the width of the spikes in nanoseconds (digital filters) and cut-off
> > frequency (analog filters)
> >=20
> > First, bindings are created for
> > 'i2c-analog-filter'
> > 'i2c-digital-filter'
> > 'i2c-digital-filter-width-ns'
> > 'i2c-analog-filter-cutoff-frequency'
> >=20
> > The support is added in the i2c core to retrieve filter width/cutoff fr=
equency
> > and add it to the timings structure.
> > Next, the at91 driver is enhanced for supporting digital filter, advanc=
ed
> > digital filter (with selectable spike width) and the analog filter.
> >=20
> > Finally the device tree for two boards are modified to make use of the
> > new properties.
> >=20
> > This series is the result of the comments on the ML in the direction
> > requested: to make the bindings globally available for i2c drivers.
> >=20
> > Changes in v5:
> > - renamed i2c-filter-width-ns to i2c-digital-filter-width-ns as this
> > is applicable only to digital filter
> > - created new binding i2c-digital-filter-width-ns for analog filters.
>=20
> Hello Wolfram and Peter,
>=20
> Are you happy with the changes in this version? I haven't heard from you=
=20
> since this latest update.
> I am interested to know if anymore changes are required or maybe we can=
=20
> move further with this support.

So, I had a look now and I am happy. I will give Peter one more day to
comment, otherwise I'll apply it tomorrow.

Thanks for your patience and keeping at it!


--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2tuxsACgkQFA3kzBSg
KbY6GQ//X5UmvTKTkgT+9BdG4luCpqZEKeKetljuT2RVeGL56TJwBRiOYWymfAa+
U88PvGx1Q9mmI/E4AvzTAsnwjZiqACFw5n4NG+mWfWmd5H2P7ko6PpgVUL7Lk/0S
zbP658UBLM1LBHjtDI4n1juS6daxP1m2Z43NaaiskaQFBmvWtPRo5mv0jpDdbYi2
gMQ2Qo1efHoaBm+bdVu6Z8O71QktM5BhqKgAPxV9vWA0etSNqiDMII9qk9SmpSfE
4JcqmuAOa0fhDzbc+wKaLZoq3Gk3WiOeTImFHEw5wKZJE80guUBWNiJ2Bl96apQT
E/+M3VuTnS1VWqkS6w0oJ0lA/un8gf+CtYbZblirG05fv7suBSLGuCe2RZvl9pJM
t/LHClLyZ/yBcYL9eAeMj1tM14II/rWES1go5UxhukZW2c7Eqep4UOPTtYQg4rwO
EozMsz3sueMFU5l6llkLW1t+tb8DnLlvlzB6wZtNlLQjL8cYMBfZJrdBy9N0wX1n
nxWhQVIjer4AluEwqpGXJ0bPDrClRr9zgznUzG4ydGRAKSNHLJ01kvvxgQmTPYr6
PSCbo+4EZWFVMZNCi0DGWQFeRLCsqoN+NsHhyM0z7wAc6TUbuaviB1qpRq7+ALkp
GktKG3WXzYEsJmEMiU5ZsJRMC/wIRicGcF7GxqJx1VGO6712MXo=
=4jBB
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
